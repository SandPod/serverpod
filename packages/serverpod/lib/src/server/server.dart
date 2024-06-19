import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:serverpod/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod/src/database/database.dart';
import 'package:serverpod/src/database/database_pool_manager.dart';
import 'package:serverpod/src/server/health_check.dart';

import '../cache/caches.dart';

/// Handling incoming calls and routing them to the correct [Endpoint]
/// methods.
class Server {
  /// The [Serverpod] managing the server.
  final Serverpod serverpod;

  /// The id of the server. If running in a cluster, all servers need unique
  /// ids.
  final String serverId;

  /// Port the server is listening on.
  final int port;

  /// The [ServerpodRunMode] the server is running in.
  final String runMode;

  /// Current database configuration.
  final DatabasePoolManager? _databasePoolManager;

  /// Creates a new [Database] object with a connection to the configured
  /// database.
  Database createDatabase(Session session) {
    var databasePoolManager = _databasePoolManager;
    if (databasePoolManager == null) {
      throw ArgumentError('Database config not set');
    }

    return Database(session: session, poolManager: databasePoolManager);
  }

  /// The [SerializationManager] used by the server.
  final SerializationManager serializationManager;

  /// [AuthenticationHandler] responsible for authenticating users.
  final AuthenticationHandler? authenticationHandler;

  /// Caches used by the server.
  final Caches caches;

  /// The name of the server.
  final String name;

  /// Security context if the server is running over https.
  final SecurityContext? securityContext;

  /// Responsible for dispatching calls to the correct [Endpoint] methods.
  final EndpointDispatch endpoints;

  bool _running = false;

  /// True if the server is currently running.
  bool get running => _running;

  late final HttpServer _httpServer;

  /// The [HttpServer] responsible for handling calls.
  HttpServer get httpServer => _httpServer;

  /// Currently not in use.
  List<String>? whitelistedExternalCalls;

  /// Map of passwords loaded from config/passwords.yaml
  Map<String, String> passwords;

  /// Central message dispatch for real time messages.
  MessageCentral messageCentral = MessageCentral();

  /// HTTP headers used by all API responses. Defaults to allowing any
  /// cross origin resource sharing (CORS).
  final Map<String, dynamic> httpResponseHeaders;

  /// HTTP headers used for OPTIONS responses. These headers are sent in
  /// addition to the [httpResponseHeaders] when the request method is OPTIONS.
  final Map<String, dynamic> httpOptionsResponseHeaders;

  /// Creates a new [Server] object.
  Server({
    required this.serverpod,
    required this.serverId,
    required this.port,
    required this.serializationManager,
    required DatabasePoolManager? databasePoolManager,
    required this.passwords,
    required this.runMode,
    this.authenticationHandler,
    String? name,
    required this.caches,
    this.securityContext,
    this.whitelistedExternalCalls,
    required this.endpoints,
    required this.httpResponseHeaders,
    required this.httpOptionsResponseHeaders,
  })  : name = name ?? 'Server $serverId',
        _databasePoolManager = databasePoolManager;

  /// Starts the server.
  /// Returns true if the server was started successfully.
  Future<bool> start() async {
    HttpServer httpServer;
    try {
      if (securityContext != null) {
        httpServer = await HttpServer.bindSecure(
          InternetAddress.anyIPv6,
          port,
          securityContext!,
        );
      } else {
        httpServer = await HttpServer.bind(InternetAddress.anyIPv6, port);
      }
    } catch (e) {
      stderr.writeln(
        '${DateTime.now().toUtc()} ERROR: Failed to bind socket, port $port '
        'may already be in use.',
      );
      stderr.writeln('${DateTime.now().toUtc()} ERROR: $e');
      return false;
    }

    try {
      _runServer(httpServer);
    } catch (e, stackTrace) {
      stderr.writeln(
          '${DateTime.now().toUtc()} Internal server error. Failed to run server.');
      stderr.writeln('$e');
      stderr.writeln('$stackTrace');
      return false;
    }

    _running = true;
    stdout.writeln('$name listening on port $port');
    return _running;
  }

