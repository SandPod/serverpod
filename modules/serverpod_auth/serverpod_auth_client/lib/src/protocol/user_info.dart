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

/// Information about a user. The [UserInfo] should only be shared with the user
/// itself as it may contain sensitive information, such as the users email.
/// If you need to share a user's info with other users, use the
/// [UserInfoPublic] instead. You can retrieve a [UserInfoPublic] through the
/// toPublic() method.
abstract class UserInfo implements _i1.SerializableModel {
  UserInfo._({
    this.id,
    required this.userIdentifier,
    this.userName,
    this.fullName,
    this.email,
    required this.created,
    this.imageUrl,
    required this.scopeNames,
    required this.blocked,
  });

  factory UserInfo({
    final int? id,
    required final String userIdentifier,
    final String? userName,
    final String? fullName,
    final String? email,
    required final DateTime created,
    final String? imageUrl,
    required final List<String> scopeNames,
    required final bool blocked,
  }) = _UserInfoImpl;

  factory UserInfo.fromJson(final Map<String, dynamic> jsonSerialization) {
    return UserInfo(
      id: jsonSerialization['id'] as int?,
      userIdentifier: jsonSerialization['userIdentifier'] as String,
      userName: jsonSerialization['userName'] as String?,
      fullName: jsonSerialization['fullName'] as String?,
      email: jsonSerialization['email'] as String?,
      created: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['created']),
      imageUrl: jsonSerialization['imageUrl'] as String?,
      scopeNames: (jsonSerialization['scopeNames'] as List)
          .map((final e) => e as String)
          .toList(),
      blocked: jsonSerialization['blocked'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Unique identifier of the user, may contain different information depending
  /// on how the user was created.
  String userIdentifier;

  /// The first name of the user or the user's nickname.
  String? userName;

  /// The full name of the user.
  String? fullName;

  /// The email of the user.
  String? email;

  /// The time when this user was created.
  DateTime created;

  /// A URL to the user's avatar.
  String? imageUrl;

  /// List of scopes that this user can access.
  List<String> scopeNames;

  /// True if the user is blocked from signing in.
  bool blocked;

  /// Returns a shallow copy of this [UserInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserInfo copyWith({
    final int? id,
    final String? userIdentifier,
    final String? userName,
    final String? fullName,
    final String? email,
    final DateTime? created,
    final String? imageUrl,
    final List<String>? scopeNames,
    final bool? blocked,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userIdentifier': userIdentifier,
      if (userName != null) 'userName': userName,
      if (fullName != null) 'fullName': fullName,
      if (email != null) 'email': email,
      'created': created.toJson(),
      if (imageUrl != null) 'imageUrl': imageUrl,
      'scopeNames': scopeNames.toJson(),
      'blocked': blocked,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserInfoImpl extends UserInfo {
  _UserInfoImpl({
    final int? id,
    required final String userIdentifier,
    final String? userName,
    final String? fullName,
    final String? email,
    required final DateTime created,
    final String? imageUrl,
    required final List<String> scopeNames,
    required final bool blocked,
  }) : super._(
         id: id,
         userIdentifier: userIdentifier,
         userName: userName,
         fullName: fullName,
         email: email,
         created: created,
         imageUrl: imageUrl,
         scopeNames: scopeNames,
         blocked: blocked,
       );

  /// Returns a shallow copy of this [UserInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserInfo copyWith({
    final Object? id = _Undefined,
    final String? userIdentifier,
    final Object? userName = _Undefined,
    final Object? fullName = _Undefined,
    final Object? email = _Undefined,
    final DateTime? created,
    final Object? imageUrl = _Undefined,
    final List<String>? scopeNames,
    final bool? blocked,
  }) {
    return UserInfo(
      id: id is int? ? id : this.id,
      userIdentifier: userIdentifier ?? this.userIdentifier,
      userName: userName is String? ? userName : this.userName,
      fullName: fullName is String? ? fullName : this.fullName,
      email: email is String? ? email : this.email,
      created: created ?? this.created,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      scopeNames: scopeNames ?? this.scopeNames.map((final e0) => e0).toList(),
      blocked: blocked ?? this.blocked,
    );
  }
}
