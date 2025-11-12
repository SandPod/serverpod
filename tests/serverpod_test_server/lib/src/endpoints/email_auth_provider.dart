import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class EmailAuthTestMethods extends Endpoint {
  Future<String?> findVerificationCode(
    final Session session,
    final String userName,
    final String email,
  ) async {
    final authRequest = await EmailCreateAccountRequest.db.findFirstRow(
      session,
      where: (final t) => t.userName.equals(userName) & t.email.equals(email),
    );

    return authRequest?.verificationCode;
  }

  Future<String?> findResetCode(final Session session, final String email) async {
    final userInfo = await UserInfo.db.findFirstRow(
      session,
      where: (final t) => t.email.equals(email),
    );

    final userId = userInfo?.id;
    if (userId == null) return null;

    final resetRequest = await EmailReset.db.findFirstRow(
      session,
      where: (final t) => t.userId.equals(userId),
    );

    return resetRequest?.verificationCode;
  }

  Future<void> tearDown(final Session session) async {
    await Future.wait([
      EmailCreateAccountRequest.db.deleteWhere(
        session,
        where: (final t) => Constant.bool(true),
      ),
      EmailAuth.db.deleteWhere(
        session,
        where: (final t) => Constant.bool(true),
      ),
      UserImage.db.deleteWhere(
        session,
        where: (final t) => Constant.bool(true),
      ),
      UserInfo.db.deleteWhere(session, where: (final t) => Constant.bool(true)),
      EmailReset.db.deleteWhere(session, where: (final t) => Constant.bool(true)),
    ]);
  }

  Future<bool> createUser(
    final Session session,
    final String userName,
    final String email,
    final String password,
  ) async {
    final userInfo = await Emails.createUser(session, userName, email, password);
    print('User info: $userInfo');
    return userInfo != null;
  }
}
