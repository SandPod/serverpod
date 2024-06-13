import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:serverpod/src/authentication/authentication_info.dart';
import 'package:serverpod/src/authentication/scope.dart';
import 'package:serverpod_serialization/serverpod_serialization.dart';

import 'endpoint.dart';
import 'server.dart';
import 'session.dart';

/// The [EndpointDispatch] is responsible for directing requests to the [Server]
/// to the correct [Endpoint] and method. Typically, this class is overridden
/// by an Endpoints class that is generated.
abstract class EndpointDispatch {
  /// All connectors associating endpoint method names with the actual methods.
  Map<String, EndpointConnector> connectors = {};

  /// References to modules.
  Map<String, EndpointDispatch> modules = {};

  /// Initializes all endpoints that are connected to the dispatch.
  void initializeEndpoints(Server server);

  /// Finds an [EndpointConnector] by its name. If the connector is in a module,
  /// a period should separate the module name from the endpoint name.
  EndpointConnector? getConnectorByName(String endpointName) {
    var endpointComponents = endpointName.split('.');
    if (endpointComponents.isEmpty || endpointComponents.length > 2) {
      return null;
    }

    // Find correct connector
    EndpointConnector? connector;

    if (endpointComponents.length == 1) {
      // This is a standard server endpoint
      connector = connectors[_endpointFromName(endpointName)];
      if (connector == null) return null;
    } else {
      // Connector is in a module
      var modulePackage = endpointComponents[0];
      endpointName = endpointComponents[1];
      var module = modules[modulePackage];
      if (module == null) return null;

      connector = module.connectors[_endpointFromName(endpointName)];
      if (connector == null) return null;
    }

    return connector;
  }

  String _endpointFromName(String name) {
    var components = name.split('/');
    return components[0];
  }

  /// Dispatches a call to the [Server] to the correct [Endpoint] method. If
  /// successful, it returns the object from the method. If unsuccessful it will
  /// return a [Result] object.
  Future<Result> handleUriCall(
    Server server,
    String path,
    Uri uri,
    String body,
    HttpRequest request,
  ) async {
    var endpointComponents = path.split('.');
    if (endpointComponents.isEmpty || endpointComponents.length > 2) {
      return ResultInvalidParams('Endpoint $path is not a valid endpoint name');
    }

    // Find correct connector
    var connector = getConnectorByName(path);
    if (connector == null) {
      return ResultInvalidParams('Endpoint $path does not exist');
    }

    MethodCallSession session;

    try {
      session = MethodCallSession(
        server: server,
        uri: uri,
        body: body,
        path: path,
        httpRequest: request,
        enableLogging: connector.endpoint.logSessions,
      );
    } catch (e) {
      return ResultInvalidParams('Malformed call: $uri');
    }

    var methodName = session.methodName;
    var inputParams = session.queryParameters;

    try {
      var endpoint = connector.endpoint;
      var authFailed = await canUserAccessEndpoint(
        () => session.authenticated,
        endpoint.requireLogin,
        endpoint.requiredScopes,
      );
      if (authFailed != null) {
        return authFailed;
      }

      var method = connector.methodConnectors[methodName];
      if (method == null) {
        await session.close();
        return ResultInvalidParams(
            'Method $methodName not found in call: $uri');
      }

      if (method is! MethodConnector) {
        await session.close();
        return ResultInvalidParams(
            'Method $methodName is not a valid method in call: $uri');
      }

      // TODO: Check parameters and check null safety

      var paramMap = <String, dynamic>{};
      for (var paramName in inputParams.keys) {
        var type = method.params[paramName]?.type;
        if (type == null) continue;
        var formatted = _formatArg(
            inputParams[paramName], type, server.serializationManager);
        paramMap[paramName] = formatted;
      }

      var result = await method.call(session, paramMap);

      return ResultSuccess(
        result,
        sendByteDataAsRaw: connector.endpoint.sendByteDataAsRaw,
      );
    } on SerializableException catch (exception) {
      return ExceptionResult(model: exception);
    } on Exception catch (e, stackTrace) {
      var sessionLogId = await session.close(error: e, stackTrace: stackTrace);
      return ResultInternalServerError(
          e.toString(), stackTrace, sessionLogId ?? 0);
    } catch (e, stackTrace) {
      // Something did not work out
      var sessionLogId = await session.close(error: e, stackTrace: stackTrace);
      return ResultInternalServerError(
          e.toString(), stackTrace, sessionLogId ?? 0);
    } finally {
      await session.close();
    }
  }

