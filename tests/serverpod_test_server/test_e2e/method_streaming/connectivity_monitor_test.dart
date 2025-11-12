import 'dart:async';

import 'package:serverpod_test_client/serverpod_test_client.dart';
import 'package:serverpod_test_server/test_util/config.dart';
import 'package:serverpod_test_server/test_util/test_key_manager.dart';
import 'package:test/test.dart';

class TestConnectivityMonitor extends ConnectivityMonitor {
  void notifyConnectionLost() {
    notifyListeners(false);
  }
}

void main() {
  group(
    'Given client that disconnects on lost internet connection with an open streaming method connection',
    () {
      final testConnectivityMonitor = TestConnectivityMonitor();
      final client = Client(
        serverUrl,
        authenticationKeyManager: TestAuthKeyManager(),
        disconnectStreamsOnLostInternetConnection: true,
      );

      client.connectivityMonitor = testConnectivityMonitor;
      test(
        'when connectivity monitor reports connection is lost then stream is closed with exception.',
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

          testConnectivityMonitor.notifyConnectionLost();

          await expectLater(streamErrorCompleter.future, completes);
          final error = await streamErrorCompleter.future;
          expect(error, isA<WebSocketClosedException>());
        },
      );
    },
  );

  group(
    'Given client that does not disconnects on lost internet connection with an open streaming method connection',
    () {
      final testConnectivityMonitor = TestConnectivityMonitor();
      final client = Client(
        serverUrl,
        authenticationKeyManager: TestAuthKeyManager(),
        disconnectStreamsOnLostInternetConnection: false,
      );
      client.connectivityMonitor = testConnectivityMonitor;

      tearDown(() => client.closeStreamingMethodConnections(exception: null));

      test(
        'when connectivity monitor reports connection is lost then stream can still be used.',
        () async {
          var messageReceived = Completer();
          final inputStream = StreamController<int>();
          final stream = client.methodStreaming.intEchoStream(inputStream.stream);

          stream.listen((final event) {
            messageReceived.complete();
          });
          inputStream.sink.add(42);
          await messageReceived.future;

          testConnectivityMonitor.notifyConnectionLost();

          messageReceived = Completer();
          inputStream.sink.add(42);
          expectLater(messageReceived.future, completes);
        },
      );
    },
  );
}
