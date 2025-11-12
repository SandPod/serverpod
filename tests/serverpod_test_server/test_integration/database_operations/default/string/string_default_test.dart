import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  final session = await IntegrationTestServer().session();

  group('Given a class with "default" fields,', () {
    tearDownAll(
      () async => StringDefault.db.deleteWhere(
        session,
        where: (_) => Constant.bool(true),
      ),
    );

    test(
      'when creating a record in the database, then the "default=\'This is a default value\'" field value should match the default value',
      () async {
        final object = StringDefault();
        final databaseObject = await StringDefault.db.insertRow(
          session,
          object,
        );
        expect(
          databaseObject.stringDefault,
          equals('This is a default value'),
        );
      },
    );

    test(
      'when creating a record in the database, then the nullable "default=\'This is a default null value\'" field value should match the default value',
      () async {
        final object = StringDefault();
        final databaseObject = await StringDefault.db.insertRow(
          session,
          object,
        );
        expect(
          databaseObject.stringDefaultNull,
          equals('This is a default null value'),
        );
      },
    );

    test(
      'when creating a record in the database with a specific value, then the "stringDefault" field value should match the provided value',
      () async {
        final specificObject = StringDefault(
          stringDefault: 'A specific value',
        );
        final specificDatabaseObject = await StringDefault.db.insertRow(
          session,
          specificObject,
        );
        expect(
          specificDatabaseObject.stringDefault,
          equals('A specific value'),
        );
      },
    );

    test(
      'when creating a record in the database with a specific value, then the "stringDefaultNull" field value should match the provided value',
      () async {
        final specificObject = StringDefault(
          stringDefaultNull: 'Another specific value',
        );
        final specificDatabaseObject = await StringDefault.db.insertRow(
          session,
          specificObject,
        );
        expect(
          specificDatabaseObject.stringDefaultNull,
          equals('Another specific value'),
        );
      },
    );
  });
}
