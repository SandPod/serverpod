import 'package:serverpod/protocol.dart';
import 'package:serverpod_test_server/test_util/builders/log_settings_builder.dart';

class RuntimeSettingsBuilder {
  LogSettings _logSettings = LogSettingsBuilder().build();

  final List<LogSettingsOverride> _logSettingsOverrides = [];

  bool _logServiceCalls = true;

  bool _logMalformedCalls = true;

  RuntimeSettingsBuilder withLogSettings(final LogSettings logSettings) {
    _logSettings = logSettings;
    return this;
  }

  RuntimeSettingsBuilder withLogSettingsOverride({
    final String? module,
    final String? endpoint,
    final String? method,
    required final LogSettings logSettings,
  }) {
    _logSettingsOverrides.add(
      LogSettingsOverride(
        module: module,
        endpoint: endpoint,
        method: method,
        logSettings: logSettings,
      ),
    );
    return this;
  }

  RuntimeSettingsBuilder withLogSettingsOverrides(
    final List<LogSettingsOverride> logSettingsOverrides,
  ) {
    _logSettingsOverrides.addAll(logSettingsOverrides);
    return this;
  }

  RuntimeSettingsBuilder withLogServiceCalls(final bool logServiceCalls) {
    _logServiceCalls = logServiceCalls;
    return this;
  }

  RuntimeSettingsBuilder withLogMalformedCalls(final bool logMalformedCalls) {
    _logMalformedCalls = logMalformedCalls;
    return this;
  }

  RuntimeSettings build() {
    return RuntimeSettings(
      logSettings: _logSettings,
      logSettingsOverrides: _logSettingsOverrides,
      logServiceCalls: _logServiceCalls,
      logMalformedCalls: _logMalformedCalls,
    );
  }
}
