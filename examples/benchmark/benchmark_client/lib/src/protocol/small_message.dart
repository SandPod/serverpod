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
import 'small_message.dart' as _i2;

abstract class SmallMessage implements _i1.SerializableModel {
  SmallMessage._({
    this.id,
    String? message,
    this.previous,
    this.nextId,
    this.next,
  }) : message = message ?? 'This is the default message value';

  factory SmallMessage({
    int? id,
    String? message,
    _i2.SmallMessage? previous,
    int? nextId,
    _i2.SmallMessage? next,
  }) = _SmallMessageImpl;

  factory SmallMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return SmallMessage(
      id: jsonSerialization['id'] as int?,
      message: jsonSerialization['message'] as String,
      previous: jsonSerialization['previous'] == null
          ? null
          : _i2.SmallMessage.fromJson(
              (jsonSerialization['previous'] as Map<String, dynamic>)),
      nextId: jsonSerialization['nextId'] as int?,
      next: jsonSerialization['next'] == null
          ? null
          : _i2.SmallMessage.fromJson(
              (jsonSerialization['next'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String message;

  _i2.SmallMessage? previous;

  int? nextId;

  _i2.SmallMessage? next;

  /// Returns a shallow copy of this [SmallMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SmallMessage copyWith({
    int? id,
    String? message,
    _i2.SmallMessage? previous,
    int? nextId,
    _i2.SmallMessage? next,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'message': message,
      if (previous != null) 'previous': previous?.toJson(),
      if (nextId != null) 'nextId': nextId,
      if (next != null) 'next': next?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SmallMessageImpl extends SmallMessage {
  _SmallMessageImpl({
    int? id,
    String? message,
    _i2.SmallMessage? previous,
    int? nextId,
    _i2.SmallMessage? next,
  }) : super._(
          id: id,
          message: message,
          previous: previous,
          nextId: nextId,
          next: next,
        );

  /// Returns a shallow copy of this [SmallMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SmallMessage copyWith({
    Object? id = _Undefined,
    String? message,
    Object? previous = _Undefined,
    Object? nextId = _Undefined,
    Object? next = _Undefined,
  }) {
    return SmallMessage(
      id: id is int? ? id : this.id,
      message: message ?? this.message,
      previous:
          previous is _i2.SmallMessage? ? previous : this.previous?.copyWith(),
      nextId: nextId is int? ? nextId : this.nextId,
      next: next is _i2.SmallMessage? ? next : this.next?.copyWith(),
    );
  }
}
