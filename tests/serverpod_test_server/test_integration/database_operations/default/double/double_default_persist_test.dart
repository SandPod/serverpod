import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  final session = await IntegrationTestServer().session();

  group('Given a class with "defaultPersist" fields,', () {
    tearDownAll(
      () async => DoubleDefaultPersist.db.deleteWhere(
        session,
        where: (_) => Constant.bool(true),
      ),
    );

    test(
      'when creating a record in the database, then the "defaultPersist=10.5" field should be 10.5',
      () async {
        final object = DoubleDefaultPersist();
        final databaseObject = await DoubleDefaultPersist.db.insertRow(
          session,
          object,
        );
        expect(databaseObject.doubleDefaultPersist, equals(10.5));
      },
    );

    test(
      'when creating a record in the database with an unsafe query, then the "defaultPersist=10.5" field should be 10.5',
      () async {
        await session.db.unsafeQuery(
          '''
        INSERT INTO ${DoubleDefaultPersist.t.tableName}
        VALUES (DEFAULT);
        ''',
        );
        final databaseObject = await DoubleDefaultPersist.db.findFirstRow(
          session,
        );
        expect(databaseObject?.doubleDefaultPersist, equals(10.5));
      },
    );

    test(
      'when creating a record in the database with a specific value, then the "doubleDefaultPersist" field value should match the provided value',
      () async {
        final specificObject = DoubleDefaultPersist(
          doubleDefaultPersist: 20.5,
        );
        final specificDatabaseObject = await DoubleDefaultPersist.db.insertRow(
          session,
          specificObject,
        );
        expect(specificDatabaseObject.doubleDefaultPersist, equals(20.5));
      },
    );
  });
}
