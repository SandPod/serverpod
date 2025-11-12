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

abstract class SessionAuthInfo
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SessionAuthInfo._({
    required this.isAuthenticated,
    this.userId,
    required this.scopes,
    this.authId,
  });

  factory SessionAuthInfo({
    required final bool isAuthenticated,
    final String? userId,
    required final List<String> scopes,
    final String? authId,
  }) = _SessionAuthInfoImpl;

  factory SessionAuthInfo.fromJson(final Map<String, dynamic> jsonSerialization) {
    return SessionAuthInfo(
      isAuthenticated: jsonSerialization['isAuthenticated'] as bool,
      userId: jsonSerialization['userId'] as String?,
      scopes: (jsonSerialization['scopes'] as List)
          .map((final e) => e as String)
          .toList(),
      authId: jsonSerialization['authId'] as String?,
    );
  }

  bool isAuthenticated;

  String? userId;

  List<String> scopes;

  String? authId;

  /// Returns a shallow copy of this [SessionAuthInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SessionAuthInfo copyWith({
    final bool? isAuthenticated,
    final String? userId,
    final List<String>? scopes,
    final String? authId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'isAuthenticated': isAuthenticated,
      if (userId != null) 'userId': userId,
      'scopes': scopes.toJson(),
      if (authId != null) 'authId': authId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'isAuthenticated': isAuthenticated,
      if (userId != null) 'userId': userId,
      'scopes': scopes.toJson(),
      if (authId != null) 'authId': authId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SessionAuthInfoImpl extends SessionAuthInfo {
  _SessionAuthInfoImpl({
    required final bool isAuthenticated,
    final String? userId,
    required final List<String> scopes,
    final String? authId,
  }) : super._(
         isAuthenticated: isAuthenticated,
         userId: userId,
         scopes: scopes,
         authId: authId,
       );

  /// Returns a shallow copy of this [SessionAuthInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SessionAuthInfo copyWith({
    final bool? isAuthenticated,
    final Object? userId = _Undefined,
    final List<String>? scopes,
    final Object? authId = _Undefined,
  }) {
    return SessionAuthInfo(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      userId: userId is String? ? userId : this.userId,
      scopes: scopes ?? this.scopes.map((final e0) => e0).toList(),
      authId: authId is String? ? authId : this.authId,
    );
  }
}