  /// Checks if a user can access an [Endpoint]. If access is granted null is
  /// returned, otherwise a [ResultAuthenticationFailed] describing the issue is
  /// returned.
  static Future<ResultAuthenticationFailed?> canUserAccessEndpoint(
    Future<AuthenticationInfo?> Function() authInfoProvider,
    bool requiresLogin,
    Set<Scope> requiredScopes,
  ) async {
    var authenticationRequired = requiresLogin || requiredScopes.isNotEmpty;

    if (!authenticationRequired) {
      return null;
    }

    var info = await authInfoProvider();
    if (info == null) {
      return ResultAuthenticationFailed.unauthenticated(
        'No valid authentication provided',
      );
    }

    var missingUserScopes = Set.from(requiredScopes)..removeAll(info.scopes);

    if (missingUserScopes.isNotEmpty) {
      return ResultAuthenticationFailed.insufficientAccess(
        'User is missing required scope${missingUserScopes.length > 1 ? 's' : ''}: $missingUserScopes',
      );
    }

    return null;
  }

  dynamic _formatArg(
      dynamic input, Type type, SerializationManager serializationManager) {
    return serializationManager.deserialize(input, type);
  }
}

/// The [EndpointConnector] associates a name with and endpoint and its
/// [MethodConnector]s.
class EndpointConnector {
  /// Name of the [Endpoint].
  final String name;

  /// Reference to the [Endpoint].
  final Endpoint endpoint;

  /// All [MethodConnector]s associated with the [Endpoint].
  final Map<String, EndpointMethodConnector> methodConnectors;

  /// Creates a new [EndpointConnector].
  EndpointConnector({
    required this.name,
    required this.endpoint,
    required this.methodConnectors,
  });
}

/// Calls a named method referenced in a [MethodConnector].
typedef MethodCall = Future Function(
    Session session, Map<String, dynamic> params);

/// Calls a named method referenced in a [StreamingMethodConnector].
typedef StreamCall = dynamic Function(
  Session session,
  Map<String, dynamic> params,
  Map<String, dynamic> streams,
  OutputStreamContext? outStream,
);

/// The [MethodConnector] hooks up a method with its name and the actual call
/// to the method.
class MethodConnector extends EndpointMethodConnector {
  /// The name of the method.
  final String name;

  /// List of parameters used by the method.
  final Map<String, ParameterDescription> params;

  /// A function that performs a call to the named method.
  final MethodCall call;

  /// Creates a new [MethodConnector].
  MethodConnector({
    required this.name,
    required this.params,
    required this.call,
  });
}

/// Method connector for streaming methods.
class StreamingMethodConnector extends EndpointMethodConnector {
  /// The name of the method.
  final String name;

  /// List of parameters used by the method.
  final Map<String, ParameterDescription> params;

  /// List of input streams used by the method.
  final Map<String, StreamDescription> inputStreams;

  /// The output stream of the method.
  final StreamDescription? outputStream;

  /// A function that performs a call to the named method.
  final StreamCall call;

  /// Creates a new [StreamingMethodConnector].
  StreamingMethodConnector({
    required this.name,
    required this.params,
    required this.inputStreams,
    required this.call,
    this.outputStream,
  });
}

/// An abstract class for all method connectors.
/// This is used to group all method connectors together.
sealed class EndpointMethodConnector {}

/// Defines a parameter in a [MethodConnector].
class ParameterDescription {
  /// The name of the parameter.
  final String name;

  /// The Dart type of the parameter.
  final Type type;

  /// True if the parameter can be nullable.
  final bool nullable;

  /// Creates a new [ParameterDescription].
  ParameterDescription(
      {required this.name, required this.type, required this.nullable});
}

/// Describes a stream.
class MethodStreamContext<T extends SerializableModel> {
  /// The stream.
  Stream get stream => _controller.stream;

  /// The controller for the stream.
  late final StreamController<T> _controller;

  /// The deserialization function.
  final SerializableModel Function(String message) _deserialize;

  /// Creates a new [MethodStreamContext] object.
  MethodStreamContext({
    required SerializableModel Function(String) deserialize,
  }) : _deserialize = deserialize {
    _controller = StreamController<T>();
  }

  /// Adds a message to the stream.
  void addMessage(String message) {
    _controller.add(_deserialize(message) as T);
  }

  /// Closes the stream.
  Future<void> close() async {
    await _controller.close();
  }
}

/// Defines a stream in an [Endpoint] method.
class StreamDescription<T extends SerializableModel> {
  /// The name of the stream.
  final String name;

  /// Creates a new [MethodStreamContext] with the given deserialization
  /// function.
  MethodStreamContext<T> createStreamContext({
    required SerializableModel Function(String) deserialize,
  }) {
    return MethodStreamContext<T>(deserialize: deserialize);
  }

