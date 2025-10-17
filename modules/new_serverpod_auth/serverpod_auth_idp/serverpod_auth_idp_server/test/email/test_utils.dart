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
  EmailIDPUtils.config = EmailIDPConfig(
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
  );

  await EmailIDPUtils.startAccountCreation(
    session,
    email: email,
    password: password,
  );

  await EmailIDPUtils.verifyAccountCreation(
    session,
    accountRequestId: pendingAccountRequestId,
    verificationCode: pendingAccountVerificationCode,
  );

  final creationResult = await EmailIDPUtils.completeAccountCreation(
    session,
    authUserId: authUserId,
    accountRequestId: pendingAccountRequestId,
  );

  EmailIDPUtils.config = EmailIDPConfig();

  return (
    accountRequestId: pendingAccountRequestId,
    verificationCode: pendingAccountVerificationCode,
    emailAccountId: creationResult.emailAccountId,
  );
}

Future<(UuidValue paswordResetRequestId, String verificationCode)>
    requestPasswordReset(
  final Session session, {
  required final String email,
}) async {
  late UuidValue pendingPasswordResetRequestId;
  late String pendingPasswordResetVerificationCode;
  EmailIDPUtils.config = EmailIDPConfig(
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
  );

  await EmailIDPUtils.startPasswordReset(
    session,
    email: email,
  );

  EmailIDPUtils.config = EmailIDPConfig();

  return (pendingPasswordResetRequestId, pendingPasswordResetVerificationCode);
}

Future<void> resetPassword(
  final Session session, {
  required final String email,
  required final String newPassword,
}) async {
  late UuidValue pendingPasswordResetRequestId;
  late String pendingPasswordResetVerificationCode;
  EmailIDPUtils.config = EmailIDPConfig(
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
  );

  await EmailIDPUtils.startPasswordReset(
    session,
    email: email,
  );

  EmailIDPUtils.config = EmailIDPConfig();

  await EmailIDPUtils.completePasswordReset(
    session,
    passwordResetRequestId: pendingPasswordResetRequestId,
    verificationCode: pendingPasswordResetVerificationCode,
    newPassword: newPassword,
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
