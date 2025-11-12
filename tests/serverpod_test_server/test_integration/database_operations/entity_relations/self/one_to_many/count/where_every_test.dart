import 'package:serverpod/database.dart' as db;
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  final session = await IntegrationTestServer().session();

  group('Given models with one to many relation ', () {
    tearDown(() async {
      await Cat.db.deleteWhere(session, where: (_) => db.Constant.bool(true));
    });

    test(
      'when counting models filtered on every many relation then result is as expected',
      () async {
        final zelda = await Cat.db.insertRow(session, Cat(name: 'Zelda'));
        final smulan = await Cat.db.insertRow(session, Cat(name: 'Smulan'));

        await Cat.db.insert(session, [
          Cat(name: 'Kitten1', motherId: zelda.id),
          Cat(name: 'Kitten2', motherId: zelda.id),
          Cat(name: 'Kitten3', motherId: zelda.id),
          Cat(name: 'Smulan II', motherId: smulan.id),
        ]);

        final catCount = await Cat.db.count(
          session,
          where: (final t) => t.kittens.every((final o) => o.name.ilike('kitt%')),
        );

        expect(catCount, 1);
      },
    );

    test(
      'when counting models filtered on multiple every many relation then result is as expected.',
      () async {
        final zelda = await Cat.db.insertRow(session, Cat(name: 'Zelda'));
        final smulan = await Cat.db.insertRow(session, Cat(name: 'Smulan'));

        await Cat.db.insert(session, [
          Cat(name: 'Kitten1', motherId: zelda.id),
          Cat(name: 'Kitten2', motherId: zelda.id),
          Cat(name: 'Kitten3', motherId: zelda.id),
          Cat(name: 'Smulan II', motherId: smulan.id),
        ]);

        final catCount = await Cat.db.count(
          session,
          where: (final t) =>
              t.kittens.every((final t) => t.name.ilike('kitt%')) |
              t.kittens.every((final t) => t.name.ilike('smul%')),
        );

        expect(catCount, 2);
      },
    );
  });

  group('Given models with nested one to many relation', () {
    tearDown(() async {
      await Cat.db.deleteWhere(session, where: (_) => db.Constant.bool(true));
    });

    test(
      'when counting models filtered on nested every many relation then result is as expected',
      () async {
        final zelda = await Cat.db.insertRow(session, Cat(name: 'Zelda'));
        final smulan = await Cat.db.insertRow(session, Cat(name: 'Smulan'));

        final kittens = await Cat.db.insert(session, [
          Cat(name: 'Kitten1', motherId: zelda.id),
          Cat(name: 'Kitten2', motherId: zelda.id),
          Cat(name: 'Kitten3', motherId: zelda.id),
          Cat(name: 'Smulan II', motherId: smulan.id),
        ]);

        await Cat.db.insert(session, [
          Cat(name: 'Nested Kitten1', motherId: kittens.last.id),
          Cat(name: 'Nested Kitten2', motherId: kittens.last.id),
          Cat(name: 'Nested Kitten3', motherId: kittens.last.id),
        ]);

        final catCount = await Cat.db.count(
          session,
          where: (final t) => t.kittens.every(
            // All cats where all kittens has kittens with name starting with 'Nest'
            (final o) => o.kittens.every((final c) => c.name.ilike('nest%')),
          ),
        );

        expect(catCount, 1);
      },
    );

    test(
      'when counting models filtered on nested every many relation in combination with separate filter then result is as expected',
      () async {
        final zelda = await Cat.db.insertRow(session, Cat(name: 'Zelda'));
        final smulan = await Cat.db.insertRow(session, Cat(name: 'Smulan'));

        final kittens = await Cat.db.insert(session, [
          Cat(name: 'Kitten1', motherId: zelda.id),
          Cat(name: 'Smulan II', motherId: smulan.id),
        ]);

        await Cat.db.insert(session, [
          Cat(name: 'Nested Kitten1', motherId: kittens.first.id),
          Cat(name: 'Nested Kitten2', motherId: kittens.last.id),
          Cat(name: 'Nested Kitten3', motherId: kittens.last.id),
          Cat(name: 'Smulan III', motherId: kittens.last.id),
        ]);

        final catCount = await Cat.db.count(
          session,
          where: (final t) => t.kittens.every(
            (final o) => o.kittens.every((final o) => o.name.ilike('%kitten%')),
          ),
        );

        expect(catCount, 1);
      },
    );
  });
}
