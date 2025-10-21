import 'package:clock/clock.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/session.dart';

import '../../../generated/protocol.dart';
import '../util/byte_data_extension.dart';
import '../util/session_extension.dart';
import 'email_idp_config.dart';
import 'email_idp_server_exceptions.dart';
import 'utils/email_idp_account_creation_utils.dart';
import 'utils/email_idp_password_hash_util.dart';
import 'utils/email_idp_password_reset_utils.dart';

/// Email account management functions.
///
/// This class provides atomic building blocks for composing custom authentication
/// and administration flows. Apart from the methods in this class, the main
/// building blocks are:
///
/// - [passwordHashUtils] - Password and verification code hashing utilities
/// - [accountCreationUtils] - Account registration and verification utilities
/// - [passwordResetUtils] - Password reset and recovery utilities
///
/// These utilities can be used to implement custom authentication flows beyond
/// what's provided by [EmailIDP] and [EmailIDPAdmin]. For example:
///
/// ```dart
/// // Access building blocks for custom flows
/// final utils = EmailIDPUtils(config: config);
///
/// // Use account creation utilities
/// final result = await utils.accountCreationUtils.startAccountCreation(...);
///
/// // Use password reset utilities
/// final resetResult = await utils.passwordResetUtils.startPasswordReset(...);
///
/// // Use password hashing utilities
/// final hash = await utils.passwordHashUtils.createHash(value: password);
/// ```
///
/// For most standard use cases, the methods exposed by [EmailIDP] and
/// [EmailIDPAdmin] should be sufficient.
class EmailIDPUtils {
  /// {@macro email_idp_config}
  final EmailIDPConfig _config;

  /// {@macro email_idp_password_hash_util}
  final EmailIDPPasswordHashUtil passwordHashUtils;

  /// {@macro email_idp_account_creation_utils}
  late final EmailIDPAccountCreationUtils accountCreationUtils;

  /// {@macro email_idp_password_reset_utils}
  late final EmailIDPPasswordResetUtils passwordResetUtils;

  /// Creates a new instance of [EmailIDPUtils].
  EmailIDPUtils({required final EmailIDPConfig config})
      : _config = config,
        passwordHashUtils = EmailIDPPasswordHashUtil(
          passwordHashPepper: config.passwordHashPepper,
          passwordHashSaltLength: config.passwordHashSaltLength,
        ) {
    accountCreationUtils = EmailIDPAccountCreationUtils(
      config: EmailIDPAccountCreationUtilsConfig.fromEmailIDPConfig(config),
      passwordHashUtils: passwordHashUtils,
    );
    passwordResetUtils = EmailIDPPasswordResetUtils(
      config: EmailIDPPasswordResetUtilsConfig.fromEmailIDPConfig(config),
      passwordHashUtils: passwordHashUtils,
    );
  }

  /// Returns the [AuthUser]'s ID upon successful email/password verification.
  ///
  /// Can throw the following [EmailLoginServerException] subclasses:
  /// - [EmailAccountNotFoundException] if the email address is not registered
  ///   in the database.
  /// - [EmailAuthenticationInvalidCredentialsException] if the password is not
  ///   valid for an existing account.
  /// - [EmailAuthenticationTooManyAttemptsException] if the user has made
  ///   too many failed attempts.
  ///
  /// In case of invalid credentials, the failed attempt will be logged to
  /// the database outside of the [transaction] and can not be rolled back.
  Future<UuidValue> authenticate(
    final Session session, {
    required String email,
    required final String password,
    required final Transaction? transaction,
  }) async {
    return DatabaseUtil.runInTransactionOrSavepoint(
      session.db,
      transaction,
      (final transaction) async {
        email = email.trim().toLowerCase();

        if (await _hasTooManyFailedSignIns(
          session,
          email,
          transaction: transaction,
        )) {
          throw EmailAuthenticationTooManyAttemptsException();
        }

        final account = await EmailAccount.db.findFirstRow(
          session,
          where: (final t) => t.email.equals(email),
          transaction: transaction,
        );

        if (account == null) {
          await _logFailedSignIn(session, email);
          throw EmailAccountNotFoundException();
        }

        if (!await passwordHashUtils.validateHash(
          value: password,
          hash: account.passwordHash.asUint8List,
          salt: account.passwordSalt.asUint8List,
        )) {
          await _logFailedSignIn(session, email);
          throw EmailAuthenticationInvalidCredentialsException();
        }

        return account.authUserId;
      },
    );
  }

