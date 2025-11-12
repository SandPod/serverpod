import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

class FutureCallsEndpoint extends Endpoint {
  Future<void> makeFutureCall(final Session session, final SimpleData? data) async {
    await session.serverpod.futureCallWithDelay(
      'testCall',
      data,
      const Duration(seconds: 1),
    );
  }

  Future<void> makeFutureCallThatThrows(
    final Session session,
    final SimpleData? data,
  ) async {
    await session.serverpod.futureCallWithDelay(
      'testExceptionCall',
      data,
      const Duration(seconds: 1),
    );
  }
}
