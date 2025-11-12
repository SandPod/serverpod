import 'package:serverpod/database.dart' as db;
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  final session = await IntegrationTestServer().session();
  group('Given models with one to many relation', () {
    tearDown(() async {
      await Cat.db.deleteWhere(session, where: (_) => db.Constant.bool(true));
    });

    test(
      'when deleting models filtered on count of many relation then only matching models are deleted',
      () async {
        final zelda = await Cat.db.insertRow(session, Cat(name: 'Zelda'));
        final smulan = await Cat.db.insertRow(session, Cat(name: 'Smulan'));

        await Cat.db.insert(session, [
          Cat(name: 'Kitten1', motherId: zelda.id),
          Cat(name: 'Kitten2', motherId: zelda.id),
          Cat(name: 'Kitten3', motherId: zelda.id),
          Cat(name: 'Kitten4', motherId: smulan.id),
        ]);

        final deletedCats = await Cat.db.deleteWhere(
          session,
          where: (final t) => t.kittens.count() > 1,
        );

        expect(deletedCats, hasLength(1));
        expect(deletedCats.firstOrNull?.id, zelda.id);
      },
    );

    test(
      'when deleting models filtered on filtered many relation count then result is as expected',
      () async {
        final zelda = await Cat.db.insertRow(session, Cat(name: 'Zelda'));
        final smulan = await Cat.db.insertRow(session, Cat(name: 'Smulan'));

        await Cat.db.insert(session, [
          Cat(name: 'Kitten1', motherId: zelda.id),
          Cat(name: 'Kitten2', motherId: zelda.id),
          Cat(name: 'Kitten3', motherId: zelda.id),
          Cat(name: 'Smulan II', motherId: smulan.id),
        ]);

        final deletedCats = await Cat.db.deleteWhere(
          session,
          where: (final t) => t.kittens.count((final t) => t.name.ilike('kitt%')) > 1,
        );

        expect(deletedCats, hasLength(1));
        expect(deletedCats.firstOrNull?.id, zelda.id);
      },
    );

    test(
      'when deleting models filtered on many relation count in combination with other filter then result is as expected.',
      () async {
        final zelda = await Cat.db.insertRow(session, Cat(name: 'Zelda'));
        final smulan = await Cat.db.insertRow(session, Cat(name: 'Smulan'));

        await Cat.db.insert(session, [
          Cat(name: 'Kitten1', motherId: zelda.id),
          Cat(name: 'Kitten2', motherId: zelda.id),
          Cat(name: 'Kitten3', motherId: zelda.id),
          Cat(name: 'Smulan II', motherId: smulan.id),
        ]);

        final deletedCats = await Cat.db.deleteWhere(
          session,
          where: (final t) => (t.kittens.count() > 2) | t.name.equals('Smulan'),
        );

        expect(deletedCats, hasLength(2));
        final deletedCatIds = deletedCats.map((final c) => c.id).toList();
        expect(deletedCatIds, containsAll([zelda.id, smulan.id]));
      },
    );

    test(
      'when deleting models filtered on multiple many relation count then result is as expected.',
      () async {
        final zelda = await Cat.db.insertRow(session, Cat(name: 'Zelda'));
        final smulan = await Cat.db.insertRow(session, Cat(name: 'Smulan'));

        await Cat.db.insert(session, [
          Cat(name: 'Kitten1', motherId: zelda.id),
          Cat(name: 'Kitten2', motherId: zelda.id),
          Cat(name: 'Kitten3', motherId: zelda.id),
          Cat(name: 'Smulan II', motherId: smulan.id),
          Cat(name: 'Kitten4', motherId: smulan.id),
        ]);

        final deletedCats = await Cat.db.deleteWhere(
          session,
          where: (final t) => (t.kittens.count() > 1) & (t.kittens.count() < 3),
        );

        expect(deletedCats, hasLength(1));
        expect(deletedCats.firstOrNull?.id, smulan.id);
      },
    );

    test(
      'when deleting models filtered on multiple filtered many relation count then result is as expected.',
      () async {
        final zelda = await Cat.db.insertRow(session, Cat(name: 'Zelda'));
        final smulan = await Cat.db.insertRow(session, Cat(name: 'Smulan'));

        await Cat.db.insert(session, [
          Cat(name: 'Kitten1', motherId: zelda.id),
          Cat(name: 'Kitten2', motherId: zelda.id),
          Cat(name: 'Zelda II', motherId: zelda.id),
          Cat(name: 'Zelda III', motherId: zelda.id),
          Cat(name: 'Smulan II', motherId: smulan.id),
        ]);

        final deletedCats = await Cat.db.deleteWhere(
          session,
          where: (final t) =>
              (t.kittens.count((final t) => t.name.ilike('kitt%')) > 1) &
              (t.kittens.count((final t) => t.name.ilike('Zelda%')) > 1),
        );

        expect(deletedCats, hasLength(1));
        expect(deletedCats.firstOrNull?.id, zelda.id);
      },
    );
  });

  group('Given models with nested one to many relation', () {
    tearDown(() async {
      await Cat.db.deleteWhere(session, where: (_) => db.Constant.bool(true));
    });

    test(
      'when filtering on nested many relation count then result is as expected',
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
          // Smulan nested kittens
          Cat(name: 'Nested Kitten1', motherId: kittens.last.id),
          Cat(name: 'Nested Kitten2', motherId: kittens.last.id),
          Cat(name: 'Nested Kitten3', motherId: kittens.last.id),

          // Zelda nested kittens
          Cat(name: 'Nested Kitten4', motherId: kittens.first.id),
          Cat(name: 'Nested Kitten5', motherId: kittens.first.id),
          Cat(name: 'Nested Kitten6', motherId: kittens.first.id),
          Cat(name: 'Nested Kitten7', motherId: kittens[1].id),
          Cat(name: 'Nested Kitten8', motherId: kittens[1].id),
          Cat(name: 'Nested Kitten9', motherId: kittens[1].id),
        ]);

        final deletedCats = await Cat.db.deleteWhere(
          session,
          where: (final t) => t.kittens.count((final o) => o.kittens.count() > 2) > 1,
        );

        expect(deletedCats, hasLength(1));
        expect(deletedCats.firstOrNull?.id, zelda.id);
      },
    );

    test(
      'when deleting models filtered on filtered nested many relation count then result is as expected',
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
          // Smulan nested kittens
          Cat(name: 'Nested Kitten1', motherId: kittens.last.id),
          Cat(name: 'Nested Kitten2', motherId: kittens.last.id),
          Cat(name: 'Nested Kitten3', motherId: kittens.last.id),

          // Zelda nested kittens
          Cat(name: 'Zelda II', motherId: kittens.first.id),
          Cat(name: 'Zelda VI', motherId: kittens.first.id),
          Cat(name: 'Nested Kitten6', motherId: kittens.first.id),
          Cat(name: 'Zelda III', motherId: kittens[1].id),
          Cat(name: 'Zelda IV', motherId: kittens[1].id),
          Cat(name: 'Nested Kitten9', motherId: kittens[1].id),
        ]);

        final deletedCats = await Cat.db.deleteWhere(
          session,
          where: (final t) =>
              t.kittens.count(
                // All cats with more than 1 kitten with more than 1 kittens named Zelda
                (final o) => o.kittens.count((final c) => c.name.ilike('zelda%')) > 1,
              ) >
              1,
        );

        expect(deletedCats, hasLength(1));
        expect(deletedCats.firstOrNull?.id, zelda.id);
      },
    );
  });
}
