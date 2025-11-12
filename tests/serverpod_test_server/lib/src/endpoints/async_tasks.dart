import 'dart:async';

import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class AsyncTasksEndpoint extends Endpoint {
  Future<void> insertRowToSimpleDataAfterDelay(
    final Session session,
    final int num,
    final int seconds,
  ) async {
    // No await, method will return immediately and execute task
    unawaited(_insertRowToSimpleDataAfterDelay(session, num, seconds));
  }

  Future<void> _insertRowToSimpleDataAfterDelay(
    final Session session,
    final int num,
    final int seconds,
  ) async {
    await Future.delayed(Duration(seconds: seconds));
    final data = SimpleData(
      num: num,
    );
    await SimpleData.db.insertRow(session, data);
  }

  Future<void> throwExceptionAfterDelay(final Session session, final int seconds) async {
    // No await, throw exception outside of this context
    unawaited(_throwExceptionAfterDelay(seconds));
  }

  Future<void> _throwExceptionAfterDelay(final int seconds) async {
    await Future.delayed(Duration(seconds: seconds));
    throw Exception('Test exception');
  }
}
