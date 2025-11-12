import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  final session = await IntegrationTestServer().session();

  group('Given a class with "defaultModel" Duration fields,', () {
    tearDownAll(
      () async => DurationDefaultModel.db.deleteWhere(
        session,
        where: (_) => Constant.bool(true),
      ),
    );

    test(
      'when creating a record in the database, then the "defaultModel=1d 2h 10min 30s 100ms" field value should be the expected duration',
      () async {
        final object = DurationDefaultModel();
        final databaseObject = await DurationDefaultModel.db.insertRow(
          session,
          object,
        );
        expect(
          databaseObject.durationDefaultModel,
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
      'when creating a record in the database, then the nullable "defaultModel=2d 1h 20min 40s 100ms" field value should be the expected duration',
      () async {
        final object = DurationDefaultModel();
        final databaseObject = await DurationDefaultModel.db.insertRow(
          session,
          object,
        );
        expect(
          databaseObject.durationDefaultModelNull,
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
      'when creating a record in the database with a specific value, then the "durationDefaultModel" field value should match the provided value',
      () async {
        const specificDuration = Duration(
          days: 3,
          hours: 4,
          minutes: 15,
          seconds: 45,
          milliseconds: 500,
        );
        final specificObject = DurationDefaultModel(
          durationDefaultModel: specificDuration,
        );
        final specificDatabaseObject = await DurationDefaultModel.db.insertRow(
          session,
          specificObject,
        );
        expect(
          specificDatabaseObject.durationDefaultModel,
          equals(specificDuration),
        );
      },
    );

    test(
      'when creating a record in the database with a specific value, then the "durationDefaultModelNull" field value should match the provided value',
      () async {
        const specificDuration = Duration(
          days: 3,
          hours: 5,
          minutes: 25,
          seconds: 50,
          milliseconds: 600,
        );
        final specificObject = DurationDefaultModel(
          durationDefaultModelNull: specificDuration,
        );
        final specificDatabaseObject = await DurationDefaultModel.db.insertRow(
          session,
          specificObject,
        );
        expect(
          specificDatabaseObject.durationDefaultModelNull,
          equals(specificDuration),
        );
      },
    );
  });
}
