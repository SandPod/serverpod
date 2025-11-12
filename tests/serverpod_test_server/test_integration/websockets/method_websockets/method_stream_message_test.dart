import 'dart:async';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/config.dart';
import 'package:serverpod_test_server/test_util/test_completer_timeout.dart';
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

    test(
      'when a MethodStreamMessage is sent to the server without an open stream then response is a CloseMethodStreamCommand with error reason.',
      () async {
        final closeMethodCommand = Completer<CloseMethodStreamCommand>();
        webSocket.textEvents.listen((final event) {
          final message = WebSocketMessage.fromJsonString(
            event,
            server.serializationManager,
          );
          if (message is CloseMethodStreamCommand) {
            closeMethodCommand.complete(message);
          }
        });

        webSocket.sendText(
          MethodStreamMessage.buildMessage(
            endpoint: 'methodStreaming',
            method: 'simpleStream',
            parameter: 'stream',
            connectionId: const Uuid().v4obj(),
            object: 1,
            serializationManager: server.serializationManager,
          ),
        );

        await expectLater(
          closeMethodCommand.future.timeout(const Duration(seconds: 5)),
          completes,
          reason: 'Failed to receive close method command message from server.',
        );

        final closeMethodStreamCommand = await closeMethodCommand.future;
        expect(closeMethodStreamCommand.reason, CloseReason.error);
      },
    );

    group(
      'when a stream is opened to an endpoint that returns a Future with a value',
      () {
        late Completer<MethodStreamMessage> endpointResponse;
        final TestCompleterTimeout testCompleterTimeout = TestCompleterTimeout();

        const endpoint = 'methodStreaming';
        const method = 'directOneIntReturnWithStreamInput';
        final connectionId = const Uuid().v4obj();

        setUp(() async {
          endpointResponse = Completer<MethodStreamMessage>();
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
              endpointResponse.complete(message);
            }
          });

          webSocket.sendText(
            OpenMethodStreamCommand.buildMessage(
              endpoint: endpoint,
              method: method,
              args: {},
              connectionId: connectionId,
              inputStreams: ['stream'],
            ),
          );

          await streamOpened.future;
          assert(
            streamOpened.isCompleted == true,
            'Failed to open method stream with server.',
          );
        });

        test(
          'then MethodStreamMessage matching endpoint return is received.',
          () async {
            endpointResponse.future
                .catchError((final error) {
                  fail('Failed to receive MethodStreamMessage from server.');
                })
                .then((final message) {
                  expect(message.endpoint, endpoint);
                  expect(message.method, method);
                  expect(message.connectionId, connectionId);

                  expect(
                    message.object,
                    1,
                    reason: 'Failed to receive expected value from endpoint.',
                  );
                });

            await expectLater(
              endpointResponse.future.timeout(const Duration(seconds: 5)),
              completes,
              reason: 'Failed to receive MethodStreamMessage from server.',
            );
          },
        );
      },
    );

    group(
      'when a stream is opened to an endpoint that returns a stream of numbers counting to the input value starting from 0',
      () {
        late List<int> endpointResponses;
        late Completer<CloseMethodStreamCommand> closeMethodStreamCommand;
        late Completer<void> webSocketCompleter;
        const inputValue = 4;

        const endpoint = 'methodStreaming';
        const method = 'intStreamFromValue';
        final connectionId = const Uuid().v4obj();

        setUp(() async {
          endpointResponses = [];
          closeMethodStreamCommand = Completer<CloseMethodStreamCommand>();
          webSocketCompleter = Completer<void>();
          final streamOpened = Completer<void>();

          webSocket.textEvents.listen(
            (final event) {
              final message = WebSocketMessage.fromJsonString(
                event,
                server.serializationManager,
              );
              if (message is OpenMethodStreamResponse) {
                streamOpened.complete();
              } else if (message is CloseMethodStreamCommand) {
                closeMethodStreamCommand.complete(message);
              } else if (message is MethodStreamMessage) {
                endpointResponses.add(message.object as int);
              }
            },
            onDone: () {
              webSocketCompleter.complete();
            },
          );

          webSocket.sendText(
            OpenMethodStreamCommand.buildMessage(
              endpoint: endpoint,
              method: method,
              args: {'value': inputValue},
              connectionId: connectionId,
              inputStreams: [],
            ),
          );

          await streamOpened.future.timeout(
            const Duration(seconds: 5),
            onTimeout: () => throw AssertionError(
              'Failed to open method stream with server.',
            ),
          );
        });

        test(
          'then once method stream is closed the received MethodStreamMessages matches input specification.',
          () async {
            await expectLater(
              closeMethodStreamCommand.future.timeout(const Duration(seconds: 5)),
              completes,
              reason: 'Failed to receive CloseMethodStreamCommand from server.',
            );

            expect(
              endpointResponses,
              List.generate(inputValue, (final index) => index),
              reason: 'Failed to receive all responses from endpoint.',
            );
          },
        );

        test(
          'then CloseMethodStreamCommand matching the endpoint is received.',
          () async {
            final message = closeMethodStreamCommand.future.timeout(
              const Duration(seconds: 5),
            );
            expect(
              message,
              completes,
              reason: 'Failed to receive CloseMethodStreamCommand from server.',
            );

            final closeMethodStreamCommandMessage = await message;
            expect(closeMethodStreamCommandMessage.endpoint, endpoint);
            expect(closeMethodStreamCommandMessage.method, method);
            expect(closeMethodStreamCommandMessage.connectionId, connectionId);
            expect(closeMethodStreamCommandMessage.reason, CloseReason.done);
          },
        );
      },
    );

    group(
      'when a stream is opened to an endpoint that returns a stream of SimpleData objects with numbers counting to the input value starting from 0',
      () {
        late List<SimpleData> endpointResponses;
        late Completer<CloseMethodStreamCommand> closeMethodStreamCommand;
        late Completer<void> webSocketCompleter;
        const inputValue = 4;

        const endpoint = 'methodStreaming';
        const method = 'simpleDataStream';
        final connectionId = const Uuid().v4obj();

        setUp(() async {
          endpointResponses = [];
          closeMethodStreamCommand = Completer<CloseMethodStreamCommand>();
          webSocketCompleter = Completer<void>();
          final streamOpened = Completer<void>();

          webSocket.textEvents.listen(
            (final event) {
              final message = WebSocketMessage.fromJsonString(
                event,
                server.serializationManager,
              );
              if (message is OpenMethodStreamResponse) {
                streamOpened.complete();
              } else if (message is CloseMethodStreamCommand) {
                closeMethodStreamCommand.complete(message);
              } else if (message is MethodStreamMessage) {
                endpointResponses.add(message.object as SimpleData);
              }
            },
            onDone: () {
              webSocketCompleter.complete();
            },
          );

          webSocket.sendText(
            OpenMethodStreamCommand.buildMessage(
              endpoint: endpoint,
              method: method,
              args: {'value': inputValue},
              connectionId: connectionId,
              inputStreams: [],
            ),
          );

          await streamOpened.future.timeout(
            const Duration(seconds: 5),
            onTimeout: () => throw AssertionError(
              'Failed to open method stream with server.',
            ),
          );
        });

        test(
          'then once method stream is closed the received MethodStreamMessages matches input specification.',
          () async {
            await expectLater(
              closeMethodStreamCommand.future.timeout(const Duration(seconds: 5)),
              completes,
              reason: 'Failed to receive CloseMethodStreamCommand from server.',
            );

            expect(
              endpointResponses.map((final simpleData) => simpleData.num).toList(),
              List.generate(inputValue, (final index) => index),
              reason: 'Failed to receive all responses from endpoint.',
            );
          },
        );

        test(
          'then CloseMethodStreamCommand matching the endpoint is received.',
          () async {
            final message = closeMethodStreamCommand.future.timeout(
              const Duration(seconds: 5),
            );
            expect(
              message,
              completes,
              reason: 'Failed to receive CloseMethodStreamCommand from server.',
            );

            final closeMethodStreamCommandMessage = await message;
            expect(closeMethodStreamCommandMessage.endpoint, endpoint);
            expect(closeMethodStreamCommandMessage.method, method);
            expect(closeMethodStreamCommandMessage.connectionId, connectionId);
            expect(closeMethodStreamCommandMessage.reason, CloseReason.done);
          },
        );
      },
    );

    group(
      'when multiple methods streams are open and one of them with Future response is closed',
      () {
        late Completer<void> returningStreamClosed;
        late Completer<void> webSocketCompleter;
        late Completer<void> delayedResponseClosed;
        const endpoint = 'methodStreaming';

        setUp(() async {
          final returningStreamOpen = Completer<void>();
          final delayedResponseOpen = Completer<void>();
          returningStreamClosed = Completer<void>();
          delayedResponseClosed = Completer<void>();
          webSocketCompleter = Completer<void>();
          final returningStreamConnectionId = const Uuid().v4obj();
          final delayedResponseConnectionId = const Uuid().v4obj();

          webSocket.textEvents.listen(
            (final event) {
              final message = WebSocketMessage.fromJsonString(
                event,
                server.serializationManager,
              );
              if (message is OpenMethodStreamResponse) {
                if (message.connectionId == returningStreamConnectionId) {
                  returningStreamOpen.complete();
                } else if (message.connectionId == delayedResponseConnectionId)
                  delayedResponseOpen.complete();
              } else if (message is CloseMethodStreamCommand) {
                if (message.connectionId == returningStreamConnectionId &&
                    message.parameter == null) {
                  returningStreamClosed.complete();
                }
                if (message.connectionId == delayedResponseConnectionId) {
                  delayedResponseClosed.complete();
                }
              }
            },
            onDone: () {
              webSocketCompleter.complete();
            },
          );

          webSocket.sendText(
            OpenMethodStreamCommand.buildMessage(
              endpoint: endpoint,
              method: 'delayedStreamResponse',
              args: {'delay': 10},
              connectionId: delayedResponseConnectionId,
              inputStreams: [],
            ),
          );

          webSocket.sendText(
            OpenMethodStreamCommand.buildMessage(
              endpoint: endpoint,
              method: 'directVoidReturnWithStreamInput',
              args: {},
              connectionId: returningStreamConnectionId,
              inputStreams: ['stream'],
            ),
          );

          await Future.wait([
            returningStreamOpen.future,
            delayedResponseOpen.future,
          ]).timeout(
            const Duration(seconds: 5),
            onTimeout: () => throw AssertionError(
              'Failed to open all method stream with server.',
            ),
          );
        });

        tearDown(() async {
          final tempSession = await server.createSession();

          /// Close any open delayed response streams.
          await (server.endpoints
                      .getConnectorByName(endpoint)
                      ?.methodConnectors['completeAllDelayedResponses']
                  as MethodConnector?)
              ?.call(tempSession, {});

          await tempSession.close();
        });

        test('then websocket connection stays open.', () async {
          await returningStreamClosed.future.timeout(const Duration(seconds: 5));

          // Monitor websocket connection for 1 second to make sure it stays open.
          expectLater(
            webSocketCompleter.future.timeout(const Duration(seconds: 1)),
            throwsA(isA<TimeoutException>()),
          );
        });
      },
    );

    group(
      'when multiple methods streams are open and one of them with Stream response is closed',
      () {
        late Completer<void> returningStreamClosed;
        late Completer<void> webSocketCompleter;
        late Completer<void> delayedResponseClosed;
        const endpoint = 'methodStreaming';

        setUp(() async {
          final returningStreamOpen = Completer<void>();
          final delayedResponseOpen = Completer<void>();
          returningStreamClosed = Completer<void>();
          delayedResponseClosed = Completer<void>();
          webSocketCompleter = Completer<void>();
          final returningStreamConnectionId = const Uuid().v4obj();
          final delayedResponseConnectionId = const Uuid().v4obj();

          webSocket.textEvents.listen(
            (final event) {
              final message = WebSocketMessage.fromJsonString(
                event,
                server.serializationManager,
              );
              if (message is OpenMethodStreamResponse) {
                if (message.connectionId == returningStreamConnectionId) {
                  returningStreamOpen.complete();
                } else if (message.connectionId == delayedResponseConnectionId)
                  delayedResponseOpen.complete();
              } else if (message is CloseMethodStreamCommand) {
                if (message.connectionId == returningStreamConnectionId) {
                  returningStreamClosed.complete();
                }
                if (message.connectionId == delayedResponseConnectionId) {
                  delayedResponseClosed.complete();
                }
              }
            },
            onDone: () {
              webSocketCompleter.complete();
            },
          );

          webSocket.sendText(
            OpenMethodStreamCommand.buildMessage(
              endpoint: endpoint,
              method: 'delayedStreamResponse',
              args: {'delay': 10},
              connectionId: delayedResponseConnectionId,
              inputStreams: [],
            ),
          );

          webSocket.sendText(
            OpenMethodStreamCommand.buildMessage(
              endpoint: endpoint,
              method: 'simpleStream',
              args: {},
              connectionId: returningStreamConnectionId,
              inputStreams: [],
            ),
          );

          await Future.wait([
            returningStreamOpen.future,
            delayedResponseOpen.future,
          ]).timeout(
            const Duration(seconds: 5),
            onTimeout: () => throw AssertionError(
              'Failed to open method stream with server.',
            ),
          );
        });

        tearDown(() async {
          final tempSession = await server.createSession();

          /// Close any open delayed response streams.
          await (server.endpoints
                      .getConnectorByName(endpoint)
                      ?.methodConnectors['completeAllDelayedResponses']
                  as MethodConnector?)
              ?.call(tempSession, {});

          await tempSession.close();
        });

        test('then websocket connection stays open.', () async {
          await returningStreamClosed.future.timeout(const Duration(seconds: 5));

          // Monitor websocket connection for 1 second to make sure it stays open.
          expectLater(
            webSocketCompleter.future.timeout(const Duration(seconds: 1)),
            throwsA(isA<TimeoutException>()),
          );
        });
      },
    );
  });

  group(
    'Given method stream connection to an endpoint with a stream return',
    () {
      const endpoint = 'methodStreaming';
      const method = 'intEchoStream';

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

      group(
        'when MethodStreamMessage is passed targeting the endpoint method',
        () {
          late Completer<BadRequestMessage> badRequestMessage;
          late Completer<void> webSocketCompleter;
          final TestCompleterTimeout testCompleterTimeout = TestCompleterTimeout();

          final connectionId = const Uuid().v4obj();

          setUp(() async {
            badRequestMessage = Completer<BadRequestMessage>();
            webSocketCompleter = Completer<void>();
            final streamOpened = Completer<void>();

            testCompleterTimeout.start({
              'badRequestMessage': badRequestMessage,
              'webSocketCompleter': webSocketCompleter,
              'streamOpened': streamOpened,
            });

            webSocket.textEvents.listen(
              (final event) {
                final message = WebSocketMessage.fromJsonString(
                  event,
                  server.serializationManager,
                );
                if (message is OpenMethodStreamResponse) {
                  streamOpened.complete();
                } else if (message is BadRequestMessage) {
                  badRequestMessage.complete(message);
                }
              },
              onDone: () {
                webSocketCompleter.complete();
              },
            );

            webSocket.sendText(
              OpenMethodStreamCommand.buildMessage(
                endpoint: endpoint,
                method: method,
                args: {},
                connectionId: connectionId,
                inputStreams: ['stream'],
              ),
            );

            await streamOpened.future;
            assert(
              streamOpened.isCompleted == true,
              'Failed to open method stream with server',
            );

            webSocket.sendText(
              MethodStreamMessage.buildMessage(
                endpoint: endpoint,
                method: method,
                connectionId: connectionId,
                object: 1,
                serializationManager: server.serializationManager,
              ),
            );
          });

          tearDown(() => testCompleterTimeout.cancel());

          test('then bad request is received.', () async {
            badRequestMessage.future.catchError((final error) {
              fail('Failed to receive bad request message from server.');
            });

            await expectLater(badRequestMessage.future, completes);
          });

          test('then websocket connection is closed.', () async {
            webSocketCompleter.future.catchError((final error) {
              fail('Failed to close websocket.');
            });

            await expectLater(webSocketCompleter.future, completes);
          });
        },
      );
    },
  );
}
