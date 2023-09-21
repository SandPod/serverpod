/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: non_constant_identifier_names

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

/// The log filter is used when searching for specific log entries.
abstract class SessionLogFilter extends _i1.SerializableEntity {
  SessionLogFilter._({
    this.endpoint,
    this.method,
    this.futureCall,
    required this.slow,
    required this.error,
    required this.open,
    this.lastSessionLogId,
  });

  factory SessionLogFilter({
    String? endpoint,
    String? method,
    String? futureCall,
    required bool slow,
    required bool error,
    required bool open,
    int? lastSessionLogId,
  }) = _SessionLogFilterImpl;

  factory SessionLogFilter.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return SessionLogFilter(
      endpoint: serializationManager
          .deserialize<String?>(jsonSerialization['endpoint']),
      method: serializationManager
          .deserialize<String?>(jsonSerialization['method']),
      futureCall: serializationManager
          .deserialize<String?>(jsonSerialization['futureCall']),
      slow: serializationManager.deserialize<bool>(jsonSerialization['slow']),
      error: serializationManager.deserialize<bool>(jsonSerialization['error']),
      open: serializationManager.deserialize<bool>(jsonSerialization['open']),
      lastSessionLogId: serializationManager
          .deserialize<int?>(jsonSerialization['lastSessionLogId']),
    );
  }

  /// The endpoint to get logs from. Null will return logs from any endpoint.
  String? endpoint;

  /// The method to get logs from. Null will return logs from any method.
  String? method;

  /// The name of a future call to get logs from.
  String? futureCall;

  /// If true, only return slow sessions.
  bool slow;

  /// If true, only return sessions ending with an exception.
  bool error;

  /// If true, only return open sessions.
  bool open;

  /// Last session id to start the list of logs from. Used for pagination.
  int? lastSessionLogId;

  SessionLogFilter copyWith({
    String? endpoint,
    String? method,
    String? futureCall,
    bool? slow,
    bool? error,
    bool? open,
    int? lastSessionLogId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'endpoint': endpoint,
      'method': method,
      'futureCall': futureCall,
      'slow': slow,
      'error': error,
      'open': open,
      'lastSessionLogId': lastSessionLogId,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'endpoint': endpoint,
      'method': method,
      'futureCall': futureCall,
      'slow': slow,
      'error': error,
      'open': open,
      'lastSessionLogId': lastSessionLogId,
    };
  }
}

class _Undefined {}

class _SessionLogFilterImpl extends SessionLogFilter {
  _SessionLogFilterImpl({
    String? endpoint,
    String? method,
    String? futureCall,
    required bool slow,
    required bool error,
    required bool open,
    int? lastSessionLogId,
  }) : super._(
          endpoint: endpoint,
          method: method,
          futureCall: futureCall,
          slow: slow,
          error: error,
          open: open,
          lastSessionLogId: lastSessionLogId,
        );

  @override
  SessionLogFilter copyWith({
    Object? endpoint = _Undefined,
    Object? method = _Undefined,
    Object? futureCall = _Undefined,
    bool? slow,
    bool? error,
    bool? open,
    Object? lastSessionLogId = _Undefined,
  }) {
    return SessionLogFilter(
      endpoint: endpoint is String? ? endpoint : this.endpoint,
      method: method is String? ? method : this.method,
      futureCall: futureCall is String? ? futureCall : this.futureCall,
      slow: slow ?? this.slow,
      error: error ?? this.error,
      open: open ?? this.open,
      lastSessionLogId:
          lastSessionLogId is int? ? lastSessionLogId : this.lastSessionLogId,
    );
  }
}
