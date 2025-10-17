import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/profile.dart';
import 'package:serverpod_auth_core_server/session.dart';

import '../../../generated/protocol.dart';
import 'email_idp_admin.dart';
import 'email_idp_config.dart';
import 'email_idp_server_exceptions.dart';
import 'email_idp_utils.dart';

/// Main class for the email identity provider.
/// The methods defined here are intended to be called from an endpoint.
///
/// The `admin` property provides access to [EmailIDPAdmin], which contains
/// admin-related methods for managing email-backed accounts.
///
/// If you would like to modify the authentication flow, consider creating
/// custom implementations of the relevant methods.
final class EmailIDP {
  /// Creates a new instance of [EmailIDP].
  EmailIDP({required final EmailIDPConfig config}) {
    // Currently no config options are used.
  }

  /// Collection of admin-related functions.
  static final EmailIDPAdmin admin = EmailIDPAdmin();

  /// {@macro email_account_base_endpoint.login}
  Future<AuthSuccess> login(
    final Session session, {
    required final String email,
    required final String password,
    final Transaction? transaction,
  }) async {
    return DatabaseUtil.runInTransactionOrSavepoint(
      session.db,
      transaction,
      (final transaction) => _withReplacedServerEmailException(() async {
        final authUserId = await EmailIDPUtils.authenticate(
          session,
          email: email,
          password: password,
          transaction: transaction,
        );

        return admin.createSession(
          session,
          authUserId,
          transaction: transaction,
        );
      }),
    );
  }

  /// {@macro email_account_base_endpoint.start_registration}
  Future<UuidValue> startRegistration(
    final Session session, {
    required final String email,
    required final String password,
    final Transaction? transaction,
  }) async {
    return await _withReplacedServerEmailException(() async {
      final result = await EmailIDPUtils.startAccountCreation(
        session,
        email: email,
        password: password,
        transaction: transaction,
      );

      // The details of the operation are intentionally not given to the caller, in order to not leak the existence of accounts.
      // Clients should always show something like "check your email to proceed with the account creation".
      // One might want to send a "password reset" in case of a "email already exists" status, to help the user log in.
      if (result.result != EmailAccountRequestResult.accountRequestCreated) {
        session.log(
          'Failed to start account registration for $email, reason: ${result.result}',
          level: LogLevel.debug,
        );
      }

      // NOTE: It is necessary to keep the version of the uuid in sync with the
      // one used by the [EmailAccountRequest] model to prevent attackers from
      // using the difference on the version bit of the uuid to determine whether
      // an email is registered or not.
      return result.accountRequestId ?? const Uuid().v4obj();
    });
  }

  /// {@macro email_account_base_endpoint.finish_registration}
  Future<AuthSuccess> finishRegistration(
    final Session session, {
    required final UuidValue accountRequestId,
    required final String verificationCode,
    final Transaction? transaction,
  }) async {
    return DatabaseUtil.runInTransactionOrSavepoint(
      session.db,
      transaction,
      (final transaction) => _withReplacedServerEmailException(() async {
        final accountRequest = await EmailIDPUtils.verifyAccountCreation(
          session,
          accountRequestId: accountRequestId,
          verificationCode: verificationCode,
          transaction: transaction,
        );

        final newUser = await AuthUsers.create(
          session,
          transaction: transaction,
        );
        final authUserId = newUser.id;

        await UserProfiles.createUserProfile(
          session,
          authUserId,
          UserProfileData(
            email: accountRequest.email,
          ),
          transaction: transaction,
        );

        await EmailIDPUtils.completeAccountCreation(
          session,
          accountRequestId: accountRequestId,
          authUserId: authUserId,
          transaction: transaction,
        );

        return admin.createSession(
          session,
          authUserId,
          transaction: transaction,
        );
      }),
    );
  }

  /// {@macro email_account_base_endpoint.start_password_reset}
  Future<UuidValue> startPasswordReset(
    final Session session, {
    required final String email,
    final Transaction? transaction,
  }) async {
    return await _withReplacedServerEmailException(() async {
      final result = await EmailIDPUtils.startPasswordReset(
        session,
        email: email,
        transaction: transaction,
      );

      // The details of the operation are intentionally not given to the caller, in order to not leak the existence of accounts.
      // Clients should always show something like "check your email to proceed with the password reset".
      if (result.result != PasswordResetResult.passwordResetSent) {
        session.log(
          'Failed to start password reset for $email, reason: ${result.result}',
          level: LogLevel.debug,
        );
      }

      // NOTE: It is necessary to keep the version of the uuid in sync with the
      // one used by the [EmailAccountPasswordResetRequestAttempt] model to
      // prevent attackers from using the difference on the version bit of the
      // uuid to determine whether an email is registered or not.
      return result.passwordResetRequestId ?? const Uuid().v4obj();
    });
  }

  /// {@macro email_account_base_endpoint.finish_password_reset}
  Future<AuthSuccess> finishPasswordReset(
    final Session session, {
    required final UuidValue passwordResetRequestId,
    required final String verificationCode,
    required final String newPassword,
    final Transaction? transaction,
  }) async {
    return DatabaseUtil.runInTransactionOrSavepoint(
      session.db,
      transaction,
      (final transaction) => _withReplacedServerEmailException(() async {
        final authUserId = await EmailIDPUtils.completePasswordReset(
          session,
          passwordResetRequestId: passwordResetRequestId,
          verificationCode: verificationCode,
          newPassword: newPassword,
          transaction: transaction,
        );

        await AuthSessions.destroyAllSessions(
          session,
          authUserId: authUserId,
          transaction: transaction,
        );

        return admin.createSession(
          session,
          authUserId,
          transaction: transaction,
        );
      }),
    );
  }
}

/// Replaces server-side exceptions by client-side exceptions, hiding details
/// that could leak account information.
Future<T> _withReplacedServerEmailException<T>(
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
