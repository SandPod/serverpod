/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

import 'chat_message_attachment.dart' as _i3;

/// A chat message.
abstract class ChatMessage implements _i1.SerializableModel {
  ChatMessage._({
    this.id,
    required this.channel,
    required this.message,
    required this.time,
    required this.sender,
    this.senderInfo,
    required this.removed,
    this.clientMessageId,
    this.sent,
    this.attachments,
  });

  factory ChatMessage({
    final int? id,
    required final String channel,
    required final String message,
    required final DateTime time,
    required final int sender,
    final _i2.UserInfoPublic? senderInfo,
    required final bool removed,
    final int? clientMessageId,
    final bool? sent,
    final List<_i3.ChatMessageAttachment>? attachments,
  }) = _ChatMessageImpl;

  factory ChatMessage.fromJson(final Map<String, dynamic> jsonSerialization) {
    return ChatMessage(
      id: jsonSerialization['id'] as int?,
      channel: jsonSerialization['channel'] as String,
      message: jsonSerialization['message'] as String,
      time: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['time']),
      sender: jsonSerialization['sender'] as int,
      senderInfo: jsonSerialization['senderInfo'] == null
          ? null
          : _i2.UserInfoPublic.fromJson(
              (jsonSerialization['senderInfo'] as Map<String, dynamic>),
            ),
      removed: jsonSerialization['removed'] as bool,
      clientMessageId: jsonSerialization['clientMessageId'] as int?,
      sent: jsonSerialization['sent'] as bool?,
      attachments: (jsonSerialization['attachments'] as List?)
          ?.map(
            (final e) =>
                _i3.ChatMessageAttachment.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// The channel this message was posted to.
  String channel;

  /// The body of the message.
  String message;

  /// The time when this message was posted.
  DateTime time;

  /// The user id of the sender.
  int sender;

  /// Information about the sender.
  _i2.UserInfoPublic? senderInfo;

  /// True, if this message has been removed.
  bool removed;

  /// The client message id, used to track if a message has been delivered.
  int? clientMessageId;

  /// True if the message has been sent.
  bool? sent;

  /// List of attachments associated with this message.
  List<_i3.ChatMessageAttachment>? attachments;

  /// Returns a shallow copy of this [ChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChatMessage copyWith({
    final int? id,
    final String? channel,
    final String? message,
    final DateTime? time,
    final int? sender,
    final _i2.UserInfoPublic? senderInfo,
    final bool? removed,
    final int? clientMessageId,
    final bool? sent,
    final List<_i3.ChatMessageAttachment>? attachments,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'channel': channel,
      'message': message,
      'time': time.toJson(),
      'sender': sender,
      if (senderInfo != null) 'senderInfo': senderInfo?.toJson(),
      'removed': removed,
      if (clientMessageId != null) 'clientMessageId': clientMessageId,
      if (sent != null) 'sent': sent,
      if (attachments != null)
        'attachments': attachments?.toJson(valueToJson: (final v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChatMessageImpl extends ChatMessage {
  _ChatMessageImpl({
    final int? id,
    required final String channel,
    required final String message,
    required final DateTime time,
    required final int sender,
    final _i2.UserInfoPublic? senderInfo,
    required final bool removed,
    final int? clientMessageId,
    final bool? sent,
    final List<_i3.ChatMessageAttachment>? attachments,
  }) : super._(
         id: id,
         channel: channel,
         message: message,
         time: time,
         sender: sender,
         senderInfo: senderInfo,
         removed: removed,
         clientMessageId: clientMessageId,
         sent: sent,
         attachments: attachments,
       );

  /// Returns a shallow copy of this [ChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChatMessage copyWith({
    final Object? id = _Undefined,
    final String? channel,
    final String? message,
    final DateTime? time,
    final int? sender,
    final Object? senderInfo = _Undefined,
    final bool? removed,
    final Object? clientMessageId = _Undefined,
    final Object? sent = _Undefined,
    final Object? attachments = _Undefined,
  }) {
    return ChatMessage(
      id: id is int? ? id : this.id,
      channel: channel ?? this.channel,
      message: message ?? this.message,
      time: time ?? this.time,
      sender: sender ?? this.sender,
      senderInfo: senderInfo is _i2.UserInfoPublic?
          ? senderInfo
          : this.senderInfo?.copyWith(),
      removed: removed ?? this.removed,
      clientMessageId: clientMessageId is int?
          ? clientMessageId
          : this.clientMessageId,
      sent: sent is bool? ? sent : this.sent,
      attachments: attachments is List<_i3.ChatMessageAttachment>?
          ? attachments
          : this.attachments?.map((final e0) => e0.copyWith()).toList(),
    );
  }
}
