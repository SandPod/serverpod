import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  final session = await IntegrationTestServer().session();
  group('Given a class with "defaultPersist" fields,', () {
    tearDownAll(
      () async => DateTimeDefaultPersist.db.deleteWhere(
        session,
        where: (_) => Constant.bool(true),
      ),
    );

    test(
      'when creating a record in the database, then the "defaultPersist=now" field should be in UTC',
      () async {
        final object = DateTimeDefaultPersist();
        final databaseObject = await DateTimeDefaultPersist.db.insertRow(
          session,
          object,
        );
        expect(databaseObject.dateTimeDefaultPersistNow?.isUtc, isTrue);
      },
    );

    test(
      'when creating a record in the database, then the "defaultPersist" field with UTC string should be in UTC',
      () async {
        final object = DateTimeDefaultPersist();
        final databaseObject = await DateTimeDefaultPersist.db.insertRow(
          session,
          object,
        );
        expect(databaseObject.dateTimeDefaultPersistStr?.isUtc, isTrue);
      },
    );

    test(
      'when creating a record in the database, then the "defaultPersist=now" field value should match the current time',
      () async {
        final object = DateTimeDefaultPersist();
        final databaseObject = await DateTimeDefaultPersist.db.insertRow(
          session,
          object,
        );
        expect(
          databaseObject.dateTimeDefaultPersistNow!
              .difference(DateTime.now())
              .inSeconds,
          0,
        );
      },
    );

    test(
      'when creating a record in the database, then the "defaultPersist" field value should match the default',
      () async {
        final object = DateTimeDefaultPersist();
        final databaseObject = await DateTimeDefaultPersist.db.insertRow(
          session,
          object,
        );
        expect(
          databaseObject.dateTimeDefaultPersistStr,
          DateTime.parse('2024-05-10T22:00:00.000Z'),
        );
      },
    );

    test(
      'when creating a record in the database with an unsafe query, then the "defaultPersist=now" field should be in UTC',
      () async {
        await session.db.unsafeQuery(
          '''
        INSERT INTO ${DateTimeDefaultPersist.t.tableName}
        VALUES (DEFAULT, DEFAULT);
        ''',
        );
        final databaseObject = await DateTimeDefaultPersist.db.findFirstRow(
          session,
        );
        expect(databaseObject?.dateTimeDefaultPersistNow?.isUtc, isTrue);
      },
    );

    test(
      'when creating a record in the database with an unsafe query, then the "defaultPersist" field with UTC string should be in UTC',
      () async {
        await session.db.unsafeQuery(
          '''
        INSERT INTO ${DateTimeDefaultPersist.t.tableName}
        VALUES (DEFAULT, DEFAULT);
        ''',
        );
        final databaseObject = await DateTimeDefaultPersist.db.findFirstRow(
          session,
        );
        expect(databaseObject?.dateTimeDefaultPersistStr?.isUtc, isTrue);
      },
    );

    test(
      'when creating a record in the database with an unsafe query, then the "defaultPersist=now" field value should match the current time',
      () async {
        await session.db.unsafeQuery(
          '''
        INSERT INTO ${DateTimeDefaultPersist.t.tableName}
        VALUES (DEFAULT, DEFAULT);
        ''',
        );
        final databaseObject = await DateTimeDefaultPersist.db.findFirstRow(
          session,
        );
        expect(
          databaseObject!.dateTimeDefaultPersistNow!
              .difference(DateTime.now())
              .inSeconds,
          0,
        );
      },
    );

    test(
      'when creating a record in the database with an unsafe query, then the "defaultPersist" field value should match the default',
      () async {
        await session.db.unsafeQuery(
          '''
        INSERT INTO ${DateTimeDefaultPersist.t.tableName}
        VALUES (DEFAULT, DEFAULT);
        ''',
        );
        final databaseObject = await DateTimeDefaultPersist.db.findFirstRow(
          session,
        );
        expect(
          databaseObject!.dateTimeDefaultPersistStr,
          DateTime.parse('2024-05-10T22:00:00.000Z'),
        );
      },
    );

    test(
      'when creating a record in the database with a specific value, then the "dateTimeDefaultPersistNow" field value should match the provided value',
      () async {
        final date = DateTime.parse('2024-05-05T22:00:00.000Z');
        final specificObject = DateTimeDefaultPersist(
          dateTimeDefaultPersistNow: date,
        );
        final specificDatabaseObject = await DateTimeDefaultPersist.db.insertRow(
          session,
          specificObject,
        );
        expect(
          specificDatabaseObject.dateTimeDefaultPersistNow,
          date,
        );
      },
    );

    test(
      'when creating a record in the database with a specific value, then the "dateTimeDefaultPersistStr" field value should match the provided value',
      () async {
        final date = DateTime.parse('2024-05-05T22:00:00.000Z');
        final specificObject = DateTimeDefaultPersist(
          dateTimeDefaultPersistStr: date,
        );
        final specificDatabaseObject = await DateTimeDefaultPersist.db.insertRow(
          session,
          specificObject,
        );
        expect(
          specificDatabaseObject.dateTimeDefaultPersistStr,
          date,
        );
      },
    );
  });
}
