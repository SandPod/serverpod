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

/// Provides a method of access for a user to authenticate with the server.
abstract class AuthKey implements _i1.SerializableModel {
  AuthKey._({
    this.id,
    required this.userId,
    required this.hash,
    this.key,
    required this.scopeNames,
    required this.method,
  });

  factory AuthKey({
    final int? id,
    required final int userId,
    required final String hash,
    final String? key,
    required final List<String> scopeNames,
    required final String method,
  }) = _AuthKeyImpl;

  factory AuthKey.fromJson(final Map<String, dynamic> jsonSerialization) {
    return AuthKey(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      hash: jsonSerialization['hash'] as String,
      key: jsonSerialization['key'] as String?,
      scopeNames: (jsonSerialization['scopeNames'] as List)
          .map((final e) => e as String)
          .toList(),
      method: jsonSerialization['method'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// The id of the user to provide access to.
  int userId;

  /// The hashed version of the key.
  String hash;

  /// The key sent to the server to authenticate.
  String? key;

  /// The scopes this key provides access to.
  List<String> scopeNames;

  /// The method of signing in this key was generated through. This can be email
  /// or different social logins.
  String method;

  /// Returns a shallow copy of this [AuthKey]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AuthKey copyWith({
    final int? id,
    final int? userId,
    final String? hash,
    final String? key,
    final List<String>? scopeNames,
    final String? method,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'hash': hash,
      if (key != null) 'key': key,
      'scopeNames': scopeNames.toJson(),
      'method': method,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AuthKeyImpl extends AuthKey {
  _AuthKeyImpl({
    final int? id,
    required final int userId,
    required final String hash,
    final String? key,
    required final List<String> scopeNames,
    required final String method,
  }) : super._(
         id: id,
         userId: userId,
         hash: hash,
         key: key,
         scopeNames: scopeNames,
         method: method,
       );

  /// Returns a shallow copy of this [AuthKey]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AuthKey copyWith({
    final Object? id = _Undefined,
    final int? userId,
    final String? hash,
    final Object? key = _Undefined,
    final List<String>? scopeNames,
    final String? method,
  }) {
    return AuthKey(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      hash: hash ?? this.hash,
      key: key is String? ? key : this.key,
      scopeNames: scopeNames ?? this.scopeNames.map((final e0) => e0).toList(),
      method: method ?? this.method,
    );
  }
}
