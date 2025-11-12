import 'package:serverpod/database.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  final session = await IntegrationTestServer().session();

  tearDown(() async {
    await ObjectUser.db.deleteWhere(session, where: (_) => Constant.bool(true));
    await UserInfo.db.deleteWhere(session, where: (_) => Constant.bool(true));
  });

  test(
    'Given an object relation to a module model when querying for the object then the module model is included.',
    () async {
      const expectedName = 'John Doe';

      final user = UserInfo(
        userIdentifier: '1234',
        userName: expectedName,
        created: DateTime.now(),
        scopeNames: [],
        blocked: false,
      );
      final insertedUser = await UserInfo.db.insertRow(session, user);

      final objectUser = ObjectUser(
        userInfoId: insertedUser.id!,
        userInfo: insertedUser,
      );
      await ObjectUser.db.insertRow(session, objectUser);

      final result = await ObjectUser.db.findFirstRow(
        session,
        orderBy: (final t) => t.id,
        include: ObjectUser.include(
          userInfo: UserInfo.include(),
        ),
      );

      expect(result?.userInfo?.userName, expectedName);
    },
  );
}