  void _runServer(HttpServer httpServer) async {
    serverpod.logVerbose(
      'runServer address: ${httpServer.address}, port: ${httpServer.port}',
    );

    _httpServer = httpServer;
    httpServer.autoCompress = true;

    try {
      await for (var request in httpServer) {
        serverpod.logVerbose(
          'received request: ${request.method} ${request.uri.path}',
        );

        try {
          _handleRequest(request);
        } catch (e, stackTrace) {
          stderr.writeln(
            '${DateTime.now().toUtc()} Internal server error. _handleRequest failed.',
          );
          stderr.writeln('$e');
          stderr.writeln('$stackTrace');
        }
      }
    } catch (e, stackTrace) {
      stderr.writeln(
          '${DateTime.now().toUtc()} Internal server error. httpSever.listen failed.');
      stderr.writeln('$e');
      stderr.writeln('$stackTrace');
    }

    stdout.writeln('$name stopped');
  }

  //TODO: encode analyze
  void _handleRequest(HttpRequest request) async {
    serverpod
        .logVerbose('handleRequest: ${request.method} ${request.uri.path}');

    for (var header in httpResponseHeaders.entries) {
      request.response.headers.add(header.key, header.value);
    }

    Uri uri;

    try {
      uri = request.requestedUri;
    } catch (e) {
      if (serverpod.runtimeSettings.logMalformedCalls) {
        // TODO: Specific log for this?
        stderr.writeln(
            'Malformed call, invalid uri from ${request.connectionInfo!.remoteAddress.address}');
      }

      request.response.statusCode = HttpStatus.badRequest;
      await request.response.close();
      return;
    }

    var readBody = true;

    if (uri.path == '/') {
      // Perform health checks
      var checks = await performHealthChecks(serverpod);
      var issues = <String>[];
      var allOk = true;
      for (var metric in checks.metrics) {
        if (!metric.isHealthy) {
          allOk = false;
          issues.add('${metric.name}: ${metric.value}');
        }
      }

      if (allOk) {
        request.response.writeln('OK ${DateTime.now().toUtc()}');
      } else {
        request.response.writeln('SADNESS ${DateTime.now().toUtc()}');
      }
      for (var issue in issues) {
        request.response.writeln(issue);
      }

      await request.response.close();
      return;
    } else if (uri.path == '/websocket') {
      WebSocket webSocket;
      try {
        webSocket = await WebSocketTransformer.upgrade(request);
      } on WebSocketException {
        stderr.writeln('Failed to upgrade connection to websocket');
        return;
      }
      webSocket.pingInterval = const Duration(seconds: 30);
      unawaited(_handleWebsocket(webSocket, request));
      return;
    } else if (uri.path == '/serverpod_cloud_storage') {
      readBody = false;
    }

    // This OPTIONS check is necessary when making requests from
    // eg `editor.swagger.io`. It ensures proper handling of preflight requests
    // with the OPTIONS method.
    if (request.method == 'OPTIONS') {
      for (var header in httpOptionsResponseHeaders.entries) {
        request.response.headers.add(header.key, header.value);
      }

      // Safari and potentially other browsers require Content-Length=0.
      request.response.headers.add('Content-Length', 0);
      request.response.statusCode = HttpStatus.ok;
      await request.response.close();
      return;
    }

    // TODO: Limit check external calls
//    bool checkLength = true;
//    if (whitelistedExternalCalls != null && whitelistedExternalCalls.contains(uri.path))
//      checkLength = false;
//
//    if (checkLength) {
//      // Check size of the request
//      int contentLength = request.contentLength;
//      if (contentLength == -1 ||
//          contentLength > serverpod.config.maxRequestSize) {
//        if (serverpod.runtimeSettings.logMalformedCalls)
//          logDebug('Malformed call, invalid content length ($contentLength): $uri');
//        request.response.statusCode = HttpStatus.badRequest;
//        request.response.close();
//        return;
//      }
//    }

    String? body;
    if (readBody) {
      try {
        body = await _readBody(request);
      } catch (e, stackTrace) {
        stderr.writeln(
            '${DateTime.now().toUtc()} Internal server error. Failed to read body of request.');
        stderr.writeln('$e');
        stderr.writeln('$stackTrace');
        request.response.statusCode = HttpStatus.badRequest;
        await request.response.close();
        return;
      }
    } else {
      body = '';
    }

    var result = await _handleUriCall(uri, body!, request);

    if (result is ResultInvalidParams) {
      if (serverpod.runtimeSettings.logMalformedCalls) {
        // TODO: Log to database?
        stderr.writeln('Malformed call: $result');
      }

      request.response.statusCode = HttpStatus.badRequest;
      await request.response.close();
      return;
    } else if (result is ResultAuthenticationFailed) {
      if (serverpod.runtimeSettings.logMalformedCalls) {
        // TODO: Log to database?
        stderr.writeln('Access denied: $result');
      }

      request.response.statusCode = switch (result.reason) {
        AuthenticationFailureReason.unauthenticated => HttpStatus.unauthorized,
        AuthenticationFailureReason.insufficientAccess => HttpStatus.forbidden,
      };
      await request.response.close();
      return;
    } else if (result is ResultInternalServerError) {
      request.response.statusCode = HttpStatus.internalServerError;
      request.response.writeln(
          'Internal server error. Call log id: ${result.sessionLogId}');
      await request.response.close();
      return;
    } else if (result is ResultStatusCode) {
      request.response.statusCode = result.statusCode;
      await request.response.close();
      return;
    } else if (result is ExceptionResult) {
      request.response.headers.contentType = ContentType.json;
      request.response.statusCode = HttpStatus.internalServerError;

      var serializedModel = serializationManager.encodeWithType(result.model);
      request.response.write(serializedModel);
      await request.response.close();
    } else if (result is ResultSuccess) {
      // Set content type.
      if (!result.sendByteDataAsRaw) {
        request.response.headers.contentType =
            ContentType('application', 'json', charset: 'utf-8');
      }

      // Send the response
      if (result.sendByteDataAsRaw && result.returnValue is ByteData?) {
        var byteData = result.returnValue as ByteData?;
        if (byteData != null) {
          request.response.add(byteData.buffer.asUint8List());
        }
      } else {
        var serializedModel = SerializationManager.encodeForProtocol(
          result.returnValue,
        );
        request.response.write(serializedModel);
      }
      await request.response.close();
      return;
    }
  }

