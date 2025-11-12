import 'dart:async';

import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

int globalInt = 0;

class StreamingEndpoint extends Endpoint {
  bool streamOpenedWasCalled = false;
  bool streamClosedWasCalled = false;

  @override
  Future<void> streamOpened(final StreamingSession session) async {
    streamOpenedWasCalled = true;
  }

  Future<bool> wasStreamOpenCalled(final Session session) async {
    return streamOpenedWasCalled;
  }

  @override
  Future<void> streamClosed(final StreamingSession session) async {
    streamClosedWasCalled = true;
  }

  Future<bool> wasStreamClosedCalled(final Session session) async {
    return streamClosedWasCalled;
  }

  @override
  Future<void> handleStreamMessage(
    final StreamingSession session,
    final SerializableModel message,
  ) async {
    if (message is! ModuleClass) {
      return;
    }

    unawaited(
      Future.delayed(const Duration(seconds: 1)).then((final value) async {
        // ignore: deprecated_member_use
        await sendStreamMessage(session, message);
      }),
    );
  }

  Stream<int> intEchoStream(final Session session, final Stream<int> stream) async* {
    await for (final value in stream) {
      yield value;
    }
  }

  Future<int> simpleInputReturnStream(
    final Session session,
    final Stream<int> stream,
  ) async {
    return stream.first;
  }
}
