import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

Future<AuthUserModel> createAuthUser(final Session session) {
  return AuthUsers.create(session);
}

Future<
    ({
      UuidValue accountRequestId,
      String verificationCode,
      UuidValue emailAccountId,
    })> createVerifiedEmailAccount(
  final Session session, {
  required final UuidValue authUserId,
  required final String email,
  required final String password,
}) async {
  late UuidValue pendingAccountRequestId;
  late String pendingAccountVerificationCode;
  final utils = EmailIDPUtils(
      config: EmailIDPConfig(
    passwordHashPepper: 'test',
    sendRegistrationVerificationCode: (
      final session, {
      required final email,
      required final accountRequestId,
      required final verificationCode,
      required final transaction,
    }) {
      pendingAccountRequestId = accountRequestId;
      pendingAccountVerificationCode = verificationCode;
    },
  ));

  await utils.accountCreationUtils.startAccountCreation(
    session,
    email: email,
    password: password,
    transaction: null,
  );

  final verifiedAccountRequest =
      await utils.accountCreationUtils.verifyAccountRequest(
    session,
    accountRequestId: pendingAccountRequestId,
    verificationCode: pendingAccountVerificationCode,
    transaction: null,
  );

  final creationResult =
      await utils.accountCreationUtils.finalizeAccountRequest(
    session,
    authUserId: authUserId,
    accountRequest: verifiedAccountRequest,
    transaction: null,
  );

  return (
    accountRequestId: pendingAccountRequestId,
    verificationCode: pendingAccountVerificationCode,
    emailAccountId: creationResult.accountId,
  );
}

Future<(UuidValue passwordResetRequestId, String verificationCode)>
    requestPasswordReset(
  final Session session, {
  required final String email,
}) async {
  late UuidValue pendingPasswordResetRequestId;
  late String pendingPasswordResetVerificationCode;
  final utils = EmailIDPUtils(
      config: EmailIDPConfig(
    passwordHashPepper: 'test',
    sendPasswordResetVerificationCode: (
      final session, {
      required final email,
      required final passwordResetRequestId,
      required final transaction,
      required final verificationCode,
    }) {
      pendingPasswordResetRequestId = passwordResetRequestId;
      pendingPasswordResetVerificationCode = verificationCode;
    },
  ));

  await utils.passwordResetUtils.startPasswordReset(
    session,
    email: email,
    transaction: null,
  );

  return (pendingPasswordResetRequestId, pendingPasswordResetVerificationCode);
}

Future<void> resetPassword(
  final Session session, {
  required final String email,
  required final String newPassword,
}) async {
  late UuidValue pendingPasswordResetRequestId;
  late String pendingPasswordResetVerificationCode;
  final utils = EmailIDPUtils(
      config: EmailIDPConfig(
    passwordHashPepper: 'test',
    sendPasswordResetVerificationCode: (
      final session, {
      required final email,
      required final passwordResetRequestId,
      required final transaction,
      required final verificationCode,
    }) {
      pendingPasswordResetRequestId = passwordResetRequestId;
      pendingPasswordResetVerificationCode = verificationCode;
    },
  ));

  await utils.passwordResetUtils.startPasswordReset(
    session,
    email: email,
    transaction: null,
  );

  await utils.passwordResetUtils.completePasswordReset(
    session,
    passwordResetRequestId: pendingPasswordResetRequestId,
    verificationCode: pendingPasswordResetVerificationCode,
    newPassword: newPassword,
    transaction: null,
  );
}

Future<void> cleanUpEmailAccountDatabaseEntities(final Session session) async {
  for (final authUser in await AuthUsers.list(session)) {
    await AuthUsers.delete(
      session,
      authUserId: authUser.id,
    );
  }

  await EmailAccountRequest.db.deleteWhere(
    session,
    where: (final t) => Constant.bool(true),
  );

  await EmailAccountFailedLoginAttempt.db.deleteWhere(
    session,
    where: (final t) => Constant.bool(true),
  );

  await EmailAccountPasswordResetRequestAttempt.db.deleteWhere(
    session,
    where: (final t) => Constant.bool(true),
  );

  await EmailAccountPasswordResetAttempt.db.deleteWhere(
    session,
    where: (final t) => Constant.bool(true),
  );

  await EmailAccountRequestCompletionAttempt.db.deleteWhere(
    session,
    where: (final t) => Constant.bool(true),
  );
}