  Future<String?> _readBody(HttpRequest request) async {
    // TODO: Find more efficient solution?
    var len = 0;
    var data = <int>[];
    await for (var segment in request) {
      len += segment.length;
      if (len > serverpod.config.maxRequestSize) return null;
      data += segment;
    }
    return const Utf8Decoder().convert(data);
  }

  Future<Result> _handleUriCall(
      Uri uri, String body, HttpRequest request) async {
    var path = uri.pathSegments.join('/');
    return endpoints.handleUriCall(this, path, uri, body, request);
  }

  Future<void> _handleWebsocket(
    WebSocket webSocket,
    HttpRequest request,
  ) async {
    try {
      var session = StreamingSession(
        server: this,
        uri: request.uri,
        httpRequest: request,
        webSocket: webSocket,
      );

      for (var endpointConnector in endpoints.connectors.values) {
        session.sessionLogs.currentEndpoint = endpointConnector.endpoint.name;
        await _callStreamOpened(session, endpointConnector.endpoint);
      }
      for (var module in endpoints.modules.values) {
        for (var endpointConnector in module.connectors.values) {
          session.sessionLogs.currentEndpoint = endpointConnector.endpoint.name;
          await _callStreamOpened(session, endpointConnector.endpoint);
        }
      }

      dynamic error;
      StackTrace? stackTrace;
      Map<String, MethodStreamContext> inputStreams = {};

      try {
        await for (String jsonData in webSocket) {
          var data = jsonDecode(jsonData) as Map;

          switch (StreamMessageType.fromString(data)) {
            case StreamMessageType.command:
              await _processCommand(
                webSocket: webSocket,
                streamingSession: session,
                data: data,
                streams: inputStreams,
              );
              break;
            case StreamMessageType.endpointMessage:
              await _handleEndpointMessage(data, session);
              break;
            case StreamMessageType.methodMessage:
              await _handleMethodMessage(data, inputStreams);
          }
        }
      } catch (e, s) {
        error = e;
        stackTrace = s;
      } finally {
        for (var inputStream in inputStreams.values) {
          await inputStream.close();
        }
      }

      // TODO: Possibly keep a list of open streams instead
      for (var endpointConnector in endpoints.connectors.values) {
        await _callStreamClosed(session, endpointConnector.endpoint);
      }
      for (var module in endpoints.modules.values) {
        for (var endpointConnector in module.connectors.values) {
          await _callStreamClosed(session, endpointConnector.endpoint);
        }
      }
      await session.close(error: error, stackTrace: stackTrace);
    } catch (e, stackTrace) {
      stderr.writeln('$e');
      stderr.writeln('$stackTrace');
      return;
    }
  }

