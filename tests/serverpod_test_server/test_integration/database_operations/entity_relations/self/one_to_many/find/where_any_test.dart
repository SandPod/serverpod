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
      'when fetching models filtered by any many relation then result is as expected.',
      () async {
        final zelda = await Cat.db.insertRow(session, Cat(name: 'Zelda'));
        await Cat.db.insertRow(session, Cat(name: 'Smulan'));

        await Cat.db.insert(session, [
          Cat(name: 'Kitten1', motherId: zelda.id),
          Cat(name: 'Kitten2', motherId: zelda.id),
          Cat(name: 'Kitten3', motherId: zelda.id),
        ]);

        final fetchedCats = await Cat.db.find(
          session,
          where: (final t) => t.kittens.any(),
        );

        final catNames = fetchedCats.map((final e) => e.name);
        expect(catNames, ['Zelda']);
      },
    );

    test(
      'when fetching models filtered by filtered any many relation then result is as expected',
      () async {
        final zelda = await Cat.db.insertRow(session, Cat(name: 'Zelda'));
        final smulan = await Cat.db.insertRow(session, Cat(name: 'Smulan'));

        await Cat.db.insert(session, [
          Cat(name: 'Kitten1', motherId: zelda.id),
          Cat(name: 'Kitten2', motherId: zelda.id),
          Cat(name: 'Kitten3', motherId: zelda.id),
          Cat(name: 'Smulan II', motherId: smulan.id),
        ]);

        final fetchedCats = await Cat.db.find(
          session,
          where: (final t) => t.kittens.any((final t) => t.name.ilike('smul%')),
        );

        final catNames = fetchedCats.map((final e) => e.name);
        expect(catNames, ['Smulan']);
      },
    );

    test(
      'when fetching models filtered on any many relation in combination with other filter then result is as expected.',
      () async {
        final zelda = await Cat.db.insertRow(session, Cat(name: 'Zelda'));
        final smulan = await Cat.db.insertRow(session, Cat(name: 'Smulan'));

        await Cat.db.insert(session, [
          Cat(name: 'Kitten1', motherId: zelda.id),
          Cat(name: 'Kitten2', motherId: zelda.id),
          Cat(name: 'Kitten3', motherId: zelda.id),
          Cat(name: 'Smulan II', motherId: smulan.id),
        ]);

        final fetchedCats = await Cat.db.find(
          session,
          where: (final t) => t.kittens.any() | t.name.equals('Zelda'),
        );

        final catNames = fetchedCats.map((final e) => e.name);
        expect(catNames, hasLength(2));
        expect(catNames, containsAll(['Zelda', 'Smulan']));
      },
    );

    test(
      'when fetching models filtered on OR filtered any many relation then result is as expected.',
      () async {
        final zelda = await Cat.db.insertRow(session, Cat(name: 'Zelda'));
        final smulan = await Cat.db.insertRow(session, Cat(name: 'Smulan'));

        await Cat.db.insert(session, [
          Cat(name: 'Kitten1', motherId: zelda.id),
          Cat(name: 'Kitten2', motherId: zelda.id),
          Cat(name: 'Kitten3', motherId: zelda.id),
          Cat(name: 'Smulan II', motherId: smulan.id),
        ]);

        final fetchedCats = await Cat.db.find(
          session,
          where: (final t) => t.kittens.any(
            (final t) => t.name.ilike('kitt%') | t.name.equals('Smulan II'),
          ),
        );

        final catNames = fetchedCats.map((final e) => e.name);
        expect(catNames, hasLength(2));
        expect(catNames, ['Zelda', 'Smulan']);
      },
    );

    test(
      'when fetching models filtered on multiple filtered any many relation then result is as expected.',
      () async {
        final zelda = await Cat.db.insertRow(session, Cat(name: 'Zelda'));
        final smulan = await Cat.db.insertRow(session, Cat(name: 'Smulan'));

        await Cat.db.insert(session, [
          Cat(name: 'Kitten1', motherId: zelda.id),
          Cat(name: 'Kitten2', motherId: zelda.id),
          Cat(name: 'Zelda II', motherId: zelda.id),
          Cat(name: 'Smulan II', motherId: smulan.id),
        ]);

        final fetchedCats = await Cat.db.find(
          session,
          where: (final t) =>
              t.kittens.any((final t) => t.name.ilike('kitt%')) &
              t.kittens.any((final t) => t.name.equals('Zelda II')),
        );

        final catNames = fetchedCats.map((final e) => e.name);
        expect(catNames, ['Zelda']);
      },
    );
  });

  group('Given models with nested one to many relation', () {
    tearDown(() async {
      await Cat.db.deleteWhere(session, where: (_) => db.Constant.bool(true));
    });

    test(
      'when filtering on nested any many relation then result is as expected',
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

        final fetchedCats = await Cat.db.find(
          session,
          where: (final t) => t.kittens.any((final o) => o.kittens.any()),
        );

        final catNames = fetchedCats.map((final e) => e.name);
        expect(catNames, ['Smulan']);
      },
    );

    test(
      'when fetching models filtered on filtered nested any many relation then result is as expected',
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
          Cat(name: 'Nested Kitten4', motherId: kittens.first.id),
        ]);

        final fetchedCats = await Cat.db.find(
          session,
          where: (final t) => t.kittens.any(
            (final o) => o.kittens.any((final o) => o.name.equals('Nested Kitten1')),
          ),
        );

        final catNames = fetchedCats.map((final e) => e.name);
        expect(catNames, ['Smulan']);
      },
    );
  });
}
