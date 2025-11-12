import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

class LoggingEndpoint extends Endpoint {
  Future<void> slowQueryMethod(final Session session, final int seconds) async {
    try {
      await session.db.unsafeQuery('SELECT pg_sleep($seconds);');
    } catch (e) {}
  }

  Future<void> queryMethod(final Session session, final int queries) async {
    try {
      for (var i = 0; i < queries; i++) {
        await Types.db.findFirstRow(session);
      }
    } catch (e) {}
  }

  Future<void> failedQueryMethod(final Session session) async {
    try {
      await session.db.unsafeQuery('SELECT * FROM table_does_not_exist;');
    } catch (e) {}
  }

  Future<void> slowMethod(final Session session, final int delayMillis) async {
    await Future.delayed(Duration(milliseconds: delayMillis));
  }

  Future<void> failingMethod(final Session session) async {
    throw Exception('This is an exception');
  }

  Future<void> emptyMethod(final Session session) async {
    // do nothing
  }

  Future<void> log(final Session session, final String message, final List<int> logLevels) async {
    final levels = logLevels.map((final level) => LogLevel.values[level]);

    for (final logLevel in levels) {
      session.log(message, level: logLevel);
    }
  }

  Future<void> logInfo(final Session session, final String message) async {
    session.log(message);
  }

  Future<void> logDebugAndInfoAndError(
    final Session session,
    final String debug,
    final String info,
    final String error,
  ) async {
    session.log(debug, level: LogLevel.debug);
    session.log(info);
    session.log(error, level: LogLevel.error);
  }

  Future<void> twoQueries(final Session session) async {
    var data = SimpleData(num: 42);
    await SimpleData.db.insertRow(session, data);
    data = (await SimpleData.db.findFirstRow(session))!;
  }

  Stream<int> streamEmpty(final Session session, final Stream<int> input) async* {
    await for (final value in input) {
      yield value;
    }
  }

  Stream<int> streamLogging(final Session session, final Stream<int> input) async* {
    await for (final value in input) {
      session.log('Received value: $value', level: LogLevel.debug);

      yield value;
    }
  }

  Stream<int> streamQueryLogging(final Session session, final Stream<int> input) async* {
    await for (final value in input) {
      await SimpleData.db.findFirstRow(session);
      yield value;
    }
  }

  Stream<int> streamException(final Session session) async* {
    throw Exception('This is an exception');
  }

  @override
  Future<void> handleStreamMessage(
    final StreamingSession session,
    final SerializableModel message,
  ) async {
    // do nothing
  }
}

class StreamLogging extends Endpoint {
  @override
  Future<void> handleStreamMessage(
    final StreamingSession session,
    final SerializableModel message,
  ) async {
    session.log('This is a message', level: LogLevel.debug);
  }
}

class StreamQueryLogging extends Endpoint {
  @override
  Future<void> handleStreamMessage(
    final StreamingSession session,
    final SerializableModel message,
  ) async {
    await SimpleData.db.findFirstRow(session);
  }
}