  Future<void> _handleMethodMessage(
    Map<dynamic, dynamic> data,
    Map<String, MethodStreamContext> inputStreams,
  ) async {
    var endpointName = data['endpoint'] as String;
    var methodName = data['method'] as String;
    var streamName = data['stream'] as String;
    var uuid = data['uuid'] as String;

    var streamPrefix = _MethodStreamConnector.buildStreamPrefix(
      endpointName: endpointName,
      methodName: methodName,
      uuid: uuid,
    );

    var streamId = _MethodStreamConnector.buildStreamName(
      streamPrefix: streamPrefix,
      streamName: streamName,
    );

    var stream = inputStreams[streamId];

    if (stream == null) {
      throw Exception('Stream not found: $streamId');
    }

    stream.addMessage(data['object'] as String);
  }

  Future<void> _handleEndpointMessage(
    Map<dynamic, dynamic> data,
    StreamingSession session,
  ) async {
    // Handle messages passed to endpoints.
    var endpointName = data['endpoint'] as String;
    var serialization = data['object'] as Map<String, dynamic>;

    var endpointConnector = endpoints.getConnectorByName(endpointName);
    if (endpointConnector == null) {
      throw Exception('Endpoint not found: $endpointName');
    }

    var endpoint = endpointConnector.endpoint;
    var authFailed = await EndpointDispatch.canUserAccessEndpoint(
      () => session.authenticated,
      endpoint.requireLogin,
      endpoint.requiredScopes,
    );

    if (authFailed == null) {
      // Process the message.
      var startTime = DateTime.now();
      dynamic messageError;
      StackTrace? messageStackTrace;

      SerializableModel? message;
      try {
        session.sessionLogs.currentEndpoint = endpointName;

        message = serializationManager.deserializeByClassName(serialization);

        if (message == null) throw Exception('Streamed message was null');

        await endpointConnector.endpoint.handleStreamMessage(session, message);
      } catch (e, s) {
        messageError = e;
        messageStackTrace = s;
        stderr.writeln('${DateTime.now().toUtc()} Internal server error. '
            'Uncaught exception in handleStreamMessage.');
        stderr.writeln('$e');
        stderr.writeln('$s');
      }

      var duration =
          DateTime.now().difference(startTime).inMicroseconds / 1000000.0;
      var logManager = session.serverpod.logManager;

      var slow = duration >=
          logManager
              .getLogSettingsForStreamingSession(
                endpoint: endpointName,
              )
              .slowSessionDuration;

      var shouldLog = logManager.shouldLogMessage(
        session: session,
        endpoint: endpointName,
        slow: slow,
        failed: messageError != null,
      );

      if (shouldLog) {
        var logEntry = MessageLogEntry(
          sessionLogId: session.sessionLogs.temporarySessionId,
          serverId: serverId,
          messageId: session.currentMessageId,
          endpoint: endpointName,
          messageName: serialization['className'],
          duration: duration,
          order: session.sessionLogs.currentLogOrderId,
          error: messageError?.toString(),
          stackTrace: messageStackTrace?.toString(),
          slow: slow,
        );
        unawaited(logManager.logMessage(session, logEntry));

        session.sessionLogs.currentLogOrderId += 1;
      }

      session.currentMessageId += 1;
    }
  }

