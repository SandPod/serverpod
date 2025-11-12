import 'package:serverpod/database.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  final session = await IntegrationTestServer().session();

  group('Given models with many to many relation', () {
    tearDown(() async {
      await Member.db.deleteWhere(session, where: (_) => Constant.bool(true));
      await Blocking.db.deleteWhere(session, where: (_) => Constant.bool(true));
    });

    test(
      'when deleting models filtered by any many relation then result is as expected',
      () async {
        final member = await Member.db.insert(session, [
          Member(name: 'Member1'),
          Member(name: 'Member2'),
          Member(name: 'Member3'),
          Member(name: 'Member4'),
        ]);

        await Blocking.db.insert(session, [
          // Member1
          Blocking(blockedById: member[0].id!, blockedId: member[1].id!),
          Blocking(blockedById: member[0].id!, blockedId: member[2].id!),
          Blocking(blockedById: member[0].id!, blockedId: member[3].id!),

          // Member2
          Blocking(blockedById: member[1].id!, blockedId: member[0].id!),
          Blocking(blockedById: member[1].id!, blockedId: member[2].id!),

          // Member3
          Blocking(blockedById: member[2].id!, blockedId: member[0].id!),
        ]);

        final deleted = await Member.db.deleteWhere(
          session,
          where: (final t) => t.blocking.any(),
        );

        expect(deleted, hasLength(3));
        final deletedIds = deleted.map((final c) => c.id).toList();
        expect(
          deletedIds,
          containsAll(
            [member[0].id!, member[1].id!, member[2].id!],
          ),
        );
      },
    );

    test(
      'when deleting models filtered by filtered any many relation then result is as expected',
      () async {
        final member = await Member.db.insert(session, [
          Member(name: 'Member1'),
          Member(name: 'Member2'),
          Member(name: 'Member3'),
          Member(name: 'Member4'),
        ]);

        await Blocking.db.insert(session, [
          // Member1
          Blocking(blockedById: member[0].id!, blockedId: member[1].id!),
          Blocking(blockedById: member[0].id!, blockedId: member[2].id!),
          Blocking(blockedById: member[0].id!, blockedId: member[3].id!),

          // Member2
          Blocking(blockedById: member[1].id!, blockedId: member[0].id!),
          Blocking(blockedById: member[1].id!, blockedId: member[2].id!),

          // Member3
          Blocking(blockedById: member[2].id!, blockedId: member[0].id!),
        ]);

        final deleted = await Member.db.deleteWhere(
          session,
          where: (final t) => t.blocking.any(
            (final c) => c.blockedId.equals(member[0].id!),
          ),
        );

        expect(deleted, hasLength(2));
        final deletedIds = deleted.map((final c) => c.id).toList();
        expect(deletedIds, [member[1].id, member[2].id]);
      },
    );

    test(
      'when deleting models filtered by any many relation in combination with other filter then result is as expected',
      () async {
        final member = await Member.db.insert(session, [
          Member(name: 'Member1'),
          Member(name: 'Member2'),
          Member(name: 'Member3'),
          Member(name: 'Member4'),
        ]);

        await Blocking.db.insert(session, [
          // Member1
          Blocking(blockedById: member[0].id!, blockedId: member[1].id!),
          Blocking(blockedById: member[0].id!, blockedId: member[2].id!),
          Blocking(blockedById: member[0].id!, blockedId: member[3].id!),

          // Member2
          Blocking(blockedById: member[1].id!, blockedId: member[0].id!),
          Blocking(blockedById: member[1].id!, blockedId: member[2].id!),
        ]);

        final deleted = await Member.db.deleteWhere(
          session,
          where: (final t) => t.blocking.any() | t.name.equals('Member3'),
        );

        expect(deleted, hasLength(3));
        final deletedIds = deleted.map((final c) => c.id).toList();
        expect(
          deletedIds,
          containsAll(
            [member[0].id, member[1].id, member[2].id],
          ),
        );
      },
    );

    test(
      'when deleting models filtered by multiple filtered any many relation then result is as expected',
      () async {
        final member = await Member.db.insert(session, [
          Member(name: 'Member1'),
          Member(name: 'Member2'),
          Member(name: 'Member3'),
          Member(name: 'Member4'),
        ]);

        await Blocking.db.insert(session, [
          // Member1
          Blocking(blockedById: member[0].id!, blockedId: member[1].id!),
          Blocking(blockedById: member[0].id!, blockedId: member[2].id!),
          Blocking(blockedById: member[0].id!, blockedId: member[3].id!),

          // Member2
          Blocking(blockedById: member[1].id!, blockedId: member[0].id!),
          Blocking(blockedById: member[1].id!, blockedId: member[2].id!),

          // Member3
          Blocking(blockedById: member[2].id!, blockedId: member[0].id!),
        ]);

        final deleted = await Member.db.deleteWhere(
          session,
          where: (final t) =>
              t.blocking.any((final o) => o.blocked.name.ilike('%3')) &
              t.blockedBy.any((final o) => o.blockedBy.name.ilike('%1')),
        );

        expect(deleted, hasLength(1));
        expect(deleted.firstOrNull?.id, member[1].id!);
      },
    );
  });
}
