import 'package:serverpod_shared/serverpod_shared.dart';

class DatabaseConfigBuilder {
  String _host = 'localhost';
  int _port = 8090;
  String _name = 'serverpod_test';
  String _user = 'postgres';
  String _password = 'password';
  bool _requireSsl = false;
  bool _isUnixSocket = false;
  List<String>? _searchPaths;

  DatabaseConfigBuilder();

  DatabaseConfig build() {
    return DatabaseConfig(
      host: _host,
      port: _port,
      name: _name,
      user: _user,
      password: _password,
      requireSsl: _requireSsl,
      isUnixSocket: _isUnixSocket,
      searchPaths: _searchPaths,
    );
  }

  DatabaseConfigBuilder withHost(final String host) {
    _host = host;
    return this;
  }

  DatabaseConfigBuilder withPort(final int port) {
    _port = port;
    return this;
  }

  DatabaseConfigBuilder withName(final String name) {
    _name = name;
    return this;
  }

  DatabaseConfigBuilder withUser(final String user) {
    _user = user;
    return this;
  }

  DatabaseConfigBuilder withPassword(final String password) {
    _password = password;
    return this;
  }

  DatabaseConfigBuilder withRequireSsl(final bool requireSsl) {
    _requireSsl = requireSsl;
    return this;
  }

  DatabaseConfigBuilder withIsUnixSocket(final bool isUnixSocket) {
    _isUnixSocket = isUnixSocket;
    return this;
  }

  DatabaseConfigBuilder withSearchPaths(final List<String>? searchPaths) {
    _searchPaths = searchPaths;
    return this;
  }
}
