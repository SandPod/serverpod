import 'dart:typed_data';

import 'package:clock/clock.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

import '../../../generated/protocol.dart';
import '../util/uint8list_extension.dart';
import 'email_idp_server_exceptions.dart';
import 'email_idp_utils.dart';

/// Administrative email account management functions.
///
/// These should generally not be exposed to clients, but might be useful for
/// internal tasks or an admin dashboard.
///
/// An instance of this class is available at [EmailIDPUtils.admin].
final class EmailAccountsAdmin {
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
    required String email,
    required final String? password,
    final Transaction? transaction,
  }) async {
    email = email.toLowerCase();

    final passwordHash = password != null
        ? await EmailAccountSecretHash.createHash(value: password)
        : (hash: Uint8List.fromList([]), salt: Uint8List.fromList([]));

    final account = await EmailAccount.db.insertRow(
      session,
      EmailAccount(
        authUserId: authUserId,
        email: email,
        passwordHash: passwordHash.hash.asByteData,
        passwordSalt: passwordHash.salt.asByteData,
      ),
      transaction: transaction,
    );

    return account.id!;
  }

  /// Deletes an account request by its ID.
  Future<void> deleteEmailAccountRequestById(
    final Session session,
    final UuidValue accountRequestId, {
    final Transaction? transaction,
  }) async {
    await EmailAccountRequest.db.deleteWhere(
      session,
      where: (final t) => t.id.equals(accountRequestId),
      transaction: transaction,
    );
  }

  /// Cleans up expired account creation requests.
  Future<void> deleteExpiredAccountCreations(
    final Session session, {
    final Transaction? transaction,
  }) async {
    final lastValidDateTime = clock.now().subtract(
          EmailIDPUtils.config.registrationVerificationCodeLifetime,
        );

    await EmailAccountRequest.db.deleteWhere(
      session,
      where: (final t) => t.createdAt < lastValidDateTime,
      transaction: transaction,
    );
  }

  /// Cleans up expired password reset attempts.
  Future<void> deleteExpiredPasswordResetRequests(
    final Session session, {
    final Transaction? transaction,
  }) async {
    final lastValidDateTime = clock.now().subtract(
          EmailIDPUtils.config.passwordResetVerificationCodeLifetime,
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
    final Transaction? transaction,
  }) async {
    olderThan ??= EmailIDPUtils.config.failedLoginRateLimit.timeframe;

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
    final Transaction? transaction,
  }) async {
    olderThan ??= EmailIDPUtils.config.maxPasswordResetAttempts.timeframe;

    final removeBefore = clock.now().subtract(olderThan);

    await EmailAccountPasswordResetAttempt.db.deleteWhere(
      session,
      where: (final t) => t.attemptedAt < removeBefore,
      transaction: transaction,
    );
  }

  /// Checks whether an email authentication exists for the given email address.
  Future<
      ({
        UuidValue authUserId,
        UuidValue emailAccountId,
        bool hasPassword,
      })?> findAccount(
    final Session session, {
    required String email,
    final Transaction? transaction,
  }) async {
    email = email.toLowerCase();

    final account = await EmailAccount.db.findFirstRow(
      session,
      where: (final t) => t.email.equals(email),
      transaction: transaction,
    );

    if (account == null) {
      return null;
    }

    return (
      authUserId: account.authUserId,
      emailAccountId: account.id!,
      hasPassword: account.passwordHash.lengthInBytes > 0,
    );
  }

  /// Checks whether an email account request is still pending, and if so
  /// returns the associated email and verification status.
  ///
  /// In case the registration has been completed or the request is expired this
  /// returns `null`.
  Future<
      ({
        String email,
        bool isVerified,
      })?> findEmailAccountRequest(
    final Session session, {
    required final UuidValue accountRequestId,
    final Transaction? transaction,
  }) async {
    final request = await EmailAccountRequest.db.findById(
      session,
      accountRequestId,
      transaction: transaction,
    );

    if (request == null || request.isExpired) {
      return null;
    }

    return (
      email: request.email,
      isVerified: request.verifiedAt != null,
    );
  }

  /// Sets the password for the authentication belonging to the given email.
  ///
  /// The [password] argument is not checked against the configured password
  /// policy.
  ///
  /// Throws an [EmailAccountNotFoundException] in case no account exists for
  /// the given email address.
  Future<void> setPassword(
    final Session session, {
    required String email,
    required final String password,
    final Transaction? transaction,
  }) async {
    email = email.toLowerCase();

    var account = (await EmailAccount.db.find(
      session,
      where: (final t) => t.email.equals(email),
      transaction: transaction,
    ))
        .singleOrNull;

    if (account == null) {
      throw EmailAccountNotFoundException();
    }

    final passwordHash = await EmailAccountSecretHash.createHash(
      value: password,
    );

    account = await EmailAccount.db.updateRow(
      session,
      account.copyWith(
        passwordHash: passwordHash.hash.asByteData,
        passwordSalt: passwordHash.salt.asByteData,
      ),
      transaction: transaction,
    );
  }
}

/// Admin operations complementing the end-user [EmailIDP] functionality.
///
/// An instance of this class is available at [EmailIDP.admin].
final class EmailIDPAdmin {
  static const String _method = 'email';

  /// Create a session for the given auth user.
  ///
  /// The session is marked as originating from the `email` provider.
  Future<AuthSuccess> createSession(
    final Session session,
    final UuidValue authUserId, {
    required final Transaction? transaction,
  }) async {
    return AuthSessions.createSession(
      session,
      authUserId: authUserId,
      method: _method,
      transaction: transaction,
    );
  }

  /// Creates a user with an email-based authentication and the associated
  /// profile.
  ///
  /// The end result is identical to the combination of
  /// [EmailIDP.startRegistration] and [EmailIDP.finishRegistration].
  /// The [email] is considered verified by default.
  ///
  /// Returns the newly created [AuthUser]'s id.
  Future<UuidValue> createUser(
    final Session session, {
    required final String email,
    required final String password,
    final Transaction? transaction,
  }) async {
    return DatabaseUtil.runInTransactionOrSavepoint(
      session.db,
      transaction,
      (final transaction) async {
        final newUser = await AuthUsers.create(
          session,
          transaction: transaction,
        );
        final authUserId = newUser.id;

        await UserProfiles.createUserProfile(
          session,
          authUserId,
          UserProfileData(
            email: email,
          ),
          transaction: transaction,
        );

        await EmailIDPUtils.admin.createEmailAuthentication(
          session,
          authUserId: authUserId,
          email: email,
          password: password,
          transaction: transaction,
        );

        return authUserId;
      },
    );
  }
}

extension on EmailAccountRequest {
  bool get isExpired {
    final requestExpiresAt = createdAt.add(
      EmailIDPUtils.config.registrationVerificationCodeLifetime,
    );

    return requestExpiresAt.isBefore(clock.now());
  }
}
