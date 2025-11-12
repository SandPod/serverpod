import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:serverpod/protocol.dart' as serverProtocol;
import 'package:serverpod_cli/src/migrations/migration_registry.dart';
import 'package:serverpod_service_client/serverpod_service_client.dart';

var _moduleName = 'serverpod_test';

abstract class MigrationTestUtils {
  static Future<void> createInitialState({
    required final List<Map<String, String>> migrationProtocols,
    final String tag = 'test',
  }) async {
    for (final protocols in migrationProtocols) {
      final exitCode = await createMigrationFromProtocols(
        protocols: protocols,
        tag: tag,
      );

      assert(
        exitCode == 0,
        'Failed to create migration.',
      );
    }

    assert(
      await runApplyMigrations() == 0,
      'Failed to create migration.',
    );
  }

  static Future<int> createMigrationFromProtocols({
    required final Map<String, String> protocols,
    final String tag = 'test',
    final bool force = false,
  }) async {
    _removeMigrationTestProtocolFolder();
    _migrationProtocolTestDirectory().createSync(recursive: true);

    protocols.forEach((final fileName, final contents) {
      final protocolFile = File(
        path.join(
          _migrationProtocolTestDirectory().path,
          '$fileName.yaml',
        ),
      );

      protocolFile.writeAsStringSync(contents);
    });

    final exitCode = await _runProcess(
      'serverpod',
      arguments: [
        'create-migration',
        '--tag',
        tag,
        if (force) '--force',
        '--verbose',
        '--no-analytics',
        '--experimental-features=all',
      ],
    );

    // Ensures that another migration is never created with the same millisecond.
    await Future.delayed(const Duration(milliseconds: 2));

    return exitCode;
  }

  static String readMigrationRegistryFile() {
    final migrationRegistryFile = File(
      path.join(
        _migrationsProjectDirectory().path,
        'migration_registry.txt',
      ),
    );

    return migrationRegistryFile.readAsStringSync();
  }

  static MigrationRegistry loadMigrationRegistry() {
    return MigrationRegistry.load(
      _migrationsProjectDirectory(),
    );
  }

  static Future<void> migrationTestCleanup({
    final String? resetSql,
    required final Client serviceClient,
  }) async {
    removeAllTaggedMigrations();
    removeRepairMigration();
    _removeMigrationTestProtocolFolder();
    _recreateMigrationRegistryFile();
    if (resetSql != null) {
      await _resetDatabase(resetSql: resetSql, serviceClient: serviceClient);
    }
    await _setDatabaseMigrationToLatestInRegistry(serviceClient: serviceClient);
  }

  static void _recreateMigrationRegistryFile() {
    final migrationRegistry = MigrationRegistry.load(
      _migrationsProjectDirectory(),
    );
    migrationRegistry.write();
  }

  static void removeRepairMigration() {
    final repairMigrationDirectory = _repairMigrationDirectory();
    if (repairMigrationDirectory.existsSync()) {
      repairMigrationDirectory.deleteSync(recursive: true);
    }
  }

  static void removeAllTaggedMigrations() {
    for (final model in _migrationsProjectDirectory().listSync()) {
      if (model is Directory) {
        if (path.basename(model.path).contains('-')) {
          model.deleteSync(recursive: true);
        }
      }
    }
  }

  static Future<int> runApplyMigrations() async {
    return await _runProcess(
      'dart',
      arguments: [
        'run',
        'bin/main.dart',
        '--apply-migrations',
        '--role',
        'maintenance',
        '--mode',
        'production',
        '--logging',
        'verbose',
      ],
    );
  }

  static Future<int> runApplyRepairMigration() async {
    return await _runProcess(
      'dart',
      arguments: [
        'run',
        'bin/main.dart',
        '--apply-repair-migration',
        '--role',
        'maintenance',
        '--mode',
        'production',
        '--logging',
        'verbose',
      ],
    );
  }

  static Future<int> runApplyBothRepairMigrationAndMigrations() async {
    return await _runProcess(
      'dart',
      arguments: [
        'run',
        'bin/main.dart',
        '--apply-repair-migration',
        '--apply-migrations',
        '--role',
        'maintenance',
        '--mode',
        'production',
        '--logging',
        'verbose',
      ],
    );
  }

  static Future<int> runCreateRepairMigration({
    final String tag = 'test',
    final bool force = false,
    final String? targetVersion,
  }) async {
    return await _runProcess(
      'serverpod',
      arguments: [
        'create-repair-migration',
        '--tag',
        tag,
        '--mode',
        'production',
        if (targetVersion != null) ...['--version', targetVersion],
        if (force) '--force',
        '--verbose',
        '--no-analytics',
      ],
    );
  }

  static File? tryLoadRepairMigrationFile() {
    final repairMigrationDirectory = _repairMigrationDirectory();
    if (!repairMigrationDirectory.existsSync()) {
      return null;
    }

    final repairMigrationFiles = repairMigrationDirectory.listSync();
    if (repairMigrationFiles.isEmpty) {
      return null;
    }

    return repairMigrationFiles.first as File;
  }

  static void setModuleName(final String moduleName) {
    _moduleName = moduleName;
  }

  static Directory _migrationProtocolTestDirectory() => Directory(
    path.join(
      Directory.current.path,
      'lib',
      'src',
      'protocol',
      'migration_test_protocol_files',
    ),
  );

  static Directory _repairMigrationDirectory() => Directory(
    path.join(
      Directory.current.path,
      'repair-migration',
    ),
  );

  static Directory _migrationsProjectDirectory() => Directory(
    path.join(
      Directory.current.path,
      'migrations',
    ),
  );

  static void _removeMigrationTestProtocolFolder() {
    final protocolDirectory = _migrationProtocolTestDirectory();
    if (protocolDirectory.existsSync()) {
      protocolDirectory.deleteSync(recursive: true);
    }
  }

  static Future<void> _resetDatabase({
    required final Client serviceClient,
    required final String resetSql,
  }) async {
    await serviceClient.insights.executeSql(resetSql);
  }

  static Future<void> _setDatabaseMigrationToLatestInRegistry({
    required final Client serviceClient,
  }) async {
    final migrationRegistry = loadMigrationRegistry();

    final latestMigration = migrationRegistry.getLatest();

    await serviceClient.insights.executeSql('''
INSERT INTO "${serverProtocol.DatabaseMigrationVersion.t.tableName}"
    ("module", "version", "timestamp")
    VALUES ('$_moduleName', '$latestMigration', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '$latestMigration';
''');
  }

  static Future<int> _runProcess(
    final String command, {
    final List<String>? arguments,
    final Directory? workingDirectory,
  }) async {
    final process = await Process.start(
      command,
      arguments ?? [],
      workingDirectory: workingDirectory?.path ?? Directory.current.path,
    );

    process.stderr.transform(utf8.decoder).listen(print);
    process.stdout.transform(utf8.decoder).listen(print);

    return await process.exitCode;
  }
}