  /// Throws an exception if endpoint is not found.
  Future<void> _processCommand({
    required WebSocket webSocket,
    required StreamingSession streamingSession /* legacy session object */,
    required Map data,
    required Map<String, MethodStreamContext> streams,
  }) async {
    var command = data['command'] as String;

    var args = data['args'] as Map;

    if (command == 'ping') {
      webSocket.add(
        SerializationManager.encodeForProtocol(
          {'command': 'pong'},
        ),
      );
    } else if (command == 'auth') {
      var authKey = args['key'] as String?;
      streamingSession.updateAuthenticationKey(authKey);
    } else if (command == 'open_stream') {
      // Alex TODO: If we fail to find the endpoint or method, we should
      // send a message back to the client to close the stream and give a
      // reason why and warning.
      var endpointName = args['endpoint'] as String;
      var endpointConnector = endpoints.getConnectorByName(endpointName);
      if (endpointConnector == null) {
        throw Exception('Endpoint not found: $endpointName');
      }

      var methodName = args['method'] as String;
      var methodConnector = endpointConnector.methodConnectors[methodName];
      if (methodConnector == null) {
        throw Exception('Method not found: $methodName');
      }

      if (methodConnector is! StreamingMethodConnector) {
        throw Exception('Method is not a streaming method: $methodName');
      }

      var uuid = args['uuid'] as String;

      // Pick out arguments.
      var params = _CallParameters.parseParameters(
        args['params'],
        methodConnector.params,
        serializationManager,
      );

      // Fetch auth
      var auth = args['auth'] as String?;

      var session = StreamingMethodCallSession(
        queryParameters: params,
        server: this,
        enableLogging: endpointConnector.endpoint.logSessions,
        authenticationKey: auth,
      );

      var authFailed = await EndpointDispatch.canUserAccessEndpoint(
        () => session.authenticated,
        endpointConnector.endpoint.requireLogin,
        endpointConnector.endpoint.requiredScopes,
      );

      if (authFailed != null) {
        throw Exception('Authentication failed');
      }

      // Build input streams.
      var inputStreams = _MethodStreamConnector.buildInputStreams(
        descriptions: methodConnector.inputStreams,
        serializationManager: serializationManager,
      );

      var streamPrefix = _MethodStreamConnector.buildStreamPrefix(
        endpointName: endpointName,
        methodName: methodName,
        uuid: uuid,
      );

      _MethodStreamConnector.registerInputStreams(
        streams: streams,
        inputStreams: inputStreams,
        streamPrefix: streamPrefix,
      );

      var outputStream = methodConnector.outputStream
          ?.createOutputStreamContext(
              serialization: (object) =>
                  serializationManager.encodeWithType(object),
              onMessage: (message) {
                var messageData = {
                  'type': 'methodMessage',
                  'endpoint': endpointName,
                  'method': methodName,
                  'uuid': uuid,
                  'object': message,
                };

                webSocket.add(jsonEncode(messageData));
              },
              onDone: () {
                // print('Sending message to close output stream $streamPrefix');
                var closeStreamMessage = {
                  'command': 'close_stream',
                  'args': {
                    'endpoint': endpointName,
                    'method': methodName,
                    'uuid': uuid,
                  }
                };

                webSocket.add(jsonEncode(closeStreamMessage));
              });

      // print('Created a new stream: $streamPrefix');
      // print('Streams: ${streams.keys}');

      // Call the method.
      methodConnector.call(session, params, inputStreams, outputStream);
    } else if (command == 'close_stream') {
      var endpointName = args['endpoint'] as String;
      var methodName = args['method'] as String;
      var uuid = args['uuid'] as String;
      var streamName = args['stream'] as String;

      var streamPrefix = _MethodStreamConnector.buildStreamPrefix(
        endpointName: endpointName,
        methodName: methodName,
        uuid: uuid,
      );
      var streamKey = _MethodStreamConnector.buildStreamName(
        streamPrefix: streamPrefix,
        streamName: streamName,
      );

      // print('Received close stream command: $streamKey');

      var stream = streams.remove(streamKey);
      if (stream == null) {
        throw Exception('Stream not found: $streamKey');
      }

      await stream.close();
    }
  }

