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
  group('Given database not matching latest migration', () {
    tearDownAll(() async {
      await MigrationTestUtils.migrationTestCleanup(
        resetSql: 'DROP TABLE IF EXISTS migrated_table, migrated_table_2;',
        serviceClient: serviceClient,
      );
    });

    setUpAll(() async {
      final firstMigrationProtocols = {
        'migrated_table': '''
class: MigratedTable
table: migrated_table
fields:
  anInt: int
''',
      };

      await MigrationTestUtils.createInitialState(
        migrationProtocols: [
          firstMigrationProtocols,
        ],
      );

      final unappliedMigrationProtocols = {
        'migrated_table': '''
class: MigratedTable
table: migrated_table
fields:
  anInt: int
''',
        'migrated_table_2': '''
class: MigratedTable2
table: migrated_table_2
fields:
  anInt: int
''',
      };

      assert(
        0 ==
            await MigrationTestUtils.createMigrationFromProtocols(
              protocols: unappliedMigrationProtocols,
            ),
      );
    });

    test(
      'when creating and applying repair migration then database matches latest migration',
      () async {
        final createRepairMigrationExitCode =
            await MigrationTestUtils.runCreateRepairMigration();
        expect(
          createRepairMigrationExitCode,
          0,
          reason: 'Should create a repair migration.',
        );

        final applyRepairMigrationExitCode =
            await MigrationTestUtils.runApplyRepairMigration();
        expect(
          applyRepairMigrationExitCode,
          0,
          reason: 'Should successfully apply repair migration.',
        );

        final liveDefinition = await serviceClient.insights
            .getLiveDatabaseDefinition();
        final databaseTables = liveDefinition.tables.map((final t) => t.name);
        expect(
          databaseTables,
          contains('migrated_table_2'),
          reason: 'Could not find table added in the repair migration.',
        );
      },
    );
  });

  group('Given database matching latest migration', () {
    tearDownAll(() async {
      await MigrationTestUtils.migrationTestCleanup(
        resetSql: 'DROP TABLE IF EXISTS migrated_table, migrated_table_2;',
        serviceClient: serviceClient,
      );
    });

    setUpAll(() async {
      final firstMigrationProtocols = {
        'migrated_table': '''
class: MigratedTable
table: migrated_table
fields:
  anInt: int
''',
      };

      final secondMigrationProtocols = {
        'migrated_table': '''
class: MigratedTable
table: migrated_table
fields:
  anInt: int
''',
        'migrated_table_2': '''
class: MigratedTable2
table: migrated_table_2
fields:
  anInt: int
''',
      };

      await MigrationTestUtils.createInitialState(
        migrationProtocols: [
          firstMigrationProtocols,
          secondMigrationProtocols,
        ],
      );
    });

    test(
      'when creating and applying destructive repair migration to older migration then database matches older migration',
      () async {
        final migrationRegistry = MigrationTestUtils.loadMigrationRegistry();
        final previousMigrationIndex = migrationRegistry.versions.length - 2;
        final previousMigrationName =
            migrationRegistry.versions[previousMigrationIndex];

        final createRepairMigrationExitCode =
            await MigrationTestUtils.runCreateRepairMigration(
              targetVersion: previousMigrationName,
              force: true,
            );

        expect(
          createRepairMigrationExitCode,
          0,
          reason: 'Should create a repair migration.',
        );

        final applyRepairMigrationExitCode =
            await MigrationTestUtils.runApplyRepairMigration();
        expect(
          applyRepairMigrationExitCode,
          0,
          reason: 'Should successfully apply repair migration.',
        );

        final liveDefinition = await serviceClient.insights
            .getLiveDatabaseDefinition();
        final databaseTables = liveDefinition.tables.map((final t) => t.name);
        expect(
          databaseTables,
          isNot(contains('migrated_table_2')),
          reason: 'Could still find table removed in the repair migration.',
        );
      },
    );
  });

  group(
    'Given database not matching latest migration and unapplied migrations',
    () {
      tearDownAll(() async {
        await MigrationTestUtils.migrationTestCleanup(
          resetSql: 'DROP TABLE IF EXISTS migrated_table, migrated_table_2;',
          serviceClient: serviceClient,
        );
      });

      setUpAll(() async {
        final firstMigrationProtocols = {
          'migrated_table': '''
class: MigratedTable
table: migrated_table
fields:
  anInt: int
''',
        };
        assert(
          0 ==
              await MigrationTestUtils.createMigrationFromProtocols(
                protocols: firstMigrationProtocols,
              ),
        );

        final secondMigrationProtocols = {
          'migrated_table': '''
class: MigratedTable
table: migrated_table
fields:
  anInt: int
''',
          'migrated_table_2': '''
class: MigratedTable2
table: migrated_table_2
fields:
  anInt: int
''',
        };
        assert(
          0 ==
              await MigrationTestUtils.createMigrationFromProtocols(
                protocols: secondMigrationProtocols,
              ),
        );
      });
      test(
        'when creating and applying repair migration targeting older migration and applying migrations then database matches latest migration',
        () async {
          final migrationRegistry = MigrationTestUtils.loadMigrationRegistry();
          final previousMigrationIndex = migrationRegistry.versions.length - 2;
          final previousMigrationName =
              migrationRegistry.versions[previousMigrationIndex];

          final createRepairMigrationExitCode =
              await MigrationTestUtils.runCreateRepairMigration(
                targetVersion: previousMigrationName,
                force: true,
              );

          expect(
            createRepairMigrationExitCode,
            0,
            reason: 'Should create a repair migration.',
          );

          final applyRepairMigrationExitCode =
              await MigrationTestUtils.runApplyBothRepairMigrationAndMigrations();
          expect(
            applyRepairMigrationExitCode,
            0,
            reason:
                'Should successfully apply repair migration and migrations.',
          );

          final liveDefinition = await serviceClient.insights
              .getLiveDatabaseDefinition();
          final databaseTables = liveDefinition.tables.map((final t) => t.name);
          expect(
            databaseTables,
            contains('migrated_table'),
            reason: 'Could not find table added in the repair migration.',
          );
          expect(
            databaseTables,
            contains('migrated_table_2'),
            reason: 'Could not find table added in the migrations.',
          );
        },
      );
    },
  );
}
