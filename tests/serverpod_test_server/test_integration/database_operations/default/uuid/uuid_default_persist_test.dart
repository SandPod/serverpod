import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  final session = await IntegrationTestServer().session();

  group('Given a class with "defaultPersist" UUID fields,', () {
    tearDownAll(
      () async => UuidDefaultPersist.db.deleteWhere(
        session,
        where: (_) => Constant.bool(true),
      ),
    );

    test(
      'when creating a record in the database, then the "defaultPersist=random" UUID field should not be null and should generate a valid UUID',
      () async {
        final object = UuidDefaultPersist();
        final databaseObject = await UuidDefaultPersist.db.insertRow(
          session,
          object,
        );
        expect(databaseObject.uuidDefaultPersistRandom, isNotNull);
        expect(
          RegExp(
            r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-4[0-9a-fA-F]{3}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$',
          ).hasMatch(databaseObject.uuidDefaultPersistRandom.toString()),
          isTrue,
        );
      },
    );

    test(
      'when creating a record in the database, then the "defaultPersist=random_v7" UUID field should not be null and should generate a valid UUID',
      () async {
        final object = UuidDefaultPersist();
        final databaseObject = await UuidDefaultPersist.db.insertRow(
          session,
          object,
        );
        expect(databaseObject.uuidDefaultPersistRandomV7, isNotNull);
        expect(
          RegExp(
            r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-7[0-9a-fA-F]{3}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$',
          ).hasMatch(databaseObject.uuidDefaultPersistRandomV7.toString()),
          isTrue,
        );
      },
    );

    test(
      'when creating a record in the database, then the "defaultPersist" UUID field with a string should match the default',
      () async {
        final object = UuidDefaultPersist();
        final databaseObject = await UuidDefaultPersist.db.insertRow(
          session,
          object,
        );
        expect(
          databaseObject.uuidDefaultPersistStr,
          UuidValue.fromString('550e8400-e29b-41d4-a716-446655440000'),
        );
      },
    );

    test(
      'when creating a record in the database with an unsafe query, then the "defaultPersist=random" UUID field should generate a valid UUID',
      () async {
        await session.db.unsafeQuery(
          '''
        INSERT INTO ${UuidDefaultPersist.t.tableName}
        VALUES (DEFAULT, DEFAULT);
        ''',
        );
        final databaseObject = await UuidDefaultPersist.db.findFirstRow(session);
        expect(databaseObject?.uuidDefaultPersistRandom, isNotNull);
        expect(
          RegExp(
            r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-4[0-9a-fA-F]{3}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$',
          ).hasMatch(databaseObject!.uuidDefaultPersistRandom.toString()),
          isTrue,
        );
      },
    );

    test(
      'when creating a record in the database with an unsafe query, then the "defaultPersist=random_v7" UUID field should generate a valid UUID',
      () async {
        await session.db.unsafeQuery(
          '''
        INSERT INTO ${UuidDefaultPersist.t.tableName}
        VALUES (DEFAULT, DEFAULT);
        ''',
        );
        final databaseObject = await UuidDefaultPersist.db.findFirstRow(session);
        expect(databaseObject?.uuidDefaultPersistRandomV7, isNotNull);
        expect(
          RegExp(
            r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-7[0-9a-fA-F]{3}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$',
          ).hasMatch(databaseObject!.uuidDefaultPersistRandomV7.toString()),
          isTrue,
        );
      },
    );

    test(
      'when creating a record in the database with an unsafe query, then the "defaultPersist" UUID field with a string should match the default',
      () async {
        await session.db.unsafeQuery(
          '''
        INSERT INTO ${UuidDefaultPersist.t.tableName}
        VALUES (DEFAULT, DEFAULT);
        ''',
        );
        final databaseObject = await UuidDefaultPersist.db.findFirstRow(session);
        expect(
          databaseObject!.uuidDefaultPersistStr,
          UuidValue.fromString('550e8400-e29b-41d4-a716-446655440000'),
        );
      },
    );

    test(
      'when creating a record in the database with a specific value, then the "uuidDefaultPersistRandom" field value should match the provided value',
      () async {
        final uuid = UuidValue.fromString('3f2504e0-4f89-11d3-9a0c-0305e82c3301');
        final specificObject = UuidDefaultPersist(
          uuidDefaultPersistRandom: uuid,
        );
        final specificDatabaseObject = await UuidDefaultPersist.db.insertRow(
          session,
          specificObject,
        );
        expect(
          specificDatabaseObject.uuidDefaultPersistRandom,
          uuid,
        );
      },
    );

    test(
      'when creating a record in the database with a specific value, then the "uuidDefaultPersistRandomV7" field value should match the provided value',
      () async {
        final uuid = UuidValue.fromString('3f2504e0-4f89-11d3-9a0c-0305e82c3301');
        final specificObject = UuidDefaultPersist(
          uuidDefaultPersistRandomV7: uuid,
        );
        final specificDatabaseObject = await UuidDefaultPersist.db.insertRow(
          session,
          specificObject,
        );
        expect(
          specificDatabaseObject.uuidDefaultPersistRandomV7,
          uuid,
        );
      },
    );

    test(
      'when creating a record in the database with a specific value, then the "uuidDefaultPersistStr" field value should match the provided value',
      () async {
        final uuid = UuidValue.fromString('550e8400-e29b-41d4-a716-446655440000');
        final specificObject = UuidDefaultPersist(
          uuidDefaultPersistStr: uuid,
        );
        final specificDatabaseObject = await UuidDefaultPersist.db.insertRow(
          session,
          specificObject,
        );
        expect(
          specificDatabaseObject.uuidDefaultPersistStr,
          uuid,
        );
      },
    );
  });
}
