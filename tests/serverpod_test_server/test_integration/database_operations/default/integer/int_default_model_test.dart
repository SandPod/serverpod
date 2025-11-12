import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  final session = await IntegrationTestServer().session();

  group('Given a class with "defaultModel" fields,', () {
    tearDownAll(
      () async => IntDefaultModel.db.deleteWhere(
        session,
        where: (_) => Constant.bool(true),
      ),
    );

    test(
      'when creating a record in the database, then the "defaultModel=10" field value should be 10',
      () async {
        final object = IntDefaultModel();
        final databaseObject = await IntDefaultModel.db.insertRow(
          session,
          object,
        );
        expect(databaseObject.intDefaultModel, 10);
      },
    );

    test(
      'when creating a record in the database, then the nullable "defaultModel=20" field value should be 20',
      () async {
        final object = IntDefaultModel();
        final databaseObject = await IntDefaultModel.db.insertRow(
          session,
          object,
        );
        expect(databaseObject.intDefaultModelNull, 20);
      },
    );

    test(
      'when creating a record in the database with a specific value, then the "intDefaultModel" field value should match the provided value',
      () async {
        final specificObject = IntDefaultModel(
          intDefaultModel: 30,
        );
        final specificDatabaseObject = await IntDefaultModel.db.insertRow(
          session,
          specificObject,
        );
        expect(specificDatabaseObject.intDefaultModel, 30);
      },
    );

    test(
      'when creating a record in the database with a specific value, then the "intDefaultModelNull" field value should match the provided value',
      () async {
        final specificObject = IntDefaultModel(
          intDefaultModelNull: 40,
        );
        final specificDatabaseObject = await IntDefaultModel.db.insertRow(
          session,
          specificObject,
        );
        expect(specificDatabaseObject.intDefaultModelNull, 40);
      },
    );
  });
}
