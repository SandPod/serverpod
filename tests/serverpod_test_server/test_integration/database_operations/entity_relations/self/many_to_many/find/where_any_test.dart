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
      'when fetching models filtered by any many relation then result is as expected',
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

        final fetchedMembers = await Member.db.find(
          session,
          where: (final t) => t.blocking.any(),
        );

        final memberNames = fetchedMembers.map((final e) => e.name);

        expect(memberNames, hasLength(3));
        expect(memberNames, containsAll(['Member1', 'Member2', 'Member3']));
      },
    );

    test(
      'when fetching models filtered by filtered any many relation then result is as expected',
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

        final fetchedMembers = await Member.db.find(
          session,
          where: (final t) => t.blocking.any(
            (final c) => c.blockedId.equals(member[0].id!),
          ),
        );

        final memberNames = fetchedMembers.map((final e) => e.name);

        expect(memberNames, hasLength(2));
        expect(memberNames, ['Member2', 'Member3']);
      },
    );

    test(
      'when fetching models filtered by any many relation in combination with other filter then result is as expected',
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

        final fetchedMembers = await Member.db.find(
          session,
          where: (final t) => t.blocking.any() | t.name.equals('Member3'),
        );

        final memberNames = fetchedMembers.map((final e) => e.name);

        expect(memberNames, hasLength(3));
        expect(memberNames, containsAll(['Member1', 'Member2', 'Member3']));
      },
    );

    test(
      'when fetching models filtered by multiple filtered any many relation then result is as expected',
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

        final fetchedMembers = await Member.db.find(
          session,
          where: (final t) =>
              t.blocking.any((final o) => o.blocked.name.ilike('%3')) &
              t.blockedBy.any((final o) => o.blockedBy.name.ilike('%1')),
        );

        final memberNames = fetchedMembers.map((final e) => e.name);

        expect(memberNames, ['Member2']);
      },
    );
  });
}
