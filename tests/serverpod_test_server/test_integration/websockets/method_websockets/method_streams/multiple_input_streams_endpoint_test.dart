import 'dart:async';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/test_util/config.dart';
import 'package:serverpod_test_server/test_util/test_completer_timeout.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';
import 'package:web_socket/web_socket.dart';

import '../../websocket_extensions.dart';

void main() {
  group(
    'Given a method stream connection to an endpoint that echoes multiple input streams',
    () {
      const endpoint = 'methodStreaming';
      const method = 'multipleIntEchoStreams';

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

      group('when values are passed to both streams', () {
        late Completer<void> allResponsesReceived;
        late List<int> endpointResponses;
        final TestCompleterTimeout testCompleterTimeout = TestCompleterTimeout();
        final inputValuesStream1 = [1, 2, 3, 4];
        final inputValuesStream2 = [1, 2, 3, 4];

        const inputStreamParameter1 = 'stream1';
        const inputStreamParameter2 = 'stream2';
        final connectionId = const Uuid().v4obj();

        setUp(() async {
          allResponsesReceived = Completer<void>();
          endpointResponses = [];
          final streamOpened = Completer<void>();

          testCompleterTimeout.start({
            'endpointResponse': allResponsesReceived,
            'streamOpened': streamOpened,
          });

          var responsesReceived = 0;
          webSocket.textEvents.listen((final event) {
            final message = WebSocketMessage.fromJsonString(
              event,
              server.serializationManager,
            );
            if (message is OpenMethodStreamResponse) {
              streamOpened.complete();
            } else if (message is MethodStreamMessage) {
              endpointResponses.add(message.object as int);

              if (++responsesReceived ==
                  inputValuesStream1.length + inputValuesStream2.length) {
                allResponsesReceived.complete();
              }
            }
          });

          webSocket.sendText(
            OpenMethodStreamCommand.buildMessage(
              endpoint: endpoint,
              method: method,
              args: {},
              connectionId: connectionId,
              inputStreams: [inputStreamParameter1, inputStreamParameter2],
            ),
          );

          await streamOpened.future;
          assert(
            streamOpened.isCompleted == true,
            'Failed to open method stream with server',
          );

          for (final value in inputValuesStream1) {
            webSocket.sendText(
              MethodStreamMessage.buildMessage(
                endpoint: endpoint,
                method: method,
                parameter: inputStreamParameter1,
                connectionId: connectionId,
                object: value,
                serializationManager: server.serializationManager,
              ),
            );
          }

          for (final value in inputValuesStream2) {
            webSocket.sendText(
              MethodStreamMessage.buildMessage(
                endpoint: endpoint,
                method: method,
                parameter: inputStreamParameter2,
                connectionId: connectionId,
                object: value,
                serializationManager: server.serializationManager,
              ),
            );
          }
        });

        tearDown(() => testCompleterTimeout.cancel());

        test(
          'then received values are the combination of both streams.',
          () async {
            allResponsesReceived.future
                .catchError((final error) {
                  fail('Failed to all expected responses from the server.');
                })
                .then(
                  (final value) => {
                    expect(
                      endpointResponses,
                      containsAll([
                        ...inputValuesStream1,
                        ...inputValuesStream2,
                      ]),
                    ),
                  },
                );

            await expectLater(
              allResponsesReceived.future,
              completes,
              reason: 'Invalid return value from endpoint.',
            );
          },
        );
      });

      group('when one stream parameter is closed', () {
        late Completer<int> endpointResponse;
        final TestCompleterTimeout testCompleterTimeout = TestCompleterTimeout();
        const inputValue = 2;

        const closedStreamParameter = 'stream1';
        const openStreamParameter = 'stream2';
        final connectionId = const Uuid().v4obj();

        setUp(() async {
          endpointResponse = Completer<int>();
          final streamOpened = Completer<void>();

          testCompleterTimeout.start({
            'endpointResponse': endpointResponse,
            'streamOpened': streamOpened,
          });

          webSocket.textEvents.listen((final event) {
            final message = WebSocketMessage.fromJsonString(
              event,
              server.serializationManager,
            );
            if (message is OpenMethodStreamResponse) {
              streamOpened.complete();
            } else if (message is MethodStreamMessage) {
              endpointResponse.complete(message.object as int);
            }
          });

          webSocket.sendText(
            OpenMethodStreamCommand.buildMessage(
              endpoint: endpoint,
              method: method,
              args: {},
              connectionId: connectionId,
              inputStreams: [closedStreamParameter, openStreamParameter],
            ),
          );

          await streamOpened.future;
          assert(
            streamOpened.isCompleted == true,
            'Failed to open method stream with server',
          );

          webSocket.sendText(
            CloseMethodStreamCommand.buildMessage(
              endpoint: endpoint,
              method: method,
              parameter: closedStreamParameter,
              connectionId: connectionId,
              reason: CloseReason.done,
            ),
          );
        });

        tearDown(() => testCompleterTimeout.cancel());

        test('then values are still echoed on other parameter.', () async {
          endpointResponse.future.catchError((final error) {
            fail('Failed to receive response from server.');
          });

          webSocket.sendText(
            MethodStreamMessage.buildMessage(
              endpoint: endpoint,
              method: method,
              parameter: openStreamParameter,
              connectionId: connectionId,
              object: inputValue,
              serializationManager: server.serializationManager,
            ),
          );

          await expectLater(
            endpointResponse.future,
            completion(inputValue),
            reason: 'Invalid return value from endpoint.',
          );
        });
      });

      group('when both streams are closed', () {
        late Completer<CloseMethodStreamCommand> closeMethodStreamCommand;
        final TestCompleterTimeout testCompleterTimeout = TestCompleterTimeout();

        const inputStreamParameter1 = 'stream1';
        const inputStreamParameter2 = 'stream2';
        final connectionId = const Uuid().v4obj();

        setUp(() async {
          closeMethodStreamCommand = Completer<CloseMethodStreamCommand>();
          Completer<CloseMethodStreamCommand>();
          final streamOpened = Completer<void>();

          testCompleterTimeout.start({
            'closeMethodStreamCommand': closeMethodStreamCommand,
            'streamOpened': streamOpened,
          });

          webSocket.textEvents.listen((final event) {
            final message = WebSocketMessage.fromJsonString(
              event,
              server.serializationManager,
            );
            if (message is OpenMethodStreamResponse) {
              streamOpened.complete();
            } else if (message is CloseMethodStreamCommand) {
              closeMethodStreamCommand.complete(message);
            }
          });

          webSocket.sendText(
            OpenMethodStreamCommand.buildMessage(
              endpoint: endpoint,
              method: method,
              args: {},
              connectionId: connectionId,
              inputStreams: [inputStreamParameter1, inputStreamParameter2],
            ),
          );

          await streamOpened.future;
          assert(
            streamOpened.isCompleted == true,
            'Failed to open method stream with server',
          );

          webSocket.sendText(
            CloseMethodStreamCommand.buildMessage(
              endpoint: endpoint,
              method: method,
              parameter: inputStreamParameter1,
              connectionId: connectionId,
              reason: CloseReason.done,
            ),
          );

          webSocket.sendText(
            CloseMethodStreamCommand.buildMessage(
              endpoint: endpoint,
              method: method,
              parameter: inputStreamParameter2,
              connectionId: connectionId,
              reason: CloseReason.done,
            ),
          );
        });

        tearDown(() => testCompleterTimeout.cancel());

        test(
          'then CloseMethodStreamCommand matching the endpoint is received.',
          () async {
            closeMethodStreamCommand.future
                .catchError((final error) {
                  fail(
                    'Failed to receive CloseMethodStreamCommand from server.',
                  );
                })
                .then((final message) {
                  expect(message.endpoint, endpoint);
                  expect(message.method, method);
                  expect(message.connectionId, connectionId);
                  expect(message.reason, CloseReason.done);
                });

            await expectLater(closeMethodStreamCommand.future, completes);
          },
        );
      });
    },
  );
}
