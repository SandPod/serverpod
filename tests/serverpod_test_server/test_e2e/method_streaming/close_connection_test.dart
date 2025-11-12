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

  tearDown(
    () async => await client.closeStreamingMethodConnections(exception: null),
  );

  test(
    'Given open streaming method connection when close method streams is called then connection is closed with exception.',
    () async {
      final messageReceived = Completer();
      final streamErrorCompleter = Completer<Object>();
      final inputStream = StreamController<int>();
      final stream = client.methodStreaming.intEchoStream(inputStream.stream);

      stream.listen(
        (final event) {
          messageReceived.complete();
        },
        onError: (final e, final s) {
          streamErrorCompleter.complete(e);
        },
      );
      inputStream.sink.add(42);
      await messageReceived.future;

      await client.closeStreamingMethodConnections();
      await expectLater(streamErrorCompleter.future, completes);
      final error = await streamErrorCompleter.future;
      expect(error, isA<WebSocketClosedException>());
    },
  );

  test(
    'Given a streaming connection that was closed when establishing a new streaming connection then messages can be successfully transmitted.',
    () async {
      {
        final firstConnectionEstablished = Completer();
        final firstInputStream = StreamController<int>();
        final firstStream = client.methodStreaming.intEchoStream(
          firstInputStream.stream,
        );

        firstStream.listen((final event) {
          firstConnectionEstablished.complete();
        });
        firstInputStream.sink.add(42);
        await expectLater(firstConnectionEstablished.future, completes);
        await client.closeStreamingMethodConnections(exception: null);
      }

      {
        final secondConnectionEstablished = Completer();
        final secondInputStream = StreamController<int>();
        final secondStream = client.methodStreaming.intEchoStream(
          secondInputStream.stream,
        );

        secondStream.listen((final event) {
          secondConnectionEstablished.complete();
        });
        secondInputStream.sink.add(42);
        await expectLater(secondConnectionEstablished.future, completes);
      }
    },
  );

  test(
    'Given an input stream that continuously sends data to the server when closing all method streams then the method stream is successfully closed.',
    () async {
      final stream = client.methodStreaming.intEchoStream(
        Stream.periodic(const Duration(microseconds: 1), (final i) => i),
      );

      final streamComplete = Completer();
      stream.listen(
        (final event) {
          if (event == 10) {
            client.closeStreamingMethodConnections(exception: null);
          }
        },
        onDone: () {
          streamComplete.complete();
        },
      );

      await expectLater(streamComplete.future, completes);
    },
  );
}
