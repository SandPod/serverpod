import 'package:pub_semver/pub_semver.dart';

class PubspecDependency {
  final Version version;
  final String name;

  PubspecDependency({required this.version, required this.name});
}

class PubspecDependencyBuilder {
  String _name = 'dependency_name';
  Version _version = Version.parse('1.0.0');

  PubspecDependencyBuilder withName(String name) {
    _name = name;
    return this;
  }

  PubspecDependencyBuilder withVersion(Version version) {
    _version = version;
    return this;
  }

  PubspecDependency build() {
    return PubspecDependency(
      name: _name,
      version: _version,
    );
  }
}

class PubspecBuilder {
  String _name = 'package_name';
  String _version = '1.0.0';
  String _description = 'A sample package';
  Version _sdk = Version.parse('3.6.0');

  List<PubspecDependency> _dependencies = [];
  List<PubspecDependency> _devDependencies = [];

  PubspecBuilder withName(String name) {
    _name = name;
    return this;
  }

  PubspecBuilder withVersion(String version) {
    _version = version;
    return this;
  }

  PubspecBuilder withDescription(String description) {
    _description = description;
    return this;
  }

  PubspecBuilder withSdk(Version sdk) {
    _sdk = sdk;
    return this;
  }

  PubspecBuilder addDependency(PubspecDependency dependency) {
    _dependencies.add(dependency);
    return this;
  }

  PubspecBuilder withDependencies(List<PubspecDependency> dependencies) {
    _dependencies = dependencies;
    return this;
  }

  PubspecBuilder addDevDependency(PubspecDependency dependency) {
    _devDependencies.add(dependency);
    return this;
  }

  PubspecBuilder withDevDependencies(List<PubspecDependency> devDependencies) {
    _devDependencies = devDependencies;
    return this;
  }

  String buildString() {
    return '''
name: $_name
version: $_version
description: $_description

environment:
  sdk: '$_sdk'

dependencies:
${_listDependencies(_dependencies)}

dev_dependencies:
${_listDependencies(_devDependencies)}
 ''';
  }

  String _listDependencies(List<PubspecDependency> dependencies) {
    return dependencies
        .map((dep) => '  ${dep.name}: ${dep.version}')
        .join('\n');
  }
}
