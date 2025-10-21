import 'dart:typed_data';

import 'package:clock/clock.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/session.dart';

import '../../../generated/protocol.dart';
import '../util/byte_data_extension.dart';
import '../util/session_extension.dart';
import '../util/uint8list_extension.dart';
import 'email_idp_config.dart';
import 'email_idp_server_exceptions.dart';
import 'utils/email_idp_account_creation_utils.dart';
import 'utils/email_idp_password_hash_util.dart';

/// Email account management functions.
///
/// These functions can be used to compose custom authentication and
/// administration flows if needed.
///
/// But for most cases, the methods exposed by [EmailIDP] and
/// [EmailIDPAdmin] should be sufficient.
class EmailIDPUtils {
  /// {@macro email_idp_config}
  final EmailIDPConfig _config;

  /// {@macro email_idp_password_hash_util}
  final EmailIDPPasswordHashUtil passwordHashUtils;

  /// {@macro email_idp_account_creation_utils}
  late final EmailIDPAccountCreationUtils accountCreationUtils;

  /// Creates a new instance of [EmailIDPUtils].
  EmailIDPUtils({required final EmailIDPConfig config})
      : _config = config,
        passwordHashUtils = EmailAccountSecretHashUtil(
          passwordHashPepper: config.passwordHashPepper,
          passwordHashSaltLength: config.passwordHashSaltLength,
        ) {
    accountCreationUtils = EmailIDPAccountCreationUtils(
      config: EmailIDPAccountCreationUtilsConfig.fromEmailIDPConfig(config),
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

  /// Returns the auth user ID for the successfully changed password.
  ///
  /// Can throw the following [EmailPasswordResetServerException] subclasses:
  /// - [EmailPasswordResetRequestNotFoundException] if no reset request could
  ///   be found for [passwordResetRequestId].
  /// - [EmailPasswordResetRequestExpiredException] if the reset request has
  ///   expired and has not been cleaned up yet.
  /// - [EmailPasswordResetPasswordPolicyViolationException] if the new password
  ///   does not comply with the configured password policy.
  /// - [EmailPasswordResetTooManyVerificationAttemptsException] if the user has
  ///   made too many attempts trying to complete the password reset.
  /// - [EmailPasswordResetInvalidVerificationCodeException] if the provided
  ///   [verificationCode] is not valid.
  ///
  /// In case of an invalid [verificationCode] or [passwordResetRequestId], the
  /// failed password reset completion will be logged to the database outside
  /// of the [transaction] and can not be rolled back.
  Future<UuidValue> completePasswordReset(
    final Session session, {
    required final UuidValue passwordResetRequestId,
    required final String verificationCode,
    required final String newPassword,
    required final Transaction? transaction,
  }) async {
    if (!_config.passwordValidationFunction(newPassword)) {
      throw EmailPasswordResetPasswordPolicyViolationException();
    }

    return DatabaseUtil.runInTransactionOrSavepoint(
      session.db,
      transaction,
      (final transaction) async {
        final resetRequest = await EmailAccountPasswordResetRequest.db.findById(
          session,
          passwordResetRequestId,
          transaction: transaction,
        );

        if (resetRequest == null) {
          throw EmailPasswordResetRequestNotFoundException();
        }

        if (await _hasTooManyPasswordResetAttempts(
          session,
          passwordResetRequestId: resetRequest.id!,
        )) {
          await EmailAccountPasswordResetRequest.db.deleteRow(
            session,
            resetRequest,
            // passing no transaction, so this will not be rolled back
          );

          throw EmailPasswordResetTooManyVerificationAttemptsException();
        }

        if (!await passwordHashUtils.validateHash(
          value: verificationCode,
          hash: resetRequest.verificationCodeHash.asUint8List,
          salt: resetRequest.verificationCodeSalt.asUint8List,
        )) {
          throw EmailPasswordResetInvalidVerificationCodeException();
        }

        if (resetRequest.isExpired(_config)) {
          await EmailAccountPasswordResetRequest.db.deleteRow(
            session,
            resetRequest,
            // passing no transaction, so this will not be rolled back
          );

          throw EmailPasswordResetRequestExpiredException();
        }

        await EmailAccountPasswordResetRequest.db.deleteRow(
          session,
          resetRequest,
          transaction: transaction,
        );

        final account = (await EmailAccount.db.findById(
          session,
          resetRequest.emailAccountId,
          transaction: transaction,
        ))!;

        final newPasswordHash = await passwordHashUtils.createHash(
          value: newPassword,
        );

        await EmailAccount.db.updateRow(
          session,
          account.copyWith(
            passwordHash: ByteData.sublistView(newPasswordHash.hash),
            passwordSalt: ByteData.sublistView(newPasswordHash.salt),
          ),
          transaction: transaction,
        );

        // Call the password reset completion callback
        _config.onPasswordResetCompleted?.call(
          session,
          emailAccountId: account.id!,
          transaction: transaction,
        );

        return account.authUserId;
      },
    );
  }

  /// Creates an email authentication for the auth user with the given email and
  /// password.
  ///
  /// The [email] will be treated as validated right away, so the caller must
  /// ensure that it comes from a trusted source.
  /// The [password] argument is not checked against the configured password
  /// policy.
  /// A `null` [password] can be passed to create an account without a password.
  /// In that case either the user has to complete a password reset or
  /// [setPassword] needs to be called before the user can log in.
  ///
  /// Returns the email account ID for the newly created authentication method.
  Future<UuidValue> createEmailAuthentication(
    final Session session, {
    required final UuidValue authUserId,
    required final String email,
    required final String? password,
    required final Transaction? transaction,
  }) async {
    final passwordHash = password != null
        ? await passwordHashUtils.createHash(
            value: password,
          )
        : (hash: Uint8List.fromList([]), salt: Uint8List.fromList([]));

    final account = await EmailAccount.db.insertRow(
      session,
      EmailAccount(
        authUserId: authUserId,
        email: email.toLowerCase(),
        passwordHash: passwordHash.hash.asByteData,
        passwordSalt: passwordHash.salt.asByteData,
      ),
      transaction: transaction,
    );

    return account.id!;
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

  /// Cleans up expired password reset attempts.
  Future<void> deleteExpiredPasswordResetRequests(
    final Session session, {
    required final Transaction? transaction,
  }) async {
    final lastValidDateTime = clock.now().subtract(
          _config.passwordResetVerificationCodeLifetime,
        );

    await EmailAccountPasswordResetRequest.db.deleteWhere(
      session,
      where: (final t) => t.createdAt < lastValidDateTime,
      transaction: transaction,
    );
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

  /// Cleans up the log of failed password reset attempts older than
  /// [olderThan].
  ///
  /// If [olderThan] is `null`, this will remove all attempts outside the time
  /// window that is checked upon password reset requests, as configured in
  /// [EmailIDPConfig.maxPasswordResetAttempts].
  Future<void> deletePasswordResetAttempts(
    final Session session, {
    Duration? olderThan,
    required final Transaction? transaction,
  }) async {
    olderThan ??= _config.maxPasswordResetAttempts.timeframe;

    final removeBefore = clock.now().subtract(olderThan);

    await EmailAccountPasswordResetAttempt.db.deleteWhere(
      session,
      where: (final t) => t.attemptedAt < removeBefore,
      transaction: transaction,
    );
  }

  /// Sends out a password reset email for the given account, if it exists.
  ///
  /// The caller may check the returned [PasswordResetResult], but this
  /// should not be exposed to the client, so that this method can not be
  /// misused to check which emails are registered. If the reset email is sent,
  /// a [passwordResetRequestId] is returned, which can be used to complete the
  /// reset.
  ///
  /// Each reset request will be logged to the database outside of the
  /// [transaction] and can not be rolled back, so the throttling will always be
  /// enforced.
  ///
  /// Can throw [EmailPasswordResetTooManyAttemptsException] if the account
  /// email does not exist in the database.
  Future<
      ({
        PasswordResetResult result,
        UuidValue? passwordResetRequestId,
      })> startPasswordReset(
    final Session session, {
    required String email,
    required final Transaction? transaction,
  }) async {
    return DatabaseUtil.runInTransactionOrSavepoint(
      session.db,
      transaction,
      (final transaction) async {
        email = email.trim().toLowerCase();

        if (await _hasTooManyPasswordResetRequestAttempts(
          session,
          email: email,
        )) {
          throw EmailPasswordResetTooManyAttemptsException();
        }

        final account = await EmailAccount.db.findFirstRow(
          session,
          where: (final t) => t.email.equals(email),
          transaction: transaction,
        );

        if (account == null) {
          return (
            result: PasswordResetResult.emailDoesNotExist,
            passwordResetRequestId: null,
          );
        }

        final verificationCode =
            _config.passwordResetVerificationCodeGenerator();

        final verificationCodeHash = await passwordHashUtils.createHash(
          value: verificationCode,
        );

        final resetRequest =
            await EmailAccountPasswordResetRequest.db.insertRow(
          session,
          EmailAccountPasswordResetRequest(
            emailAccountId: account.id!,
            verificationCodeHash: verificationCodeHash.hash.asByteData,
            verificationCodeSalt: verificationCodeHash.salt.asByteData,
          ),
          transaction: transaction,
        );

        _config.sendPasswordResetVerificationCode?.call(
          session,
          email: email,
          passwordResetRequestId: resetRequest.id!,
          verificationCode: verificationCode,
          transaction: transaction,
        );

        return (
          result: PasswordResetResult.passwordResetSent,
          passwordResetRequestId: resetRequest.id!,
        );
      },
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

  Future<bool> _hasTooManyPasswordResetAttempts(
    final Session session, {
    required final UuidValue passwordResetRequestId,
  }) async {
    // NOTE: The attempt counting runs in a separate transaction, so that it is never rolled back with the parent transaction.
    return session.db.transaction(
      (final transaction) async {
        await EmailAccountPasswordResetAttempt.db.insertRow(
          session,
          EmailAccountPasswordResetAttempt(
            ipAddress: session.remoteIpAddress,
            passwordResetRequestId: passwordResetRequestId,
          ),
          transaction: transaction,
        );

        final recentAttempts = await EmailAccountPasswordResetAttempt.db.count(
          session,
          where: (final t) =>
              t.passwordResetRequestId.equals(passwordResetRequestId),
          transaction: transaction,
        );

        return recentAttempts >
            _config.passwordResetVerificationCodeAllowedAttempts;
      },
    );
  }

  Future<bool> _hasTooManyPasswordResetRequestAttempts(
    final Session session, {
    required final String email,
  }) async {
    // NOTE: The attempt counting runs in a separate transaction, so that it is
    // never rolled back with the parent transaction.
    return session.db.transaction((final transaction) async {
      await EmailAccountPasswordResetRequestAttempt.db.insertRow(
        session,
        EmailAccountPasswordResetRequestAttempt(
          email: email,
          ipAddress: session.remoteIpAddress,
        ),
        transaction: transaction,
      );

      final oldestRelevantAttemptTimestamp = clock.now().subtract(
            _config.maxPasswordResetAttempts.timeframe,
          );

      final recentRequests =
          await EmailAccountPasswordResetRequestAttempt.db.count(
        session,
        where: (final t) =>
            (t.email.equals(email) |
                t.ipAddress.equals(session.remoteIpAddress)) &
            (t.attemptedAt > oldestRelevantAttemptTimestamp),
        transaction: transaction,
      );

      return recentRequests > _config.maxPasswordResetAttempts.maxAttempts;
    });
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

/// Describes the result of a password reset operation.
enum PasswordResetResult {
  /// A password reset email has been sent.
  passwordResetSent,

  /// No account exists for the given email.
  emailDoesNotExist,
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

extension EmailAccountPasswordResetRequestExtension
    on EmailAccountPasswordResetRequest {
  bool isExpired(EmailIDPConfig config) {
    final resetExpiresAt = createdAt.add(
      config.passwordResetVerificationCodeLifetime,
    );

    return resetExpiresAt.isBefore(clock.now());
  }
}