  Future<void> _callStreamOpened(
    StreamingSession session,
    Endpoint endpoint,
  ) async {
    try {
      var authFailed = await EndpointDispatch.canUserAccessEndpoint(
        () => session.authenticated,
        endpoint.requireLogin,
        endpoint.requiredScopes,
      );
      if (authFailed == null) await endpoint.streamOpened(session);
    } catch (e) {
      return;
    }
  }

  Future<void> _callStreamClosed(
    StreamingSession session,
    Endpoint endpoint,
  ) async {
    try {
      var authFailed = await EndpointDispatch.canUserAccessEndpoint(
        () => session.authenticated,
        endpoint.requireLogin,
        endpoint.requiredScopes,
      );
      if (authFailed == null) await endpoint.streamClosed(session);
    } catch (e) {
      return;
    }
  }

  /// Shuts the server down.
  void shutdown() {
    _httpServer.close();
    _running = false;
  }
}

abstract class _CallParameters {
  static Map<String, dynamic> parseParameters(
    String? paramString,
    Map<String, ParameterDescription> descriptions,
    SerializationManager serializationManager, {
    Map<String, dynamic> additionalParameters = const {},
  }) {
    if (descriptions.isNotEmpty && paramString == null) {
      throw Exception('Missing query parameters');
    }

    if (descriptions.isEmpty || paramString == null) return {};

    var decodedParams = jsonDecode(paramString) as Map<String, dynamic>;
    decodedParams.addAll(additionalParameters);

    var deserializedParams = <String, dynamic>{};
    for (var MapEntry(key: name, value: serializedParam)
        in decodedParams.entries) {
      var type = descriptions[name]?.type;
      if (type == null) continue;

      deserializedParams[name] = serializationManager.deserialize(
        serializedParam,
        type,
      );
    }

    return deserializedParams;
  }
}

abstract class _MethodStreamConnector {
  static Map<String, MethodStreamContext> buildInputStreams({
    required Map<String, StreamDescription> descriptions,
    required SerializationManager serializationManager,
  }) {
    var streams = <String, MethodStreamContext>{};
    if (descriptions.isEmpty) return streams;

    for (var MapEntry(key: name, value: description) in descriptions.entries) {
      // Alex - Should be moved to registerInputStreams and should only use
      // parameter name as key for the return of this method.

      streams[name] = description.createStreamContext(
        deserialize: (object) {
          return serializationManager.decodeWithType(object)
              as SerializableModel;
        },
      );
    }

    return streams;
  }

  static void registerInputStreams({
    required Map<String, MethodStreamContext> streams,
    required Map<String, MethodStreamContext> inputStreams,
    required String streamPrefix,
  }) {
    if (inputStreams.isEmpty) return;

    for (var MapEntry(key: name, value: context) in inputStreams.entries) {
      var streamName = buildStreamName(
        streamPrefix: streamPrefix,
        streamName: name,
      );

      if (streams.containsKey(streamName)) continue;

      streams[streamName] = context;
    }
  }

  static String buildStreamPrefix({
    required String endpointName,
    required String methodName,
    required String uuid,
  }) {
    return '$uuid.$endpointName.$methodName';
  }

  static String buildStreamName({
    required String streamPrefix,
    required String streamName,
  }) {
    return '$streamPrefix.$streamName';
  }
}

/// Describes the message stream type sent to the server.
enum StreamMessageType {
  /// A method call message.
  methodMessage,

  /// An endpoint message.
  endpointMessage,

  /// A command message.
  command;

  /// Converts a string to a [StreamMessageType].
  static StreamMessageType fromString(Map data) {
    // Handle control commands.
    var command = data['command'] as String?;
    if (command != null) return StreamMessageType.command;

    var value = data['type'] as String?;
    switch (value) {
      case 'methodMessage':
        return StreamMessageType.methodMessage;
      case 'endpointMessage':
        return StreamMessageType.endpointMessage;
      default:
        // Legacy support, always default to endpointMessage
        return StreamMessageType.endpointMessage;
    }
  }
}
