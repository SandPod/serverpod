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
import '../scopes/serverOnly/server_only_class.dart' as _i2;

abstract class ServerOnlyClassField
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ServerOnlyClassField._({
    this.serverOnlyClassList,
    this.serverOnlyClassMap,
  });

  factory ServerOnlyClassField({
    final List<_i2.ServerOnlyClass>? serverOnlyClassList,
    final Map<String, _i2.ServerOnlyClass>? serverOnlyClassMap,
  }) = _ServerOnlyClassFieldImpl;

  factory ServerOnlyClassField.fromJson(
    final Map<String, dynamic> jsonSerialization,
  ) {
    return ServerOnlyClassField(
      serverOnlyClassList: (jsonSerialization['serverOnlyClassList'] as List?)
          ?.map(
            (final e) => _i2.ServerOnlyClass.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      serverOnlyClassMap: (jsonSerialization['serverOnlyClassMap'] as Map?)
          ?.map(
            (final k, final v) => MapEntry(
              k as String,
              _i2.ServerOnlyClass.fromJson((v as Map<String, dynamic>)),
            ),
          ),
    );
  }

  List<_i2.ServerOnlyClass>? serverOnlyClassList;

  Map<String, _i2.ServerOnlyClass>? serverOnlyClassMap;

  /// Returns a shallow copy of this [ServerOnlyClassField]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ServerOnlyClassField copyWith({
    final List<_i2.ServerOnlyClass>? serverOnlyClassList,
    final Map<String, _i2.ServerOnlyClass>? serverOnlyClassMap,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (serverOnlyClassList != null)
        'serverOnlyClassList': serverOnlyClassList?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      if (serverOnlyClassMap != null)
        'serverOnlyClassMap': serverOnlyClassMap?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ServerOnlyClassFieldImpl extends ServerOnlyClassField {
  _ServerOnlyClassFieldImpl({
    final List<_i2.ServerOnlyClass>? serverOnlyClassList,
    final Map<String, _i2.ServerOnlyClass>? serverOnlyClassMap,
  }) : super._(
         serverOnlyClassList: serverOnlyClassList,
         serverOnlyClassMap: serverOnlyClassMap,
       );

  /// Returns a shallow copy of this [ServerOnlyClassField]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ServerOnlyClassField copyWith({
    final Object? serverOnlyClassList = _Undefined,
    final Object? serverOnlyClassMap = _Undefined,
  }) {
    return ServerOnlyClassField(
      serverOnlyClassList: serverOnlyClassList is List<_i2.ServerOnlyClass>?
          ? serverOnlyClassList
          : this.serverOnlyClassList?.map((final e0) => e0.copyWith()).toList(),
      serverOnlyClassMap:
          serverOnlyClassMap is Map<String, _i2.ServerOnlyClass>?
          ? serverOnlyClassMap
          : this.serverOnlyClassMap?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0.copyWith(),
              ),
            ),
    );
  }
}
