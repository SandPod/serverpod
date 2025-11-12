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
    'Given an existing table, when adding a non-nullable column with a default value,',
    () {
      setUpAll(() async {
        final createTableProtocol = {
          'existing_table': '''
        class: ExistingTable
        table: existing_table
        fields:
          number: int
        ''',
        };

        await MigrationTestUtils.createMigrationFromProtocols(
          protocols: createTableProtocol,
          tag: 'create-existing-table',
        );

        await MigrationTestUtils.runApplyMigrations();
      });

      tearDown(() async {
        await MigrationTestUtils.migrationTestCleanup(
          resetSql: 'DROP TABLE IF EXISTS existing_table;',
          serviceClient: serviceClient,
        );
      });

      test(
        'then the table contains the new non-nullable column with the correct default value.',
        () async {
          final targetStateProtocols = {
            'existing_table': '''
        class: ExistingTable
        table: existing_table
        fields:
          number: int
          newColumn: DateTime, default=now
        ''',
          };

          final createMigrationExitCode =
              await MigrationTestUtils.createMigrationFromProtocols(
                protocols: targetStateProtocols,
                tag: 'add-new-column',
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
            (final t) => t.name == 'existing_table',
          );

          expect(
            databaseTable,
            isNotNull,
            reason: 'Could not find existing table in live table definitions.',
          );

          final columns = databaseTable!.columns;
          expect(
            columns.length,
            3,
            reason: 'Invalid Table Columns',
          );

          final newColumn = columns[2];
          expect(
            newColumn.columnDefault,
            'CURRENT_TIMESTAMP',
            reason: 'Could not find "columnDefault" for "newColumn"',
          );
        },
      );
    },
  );

  group('Given an existing table with a nullable column,', () {
    setUpAll(() async {
      final createTableProtocol = {
        'existing_table': '''
        class: ExistingTable
        table: existing_table
        fields:
          number: int
          existingColumn: DateTime?
        ''',
      };

      await MigrationTestUtils.createMigrationFromProtocols(
        protocols: createTableProtocol,
        tag: 'create-existing-table',
      );

      await MigrationTestUtils.runApplyMigrations();
    });

    tearDown(() async {
      await MigrationTestUtils.migrationTestCleanup(
        resetSql: 'DROP TABLE IF EXISTS existing_table;',
        serviceClient: serviceClient,
      );
    });

    group('when modifying it to be non-nullable with a default value,', () {
      test(
        'then the column is modified to be non-nullable with the correct default value.',
        () async {
          final targetStateProtocols = {
            'existing_table': '''
        class: ExistingTable
        table: existing_table
        fields:
          number: int
          existingColumn: DateTime, default=now
        ''',
          };

          final createMigrationExitCode =
              await MigrationTestUtils.createMigrationFromProtocols(
                force: true,
                protocols: targetStateProtocols,
                tag: 'modify-existing-column',
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
            (final t) => t.name == 'existing_table',
          );

          expect(
            databaseTable,
            isNotNull,
            reason: 'Could not find existing table in live table definitions.',
          );

          final columns = databaseTable!.columns;
          expect(
            columns.length,
            3,
            reason: 'Invalid Table Columns',
          );

          final existingColumn = columns[2];
          expect(
            existingColumn.columnDefault,
            'CURRENT_TIMESTAMP',
            reason: 'Could not find "columnDefault" for "existingColumn"',
          );
        },
      );
    });
  });
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
