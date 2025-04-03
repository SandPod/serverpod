import 'dart:io';

import 'package:package_config/package_config.dart';
import 'package:path/path.dart' as path;
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:serverpod_cli/src/config/config.dart';
import 'package:serverpod_cli/src/util/pubspec_helpers.dart';
import 'package:serverpod_shared/serverpod_shared.dart';
import 'package:yaml/yaml.dart';

const _serverSuffix = '_server';

bool _isServerpodModule(String packageName) {
  return packageName.endsWith(_serverSuffix) || packageName == 'serverpod';
}

Set<String> listModuleDependencies({
  required Pubspec projectPubspec,
  required PackageConfig packageConfig,
}) {
  var projectModuleDependencies = <String>{};
  var visitedModules = <String>{};

  void collectModuleDependencies(String modulePath, String packageName) {
    if (visitedModules.contains(modulePath)) {
      return;
    }

    visitedModules.add(modulePath);
    projectModuleDependencies.add(packageName);

    var modulePubspecFile = File(path.join(modulePath, 'pubspec.yaml'));
    if (!modulePubspecFile.existsSync()) {
      return;
    }

    Pubspec modulePubspec;
    try {
      modulePubspec = parsePubspec(modulePubspecFile);
    } catch (_) {
      return;
    }

    for (var dependency in modulePubspec.dependencies.keys) {
      if (!_isServerpodModule(dependency)) {
        continue;
      }

      var modulePath = packageConfig.packages
          .where((pkg) => pkg.name == dependency)
          .firstOrNull
          ?.packageUriRoot
          .toFilePath();

      if (modulePath == null) {
        continue;
      }

      collectModuleDependencies(modulePath, dependency);
    }
  }

  for (var packageInfo in packageConfig.packages) {
    if (!_isServerpodModule(packageInfo.name)) {
      continue;
    }

    var modulePath = packageInfo.packageUriRoot.toFilePath();
    collectModuleDependencies(modulePath, packageInfo.name);
  }

  return projectModuleDependencies;
}

Future<List<ModuleConfig>> loadModuleConfigs({
  required PackageConfig packageConfig,
  required Set<String> modules,
  Map<String, String?> nickNameOverrides = const {},
}) async {
  var moduleConfigs = <ModuleConfig>[];

  var dependencyPackageConfigs =
      packageConfig.packages.where((pkg) => modules.contains(pkg.name));
  for (var packageInfo in dependencyPackageConfigs) {
    try {
      var packageName = packageInfo.name;

      var packageSrcRoot = packageInfo.packageUriRoot;
      var moduleProjectRoot = List<String>.from(packageSrcRoot.pathSegments)
        ..removeLast()
        ..removeLast();
      var generatorConfigSegments = path
          .joinAll([...moduleProjectRoot, 'config', 'generator.yaml']).split(
              path.separator);

      var generatorConfigUri = packageSrcRoot.replace(
        pathSegments: generatorConfigSegments,
      );

      var generatorConfigFile = File.fromUri(generatorConfigUri);
      if (!await generatorConfigFile.exists()) {
        continue;
      }

      var moduleProjectUri = packageSrcRoot.replace(
        pathSegments: moduleProjectRoot,
      );

      var migrationVersions = findAllMigrationVersionsSync(
        directory: Directory.fromUri(moduleProjectUri),
      );

      var moduleInfo = loadConfigFile(generatorConfigFile);

      var moduleName = moduleNameFromServerPackageName(packageName);
      var manualNickname = nickNameOverrides[moduleName];
      var nickname = manualNickname ?? moduleInfo['nickname'] ?? moduleName;

      moduleConfigs.add(
        ModuleConfig(
          type: GeneratorConfig.getPackageType(moduleInfo),
          name: moduleName,
          nickname: nickname,
          migrationVersions: migrationVersions,
          serverPackageDirectoryPathParts: moduleProjectRoot,
        ),
      );
    } catch (e) {
      continue;
    }
  }

  return moduleConfigs;
}

Map<dynamic, dynamic> loadConfigFile(File file) {
  var yaml = file.readAsStringSync();
  return loadYaml(yaml) as Map;
}

List<String> findAllMigrationVersionsSync({
  required Directory directory,
}) {
  try {
    var migrationRoot = MigrationConstants.migrationsBaseDirectory(directory);

    var migrationsDir = migrationRoot.listSync().whereType<Directory>();

    var migrationVersions =
        migrationsDir.map((dir) => path.split(dir.path).last).toList();

    migrationVersions.sort();
    return migrationVersions;
  } catch (e) {
    return [];
  }
}

/// This method assumes that server package names end with `_server`.
/// If the package name does not follow this convention, an exception is thrown.
///
/// Throws:
/// - [LocateModuleNameFromServerPackageNameException] if the package name
///   does not end with `_server`, indicating it is not a valid server package.
String moduleNameFromServerPackageName(String packageDirName) {
  var packageName = packageDirName.split('-').first;

  if (packageName == 'serverpod') {
    return 'serverpod';
  }
  if (!packageName.endsWith(_serverSuffix)) {
    throw LocateModuleNameFromServerPackageNameException(
      packageName: packageName,
    );
  }
  return packageName.substring(0, packageName.length - _serverSuffix.length);
}

/// Exception thrown when a module name cannot be determined from the server package name.
class LocateModuleNameFromServerPackageNameException implements Exception {
  /// The package name that doesn't have a suffix of '_server'.
  final String packageName;

  /// Creates a new [LocateModuleNameFromServerPackageNameException].
  LocateModuleNameFromServerPackageNameException({
    required this.packageName,
  });
}
