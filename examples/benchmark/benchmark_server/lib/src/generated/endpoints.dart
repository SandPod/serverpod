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
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/database.dart' as _i2;
import '../endpoints/endpoint_requests.dart' as _i3;
import '../endpoints/streams.dart' as _i4;
import 'package:benchmark_server/src/generated/small_message.dart' as _i5;
import 'package:benchmark_server/src/generated/large_message.dart' as _i6;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'database': _i2.Database()
        ..initialize(
          server,
          'database',
          null,
        ),
      'endpointRequests': _i3.EndpointRequests()
        ..initialize(
          server,
          'endpointRequests',
          null,
        ),
      'streams': _i4.Streams()
        ..initialize(
          server,
          'streams',
          null,
        ),
    };
    connectors['database'] = _i1.EndpointConnector(
      name: 'database',
      endpoint: endpoints['database']!,
      methodConnectors: {
        'roundtripSmall': _i1.MethodConnector(
          name: 'roundtripSmall',
          params: {
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<_i5.SmallMessage>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['database'] as _i2.Database).roundtripSmall(
            session,
            params['message'],
          ),
        ),
        'roundtripLarge': _i1.MethodConnector(
          name: 'roundtripLarge',
          params: {
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<_i6.LargeMessage>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['database'] as _i2.Database).roundtripLarge(
            session,
            params['message'],
          ),
        ),
        'insertSmall': _i1.MethodConnector(
          name: 'insertSmall',
          params: {
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<_i5.SmallMessage>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['database'] as _i2.Database).insertSmall(
            session,
            params['message'],
          ),
        ),
        'insertLarge': _i1.MethodConnector(
          name: 'insertLarge',
          params: {
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<_i6.LargeMessage>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['database'] as _i2.Database).insertLarge(
            session,
            params['message'],
          ),
        ),
        'getSmall': _i1.MethodConnector(
          name: 'getSmall',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['database'] as _i2.Database).getSmall(
            session,
            params['id'],
          ),
        ),
        'getLarge': _i1.MethodConnector(
          name: 'getLarge',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['database'] as _i2.Database).getLarge(
            session,
            params['id'],
          ),
        ),
        'getWithRelationsSmall': _i1.MethodConnector(
          name: 'getWithRelationsSmall',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['database'] as _i2.Database).getWithRelationsSmall(
            session,
            params['id'],
          ),
        ),
        'getWithRelationLarge': _i1.MethodConnector(
          name: 'getWithRelationLarge',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['database'] as _i2.Database).getWithRelationLarge(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['endpointRequests'] = _i1.EndpointConnector(
      name: 'endpointRequests',
      endpoint: endpoints['endpointRequests']!,
      methodConnectors: {
        'echoSmall': _i1.MethodConnector(
          name: 'echoSmall',
          params: {
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<_i5.SmallMessage>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['endpointRequests'] as _i3.EndpointRequests).echoSmall(
            session,
            params['message'],
          ),
        ),
        'echoLarge': _i1.MethodConnector(
          name: 'echoLarge',
          params: {
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<_i6.LargeMessage>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['endpointRequests'] as _i3.EndpointRequests).echoLarge(
            session,
            params['message'],
          ),
        ),
        'inputSmall': _i1.MethodConnector(
          name: 'inputSmall',
          params: {
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<_i5.SmallMessage>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['endpointRequests'] as _i3.EndpointRequests)
                  .inputSmall(
            session,
            params['message'],
          ),
        ),
        'inputLarge': _i1.MethodConnector(
          name: 'inputLarge',
          params: {
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<_i6.LargeMessage>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['endpointRequests'] as _i3.EndpointRequests)
                  .inputLarge(
            session,
            params['message'],
          ),
        ),
        'fetchSmall': _i1.MethodConnector(
          name: 'fetchSmall',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['endpointRequests'] as _i3.EndpointRequests)
                  .fetchSmall(session),
        ),
        'fetchLarge': _i1.MethodConnector(
          name: 'fetchLarge',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['endpointRequests'] as _i3.EndpointRequests)
                  .fetchLarge(session),
        ),
      },
    );
    connectors['streams'] = _i1.EndpointConnector(
      name: 'streams',
      endpoint: endpoints['streams']!,
      methodConnectors: {
        'echoSmall': _i1.MethodStreamConnector(
          name: 'echoSmall',
          params: {},
          streamParams: {
            'messageStream': _i1.StreamParameterDescription<_i5.SmallMessage>(
              name: 'messageStream',
              nullable: false,
            )
          },
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['streams'] as _i4.Streams).echoSmall(
            session,
            streamParams['messageStream']!.cast<_i5.SmallMessage>(),
          ),
        ),
        'echoLarge': _i1.MethodStreamConnector(
          name: 'echoLarge',
          params: {},
          streamParams: {
            'messageStream': _i1.StreamParameterDescription<_i6.LargeMessage>(
              name: 'messageStream',
              nullable: false,
            )
          },
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['streams'] as _i4.Streams).echoLarge(
            session,
            streamParams['messageStream']!.cast<_i6.LargeMessage>(),
          ),
        ),
        'continuousInSmall': _i1.MethodStreamConnector(
          name: 'continuousInSmall',
          params: {},
          streamParams: {
            'messageStream': _i1.StreamParameterDescription<_i5.SmallMessage>(
              name: 'messageStream',
              nullable: false,
            )
          },
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['streams'] as _i4.Streams).continuousInSmall(
            session,
            streamParams['messageStream']!.cast<_i5.SmallMessage>(),
          ),
        ),
        'continuousInLarge': _i1.MethodStreamConnector(
          name: 'continuousInLarge',
          params: {},
          streamParams: {
            'messageStream': _i1.StreamParameterDescription<_i6.LargeMessage>(
              name: 'messageStream',
              nullable: false,
            )
          },
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['streams'] as _i4.Streams).continuousInLarge(
            session,
            streamParams['messageStream']!.cast<_i6.LargeMessage>(),
          ),
        ),
        'continuousOutSmall': _i1.MethodStreamConnector(
          name: 'continuousOutSmall',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['streams'] as _i4.Streams).continuousOutSmall(session),
        ),
        'continuousOutLarge': _i1.MethodStreamConnector(
          name: 'continuousOutLarge',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['streams'] as _i4.Streams).continuousOutLarge(session),
        ),
      },
    );
  }
}
