import 'package:clock/clock.dart';
import 'package:serverpod/serverpod.dart';

import '../../../../generated/protocol.dart';
import '../../util/byte_data_extension.dart';
import '../../util/session_extension.dart';
import '../../util/uint8list_extension.dart';
import '../email_idp_config.dart';
import '../email_idp_server_exceptions.dart';
import 'email_idp_password_hash_util.dart';

/// {@template email_idp_password_reset_utils}
/// Class for handling password reset operations in the email account module.
///
/// The main entry point is the [startPasswordReset] method, which can be used
/// to start a password reset process.
///
/// This class also contains utility functions for administration tasks, such as
/// deleting expired password reset requests and password reset attempts.
/// {@endtemplate}
class EmailIDPPasswordResetUtils {
  final EmailIDPPasswordHashUtil _passwordHashUtils;
  final EmailIDPPasswordResetUtilsConfig _config;

  /// Creates a new [EmailIDPPasswordResetUtils] instance.
  EmailIDPPasswordResetUtils({
    required final EmailIDPPasswordResetUtilsConfig config,
    required final EmailIDPPasswordHashUtil passwordHashUtils,
  })  : _config = config,
        _passwordHashUtils = passwordHashUtils;

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

        if (!await _passwordHashUtils.validateHash(
          value: verificationCode,
          hash: resetRequest.verificationCodeHash.asUint8List,
          salt: resetRequest.verificationCodeSalt.asUint8List,
        )) {
          throw EmailPasswordResetInvalidVerificationCodeException();
        }

        if (resetRequest
            .isExpired(_config.passwordResetVerificationCodeLifetime)) {
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

        await setPassword(
          session,
          emailAccount: account,
          password: newPassword,
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

  /// {@template email_idp_password_reset_utils.delete_password_reset_attempts}
  /// Cleans up the log of failed password reset attempts older than
  /// [olderThan].
  ///
  /// If [olderThan] is `null`, this will remove all attempts outside the time
  /// window that is checked upon password reset requests, as configured in
  /// [EmailIDPConfig.maxPasswordResetAttempts].
  /// {@endtemplate}
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

  /// Sets the password for the authentication belonging to the given email
  /// account.
  ///
  /// The [password] argument is not checked against the configured password
  /// policy.
  Future<void> setPassword(
    final Session session, {
    required final EmailAccount emailAccount,
    required final String password,
    final Transaction? transaction,
  }) async {
    final passwordHash = await _passwordHashUtils.createHash(
      value: password,
    );

    await EmailAccount.db.updateRow(
      session,
      emailAccount.copyWith(
        passwordHash: passwordHash.hash.asByteData,
        passwordSalt: passwordHash.salt.asByteData,
      ),
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
  Future<PasswordResetResult> startPasswordReset(
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
          return PasswordResetResult.emailDoesNotExist();
        }

        final verificationCode =
            _config.passwordResetVerificationCodeGenerator();

        final verificationCodeHash = await _passwordHashUtils.createHash(
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

        return PasswordResetResult.sent(resetRequest.id!);
      },
    );
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
}

/// Configuration options for the [EmailIDPPasswordResetUtils] class.
class EmailIDPPasswordResetUtilsConfig {
  /// Function for validating the password.
  final PasswordValidationFunction passwordValidationFunction;

  /// The number of allowed attempts to verify the password reset code.
  final int passwordResetVerificationCodeAllowedAttempts;

  /// The lifetime of the password reset verification code.
  final Duration passwordResetVerificationCodeLifetime;

  /// Callback to be invoked after a password reset is successfully completed.
  final OnPasswordResetCompletedFunction? onPasswordResetCompleted;

  /// The maximum number of password reset attempts allowed within the timeframe.
  final RateLimit maxPasswordResetAttempts;

  /// Function for generating the password reset verification code.
  final String Function() passwordResetVerificationCodeGenerator;

  /// Callback to be invoked for sending out the password reset verification code.
  final SendPasswordResetVerificationCodeFunction?
      sendPasswordResetVerificationCode;

  /// Creates a new [EmailIDPPasswordResetUtilsConfig] instance.
  EmailIDPPasswordResetUtilsConfig({
    required this.passwordValidationFunction,
    required this.passwordResetVerificationCodeAllowedAttempts,
    required this.passwordResetVerificationCodeLifetime,
    required this.onPasswordResetCompleted,
    required this.maxPasswordResetAttempts,
    required this.passwordResetVerificationCodeGenerator,
    required this.sendPasswordResetVerificationCode,
  });

  /// Creates a new [EmailIDPPasswordResetUtilsConfig] instance from an
  /// [EmailIDPConfig] instance.
  factory EmailIDPPasswordResetUtilsConfig.fromEmailIDPConfig(
      final EmailIDPConfig config) {
    return EmailIDPPasswordResetUtilsConfig(
      passwordValidationFunction: config.passwordValidationFunction,
      passwordResetVerificationCodeAllowedAttempts:
          config.passwordResetVerificationCodeAllowedAttempts,
      passwordResetVerificationCodeLifetime:
          config.passwordResetVerificationCodeLifetime,
      onPasswordResetCompleted: config.onPasswordResetCompleted,
      maxPasswordResetAttempts: config.maxPasswordResetAttempts,
      passwordResetVerificationCodeGenerator:
          config.passwordResetVerificationCodeGenerator,
      sendPasswordResetVerificationCode:
          config.sendPasswordResetVerificationCode,
    );
  }
}

/// No account exists for the given email.
final class PasswordResetEmailDoesNotExistResult extends PasswordResetResult {
  const PasswordResetEmailDoesNotExistResult._();
}

/// Describes the result of a password reset operation.
sealed class PasswordResetResult {
  const PasswordResetResult();

  /// Creates a new [PasswordResetResult.emailDoesNotExist] instance.
  factory PasswordResetResult.emailDoesNotExist() {
    return const PasswordResetEmailDoesNotExistResult._();
  }

  /// Creates a new [PasswordResetResult.sent] instance.
  factory PasswordResetResult.sent(final UuidValue passwordResetRequestId) {
    return PasswordResetSentResult._(
        passwordResetRequestId: passwordResetRequestId);
  }
}

/// A password reset email has been sent.
final class PasswordResetSentResult extends PasswordResetResult {
  /// The ID of the password reset request.
  final UuidValue passwordResetRequestId;

  const PasswordResetSentResult._({
    required this.passwordResetRequestId,
  });
}

extension on EmailAccountPasswordResetRequest {
  bool isExpired(final Duration passwordResetVerificationCodeLifetime) {
    final resetExpiresAt = createdAt.add(
      passwordResetVerificationCodeLifetime,
    );

    return resetExpiresAt.isBefore(clock.now());
  }
}
