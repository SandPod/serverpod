// Add tests for when passing an input parameter to the stream.
import 'dart:async';

import 'package:serverpod_test_client/serverpod_test_client.dart';
import 'package:serverpod_test_server/test_util/config.dart';
import 'package:serverpod_test_server/test_util/test_key_manager.dart';
import 'package:test/test.dart';

void main() {
  final client = Client(
    serverUrl,
    authenticationKeyManager: TestAuthKeyManager(),
  );

  test(
    'Given multiple streaming method connections when one is finished then the open method stream can still transmit messages.',
    () async {
      final keepAliveStreamComplete = Completer();
      final closeStreamComplete = Completer();
      final keepAliveInputStream = StreamController<int>();
      final keepAliveStream = client.methodStreaming.intEchoStream(
        keepAliveInputStream.stream,
      );
      final closeStreamInputStream = StreamController<int>();
      final closeStream = client.methodStreaming.intEchoStream(
        closeStreamInputStream.stream,
      );

      closeStream.listen(
        (final event) {
          // Do nothing
        },
        onDone: () {
          closeStreamComplete.complete();
        },
      );

      final received = <int>[];
      keepAliveStream.listen(
        (final event) {
          received.add(event);
        },
        onDone: () {
          keepAliveStreamComplete.complete();
        },
      );

      await closeStreamInputStream.close();
      await expectLater(closeStreamComplete.future, completes);

      keepAliveInputStream.add(42);
      await keepAliveInputStream.close();
      await expectLater(keepAliveStreamComplete.future, completes);

      expect(received, [42]);
    },
  );
}
