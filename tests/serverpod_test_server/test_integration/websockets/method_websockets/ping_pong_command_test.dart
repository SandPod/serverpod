import 'dart:async';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/test_util/config.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';
import 'package:web_socket/web_socket.dart';
import '../websocket_extensions.dart';

void main() {
  group('Given method websocket connection', () {
    late Serverpod server;
    late WebSocket webSocket;

    setUp(() async {
      server = IntegrationTestServer.create();
      await server.start();
      webSocket = await WebSocket.connect(
        Uri.parse(serverMethodWebsocketUrl),
      );
    });

    tearDown(() async {
      await server.shutdown(exitProcess: false);
      await webSocket.tryClose();
    });

    test('when ping command is sent then pong response is received.', () async {
      webSocket.sendText(PingCommand.buildMessage());

      final response = await webSocket.textEvents.first;
      final message = WebSocketMessage.fromJsonString(
        response,
        server.serializationManager,
      );

      expect(message, isA<PongCommand>());
    });

    test('when pong command is sent then no response is received.', () async {
      webSocket.sendText(PongCommand.buildMessage());

      expectLater(
        webSocket.textEvents.first.timeout(const Duration(seconds: 1)),
        throwsA(isA<TimeoutException>()),
      );
    });
  });
}
