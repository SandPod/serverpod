import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  final session = await IntegrationTestServer().session();

  group('Given a class with mixed default Duration fields,', () {
    tearDownAll(
      () async => DurationDefaultMix.db.deleteWhere(
        session,
        where: (_) => Constant.bool(true),
      ),
    );

    test(
      'when creating a record in the database with an unsafe query, then the "durationDefaultAndDefaultModel" field value should match the default value',
      () async {
        await session.db.unsafeQuery(
          '''
        INSERT INTO "${DurationDefaultMix.t.tableName}" ("durationDefaultAndDefaultModel", "durationDefaultAndDefaultPersist", "durationDefaultModelAndDefaultPersist")
        VALUES (DEFAULT, DEFAULT, DEFAULT);
        ''',
        );
        final databaseObject = await DurationDefaultMix.db.findFirstRow(session);
        expect(
          databaseObject?.durationDefaultAndDefaultModel,
          equals(
            const Duration(
              days: 1,
              hours: 2,
              minutes: 10,
              seconds: 30,
              milliseconds: 100,
            ),
          ),
        );
      },
    );

    test(
      'when creating a record in the database with an unsafe query, then the "durationDefaultAndDefaultPersist" field value should match the defaultPersist value',
      () async {
        await session.db.unsafeQuery(
          '''
        INSERT INTO "${DurationDefaultMix.t.tableName}" ("durationDefaultAndDefaultModel", "durationDefaultAndDefaultPersist", "durationDefaultModelAndDefaultPersist")
        VALUES (DEFAULT, DEFAULT, DEFAULT);
        ''',
        );
        final databaseObject = await DurationDefaultMix.db.findFirstRow(session);
        expect(
          databaseObject?.durationDefaultAndDefaultPersist,
          equals(
            const Duration(
              days: 2,
              hours: 1,
              minutes: 20,
              seconds: 40,
              milliseconds: 100,
            ),
          ),
        );
      },
    );

    test(
      'when creating a record in the database with an unsafe query, then the "durationDefaultModelAndDefaultPersist" field value should match the defaultPersist value',
      () async {
        await session.db.unsafeQuery(
          '''
        INSERT INTO "${DurationDefaultMix.t.tableName}" ("durationDefaultAndDefaultModel", "durationDefaultAndDefaultPersist", "durationDefaultModelAndDefaultPersist")
        VALUES (DEFAULT, DEFAULT, DEFAULT);
        ''',
        );
        final databaseObject = await DurationDefaultMix.db.findFirstRow(session);
        expect(
          databaseObject?.durationDefaultModelAndDefaultPersist,
          equals(
            const Duration(
              days: 2,
              hours: 1,
              minutes: 20,
              seconds: 40,
              milliseconds: 100,
            ),
          ),
        );
      },
    );

    test(
      'when creating a record in the database with specific values, then the "durationDefaultAndDefaultModel" field value should match the provided value',
      () async {
        const specificDuration = Duration(
          days: 3,
          hours: 4,
          minutes: 15,
          seconds: 45,
          milliseconds: 500,
        );
        final specificObject = DurationDefaultMix(
          durationDefaultAndDefaultModel: specificDuration,
        );
        final specificDatabaseObject = await DurationDefaultMix.db.insertRow(
          session,
          specificObject,
        );
        expect(
          specificDatabaseObject.durationDefaultAndDefaultModel,
          equals(specificDuration),
        );
      },
    );

    test(
      'when creating a record in the database with specific values, then the "durationDefaultAndDefaultPersist" field value should match the provided value',
      () async {
        const specificDuration = Duration(
          days: 3,
          hours: 5,
          minutes: 25,
          seconds: 50,
          milliseconds: 600,
        );
        final specificObject = DurationDefaultMix(
          durationDefaultAndDefaultPersist: specificDuration,
        );
        final specificDatabaseObject = await DurationDefaultMix.db.insertRow(
          session,
          specificObject,
        );
        expect(
          specificDatabaseObject.durationDefaultAndDefaultPersist,
          equals(specificDuration),
        );
      },
    );

    test(
      'when creating a record in the database with specific values, then the "durationDefaultModelAndDefaultPersist" field value should match the provided value',
      () async {
        const specificDuration = Duration(
          days: 4,
          hours: 6,
          minutes: 30,
          seconds: 55,
          milliseconds: 700,
        );
        final specificObject = DurationDefaultMix(
          durationDefaultModelAndDefaultPersist: specificDuration,
        );
        final specificDatabaseObject = await DurationDefaultMix.db.insertRow(
          session,
          specificObject,
        );
        expect(
          specificDatabaseObject.durationDefaultModelAndDefaultPersist,
          equals(specificDuration),
        );
      },
    );
  });
}
