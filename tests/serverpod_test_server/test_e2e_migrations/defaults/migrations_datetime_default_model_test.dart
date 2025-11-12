@Timeout(Duration(minutes: 5))
import 'package:serverpod_service_client/serverpod_service_client.dart';
import 'package:serverpod_test_server/test_util/config.dart';
import 'package:serverpod_test_server/test_util/migration_test_utils.dart';
import 'package:serverpod_test_server/test_util/test_service_key_manager.dart';
import 'package:test/test.dart';

void main() {
  final serviceClient = Client(
    serviceServerUrl,
    authenticationKeyManager: TestServiceKeyManager(
      '0',
      'super_SECRET_password',
    ),
  );

  group(
    'Given an empty database and new protocol model with table and fields with "defaultModel" value',
    () {
      tearDown(() async {
        await MigrationTestUtils.migrationTestCleanup(
          resetSql: 'DROP TABLE IF EXISTS migrated_table;',
          serviceClient: serviceClient,
        );
      });

      test(
        'when creating and applying migration, then the database does not contain default values for "dateTimeDefaultNow" with "defaultModel".',
        () async {
          const tableName = 'migrated_table';
          const tag = 'add-table';
          final targetStateProtocols = {
            'migrated_table':
                '''
        class: MigratedTable
        table: $tableName 
        fields:
          dateTimeDefaultNow: DateTime, defaultModel=now
        ''',
          };

          final createMigrationExitCode =
              await MigrationTestUtils.createMigrationFromProtocols(
                protocols: targetStateProtocols,
                tag: tag,
              );

          expect(
            createMigrationExitCode,
            0,
            reason: 'Failed to create migration, exit code was not 0.',
          );

          final applyMigrationExitCode =
              await MigrationTestUtils.runApplyMigrations();

          expect(
            applyMigrationExitCode,
            0,
            reason: 'Failed to apply migration, exit code was not 0.',
          );

          final liveDefinition = await serviceClient.insights
              .getLiveDatabaseDefinition();

          final databaseTable = liveDefinition.tables.firstWhereOrNull(
            (final t) => t.name == tableName,
          );

          expect(
            databaseTable,
            isNotNull,
            reason: 'Could not find migration table in live table definitions.',
          );

          final columns = databaseTable!.columns;
          expect(
            columns.length,
            2,
            reason: 'Invalid Table Columns',
          );

          final dateTimeDefaultNow = columns.last;
          expect(
            dateTimeDefaultNow.columnDefault,
            isNull,
            reason:
                '"dateTimeDefaultNow" column should not have "columnDefault"',
          );
        },
      );

      test(
        'when creating and applying migration, then the database does not contain default values for "dateTimeDefaultStr" with "defaultModel".',
        () async {
          const tableName = 'migrated_table';
          const tag = 'add-table';
          final targetStateProtocols = {
            'migrated_table':
                '''
        class: MigratedTable
        table: $tableName 
        fields:
          dateTimeDefaultStr: DateTime, defaultModel=2024-05-24T22:00:00.000Z
        ''',
          };

          final createMigrationExitCode =
              await MigrationTestUtils.createMigrationFromProtocols(
                protocols: targetStateProtocols,
                tag: tag,
              );

          expect(
            createMigrationExitCode,
            0,
            reason: 'Failed to create migration, exit code was not 0.',
          );

          final applyMigrationExitCode =
              await MigrationTestUtils.runApplyMigrations();

          expect(
            applyMigrationExitCode,
            0,
            reason: 'Failed to apply migration, exit code was not 0.',
          );

          final liveDefinition = await serviceClient.insights
              .getLiveDatabaseDefinition();

          final databaseTable = liveDefinition.tables.firstWhereOrNull(
            (final t) => t.name == tableName,
          );

          expect(
            databaseTable,
            isNotNull,
            reason: 'Could not find migration table in live table definitions.',
          );

          final columns = databaseTable!.columns;
          expect(
            columns.length,
            2,
            reason: 'Invalid Table Columns',
          );

          final dateTimeDefaultStr = columns.last;
          expect(
            dateTimeDefaultStr.columnDefault,
            isNull,
            reason:
                '"dateTimeDefaultStr" column should not have "columnDefault"',
          );
        },
      );
    },
  );
}

extension _ListExt<T> on List<T> {
  /// The first element satisfying [test], or `null` if there are none.
  T? firstWhereOrNull(final bool Function(T element) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
