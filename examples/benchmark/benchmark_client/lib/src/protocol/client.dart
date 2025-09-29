/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:benchmark_client/src/protocol/small_message.dart' as _i3;
import 'package:benchmark_client/src/protocol/large_message.dart' as _i4;
import 'protocol.dart' as _i5;

/// {@category Endpoint}
class EndpointDatabase extends _i1.EndpointRef {
  EndpointDatabase(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'database';

  _i2.Future<_i3.SmallMessage> roundtripSmall(_i3.SmallMessage message) =>
      caller.callServerEndpoint<_i3.SmallMessage>(
        'database',
        'roundtripSmall',
        {'message': message},
      );

  _i2.Future<_i4.LargeMessage> roundtripLarge(_i4.LargeMessage message) =>
      caller.callServerEndpoint<_i4.LargeMessage>(
        'database',
        'roundtripLarge',
        {'message': message},
      );

  _i2.Future<void> insertSmall(_i3.SmallMessage message) =>
      caller.callServerEndpoint<void>(
        'database',
        'insertSmall',
        {'message': message},
      );

  _i2.Future<void> insertLarge(_i4.LargeMessage message) =>
      caller.callServerEndpoint<void>(
        'database',
        'insertLarge',
        {'message': message},
      );

  _i2.Future<_i3.SmallMessage?> getSmall(int id) =>
      caller.callServerEndpoint<_i3.SmallMessage?>(
        'database',
        'getSmall',
        {'id': id},
      );

  _i2.Future<_i4.LargeMessage?> getLarge(int id) =>
      caller.callServerEndpoint<_i4.LargeMessage?>(
        'database',
        'getLarge',
        {'id': id},
      );

  _i2.Future<_i3.SmallMessage?> getWithRelationsSmall(int id) =>
      caller.callServerEndpoint<_i3.SmallMessage?>(
        'database',
        'getWithRelationsSmall',
        {'id': id},
      );

  _i2.Future<_i4.LargeMessage?> getWithRelationLarge(int id) =>
      caller.callServerEndpoint<_i4.LargeMessage?>(
        'database',
        'getWithRelationLarge',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointEndpointRequests extends _i1.EndpointRef {
  EndpointEndpointRequests(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'endpointRequests';

  _i2.Future<_i3.SmallMessage> echoSmall(_i3.SmallMessage message) =>
      caller.callServerEndpoint<_i3.SmallMessage>(
        'endpointRequests',
        'echoSmall',
        {'message': message},
      );

  _i2.Future<_i4.LargeMessage> echoLarge(_i4.LargeMessage message) =>
      caller.callServerEndpoint<_i4.LargeMessage>(
        'endpointRequests',
        'echoLarge',
        {'message': message},
      );

  _i2.Future<void> inputSmall(_i3.SmallMessage message) =>
      caller.callServerEndpoint<void>(
        'endpointRequests',
        'inputSmall',
        {'message': message},
      );

  _i2.Future<void> inputLarge(_i4.LargeMessage message) =>
      caller.callServerEndpoint<void>(
        'endpointRequests',
        'inputLarge',
        {'message': message},
      );

  _i2.Future<_i3.SmallMessage> fetchSmall() =>
      caller.callServerEndpoint<_i3.SmallMessage>(
        'endpointRequests',
        'fetchSmall',
        {},
      );

  _i2.Future<_i4.LargeMessage> fetchLarge() =>
      caller.callServerEndpoint<_i4.LargeMessage>(
        'endpointRequests',
        'fetchLarge',
        {},
      );
}

/// {@category Endpoint}
class EndpointStreams extends _i1.EndpointRef {
  EndpointStreams(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'streams';

  _i2.Stream<_i3.SmallMessage> echoSmall(
          _i2.Stream<_i3.SmallMessage> messageStream) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i3.SmallMessage>,
          _i3.SmallMessage>(
        'streams',
        'echoSmall',
        {},
        {'messageStream': messageStream},
      );

  _i2.Stream<_i4.LargeMessage> echoLarge(
          _i2.Stream<_i4.LargeMessage> messageStream) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i4.LargeMessage>,
          _i4.LargeMessage>(
        'streams',
        'echoLarge',
        {},
        {'messageStream': messageStream},
      );

  _i2.Stream<_i3.SmallMessage> continuousInSmall(
          _i2.Stream<_i3.SmallMessage> messageStream) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i3.SmallMessage>,
          _i3.SmallMessage>(
        'streams',
        'continuousInSmall',
        {},
        {'messageStream': messageStream},
      );

  _i2.Stream<_i4.LargeMessage> continuousInLarge(
          _i2.Stream<_i4.LargeMessage> messageStream) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i4.LargeMessage>,
          _i4.LargeMessage>(
        'streams',
        'continuousInLarge',
        {},
        {'messageStream': messageStream},
      );

  _i2.Stream<_i3.SmallMessage> continuousOutSmall() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i3.SmallMessage>,
          _i3.SmallMessage>(
        'streams',
        'continuousOutSmall',
        {},
        {},
      );

  _i2.Stream<_i4.LargeMessage> continuousOutLarge() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i4.LargeMessage>,
          _i4.LargeMessage>(
        'streams',
        'continuousOutLarge',
        {},
        {},
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    database = EndpointDatabase(this);
    endpointRequests = EndpointEndpointRequests(this);
    streams = EndpointStreams(this);
  }

  late final EndpointDatabase database;

  late final EndpointEndpointRequests endpointRequests;

  late final EndpointStreams streams;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'database': database,
        'endpointRequests': endpointRequests,
        'streams': streams,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
