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

/// An attachment to a chat message. Typically an image or a file.
abstract class ChatMessageAttachment implements _i1.SerializableModel {
  ChatMessageAttachment._({
    required this.fileName,
    required this.url,
    required this.contentType,
    this.previewImage,
    this.previewWidth,
    this.previewHeight,
  });

  factory ChatMessageAttachment({
    required final String fileName,
    required final String url,
    required final String contentType,
    final String? previewImage,
    final int? previewWidth,
    final int? previewHeight,
  }) = _ChatMessageAttachmentImpl;

  factory ChatMessageAttachment.fromJson(
    final Map<String, dynamic> jsonSerialization,
  ) {
    return ChatMessageAttachment(
      fileName: jsonSerialization['fileName'] as String,
      url: jsonSerialization['url'] as String,
      contentType: jsonSerialization['contentType'] as String,
      previewImage: jsonSerialization['previewImage'] as String?,
      previewWidth: jsonSerialization['previewWidth'] as int?,
      previewHeight: jsonSerialization['previewHeight'] as int?,
    );
  }

  /// The name of the file.
  String fileName;

  /// The URL to the file.
  String url;

  /// The content type of the file.
  String contentType;

  /// URL to an image preview of the file, if available.
  String? previewImage;

  /// The width of the image preview, if available.
  int? previewWidth;

  /// The height of the image preview, if available.
  int? previewHeight;

  /// Returns a shallow copy of this [ChatMessageAttachment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChatMessageAttachment copyWith({
    final String? fileName,
    final String? url,
    final String? contentType,
    final String? previewImage,
    final int? previewWidth,
    final int? previewHeight,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'fileName': fileName,
      'url': url,
      'contentType': contentType,
      if (previewImage != null) 'previewImage': previewImage,
      if (previewWidth != null) 'previewWidth': previewWidth,
      if (previewHeight != null) 'previewHeight': previewHeight,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChatMessageAttachmentImpl extends ChatMessageAttachment {
  _ChatMessageAttachmentImpl({
    required final String fileName,
    required final String url,
    required final String contentType,
    final String? previewImage,
    final int? previewWidth,
    final int? previewHeight,
  }) : super._(
         fileName: fileName,
         url: url,
         contentType: contentType,
         previewImage: previewImage,
         previewWidth: previewWidth,
         previewHeight: previewHeight,
       );

  /// Returns a shallow copy of this [ChatMessageAttachment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChatMessageAttachment copyWith({
    final String? fileName,
    final String? url,
    final String? contentType,
    final Object? previewImage = _Undefined,
    final Object? previewWidth = _Undefined,
    final Object? previewHeight = _Undefined,
  }) {
    return ChatMessageAttachment(
      fileName: fileName ?? this.fileName,
      url: url ?? this.url,
      contentType: contentType ?? this.contentType,
      previewImage: previewImage is String? ? previewImage : this.previewImage,
      previewWidth: previewWidth is int? ? previewWidth : this.previewWidth,
      previewHeight: previewHeight is int? ? previewHeight : this.previewHeight,
    );
  }
}
