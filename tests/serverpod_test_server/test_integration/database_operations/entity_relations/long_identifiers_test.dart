import 'package:serverpod/database.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  final session = await IntegrationTestServer().session();

  group('Given a model with a list relation to model with max length named fields', () {
    tearDown(() async {
      await MultipleMaxFieldName.db.deleteWhere(
        session,
        where: (_) => Constant.bool(true),
      );
      await RelationToMultipleMaxFieldName.db.deleteWhere(
        session,
        where: (_) => Constant.bool(true),
      );
    });

    test(
      'when filtering on related fields data multiple times then fetched data is as expected.',
      () async {
        final multipleMaxFieldNames = await MultipleMaxFieldName.db.insert(
          session,
          [
            MultipleMaxFieldName(
              thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1:
                  'First 1',
              thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2:
                  'First 2',
            ),
            MultipleMaxFieldName(
              thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1:
                  'Second 1',
              thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2:
                  'Second 2',
            ),
            MultipleMaxFieldName(
              thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1:
                  'Third 1',
              thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2:
                  'Third 2',
            ),
          ],
        );

        final relationToMultipleMaxFieldNames =
            await RelationToMultipleMaxFieldName.db.insert(session, [
              RelationToMultipleMaxFieldName(
                name: 'First',
              ),
              RelationToMultipleMaxFieldName(
                name: 'Second',
              ),
              RelationToMultipleMaxFieldName(
                name: 'Third',
              ),
            ]);

        // Attach ("First 1", "First 2") to "First"
        await RelationToMultipleMaxFieldName.db.attachRow.multipleMaxFieldNames(
          session,
          relationToMultipleMaxFieldNames[0],
          multipleMaxFieldNames[0],
        );

        // Attach ("Second 1", "Second 2") to "Second"
        await RelationToMultipleMaxFieldName.db.attachRow.multipleMaxFieldNames(
          session,
          relationToMultipleMaxFieldNames[1],
          multipleMaxFieldNames[1],
        );

        // Attach ("Third 1", "Third 2") to "Third"
        await RelationToMultipleMaxFieldName.db.attachRow.multipleMaxFieldNames(
          session,
          relationToMultipleMaxFieldNames[2],
          multipleMaxFieldNames[2],
        );

        final fetched = await RelationToMultipleMaxFieldName.db.find(
          session,
          where: (final t) =>
              t.multipleMaxFieldNames.any(
                (final t) => t
                    .thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1
                    .ilike('First 1'),
              ) |
              t.multipleMaxFieldNames.any(
                (final t) => t
                    .thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2
                    .ilike('Second 2'),
              ),
        );

        final fetchedNamed = fetched.map((final e) => e.name).toList();
        expect(fetchedNamed, hasLength(2));
        expect(fetchedNamed, containsAll(['First', 'Second']));
      },
    );

    test(
      'when filtering on both fields then fetched data is as expected.',
      () async {
        final multipleMaxFieldNames = await MultipleMaxFieldName.db.insert(
          session,
          [
            MultipleMaxFieldName(
              thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1:
                  'First 1',
              thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2:
                  'First 2',
            ),
            MultipleMaxFieldName(
              thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1:
                  'Second 1',
              thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2:
                  'Second 2',
            ),
          ],
        );

        final relationToMultipleMaxFieldNames =
            await RelationToMultipleMaxFieldName.db.insert(session, [
              RelationToMultipleMaxFieldName(
                name: 'First',
              ),
              RelationToMultipleMaxFieldName(
                name: 'Second',
              ),
            ]);

        // Attach ("First 1", "First 2") to "First"
        await RelationToMultipleMaxFieldName.db.attachRow.multipleMaxFieldNames(
          session,
          relationToMultipleMaxFieldNames[0],
          multipleMaxFieldNames[0],
        );

        // Attach ("Second 1", "Second 2") to "Second"
        await RelationToMultipleMaxFieldName.db.attachRow.multipleMaxFieldNames(
          session,
          relationToMultipleMaxFieldNames[1],
          multipleMaxFieldNames[1],
        );

        final fetched = await RelationToMultipleMaxFieldName.db.find(
          session,
          where: (final t) => t.multipleMaxFieldNames.any(
            (final t) =>
                t.thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1
                    .ilike('First 1') &
                t.thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2
                    .ilike('First 2'),
          ),
        );

        final fetchedNamed = fetched.map((final e) => e.name).toList();
        expect(fetchedNamed, hasLength(1));
        expect(fetchedNamed, ['First']);
      },
    );
  });

  group('Given a model with a field that has max allowed length', () {
    tearDown(
      () async => await MaxFieldName.db.deleteWhere(
        session,
        where: (_) => Constant.bool(true),
      ),
    );

    test('when fetching then data is fetched.', () async {
      const name = 'Test Name';
      final row = await MaxFieldName.db.insertRow(
        session,
        MaxFieldName(
          thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNameFo: name,
        ),
      );

      final fetched = await MaxFieldName.db.findById(session, row.id!);

      expect(
        fetched?.thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNameFo,
        name,
      );
    });
  });

  group('Given a model with a max length relational field', () {
    tearDown(() async {
      await LongImplicitIdField.db.deleteWhere(
        session,
        where: (_) => Constant.bool(true),
      );
      await LongImplicitIdFieldCollection.db.deleteWhere(
        session,
        where: (_) => Constant.bool(true),
      );
    });

    test(
      'when fetching the relational data then the data is fetched.',
      () async {
        final longImplicitField = await LongImplicitIdField.db.insertRow(
          session,
          LongImplicitIdField(
            name: 'HasField',
          ),
        );

        final longImplicitIdFieldCollection = await LongImplicitIdFieldCollection
            .db
            .insertRow(
              session,
              LongImplicitIdFieldCollection(name: 'Collection'),
            );

        await LongImplicitIdFieldCollection.db.attachRow
            .thisFieldIsExactly61CharactersLongAndIsThereforeAValidFieldNa(
              session,
              longImplicitIdFieldCollection,
              longImplicitField,
            );

        final fetched = await LongImplicitIdFieldCollection.db.findById(
          session,
          longImplicitIdFieldCollection.id!,
          include: LongImplicitIdFieldCollection.include(
            thisFieldIsExactly61CharactersLongAndIsThereforeAValidFieldNa:
                LongImplicitIdField.includeList(),
          ),
        );

        expect(fetched?.name, 'Collection');
        expect(
          fetched
              ?.thisFieldIsExactly61CharactersLongAndIsThereforeAValidFieldNa,
          hasLength(1),
        );
        expect(
          fetched
              ?.thisFieldIsExactly61CharactersLongAndIsThereforeAValidFieldNa
              ?.firstOrNull
              ?.name,
          'HasField',
        );
      },
    );

    test(
      'when applying the same filter multiple times on the relational field then data is fetched as expected',
      () async {
        // The concern for this test is that when we create subquery aliases we
        // ensure we don't get an alias collision when the end of the alias is
        // truncated.

        final longImplicitFields = await LongImplicitIdField.db.insert(session, [
          LongImplicitIdField(name: 'One'),
          LongImplicitIdField(name: 'Two'),
          LongImplicitIdField(name: 'Three'),
        ]);

        final longImplicitIdFieldCollections = await LongImplicitIdFieldCollection
            .db
            .insert(session, [
              LongImplicitIdFieldCollection(name: 'First Collection'),
              LongImplicitIdFieldCollection(name: 'Second Collection'),
              LongImplicitIdFieldCollection(name: 'Third Collection'),
            ]);

        // Attach "One" to first collection
        await LongImplicitIdFieldCollection.db.attachRow
            .thisFieldIsExactly61CharactersLongAndIsThereforeAValidFieldNa(
              session,
              longImplicitIdFieldCollections[0],
              longImplicitFields[0],
            );
        // Attach "Two" to second collection
        await LongImplicitIdFieldCollection.db.attachRow
            .thisFieldIsExactly61CharactersLongAndIsThereforeAValidFieldNa(
              session,
              longImplicitIdFieldCollections[1],
              longImplicitFields[1],
            );
        // Attach "Three" to third collection
        await LongImplicitIdFieldCollection.db.attachRow
            .thisFieldIsExactly61CharactersLongAndIsThereforeAValidFieldNa(
              session,
              longImplicitIdFieldCollections[1],
              longImplicitFields[1],
            );

        final fetched = await LongImplicitIdFieldCollection.db.find(
          session,
          where: (final t) =>
              t.thisFieldIsExactly61CharactersLongAndIsThereforeAValidFieldNa
                  .any((final t) => t.name.ilike('One')) |
              t.thisFieldIsExactly61CharactersLongAndIsThereforeAValidFieldNa
                  .any((final t) => t.name.ilike('Two')),
        );

        final collectionNames = fetched.map((final e) => e.name).toList();
        expect(collectionNames, hasLength(2));
        expect(
          collectionNames,
          containsAll(['First Collection', 'Second Collection']),
        );
      },
    );
  });

  group('Given a relation between two models with long names', () {
    tearDown(() async {
      await UserNoteWithALongName.db.deleteWhere(
        session,
        where: (_) => Constant.bool(true),
      );
      await UserNoteCollectionWithALongName.db.deleteWhere(
        session,
        where: (_) => Constant.bool(true),
      );
    });

    test(
      'when fetching the model with relational data included then the data is fetched.',
      () async {
        final userNote = await UserNoteWithALongName.db.insertRow(
          session,
          UserNoteWithALongName(name: 'Note'),
        );
        final userNoteCollection = await UserNoteCollectionWithALongName.db
            .insertRow(
              session,
              UserNoteCollectionWithALongName(name: 'Collection'),
            );
        await UserNoteCollectionWithALongName.db.attachRow.notes(
          session,
          userNoteCollection,
          userNote,
        );

        final collection = await UserNoteCollectionWithALongName.db.findById(
          session,
          userNoteCollection.id!,
          include: UserNoteCollectionWithALongName.include(
            notes: UserNoteWithALongName.includeList(),
          ),
        );

        expect(collection?.notes, hasLength(1));
      },
    );
  });
  group('Given a relation with a model with a long relation field name', () {
    tearDown(() async {
      await UserNote.db.deleteWhere(session, where: (_) => Constant.bool(true));
      await UserNoteCollection.db.deleteWhere(
        session,
        where: (_) => Constant.bool(true),
      );
    });

    test(
      'when fetching the model with relational data included then the data is fetched.',
      () async {
        final userNote = await UserNote.db.insertRow(
          session,
          UserNote(name: 'Note'),
        );
        final userNoteCollection = await UserNoteCollection.db.insertRow(
          session,
          UserNoteCollection(name: 'Collection'),
        );

        await UserNoteCollection.db.attachRow.userNotesPropertyName(
          session,
          userNoteCollection,
          userNote,
        );

        final collection = await UserNoteCollection.db.findById(
          session,
          userNoteCollection.id!,
          include: UserNoteCollection.include(
            userNotesPropertyName: UserNote.includeList(),
          ),
        );

        expect(collection?.userNotesPropertyName, hasLength(1));
      },
    );
  });

  group('Given a self relation', () {
    tearDown(() async {
      await Post.db.deleteWhere(session, where: (_) => Constant.bool(true));
    });

    test(
      'when including the relation so many times the relation path exceeds sql limit then data is still successfully fetched.',
      () async {
        final posts = await Post.db.insert(
          session,
          [
            Post(content: '0'),
            Post(content: '1'),
            Post(content: '2'),
            Post(content: '3'),
            Post(content: '4'),
            Post(content: '5'),
            Post(content: '6'),
            Post(content: '7'),
            Post(content: '8'),
          ],
        );
        await Post.db.attachRow.next(session, posts[0], posts[1]);
        await Post.db.attachRow.next(session, posts[1], posts[2]);
        await Post.db.attachRow.next(session, posts[2], posts[3]);
        await Post.db.attachRow.next(session, posts[3], posts[4]);
        await Post.db.attachRow.next(session, posts[4], posts[5]);
        await Post.db.attachRow.next(session, posts[5], posts[6]);
        await Post.db.attachRow.next(session, posts[6], posts[7]);
        await Post.db.attachRow.next(session, posts[7], posts[8]);

        final fetchedPost = await Post.db.findById(
          session,
          posts[0].id!,
          include: Post.include(
            next: Post.include(
              next: Post.include(
                next: Post.include(
                  next: Post.include(
                    next: Post.include(
                      next: Post.include(
                        next: Post.include(
                          next: Post.include(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

        expect(
          fetchedPost?.next?.next?.next?.next?.next?.next?.next?.next?.content,
          '8',
        );
        expect(
          fetchedPost?.next?.next?.next?.next?.next?.next?.next?.content,
          '7',
        );
      },
    );
  });

  group(
    'Given a deep nested relationship with long names when fetching with includes',
    () {
      tearDownAll(() async {
        await PersonWithLongTableName.db.deleteWhere(
          session,
          where: (_) => Constant.bool(true),
        );
        await OrganizationWithLongTableName.db.deleteWhere(
          session,
          where: (_) => Constant.bool(true),
        );
        await CityWithLongTableName.db.deleteWhere(
          session,
          where: (_) => Constant.bool(true),
        );
      });

      const personName = 'Alex';
      const cityName = 'Stockholm';
      const organizationName = 'Serverpod';
      setUpAll(() async {
        final insertedPerson = await PersonWithLongTableName.db.insertRow(
          session,
          PersonWithLongTableName(name: personName),
        );

        final insertedCity = await CityWithLongTableName.db.insertRow(
          session,
          CityWithLongTableName(name: cityName),
        );

        await CityWithLongTableName.db.attachRow.citizens(
          session,
          insertedCity,
          insertedPerson,
        );

        final insertedOrganization = await OrganizationWithLongTableName.db
            .insertRow(
              session,
              OrganizationWithLongTableName(name: organizationName),
            );

        await OrganizationWithLongTableName.db.attachRow.city(
          session,
          insertedOrganization,
          insertedCity,
        );
      });

      test('then all includes are included in the result.', () async {
        final organizations = await OrganizationWithLongTableName.db.find(
          session,
          include: OrganizationWithLongTableName.include(
            city: CityWithLongTableName.include(
              citizens: PersonWithLongTableName.includeList(),
            ),
          ),
        );

        final firstOrganization = organizations.firstOrNull;
        expect(firstOrganization?.name, organizationName);
        final city = firstOrganization?.city;
        expect(city?.name, cityName);
        final citizen = city?.citizens?.firstOrNull;
        expect(citizen?.name, personName);
      });
    },
  );
}
