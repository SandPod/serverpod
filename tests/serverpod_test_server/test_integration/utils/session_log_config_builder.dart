import 'package:serverpod_shared/serverpod_shared.dart';

class SessionLogConfigBuilder {
  bool _persistentEnabled = true;
  bool _consoleEnabled = true;
  ConsoleLogFormat _consoleLogFormat = ConsoleLogFormat.text;

  SessionLogConfigBuilder();

  SessionLogConfig build() {
    return SessionLogConfig(
      persistentEnabled: _persistentEnabled,
      consoleEnabled: _consoleEnabled,
      consoleLogFormat: _consoleLogFormat,
    );
  }

  SessionLogConfigBuilder withPersistentEnabled(final bool persistentEnabled) {
    _persistentEnabled = persistentEnabled;
    return this;
  }

  SessionLogConfigBuilder withConsoleEnabled(final bool consoleEnabled) {
    _consoleEnabled = consoleEnabled;
    return this;
  }

  SessionLogConfigBuilder withConsoleLogFormat(
    final ConsoleLogFormat consoleLogFormat,
  ) {
    _consoleLogFormat = consoleLogFormat;
    return this;
  }
}
