import 'package:serverpod_shared/serverpod_shared.dart';

class RedisConfigBuilder {
  bool _enabled = false;
  String _host = 'localhost';
  int _port = 8091;
  String? _user;
  String? _password = 'password';
  bool _requireSsl = false;

  RedisConfigBuilder();

  RedisConfig build() {
    return RedisConfig(
      enabled: _enabled,
      host: _host,
      port: _port,
      user: _user,
      password: _password,
      requireSsl: _requireSsl,
    );
  }

  RedisConfigBuilder withEnabled(final bool enabled) {
    _enabled = enabled;
    return this;
  }

  RedisConfigBuilder withHost(final String host) {
    _host = host;
    return this;
  }

  RedisConfigBuilder withPort(final int port) {
    _port = port;
    return this;
  }

  RedisConfigBuilder withUser(final String? user) {
    _user = user;
    return this;
  }

  RedisConfigBuilder withPassword(final String? password) {
    _password = password;
    return this;
  }

  RedisConfigBuilder withRequireSsl(final bool requireSsl) {
    _requireSsl = requireSsl;
    return this;
  }
}
