import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  final session = await IntegrationTestServer().session();

  group('Given a class with "defaultModel" enum fields,', () {
    tearDownAll(
      () async => EnumDefaultModel.db.deleteWhere(
        session,
        where: (_) => Constant.bool(true),
      ),
    );

    test(
      'when creating a record in the database, then the "defaultModel=byName1" field value should be byName1',
      () async {
        final object = EnumDefaultModel();
        final databaseObject = await EnumDefaultModel.db.insertRow(
          session,
          object,
        );
        expect(
          databaseObject.byNameEnumDefaultModel,
          equals(ByNameEnum.byName1),
        );
      },
    );

    test(
      'when creating a record in the database, then the nullable "defaultModel=byName2" field value should be byName2',
      () async {
        final object = EnumDefaultModel();
        final databaseObject = await EnumDefaultModel.db.insertRow(
          session,
          object,
        );
        expect(
          databaseObject.byNameEnumDefaultModelNull,
          equals(ByNameEnum.byName2),
        );
      },
    );

    test(
      'when creating a record in the database, then the "defaultModel=byIndex1" field value should be byIndex1',
      () async {
        final object = EnumDefaultModel();
        final databaseObject = await EnumDefaultModel.db.insertRow(
          session,
          object,
        );
        expect(
          databaseObject.byIndexEnumDefaultModel,
          equals(ByIndexEnum.byIndex1),
        );
      },
    );

    test(
      'when creating a record in the database, then the nullable "defaultModel=byIndex2" field value should be byIndex2',
      () async {
        final object = EnumDefaultModel();
        final databaseObject = await EnumDefaultModel.db.insertRow(
          session,
          object,
        );
        expect(
          databaseObject.byIndexEnumDefaultModelNull,
          equals(ByIndexEnum.byIndex2),
        );
      },
    );

    test(
      'when creating a record in the database with a specific value, then the "byNameEnumDefaultModel" field value should match the provided value',
      () async {
        final specificObject = EnumDefaultModel(
          byNameEnumDefaultModel: ByNameEnum.byName2,
        );
        final specificDatabaseObject = await EnumDefaultModel.db.insertRow(
          session,
          specificObject,
        );
        expect(
          specificDatabaseObject.byNameEnumDefaultModel,
          equals(ByNameEnum.byName2),
        );
      },
    );

    test(
      'when creating a record in the database with a specific value, then the "byNameEnumDefaultModelNull" field value should match the provided value',
      () async {
        final specificObject = EnumDefaultModel(
          byNameEnumDefaultModelNull: ByNameEnum.byName1,
        );
        final specificDatabaseObject = await EnumDefaultModel.db.insertRow(
          session,
          specificObject,
        );
        expect(
          specificDatabaseObject.byNameEnumDefaultModelNull,
          equals(ByNameEnum.byName1),
        );
      },
    );

    test(
      'when creating a record in the database with a specific value, then the "byIndexEnumDefaultModel" field value should match the provided value',
      () async {
        final specificObject = EnumDefaultModel(
          byIndexEnumDefaultModel: ByIndexEnum.byIndex2,
        );
        final specificDatabaseObject = await EnumDefaultModel.db.insertRow(
          session,
          specificObject,
        );
        expect(
          specificDatabaseObject.byIndexEnumDefaultModel,
          equals(ByIndexEnum.byIndex2),
        );
      },
    );

    test(
      'when creating a record in the database with a specific value, then the "byIndexEnumDefaultModelNull" field value should match the provided value',
      () async {
        final specificObject = EnumDefaultModel(
          byIndexEnumDefaultModelNull: ByIndexEnum.byIndex1,
        );
        final specificDatabaseObject = await EnumDefaultModel.db.insertRow(
          session,
          specificObject,
        );
        expect(
          specificDatabaseObject.byIndexEnumDefaultModelNull,
          equals(ByIndexEnum.byIndex1),
        );
      },
    );
  });
}
