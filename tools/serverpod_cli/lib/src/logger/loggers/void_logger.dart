import 'package:serverpod_cli/src/analyzer/code_analysis_collector.dart';
import 'package:serverpod_cli/src/logger/logger.dart';

/// Logger that logs no output.
///
/// Intended to be used for testing to silence any printed output.
class VoidLogger extends Logger {
  VoidLogger() : super(LogLevel.debug);

  @override
  int? get wrapTextColumn => null;

  @override
  void debug(String message, {LogStyle style = const LogStyle()}) {}

  @override
  void info(String message, {LogStyle style = const LogStyle()}) {}

  @override
  void warning(String message, {LogStyle style = const LogStyle()}) {}

  @override
  void error(String message,
      {StackTrace? stackTrace, LogStyle style = const LogStyle()}) {}

  @override
  void sourceSpanSeverityException(
      SourceSpanSeverityException sourceSpan, LogLevel logLevel) {}

  @override
  Future<void> flush() {
    return Future(() => {});
  }
}
