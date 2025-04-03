import 'dart:io';

import 'package:package_config/package_config.dart';
import 'package:path/path.dart' as path;
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:serverpod_cli/src/util/locate_modules.dart';
import 'package:test/test.dart';

void main() {
  late Directory tempDir;
  late Directory mainProjectDir;

  setUp(() {
    tempDir = Directory.systemTemp.createTempSync();
    mainProjectDir = Directory(path.join(tempDir.path, 'main_project'))
      ..createSync();
  });

  tearDown(() {
    tempDir.deleteSync(recursive: true);
  });

  void createModule(String name, List<String> dependencies) {
    var moduleDir = Directory(path.join(tempDir.path, name))..createSync();
    File(path.join(moduleDir.path, 'pubspec.yaml')).writeAsStringSync('''
name: ${name}_server
dependencies:
${dependencies.map((dep) => '  ${dep}_server:').join('\n')}
''');
  }

  void createPackageConfig(List<String> modules) {
    var packages = modules.map((name) => '''
  - name: "${name}_server"
    rootUri: "../$name"
    packageUri: "lib/"
''').join('\n');

    File(path.join(mainProjectDir.path, '.dart_tool', 'package_config.json'))
      ..parent.createSync(recursive: true)
      ..writeAsStringSync('''
{
  "configVersion": 2,
  "packages": [
$packages
  ]
}
''');
  }

  PackageConfig loadPackageConfig() {
    return PackageConfig.parseString(File(
            path.join(mainProjectDir.path, '.dart_tool', 'package_config.json'))
        .readAsStringSync());
  }

  Pubspec createMainPubspec(List<String> dependencies) {
    var pubspecFile = File(path.join(mainProjectDir.path, 'pubspec.yaml'))
      ..writeAsStringSync('''
name: main_project
dependencies:
${dependencies.map((dep) => '  ${dep}_server:').join('\n')}
''');
    return Pubspec.parse(pubspecFile.readAsStringSync());
  }

  test('lists direct module dependencies', () {
    createModule('module1', []);
    createModule('module2', []);
    createPackageConfig(['module1', 'module2']);
    var pubspec = createMainPubspec(['module1', 'module2']);

    var dependencies = listModuleDependencies(
      projectPubspec: pubspec,
      packageConfig: loadPackageConfig(),
    );

    expect(dependencies, equals({'module1_server', 'module2_server'}));
  });

  test('lists transitive module dependencies', () {
    createModule('module1', ['module2']);
    createModule('module2', ['module3']);
    createModule('module3', []);
    createPackageConfig(['module1', 'module2', 'module3']);
    var pubspec = createMainPubspec(['module1']);

    var dependencies = listModuleDependencies(
      projectPubspec: pubspec,
      packageConfig: loadPackageConfig(),
    );

    expect(
      dependencies,
      equals({'module1_server', 'module2_server', 'module3_server'}),
    );
  });

  test('handles circular dependencies gracefully', () {
    createModule('module1', ['module2']);
    createModule('module2', ['module1']);
    createPackageConfig(['module1', 'module2']);
    var pubspec = createMainPubspec(['module1']);

    var dependencies = listModuleDependencies(
      projectPubspec: pubspec,
      packageConfig: loadPackageConfig(),
    );

    expect(dependencies, equals({'module1_server', 'module2_server'}));
  });

  test('handles missing pubspec files gracefully', () {
    createModule('module1', ['module2']);
    var module2Dir = Directory(path.join(tempDir.path, 'module2'))
      ..createSync();
    // Not creating pubspec.yaml for module2
    createPackageConfig(['module1', 'module2']);
    var pubspec = createMainPubspec(['module1']);

    var dependencies = listModuleDependencies(
      projectPubspec: pubspec,
      packageConfig: loadPackageConfig(),
    );

    expect(dependencies, equals({'module1_server', 'module2_server'}));
  });

  test('handles invalid pubspec files gracefully', () {
    createModule('module1', ['module2']);
    var module2Dir = Directory(path.join(tempDir.path, 'module2'))
      ..createSync();
    File(path.join(module2Dir.path, 'pubspec.yaml'))
        .writeAsStringSync('invalid: yaml: :');
    createPackageConfig(['module1', 'module2']);
    var pubspec = createMainPubspec(['module1']);

    var dependencies = listModuleDependencies(
      projectPubspec: pubspec,
      packageConfig: loadPackageConfig(),
    );

    expect(dependencies, equals({'module1_server', 'module2_server'}));
  });

  test('handles non-serverpod modules gracefully', () {
    createModule('module1', ['regular_package']);
    createModule('regular_package', []);
    createPackageConfig(['module1', 'regular_package']);
    var pubspec = createMainPubspec(['module1']);

    var dependencies = listModuleDependencies(
      projectPubspec: pubspec,
      packageConfig: loadPackageConfig(),
    );

    expect(dependencies, equals({'module1_server'}));
  });
}
