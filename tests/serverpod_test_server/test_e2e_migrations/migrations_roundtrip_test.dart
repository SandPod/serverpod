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

  group('Given new protocol model with table', () {
    tearDown(() async {
      await MigrationTestUtils.migrationTestCleanup(
        resetSql: 'DROP TABLE IF EXISTS migrated_table;',
        serviceClient: serviceClient,
      );
    });

    test(
      'when creating and applying migration then database contains new table.',
      () async {
        const tableName = 'migrated_table';
        const tag = 'add-table';
        final targetStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $tableName 
fields:
  anInt: int
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
        final databaseTables = liveDefinition.tables.map((final t) => t.name);
        expect(
          databaseTables,
          contains(tableName),
          reason: 'Could not find migration table in live table definitions.',
        );
      },
    );
  });

  group('Given multiple new protocol models with table', () {
    tearDown(() async {
      await MigrationTestUtils.migrationTestCleanup(
        resetSql:
            'DROP TABLE IF EXISTS migrated_table, migrated_table_2, migrated_table_3;',
        serviceClient: serviceClient,
      );
    });

    test(
      'when creating and applying migration then database contains new tables.',
      () async {
        const tag = 'add-multiple-tables';
        final tables = [
          'migrated_table',
          'migrated_table_2',
          'migrated_table_3',
        ];
        final targetStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: ${tables[0]}
fields:
  anInt: int
''',
          'migrated_table_2':
              '''
class: MigratedTable2
table: ${tables[1]} 
fields:
  aBool: bool
''',
          'migrated_table_3':
              '''
class: MigratedTable3
table: ${tables[2]} 
fields:
  aString: String
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
        final databaseTables = liveDefinition.tables.map((final t) => t.name);
        expect(
          databaseTables,
          containsAll(tables),
          reason: 'Could not find the new tables in live table definitions.',
        );
      },
    );
  });

  group('Given protocol model with table that is removed', () {
    tearDown(() async {
      await MigrationTestUtils.migrationTestCleanup(
        resetSql: 'DROP TABLE IF EXISTS migrated_table;',
        serviceClient: serviceClient,
      );
    });

    test('when creating migration then creating migration fails.', () async {
      const tag = 'drop-table';
      final initialStateProtocols = {
        'migrated_table': '''
class: MigratedTable
table: migrated_table
fields:
  anInt: int
''',
      };
      await MigrationTestUtils.createInitialState(
        migrationProtocols: [initialStateProtocols],
        tag: tag,
      );

      final targetStateProtocols = <String, String>{};
      final createMigrationExitCode =
          await MigrationTestUtils.createMigrationFromProtocols(
            protocols: targetStateProtocols,
            tag: tag,
          );

      expect(
        createMigrationExitCode,
        isNot(0),
        reason: 'Should fail to create migration, exit code was 0.',
      );
    });
  });

  group('Given protocol model with table that is removed', () {
    tearDown(() async {
      await MigrationTestUtils.migrationTestCleanup(
        resetSql: 'DROP TABLE IF EXISTS migrated_table;',
        serviceClient: serviceClient,
      );
    });

    test(
      'when creating migration using --force and applying it then table is removed from database.',
      () async {
        const tag = 'drop-table';
        const table = 'migrated_table';
        final initialStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int
''',
        };
        await MigrationTestUtils.createInitialState(
          migrationProtocols: [initialStateProtocols],
          tag: tag,
        );

        final targetStateProtocols = <String, String>{};
        final createMigrationExitCode =
            await MigrationTestUtils.createMigrationFromProtocols(
              protocols: targetStateProtocols,
              tag: tag,
              force: true,
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
        final databaseTables = liveDefinition.tables.map((final t) => t.name);
        expect(
          databaseTables,
          isNot(contains(table)),
          reason: 'Could still find migration table in live table definitions.',
        );
      },
    );
  });

  group('Given existing protocol model with added nullable column', () {
    tearDown(() async {
      await MigrationTestUtils.migrationTestCleanup(
        resetSql: 'DROP TABLE IF EXISTS migrated_table;',
        serviceClient: serviceClient,
      );
    });

    test(
      'when creating and applying migration then contains new column.',
      () async {
        const tag = 'add-nullable-column';
        const table = 'migrated_table';
        final initialStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int
''',
        };
        await MigrationTestUtils.createInitialState(
          migrationProtocols: [initialStateProtocols],
          tag: tag,
        );

        const addedColumn = 'addedColumn';
        final targetStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int
  $addedColumn: String?
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
        final databaseTables = liveDefinition.tables.map((final t) => t.name);
        expect(
          databaseTables,
          contains(table),
          reason: 'Could not find migration table in live table definitions.',
        );

        final migratedTable = liveDefinition.tables.firstWhere(
          (final t) => t.name == table,
        );
        final databaseColumns = migratedTable.columns.map((final c) => c.name);
        expect(
          databaseColumns,
          contains(addedColumn),
          reason: 'Could not find added column in migrated table columns.',
        );
      },
    );
  });

  group('Given existing protocol model with removed column', () {
    tearDown(() async {
      await MigrationTestUtils.migrationTestCleanup(
        resetSql: 'DROP TABLE IF EXISTS migrated_table;',
        serviceClient: serviceClient,
      );
    });

    test(
      'when creating migration using --force and applying it then table is removed from database.',
      () async {
        const tag = 'drop-column';
        const table = 'migrated_table';
        const columnToRemove = 'columnToRemove';
        final initialStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int
  $columnToRemove: String
''',
        };
        await MigrationTestUtils.createInitialState(
          migrationProtocols: [initialStateProtocols],
          tag: tag,
        );

        final targetStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int
''',
        };
        final createMigrationExitCode =
            await MigrationTestUtils.createMigrationFromProtocols(
              protocols: targetStateProtocols,
              tag: tag,
              force: true,
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
        final databaseTables = liveDefinition.tables.map((final t) => t.name);
        expect(
          databaseTables,
          contains(table),
          reason: 'Could not find migration table in live table definitions.',
        );

        final migratedTable = liveDefinition.tables.firstWhere(
          (final t) => t.name == table,
        );
        final databaseColumns = migratedTable.columns.map((final c) => c.name);
        expect(
          databaseColumns,
          isNot(contains(columnToRemove)),
          reason: 'Could still find removed column in migrated table columns.',
        );
      },
    );
  });

  group('Given existing protocol model with removed column', () {
    tearDown(() async {
      await MigrationTestUtils.migrationTestCleanup(
        resetSql: 'DROP TABLE IF EXISTS migrated_table;',
        serviceClient: serviceClient,
      );
    });

    test('when creating migration then creating migration fails.', () async {
      const tag = 'drop-column';
      const table = 'migrated_table';
      const columnToRemove = 'columnToRemove';
      final initialStateProtocols = {
        'migrated_table':
            '''
class: MigratedTable
table: $table 
fields:
  anInt: int
  $columnToRemove: String
''',
      };
      await MigrationTestUtils.createInitialState(
        migrationProtocols: [initialStateProtocols],
        tag: tag,
      );

      final targetStateProtocols = {
        'migrated_table':
            '''
class: MigratedTable
table: $table 
fields:
  anInt: int
''',
      };
      final createMigrationExitCode =
          await MigrationTestUtils.createMigrationFromProtocols(
            protocols: targetStateProtocols,
            tag: tag,
          );
      expect(
        createMigrationExitCode,
        isNot(0),
        reason: 'Should fail to create migration, exit code was 0.',
      );
    });
  });

  group('Given existing protocol model with added non nullable column', () {
    tearDown(() async {
      await MigrationTestUtils.migrationTestCleanup(
        resetSql: 'DROP TABLE IF EXISTS migrated_table;',
        serviceClient: serviceClient,
      );
    });

    test('when creating migration then creating migration fails.', () async {
      const tag = 'add-non-nullable-column';
      const table = 'migrated_table';
      final initialStateProtocols = {
        'migrated_table':
            '''
class: MigratedTable
table: $table 
fields:
  anInt: int
''',
      };
      await MigrationTestUtils.createInitialState(
        migrationProtocols: [initialStateProtocols],
        tag: tag,
      );

      const addedColumn = 'addedColumn';
      final targetStateProtocols = {
        'migrated_table':
            '''
class: MigratedTable
table: $table 
fields:
  anInt: int
  $addedColumn: String
''',
      };
      final createMigrationExitCode =
          await MigrationTestUtils.createMigrationFromProtocols(
            protocols: targetStateProtocols,
            tag: tag,
          );
      expect(
        createMigrationExitCode,
        isNot(0),
        reason: 'Should fail to create migration, exit code was 0.',
      );
    });
  });

  group('Given existing protocol model with non nullable column', () {
    tearDown(() async {
      await MigrationTestUtils.migrationTestCleanup(
        resetSql: 'DROP TABLE IF EXISTS migrated_table;',
        serviceClient: serviceClient,
      );
    });

    test(
      'when creating migration using --force and applying it then database contains new column.',
      () async {
        const tag = 'add-non-nullable-column';
        const table = 'migrated_table';
        final initialStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int
''',
        };
        await MigrationTestUtils.createInitialState(
          migrationProtocols: [initialStateProtocols],
          tag: tag,
        );

        const addedColumn = 'addedColumn';
        final targetStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int
  $addedColumn: String
''',
        };
        final createMigrationExitCode =
            await MigrationTestUtils.createMigrationFromProtocols(
              protocols: targetStateProtocols,
              tag: tag,
              force: true,
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
        final databaseTables = liveDefinition.tables.map((final t) => t.name);
        expect(
          databaseTables,
          contains(table),
          reason: 'Could not find migration table in live table definitions.',
        );

        final migratedTable = liveDefinition.tables.firstWhere(
          (final t) => t.name == table,
        );
        final databaseColumns = migratedTable.columns.map((final c) => c.name);
        expect(
          databaseColumns,
          contains(addedColumn),
          reason: 'Could not find added column in migrated table columns.',
        );
      },
    );
  });

  group('Given existing protocol model with nullability added to column', () {
    tearDown(() async {
      await MigrationTestUtils.migrationTestCleanup(
        resetSql: 'DROP TABLE IF EXISTS migrated_table;',
        serviceClient: serviceClient,
      );
    });

    test(
      'when creating and applying migration then database column is nullable.',
      () async {
        const tag = 'add-column-nullability';
        const table = 'migrated_table';
        const columnToModify = 'previouslyNonNullableColumn';
        final initialStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int
  $columnToModify: String
''',
        };
        await MigrationTestUtils.createInitialState(
          migrationProtocols: [initialStateProtocols],
          tag: tag,
        );

        final targetStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int
  $columnToModify: String?
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
        final databaseTables = liveDefinition.tables.map((final t) => t.name);
        expect(
          databaseTables,
          contains(table),
          reason: 'Could not find migration table in live table definitions.',
        );

        final migratedTable = liveDefinition.tables.firstWhere(
          (final t) => t.name == table,
        );
        final migratedTableColumnNames = migratedTable.columns.map((final c) => c.name);
        expect(
          migratedTableColumnNames,
          contains(columnToModify),
          reason: 'Could not find modified column in migrated table columns.',
        );

        final migratedTableColumn = migratedTable.columns.firstWhere(
          (final c) => c.name == columnToModify,
        );
        expect(
          migratedTableColumn.isNullable,
          isTrue,
          reason: 'Column should be nullable after migration',
        );
      },
    );
  });

  group('Given existing protocol model with nullability removed from column', () {
    tearDown(() async {
      await MigrationTestUtils.migrationTestCleanup(
        resetSql: 'DROP TABLE IF EXISTS migrated_table;',
        serviceClient: serviceClient,
      );
    });

    test(
      'when creating migration using --force and applying it then database contains non nullable column.',
      () async {
        const tag = 'drop-column-nullability';
        const table = 'migrated_table';
        const columnToModify = 'previouslyNullableColumn';
        final initialStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int
  $columnToModify: String?
''',
        };
        await MigrationTestUtils.createInitialState(
          migrationProtocols: [initialStateProtocols],
          tag: tag,
        );

        final targetStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int
  $columnToModify: String
''',
        };
        final createMigrationExitCode =
            await MigrationTestUtils.createMigrationFromProtocols(
              protocols: targetStateProtocols,
              tag: tag,
              force: true,
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
        final databaseTables = liveDefinition.tables.map((final t) => t.name);
        expect(
          databaseTables,
          contains(table),
          reason: 'Could not find migration table in live table definitions.',
        );

        final migratedTable = liveDefinition.tables.firstWhere(
          (final t) => t.name == table,
        );
        final migratedTableColumnNames = migratedTable.columns.map((final c) => c.name);
        expect(
          migratedTableColumnNames,
          contains(columnToModify),
          reason: 'Could not find modified column in migrated table columns.',
        );

        final migratedTableColumn = migratedTable.columns.firstWhere(
          (final c) => c.name == columnToModify,
        );
        expect(
          migratedTableColumn.isNullable,
          isFalse,
          reason: 'Column should not be nullable after migration',
        );
      },
    );
  });

  group(
    'Given existing protocol model with nullability removed from column',
    () {
      tearDown(() async {
        await MigrationTestUtils.migrationTestCleanup(
          resetSql: 'DROP TABLE IF EXISTS migrated_table;',
          serviceClient: serviceClient,
        );
      });

      test('when creating migration then creating migration fails.', () async {
        const tag = 'drop-column-nullability';
        const table = 'migrated_table';
        const columnToModify = 'previouslyNullableColumn';
        final initialStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int
  $columnToModify: String?
''',
        };
        await MigrationTestUtils.createInitialState(
          migrationProtocols: [initialStateProtocols],
          tag: tag,
        );

        final targetStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int
  $columnToModify: String
''',
        };
        final createMigrationExitCode =
            await MigrationTestUtils.createMigrationFromProtocols(
              protocols: targetStateProtocols,
              tag: tag,
            );
        expect(
          createMigrationExitCode,
          isNot(0),
          reason: 'Should fail to create migration, exit code was 0.',
        );
      });
    },
  );

  group('Given protocol model with added index', () {
    tearDown(() async {
      await MigrationTestUtils.migrationTestCleanup(
        resetSql: 'DROP TABLE IF EXISTS migrated_table;',
        serviceClient: serviceClient,
      );
    });

    test(
      'when creating and applying migration then contains new index.',
      () async {
        const tag = 'add-index';
        const table = 'migrated_table';
        final initialStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int
''',
        };
        await MigrationTestUtils.createInitialState(
          migrationProtocols: [initialStateProtocols],
          tag: tag,
        );

        const addedIndex = 'migrated_table_index';
        final targetStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int
indexes:
  $addedIndex:
    fields: anInt
    unique: false

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
        final databaseTables = liveDefinition.tables.map((final t) => t.name);
        expect(
          databaseTables,
          contains(table),
          reason: 'Could not find migration table in live table definitions.',
        );

        final migratedTable = liveDefinition.tables.firstWhere(
          (final t) => t.name == table,
        );
        final tableIndexes = migratedTable.indexes.map((final i) => i.indexName);
        expect(
          tableIndexes,
          contains(addedIndex),
          reason: 'Could not find added index for migrated table.',
        );
      },
    );
  });

  group('Given protocol model with index that is removed', () {
    tearDown(() async {
      await MigrationTestUtils.migrationTestCleanup(
        resetSql: 'DROP TABLE IF EXISTS migrated_table;',
        serviceClient: serviceClient,
      );
    });

    test(
      'when creating and applying migration then index is removed from database.',
      () async {
        const tag = 'drop-index';
        const table = 'migrated_table';
        const indexToRemove = 'migrated_table_index';
        final initialStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int
indexes:
  $indexToRemove:
    fields: anInt
    unique: false
''',
        };
        await MigrationTestUtils.createInitialState(
          migrationProtocols: [initialStateProtocols],
          tag: tag,
        );

        final targetStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int

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
        final databaseTables = liveDefinition.tables.map((final t) => t.name);
        expect(
          databaseTables,
          contains(table),
          reason: 'Could not find migration table in live table definitions.',
        );

        final migratedTable = liveDefinition.tables.firstWhere(
          (final t) => t.name == table,
        );
        final tableIndexes = migratedTable.indexes.map((final i) => i.indexName);
        expect(
          tableIndexes,
          isNot(contains(indexToRemove)),
          reason: 'Could still find removed index for migrated table.',
        );
      },
    );
  });

  group('Given protocol model with added relation', () {
    tearDown(() async {
      await MigrationTestUtils.migrationTestCleanup(
        resetSql: 'DROP TABLE IF EXISTS migrated_table;',
        serviceClient: serviceClient,
      );
    });

    test(
      'when creating and applying migration then database contains new relation.',
      () async {
        const tag = 'add-relation';
        const table = 'migrated_table';
        final initialStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int
''',
        };
        await MigrationTestUtils.createInitialState(
          migrationProtocols: [initialStateProtocols],
          tag: tag,
        );

        final targetStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int, relation(parent=migrated_table)
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
        final databaseTables = liveDefinition.tables.map((final t) => t.name);
        expect(
          databaseTables,
          contains(table),
          reason: 'Could not find migration table in live table definitions.',
        );

        final migratedTable = liveDefinition.tables.firstWhere(
          (final t) => t.name == table,
        );
        final relations = migratedTable.foreignKeys;
        expect(
          relations,
          isNotEmpty,
          reason: 'Could not find added relation for migrated table.',
        );
      },
    );
  });

  group('Given protocol model with relation that is removed', () {
    tearDown(() async {
      await MigrationTestUtils.migrationTestCleanup(
        resetSql: 'DROP TABLE IF EXISTS migrated_table;',
        serviceClient: serviceClient,
      );
    });

    test(
      'when creating and applying migration then relation is removed from database.',
      () async {
        const tag = 'drop-relation';
        const table = 'migrated_table';
        final initialStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int, relation(parent=migrated_table)
''',
        };
        await MigrationTestUtils.createInitialState(
          migrationProtocols: [initialStateProtocols],
          tag: tag,
        );

        final targetStateProtocols = {
          'migrated_table':
              '''
class: MigratedTable
table: $table 
fields:
  anInt: int
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
        final databaseTables = liveDefinition.tables.map((final t) => t.name);
        expect(
          databaseTables,
          contains(table),
          reason: 'Could not find migration table in live table definitions.',
        );

        final migratedTable = liveDefinition.tables.firstWhere(
          (final t) => t.name == table,
        );
        final relations = migratedTable.foreignKeys;
        expect(
          relations,
          isEmpty,
          reason: 'Could still find relation for migrated table.',
        );
      },
    );
  });

  group('Given invalid protocol file', () {
    tearDown(() async {
      await MigrationTestUtils.migrationTestCleanup(
        serviceClient: serviceClient,
      );
    });

    test(
      'when creating migration then create migration exits with error and migration is not created.',
      () async {
        const tag = 'invalid-protocol';
        final targetStateProtocols = {
          'migrated_table': '''
This is not a valid protocol file, in yaml format
''',
        };

        final createMigrationExitCode =
            await MigrationTestUtils.createMigrationFromProtocols(
              protocols: targetStateProtocols,
              tag: tag,
            );
        expect(
          createMigrationExitCode,
          isNot(0),
          reason: 'Should fail to create migration but exit code 0.',
        );

        final migrationRegistry = MigrationTestUtils.loadMigrationRegistry();
        expect(migrationRegistry.versions, isNot(contains(tag)));
      },
    );
  });

  group('Given a new table that should not be managed by Serverpod', () {
    tearDown(() async {
      await MigrationTestUtils.migrationTestCleanup(
        serviceClient: serviceClient,
      );
    });

    test(
      'when creating migration then create migration exits with error and migration is not created.',
      () async {
        const tag = 'managed-false';
        final targetStateProtocols = {
          'migrated_table': '''
class: MigratedTable
managedMigration: false
table: migrated_table
fields:
  name: String
''',
        };

        final createMigrationExitCode =
            await MigrationTestUtils.createMigrationFromProtocols(
              protocols: targetStateProtocols,
              tag: tag,
            );
        expect(
          createMigrationExitCode,
          isNot(0),
          reason: 'Should fail to create migration but exit code 0.',
        );

        final migrationRegistry = MigrationTestUtils.loadMigrationRegistry();
        expect(migrationRegistry.versions, isNot(contains(tag)));
      },
    );
  });

  /// Issue: https://github.com/serverpod/serverpod/issues/3503
  group(
    'Given an existing table when a new table is added that is lexically sorted after the existing table and the existing table references the new table',
    () {
      const oldTable = 'a_old_table';
      const newTable = 'z_new_table';
      tearDown(() async {
        await MigrationTestUtils.migrationTestCleanup(
          resetSql: 'DROP TABLE IF EXISTS $oldTable, $newTable;',
          serviceClient: serviceClient,
        );
      });

      test(
        'when creating and applying migrations then both tables and the relation exist in the database.',
        () async {
          const initialTag = 'create-old-table';
          // a Prefix ensure that it is lexically sorted before the new table
          final initialStateProtocols = {
            oldTable:
                '''
class: OldTable
table: $oldTable
fields:
  name: String
''',
          };
          await MigrationTestUtils.createInitialState(
            migrationProtocols: [initialStateProtocols],
            tag: initialTag,
          );

          const newTag = 'add-new-table-with-relation';
          // z Prefix ensure that it is lexically sorted after the old table
          final targetStateProtocols = {
            oldTable:
                '''
class: OldTable
table: $oldTable
fields:
  name: String
  newTableId: NewTable?, relation(optional)
''',
            newTable:
                '''
class: NewTable
table: $newTable
fields:
  description: String
''',
          };

          final createMigrationExitCode =
              await MigrationTestUtils.createMigrationFromProtocols(
                protocols: targetStateProtocols,
                tag: newTag,
              );
          expect(
            createMigrationExitCode,
            0,
            reason: 'Failed to create migration, exit code was not 0.',
          );

          final applyNewMigrationExitCode =
              await MigrationTestUtils.runApplyMigrations();
          expect(
            applyNewMigrationExitCode,
            0,
            reason: 'Failed to apply new migration, exit code was not 0.',
          );

          final liveDefinition = await serviceClient.insights
              .getLiveDatabaseDefinition();
          final databaseTables = liveDefinition.tables.map((final t) => t.name);
          expect(
            databaseTables,
            containsAll([oldTable, newTable]),
            reason: 'Could not find both tables in live table definitions.',
          );

          final oldTableDefinition = liveDefinition.tables.firstWhere(
            (final t) => t.name == oldTable,
          );
          final relations = oldTableDefinition.foreignKeys;
          expect(
            relations,
            isNotEmpty,
            reason: 'Could not find relation from old_table to new_table.',
          );
        },
      );
    },
  );
}