  /// Creates a new [OutputStreamContext] with the given serialization function.
  OutputStreamContext<T> createOutputStreamContext({
    required String Function(T) serialization,
    required void Function(String) onMessage,
    required void Function() onDone,
  }) {
    return OutputStreamContext<T>(
      serialization: serialization,
      onMessage: onMessage,
      onDone: onDone,
    );
  }

  /// Creates a new [StreamDescription].
  StreamDescription({
    required this.name,
  });
}

/// Documentation for an output stream.
class OutputStreamContext<T extends SerializableModel> {
  /// The controller for the stream.
  late final StreamController<String> _controller;

  /// The serialization function.
  final String Function(T message) _serialization;

  final void Function(String) _onMessage;
  final void Function() _onDone;

  /// Creates a new [OutputStreamContext] object.
  OutputStreamContext({
    required String Function(T) serialization,
    required void Function(String) onMessage,
    required void Function() onDone,
  })  : _serialization = serialization,
        _onMessage = onMessage,
        _onDone = onDone {
    _controller = StreamController<String>();
    _controller.stream.listen((event) {
      _onMessage(event);
    }).onDone(() {
      _onDone();
    });
  }

  /// Adds a stream to the stream.
  Future<void> addStream(Stream<T> stream) async {
    await _controller.addStream(stream.map((event) => _serialization(event)));
    await _controller.close();
  }

  /// Adds a a future to the stream that is sent once the future completes and
  /// then and then closes it.
  void addFuture(Future<T> message) async {
    _controller.add(_serialization(await message));
    await _controller.close();
  }
}

/// The [Result] of an [Endpoint] method call.
abstract class Result {}

/// A successful result from an [Endpoint] method call containing the return
/// value of the call.
class ResultSuccess extends Result {
  /// The returned value of a successful [Endpoint] method call.
  final dynamic returnValue;

  /// True if [ByteData] should not be embedded in API serialization.
  final bool sendByteDataAsRaw;

  /// Creates a new successful result with a value.
  ResultSuccess(this.returnValue, {this.sendByteDataAsRaw = false});
}

/// The result of a failed [Endpoint] method call where the parameters where not
/// valid.
class ResultInvalidParams extends Result {
  /// Description of the error.
  final String errorDescription;

  /// Creates a new [ResultInvalidParams] object.
  ResultInvalidParams(this.errorDescription);

  @override
  String toString() {
    return errorDescription;
  }
}

/// The type of failures that can occur during authentication.
enum AuthenticationFailureReason {
  /// No valid authentication key was provided.
  unauthenticated,

  /// The authentication key provided did not have sufficient access.
  insufficientAccess,
}

/// The result of a failed [Endpoint] method call where authentication failed.
class ResultAuthenticationFailed extends Result {
  /// Description of the error.
  final String errorDescription;

  /// The reason why the authentication failed.
  final AuthenticationFailureReason reason;

  /// Creates a new [ResultAuthenticationFailed] object.
  ResultAuthenticationFailed._(this.errorDescription, this.reason);

  /// Creates a new [ResultAuthenticationFailed] object when the user failed to
  /// provide a valid authentication key.
  factory ResultAuthenticationFailed.unauthenticated(String message) =>
      ResultAuthenticationFailed._(
        message,
        AuthenticationFailureReason.unauthenticated,
      );

  /// Creates a new [ResultAuthenticationFailed] object when the user provided
  /// an authentication key that did not have sufficient access.
  factory ResultAuthenticationFailed.insufficientAccess(String message) =>
      ResultAuthenticationFailed._(
        message,
        AuthenticationFailureReason.insufficientAccess,
      );

  @override
  String toString() {
    return errorDescription;
  }
}

/// The result of a failed [Endpoint] method call where an [Exception] was
/// thrown during execution of the method.
class ResultInternalServerError extends Result {
  /// The Exception that was thrown.
  final String exception;

  /// Stack trace when the exception occurred.
  final StackTrace stackTrace;

  /// The session log id.
  final int? sessionLogId;

  /// Creates a new [ResultInternalServerError].
  ResultInternalServerError(this.exception, this.stackTrace, this.sessionLogId);

  @override
  String toString() {
    return '$exception\n$stackTrace';
  }
}

/// The result of a failed [Endpoint] method call, with a custom status code.
class ResultStatusCode extends Result {
  /// The status code to be returned to the client.
  final int statusCode;

  /// Creates a new [ResultStatusCode].
  ResultStatusCode(this.statusCode);

  @override
  String toString() {
    return 'Status Code: $statusCode';
  }
}

/// The result of a failed [Endpoint] method call, with a custom exception.
class ExceptionResult<T extends SerializableException> extends Result {
  /// The exception to be returned to the client.
  final T model;

  /// Creates a new [ExceptionResult].
  ExceptionResult({
    required this.model,
  });

  @override
  String toString() => 'ExceptionResult(entity: $model)';
}