  /// Creates a new authentication session for the given [authUserId].
  Future<AuthSuccess> createSession(
    final Session session,
    final UuidValue authUserId, {
    required final Transaction? transaction,
    required final String method,
  }) async {
    final authUser = await AuthUsers.get(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );

    if (authUser.blocked) {
      throw AuthUserBlockedException();
    }

    final sessionKey = await AuthSessions.createSession(
      session,
      authUserId: authUserId,
      method: method,
      scopes: authUser.scopes,
      transaction: transaction,
    );

    return sessionKey;
  }

  /// Cleans up the log of failed login attempts older than [olderThan].
  ///
  /// If [olderThan] is `null`, this will remove all attempts outside the time
  /// window that is checked upon login, as configured in
  /// [EmailIDPConfig.emailSignInFailureResetTime].
  Future<void> deleteFailedLoginAttempts(
    final Session session, {
    Duration? olderThan,
    required final Transaction? transaction,
  }) async {
    olderThan ??= _config.failedLoginRateLimit.timeframe;

    final removeBefore = clock.now().subtract(olderThan);

    await EmailAccountFailedLoginAttempt.db.deleteWhere(
      session,
      where: (final t) => t.attemptedAt < removeBefore,
      transaction: transaction,
    );
  }

  Future<bool> _hasTooManyFailedSignIns(
    final Session session,
    final String email, {
    required final Transaction? transaction,
  }) async {
    final oldestRelevantAttempt =
        clock.now().subtract(_config.failedLoginRateLimit.timeframe);

    final failedLoginAttemptCount =
        await EmailAccountFailedLoginAttempt.db.count(
      session,
      where: (final t) =>
          (t.email.equals(email) |
              t.ipAddress.equals(session.remoteIpAddress)) &
          (t.attemptedAt > oldestRelevantAttempt),
      transaction: transaction,
    );

    return failedLoginAttemptCount >= _config.failedLoginRateLimit.maxAttempts;
  }

  Future<void> _logFailedSignIn(
    final Session session,
    final String email,
  ) async {
    // NOTE: The failed attempt logging runs in a separate transaction, so that
    // it is never rolled back with the parent transaction.
    await session.db.transaction((final transaction) async {
      await EmailAccountFailedLoginAttempt.db.insertRow(
        session,
        EmailAccountFailedLoginAttempt(
          email: email,
          ipAddress: session.remoteIpAddress,
        ),
        transaction: transaction,
      );
    });
  }

  /// Replaces server-side exceptions by client-side exceptions, hiding details
  /// that could leak account information.
  static Future<T> withReplacedServerEmailException<T>(
      final Future<T> Function() fn) async {
    try {
      return await fn();
    } on EmailServerException catch (e) {
      switch (e) {
        case EmailLoginServerException():
          throw EmailAccountLoginException(reason: e.reason);
        case EmailAccountRequestServerException():
          throw EmailAccountRequestException(reason: e.reason);
        case EmailPasswordResetServerException():
          throw EmailAccountPasswordResetException(reason: e.reason);
      }
    }
  }
}

extension on EmailLoginServerException {
  EmailAccountLoginExceptionReason get reason {
    switch (this) {
      case EmailAccountNotFoundException():
      case EmailAuthenticationInvalidCredentialsException():
        return EmailAccountLoginExceptionReason.invalidCredentials;
      case EmailAuthenticationTooManyAttemptsException():
        return EmailAccountLoginExceptionReason.tooManyAttempts;
    }
  }
}

extension on EmailAccountRequestServerException {
  EmailAccountRequestExceptionReason get reason {
    switch (this) {
      case EmailAccountRequestInvalidVerificationCodeException():
      case EmailAccountRequestNotFoundException():
      case EmailAccountRequestNotVerifiedException():
      case EmailAccountRequestVerificationTooManyAttemptsException():
        return EmailAccountRequestExceptionReason.invalid;
      case EmailPasswordPolicyViolationException():
        return EmailAccountRequestExceptionReason.policyViolation;
      case EmailAccountRequestVerificationExpiredException():
        return EmailAccountRequestExceptionReason.expired;
    }
  }
}

extension on EmailPasswordResetServerException {
  EmailAccountPasswordResetExceptionReason get reason {
    switch (this) {
      case EmailPasswordResetAccountNotFoundException():
      case EmailPasswordResetInvalidVerificationCodeException():
      case EmailPasswordResetRequestNotFoundException():
      case EmailPasswordResetTooManyAttemptsException():
      case EmailPasswordResetTooManyVerificationAttemptsException():
        return EmailAccountPasswordResetExceptionReason.invalid;
      case EmailPasswordResetPasswordPolicyViolationException():
        return EmailAccountPasswordResetExceptionReason.policyViolation;
      case EmailPasswordResetRequestExpiredException():
        return EmailAccountPasswordResetExceptionReason.expired;
    }
  }
}
