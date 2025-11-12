/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

import 'dart:typed_data' as _i2;

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_test_server/src/generated/protocol.dart' as _i6;

import 'test_enum.dart' as _i3;
import 'test_enum_stringified.dart' as _i4;
import 'types.dart' as _i5;

abstract class TypesMap
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TypesMap._({
    this.anIntKey,
    this.aBoolKey,
    this.aDoubleKey,
    this.aDateTimeKey,
    this.aStringKey,
    this.aByteDataKey,
    this.aDurationKey,
    this.aUuidKey,
    this.aUriKey,
    this.aBigIntKey,
    this.anEnumKey,
    this.aStringifiedEnumKey,
    this.anObjectKey,
    this.aMapKey,
    this.aListKey,
    this.aRecordKey,
    this.anIntValue,
    this.aBoolValue,
    this.aDoubleValue,
    this.aDateTimeValue,
    this.aStringValue,
    this.aByteDataValue,
    this.aDurationValue,
    this.aUuidValue,
    this.aUriValue,
    this.aBigIntValue,
    this.anEnumValue,
    this.aStringifiedEnumValue,
    this.anObjectValue,
    this.aMapValue,
    this.aListValue,
    this.aRecordValue,
    this.aNullableRecordValue,
    this.aNullableRecordKey,
  });

  factory TypesMap({
    final Map<int, String>? anIntKey,
    final Map<bool, String>? aBoolKey,
    final Map<double, String>? aDoubleKey,
    final Map<DateTime, String>? aDateTimeKey,
    final Map<String, String>? aStringKey,
    final Map<_i2.ByteData, String>? aByteDataKey,
    final Map<Duration, String>? aDurationKey,
    final Map<_i1.UuidValue, String>? aUuidKey,
    final Map<Uri, String>? aUriKey,
    final Map<BigInt, String>? aBigIntKey,
    final Map<_i3.TestEnum, String>? anEnumKey,
    final Map<_i4.TestEnumStringified, String>? aStringifiedEnumKey,
    final Map<_i5.Types, String>? anObjectKey,
    final Map<Map<_i5.Types, String>, String>? aMapKey,
    final Map<List<_i5.Types>, String>? aListKey,
    final Map<(String,), String>? aRecordKey,
    final Map<String, int>? anIntValue,
    final Map<String, bool>? aBoolValue,
    final Map<String, double>? aDoubleValue,
    final Map<String, DateTime>? aDateTimeValue,
    final Map<String, String>? aStringValue,
    final Map<String, _i2.ByteData>? aByteDataValue,
    final Map<String, Duration>? aDurationValue,
    final Map<String, _i1.UuidValue>? aUuidValue,
    final Map<String, Uri>? aUriValue,
    final Map<String, BigInt>? aBigIntValue,
    final Map<String, _i3.TestEnum>? anEnumValue,
    final Map<String, _i4.TestEnumStringified>? aStringifiedEnumValue,
    final Map<String, _i5.Types>? anObjectValue,
    final Map<String, Map<String, _i5.Types>>? aMapValue,
    final Map<String, List<_i5.Types>>? aListValue,
    final Map<String, (String,)>? aRecordValue,
    final Map<String, (String,)?>? aNullableRecordValue,
    final Map<(String,)?, String>? aNullableRecordKey,
  }) = _TypesMapImpl;

  factory TypesMap.fromJson(final Map<String, dynamic> jsonSerialization) {
    return TypesMap(
      anIntKey: (jsonSerialization['anIntKey'] as List?)
          ?.fold<Map<int, String>>(
            {},
            (final t, final e) => {...t, e['k'] as int: e['v'] as String},
          ),
      aBoolKey: (jsonSerialization['aBoolKey'] as List?)
          ?.fold<Map<bool, String>>(
            {},
            (final t, final e) => {...t, e['k'] as bool: e['v'] as String},
          ),
      aDoubleKey: (jsonSerialization['aDoubleKey'] as List?)
          ?.fold<Map<double, String>>(
            {},
            (final t, final e) => {...t, (e['k'] as num).toDouble(): e['v'] as String},
          ),
      aDateTimeKey: (jsonSerialization['aDateTimeKey'] as List?)
          ?.fold<Map<DateTime, String>>(
            {},
            (final t, final e) => {
              ...t,
              _i1.DateTimeJsonExtension.fromJson(e['k']): e['v'] as String,
            },
          ),
      aStringKey: (jsonSerialization['aStringKey'] as Map?)?.map(
        (final k, final v) => MapEntry(
          k as String,
          v as String,
        ),
      ),
      aByteDataKey: (jsonSerialization['aByteDataKey'] as List?)
          ?.fold<Map<_i2.ByteData, String>>(
            {},
            (final t, final e) => {
              ...t,
              _i1.ByteDataJsonExtension.fromJson(e['k']): e['v'] as String,
            },
          ),
      aDurationKey: (jsonSerialization['aDurationKey'] as List?)
          ?.fold<Map<Duration, String>>(
            {},
            (final t, final e) => {
              ...t,
              _i1.DurationJsonExtension.fromJson(e['k']): e['v'] as String,
            },
          ),
      aUuidKey: (jsonSerialization['aUuidKey'] as List?)
          ?.fold<Map<_i1.UuidValue, String>>(
            {},
            (final t, final e) => {
              ...t,
              _i1.UuidValueJsonExtension.fromJson(e['k']): e['v'] as String,
            },
          ),
      aUriKey: (jsonSerialization['aUriKey'] as List?)?.fold<Map<Uri, String>>(
        {},
        (final t, final e) => {
          ...t,
          _i1.UriJsonExtension.fromJson(e['k']): e['v'] as String,
        },
      ),
      aBigIntKey: (jsonSerialization['aBigIntKey'] as List?)
          ?.fold<Map<BigInt, String>>(
            {},
            (final t, final e) => {
              ...t,
              _i1.BigIntJsonExtension.fromJson(e['k']): e['v'] as String,
            },
          ),
      anEnumKey: (jsonSerialization['anEnumKey'] as List?)
          ?.fold<Map<_i3.TestEnum, String>>(
            {},
            (final t, final e) => {
              ...t,
              _i3.TestEnum.fromJson((e['k'] as int)): e['v'] as String,
            },
          ),
      aStringifiedEnumKey: (jsonSerialization['aStringifiedEnumKey'] as List?)
          ?.fold<Map<_i4.TestEnumStringified, String>>(
            {},
            (final t, final e) => {
              ...t,
              _i4.TestEnumStringified.fromJson((e['k'] as String)):
                  e['v'] as String,
            },
          ),
      anObjectKey: (jsonSerialization['anObjectKey'] as List?)
          ?.fold<Map<_i5.Types, String>>(
            {},
            (final t, final e) => {
              ...t,
              _i5.Types.fromJson((e['k'] as Map<String, dynamic>)):
                  e['v'] as String,
            },
          ),
      aMapKey: (jsonSerialization['aMapKey'] as List?)
          ?.fold<Map<Map<_i5.Types, String>, String>>(
            {},
            (final t, final e) => {
              ...t,
              (e['k'] as List).fold<Map<_i5.Types, String>>(
                {},
                (final t, final e) => {
                  ...t,
                  _i5.Types.fromJson((e['k'] as Map<String, dynamic>)):
                      e['v'] as String,
                },
              ): e['v'] as String,
            },
          ),
      aListKey: (jsonSerialization['aListKey'] as List?)
          ?.fold<Map<List<_i5.Types>, String>>(
            {},
            (final t, final e) => {
              ...t,
              (e['k'] as List)
                      .map(
                        (final e) => _i5.Types.fromJson((e as Map<String, dynamic>)),
                      )
                      .toList():
                  e['v'] as String,
            },
          ),
      aRecordKey: (jsonSerialization['aRecordKey'] as List?)
          ?.fold<Map<(String,), String>>(
            {},
            (final t, final e) => {
              ...t,
              _i6.Protocol().deserialize<(String,)>(
                (e['k'] as Map<String, dynamic>),
              ): e['v'] as String,
            },
          ),
      anIntValue: (jsonSerialization['anIntValue'] as Map?)?.map(
        (final k, final v) => MapEntry(
          k as String,
          v as int,
        ),
      ),
      aBoolValue: (jsonSerialization['aBoolValue'] as Map?)?.map(
        (final k, final v) => MapEntry(
          k as String,
          v as bool,
        ),
      ),
      aDoubleValue: (jsonSerialization['aDoubleValue'] as Map?)?.map(
        (final k, final v) => MapEntry(
          k as String,
          (v as num).toDouble(),
        ),
      ),
      aDateTimeValue: (jsonSerialization['aDateTimeValue'] as Map?)?.map(
        (final k, final v) => MapEntry(
          k as String,
          _i1.DateTimeJsonExtension.fromJson(v),
        ),
      ),
      aStringValue: (jsonSerialization['aStringValue'] as Map?)?.map(
        (final k, final v) => MapEntry(
          k as String,
          v as String,
        ),
      ),
      aByteDataValue: (jsonSerialization['aByteDataValue'] as Map?)?.map(
        (final k, final v) => MapEntry(
          k as String,
          _i1.ByteDataJsonExtension.fromJson(v),
        ),
      ),
      aDurationValue: (jsonSerialization['aDurationValue'] as Map?)?.map(
        (final k, final v) => MapEntry(
          k as String,
          _i1.DurationJsonExtension.fromJson(v),
        ),
      ),
      aUuidValue: (jsonSerialization['aUuidValue'] as Map?)?.map(
        (final k, final v) => MapEntry(
          k as String,
          _i1.UuidValueJsonExtension.fromJson(v),
        ),
      ),
      aUriValue: (jsonSerialization['aUriValue'] as Map?)?.map(
        (final k, final v) => MapEntry(
          k as String,
          _i1.UriJsonExtension.fromJson(v),
        ),
      ),
      aBigIntValue: (jsonSerialization['aBigIntValue'] as Map?)?.map(
        (final k, final v) => MapEntry(
          k as String,
          _i1.BigIntJsonExtension.fromJson(v),
        ),
      ),
      anEnumValue: (jsonSerialization['anEnumValue'] as Map?)?.map(
        (final k, final v) => MapEntry(
          k as String,
          _i3.TestEnum.fromJson((v as int)),
        ),
      ),
      aStringifiedEnumValue:
          (jsonSerialization['aStringifiedEnumValue'] as Map?)?.map(
            (final k, final v) => MapEntry(
              k as String,
              _i4.TestEnumStringified.fromJson((v as String)),
            ),
          ),
      anObjectValue: (jsonSerialization['anObjectValue'] as Map?)?.map(
        (final k, final v) => MapEntry(
          k as String,
          _i5.Types.fromJson((v as Map<String, dynamic>)),
        ),
      ),
      aMapValue: (jsonSerialization['aMapValue'] as Map?)?.map(
        (final k, final v) => MapEntry(
          k as String,
          (v as Map).map(
            (final k, final v) => MapEntry(
              k as String,
              _i5.Types.fromJson((v as Map<String, dynamic>)),
            ),
          ),
        ),
      ),
      aListValue: (jsonSerialization['aListValue'] as Map?)?.map(
        (final k, final v) => MapEntry(
          k as String,
          (v as List)
              .map((final e) => _i5.Types.fromJson((e as Map<String, dynamic>)))
              .toList(),
        ),
      ),
      aRecordValue: (jsonSerialization['aRecordValue'] as Map?)?.map(
        (final k, final v) => MapEntry(
          k as String,
          _i6.Protocol().deserialize<(String,)>((v as Map<String, dynamic>)),
        ),
      ),
      aNullableRecordValue: (jsonSerialization['aNullableRecordValue'] as Map?)
          ?.map(
            (final k, final v) => MapEntry(
              k as String,
              v == null
                  ? null
                  : _i6.Protocol().deserialize<(String,)?>(
                      (v as Map<String, dynamic>),
                    ),
            ),
          ),
      aNullableRecordKey: (jsonSerialization['aNullableRecordKey'] as List?)
          ?.fold<Map<(String,)?, String>>(
            {},
            (final t, final e) => {
              ...t,
              e['k'] == null
                      ? null
                      : _i6.Protocol().deserialize<(String,)?>(
                          (e['k'] as Map<String, dynamic>),
                        ):
                  e['v'] as String,
            },
          ),
    );
  }

  Map<int, String>? anIntKey;

  Map<bool, String>? aBoolKey;

  Map<double, String>? aDoubleKey;

  Map<DateTime, String>? aDateTimeKey;

  Map<String, String>? aStringKey;

  Map<_i2.ByteData, String>? aByteDataKey;

  Map<Duration, String>? aDurationKey;

  Map<_i1.UuidValue, String>? aUuidKey;

  Map<Uri, String>? aUriKey;

  Map<BigInt, String>? aBigIntKey;

  Map<_i3.TestEnum, String>? anEnumKey;

  Map<_i4.TestEnumStringified, String>? aStringifiedEnumKey;

  Map<_i5.Types, String>? anObjectKey;

  Map<Map<_i5.Types, String>, String>? aMapKey;

  Map<List<_i5.Types>, String>? aListKey;

  Map<(String,), String>? aRecordKey;

  Map<String, int>? anIntValue;

  Map<String, bool>? aBoolValue;

  Map<String, double>? aDoubleValue;

  Map<String, DateTime>? aDateTimeValue;

  Map<String, String>? aStringValue;

  Map<String, _i2.ByteData>? aByteDataValue;

  Map<String, Duration>? aDurationValue;

  Map<String, _i1.UuidValue>? aUuidValue;

  Map<String, Uri>? aUriValue;

  Map<String, BigInt>? aBigIntValue;

  Map<String, _i3.TestEnum>? anEnumValue;

  Map<String, _i4.TestEnumStringified>? aStringifiedEnumValue;

  Map<String, _i5.Types>? anObjectValue;

  Map<String, Map<String, _i5.Types>>? aMapValue;

  Map<String, List<_i5.Types>>? aListValue;

  Map<String, (String,)>? aRecordValue;

  Map<String, (String,)?>? aNullableRecordValue;

  Map<(String,)?, String>? aNullableRecordKey;

  /// Returns a shallow copy of this [TypesMap]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TypesMap copyWith({
    final Map<int, String>? anIntKey,
    final Map<bool, String>? aBoolKey,
    final Map<double, String>? aDoubleKey,
    final Map<DateTime, String>? aDateTimeKey,
    final Map<String, String>? aStringKey,
    final Map<_i2.ByteData, String>? aByteDataKey,
    final Map<Duration, String>? aDurationKey,
    final Map<_i1.UuidValue, String>? aUuidKey,
    final Map<Uri, String>? aUriKey,
    final Map<BigInt, String>? aBigIntKey,
    final Map<_i3.TestEnum, String>? anEnumKey,
    final Map<_i4.TestEnumStringified, String>? aStringifiedEnumKey,
    final Map<_i5.Types, String>? anObjectKey,
    final Map<Map<_i5.Types, String>, String>? aMapKey,
    final Map<List<_i5.Types>, String>? aListKey,
    final Map<(String,), String>? aRecordKey,
    final Map<String, int>? anIntValue,
    final Map<String, bool>? aBoolValue,
    final Map<String, double>? aDoubleValue,
    final Map<String, DateTime>? aDateTimeValue,
    final Map<String, String>? aStringValue,
    final Map<String, _i2.ByteData>? aByteDataValue,
    final Map<String, Duration>? aDurationValue,
    final Map<String, _i1.UuidValue>? aUuidValue,
    final Map<String, Uri>? aUriValue,
    final Map<String, BigInt>? aBigIntValue,
    final Map<String, _i3.TestEnum>? anEnumValue,
    final Map<String, _i4.TestEnumStringified>? aStringifiedEnumValue,
    final Map<String, _i5.Types>? anObjectValue,
    final Map<String, Map<String, _i5.Types>>? aMapValue,
    final Map<String, List<_i5.Types>>? aListValue,
    final Map<String, (String,)>? aRecordValue,
    final Map<String, (String,)?>? aNullableRecordValue,
    final Map<(String,)?, String>? aNullableRecordKey,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (anIntKey != null) 'anIntKey': anIntKey?.toJson(),
      if (aBoolKey != null) 'aBoolKey': aBoolKey?.toJson(),
      if (aDoubleKey != null) 'aDoubleKey': aDoubleKey?.toJson(),
      if (aDateTimeKey != null)
        'aDateTimeKey': aDateTimeKey?.toJson(keyToJson: (final k) => k.toJson()),
      if (aStringKey != null) 'aStringKey': aStringKey?.toJson(),
      if (aByteDataKey != null)
        'aByteDataKey': aByteDataKey?.toJson(keyToJson: (final k) => k.toJson()),
      if (aDurationKey != null)
        'aDurationKey': aDurationKey?.toJson(keyToJson: (final k) => k.toJson()),
      if (aUuidKey != null)
        'aUuidKey': aUuidKey?.toJson(keyToJson: (final k) => k.toJson()),
      if (aUriKey != null)
        'aUriKey': aUriKey?.toJson(keyToJson: (final k) => k.toJson()),
      if (aBigIntKey != null)
        'aBigIntKey': aBigIntKey?.toJson(keyToJson: (final k) => k.toJson()),
      if (anEnumKey != null)
        'anEnumKey': anEnumKey?.toJson(keyToJson: (final k) => k.toJson()),
      if (aStringifiedEnumKey != null)
        'aStringifiedEnumKey': aStringifiedEnumKey?.toJson(
          keyToJson: (final k) => k.toJson(),
        ),
      if (anObjectKey != null)
        'anObjectKey': anObjectKey?.toJson(keyToJson: (final k) => k.toJson()),
      if (aMapKey != null)
        'aMapKey': aMapKey?.toJson(
          keyToJson: (final k) => k.toJson(keyToJson: (final k) => k.toJson()),
        ),
      if (aListKey != null)
        'aListKey': aListKey?.toJson(
          keyToJson: (final k) => k.toJson(valueToJson: (final v) => v.toJson()),
        ),
      if (aRecordKey != null) 'aRecordKey': _i6.mapContainerToJson(aRecordKey!),
      if (anIntValue != null) 'anIntValue': anIntValue?.toJson(),
      if (aBoolValue != null) 'aBoolValue': aBoolValue?.toJson(),
      if (aDoubleValue != null) 'aDoubleValue': aDoubleValue?.toJson(),
      if (aDateTimeValue != null)
        'aDateTimeValue': aDateTimeValue?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      if (aStringValue != null) 'aStringValue': aStringValue?.toJson(),
      if (aByteDataValue != null)
        'aByteDataValue': aByteDataValue?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      if (aDurationValue != null)
        'aDurationValue': aDurationValue?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      if (aUuidValue != null)
        'aUuidValue': aUuidValue?.toJson(valueToJson: (final v) => v.toJson()),
      if (aUriValue != null)
        'aUriValue': aUriValue?.toJson(valueToJson: (final v) => v.toJson()),
      if (aBigIntValue != null)
        'aBigIntValue': aBigIntValue?.toJson(valueToJson: (final v) => v.toJson()),
      if (anEnumValue != null)
        'anEnumValue': anEnumValue?.toJson(valueToJson: (final v) => v.toJson()),
      if (aStringifiedEnumValue != null)
        'aStringifiedEnumValue': aStringifiedEnumValue?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      if (anObjectValue != null)
        'anObjectValue': anObjectValue?.toJson(valueToJson: (final v) => v.toJson()),
      if (aMapValue != null)
        'aMapValue': aMapValue?.toJson(
          valueToJson: (final v) => v.toJson(valueToJson: (final v) => v.toJson()),
        ),
      if (aListValue != null)
        'aListValue': aListValue?.toJson(
          valueToJson: (final v) => v.toJson(valueToJson: (final v) => v.toJson()),
        ),
      if (aRecordValue != null)
        'aRecordValue': _i6.mapContainerToJson(aRecordValue!),
      if (aNullableRecordValue != null)
        'aNullableRecordValue': _i6.mapContainerToJson(aNullableRecordValue!),
      if (aNullableRecordKey != null)
        'aNullableRecordKey': _i6.mapContainerToJson(aNullableRecordKey!),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (anIntKey != null) 'anIntKey': anIntKey?.toJson(),
      if (aBoolKey != null) 'aBoolKey': aBoolKey?.toJson(),
      if (aDoubleKey != null) 'aDoubleKey': aDoubleKey?.toJson(),
      if (aDateTimeKey != null)
        'aDateTimeKey': aDateTimeKey?.toJson(keyToJson: (final k) => k.toJson()),
      if (aStringKey != null) 'aStringKey': aStringKey?.toJson(),
      if (aByteDataKey != null)
        'aByteDataKey': aByteDataKey?.toJson(keyToJson: (final k) => k.toJson()),
      if (aDurationKey != null)
        'aDurationKey': aDurationKey?.toJson(keyToJson: (final k) => k.toJson()),
      if (aUuidKey != null)
        'aUuidKey': aUuidKey?.toJson(keyToJson: (final k) => k.toJson()),
      if (aUriKey != null)
        'aUriKey': aUriKey?.toJson(keyToJson: (final k) => k.toJson()),
      if (aBigIntKey != null)
        'aBigIntKey': aBigIntKey?.toJson(keyToJson: (final k) => k.toJson()),
      if (anEnumKey != null)
        'anEnumKey': anEnumKey?.toJson(keyToJson: (final k) => k.toJson()),
      if (aStringifiedEnumKey != null)
        'aStringifiedEnumKey': aStringifiedEnumKey?.toJson(
          keyToJson: (final k) => k.toJson(),
        ),
      if (anObjectKey != null)
        'anObjectKey': anObjectKey?.toJson(
          keyToJson: (final k) => k.toJsonForProtocol(),
        ),
      if (aMapKey != null)
        'aMapKey': aMapKey?.toJson(
          keyToJson: (final k) => k.toJson(keyToJson: (final k) => k.toJsonForProtocol()),
        ),
      if (aListKey != null)
        'aListKey': aListKey?.toJson(
          keyToJson: (final k) => k.toJson(valueToJson: (final v) => v.toJsonForProtocol()),
        ),
      if (aRecordKey != null) 'aRecordKey': _i6.mapContainerToJson(aRecordKey!),
      if (anIntValue != null) 'anIntValue': anIntValue?.toJson(),
      if (aBoolValue != null) 'aBoolValue': aBoolValue?.toJson(),
      if (aDoubleValue != null) 'aDoubleValue': aDoubleValue?.toJson(),
      if (aDateTimeValue != null)
        'aDateTimeValue': aDateTimeValue?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      if (aStringValue != null) 'aStringValue': aStringValue?.toJson(),
      if (aByteDataValue != null)
        'aByteDataValue': aByteDataValue?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      if (aDurationValue != null)
        'aDurationValue': aDurationValue?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      if (aUuidValue != null)
        'aUuidValue': aUuidValue?.toJson(valueToJson: (final v) => v.toJson()),
      if (aUriValue != null)
        'aUriValue': aUriValue?.toJson(valueToJson: (final v) => v.toJson()),
      if (aBigIntValue != null)
        'aBigIntValue': aBigIntValue?.toJson(valueToJson: (final v) => v.toJson()),
      if (anEnumValue != null)
        'anEnumValue': anEnumValue?.toJson(valueToJson: (final v) => v.toJson()),
      if (aStringifiedEnumValue != null)
        'aStringifiedEnumValue': aStringifiedEnumValue?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      if (anObjectValue != null)
        'anObjectValue': anObjectValue?.toJson(
          valueToJson: (final v) => v.toJsonForProtocol(),
        ),
      if (aMapValue != null)
        'aMapValue': aMapValue?.toJson(
          valueToJson: (final v) =>
              v.toJson(valueToJson: (final v) => v.toJsonForProtocol()),
        ),
      if (aListValue != null)
        'aListValue': aListValue?.toJson(
          valueToJson: (final v) =>
              v.toJson(valueToJson: (final v) => v.toJsonForProtocol()),
        ),
      if (aRecordValue != null)
        'aRecordValue': _i6.mapContainerToJson(aRecordValue!),
      if (aNullableRecordValue != null)
        'aNullableRecordValue': _i6.mapContainerToJson(aNullableRecordValue!),
      if (aNullableRecordKey != null)
        'aNullableRecordKey': _i6.mapContainerToJson(aNullableRecordKey!),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TypesMapImpl extends TypesMap {
  _TypesMapImpl({
    final Map<int, String>? anIntKey,
    final Map<bool, String>? aBoolKey,
    final Map<double, String>? aDoubleKey,
    final Map<DateTime, String>? aDateTimeKey,
    final Map<String, String>? aStringKey,
    final Map<_i2.ByteData, String>? aByteDataKey,
    final Map<Duration, String>? aDurationKey,
    final Map<_i1.UuidValue, String>? aUuidKey,
    final Map<Uri, String>? aUriKey,
    final Map<BigInt, String>? aBigIntKey,
    final Map<_i3.TestEnum, String>? anEnumKey,
    final Map<_i4.TestEnumStringified, String>? aStringifiedEnumKey,
    final Map<_i5.Types, String>? anObjectKey,
    final Map<Map<_i5.Types, String>, String>? aMapKey,
    final Map<List<_i5.Types>, String>? aListKey,
    final Map<(String,), String>? aRecordKey,
    final Map<String, int>? anIntValue,
    final Map<String, bool>? aBoolValue,
    final Map<String, double>? aDoubleValue,
    final Map<String, DateTime>? aDateTimeValue,
    final Map<String, String>? aStringValue,
    final Map<String, _i2.ByteData>? aByteDataValue,
    final Map<String, Duration>? aDurationValue,
    final Map<String, _i1.UuidValue>? aUuidValue,
    final Map<String, Uri>? aUriValue,
    final Map<String, BigInt>? aBigIntValue,
    final Map<String, _i3.TestEnum>? anEnumValue,
    final Map<String, _i4.TestEnumStringified>? aStringifiedEnumValue,
    final Map<String, _i5.Types>? anObjectValue,
    final Map<String, Map<String, _i5.Types>>? aMapValue,
    final Map<String, List<_i5.Types>>? aListValue,
    final Map<String, (String,)>? aRecordValue,
    final Map<String, (String,)?>? aNullableRecordValue,
    final Map<(String,)?, String>? aNullableRecordKey,
  }) : super._(
         anIntKey: anIntKey,
         aBoolKey: aBoolKey,
         aDoubleKey: aDoubleKey,
         aDateTimeKey: aDateTimeKey,
         aStringKey: aStringKey,
         aByteDataKey: aByteDataKey,
         aDurationKey: aDurationKey,
         aUuidKey: aUuidKey,
         aUriKey: aUriKey,
         aBigIntKey: aBigIntKey,
         anEnumKey: anEnumKey,
         aStringifiedEnumKey: aStringifiedEnumKey,
         anObjectKey: anObjectKey,
         aMapKey: aMapKey,
         aListKey: aListKey,
         aRecordKey: aRecordKey,
         anIntValue: anIntValue,
         aBoolValue: aBoolValue,
         aDoubleValue: aDoubleValue,
         aDateTimeValue: aDateTimeValue,
         aStringValue: aStringValue,
         aByteDataValue: aByteDataValue,
         aDurationValue: aDurationValue,
         aUuidValue: aUuidValue,
         aUriValue: aUriValue,
         aBigIntValue: aBigIntValue,
         anEnumValue: anEnumValue,
         aStringifiedEnumValue: aStringifiedEnumValue,
         anObjectValue: anObjectValue,
         aMapValue: aMapValue,
         aListValue: aListValue,
         aRecordValue: aRecordValue,
         aNullableRecordValue: aNullableRecordValue,
         aNullableRecordKey: aNullableRecordKey,
       );

  /// Returns a shallow copy of this [TypesMap]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TypesMap copyWith({
    final Object? anIntKey = _Undefined,
    final Object? aBoolKey = _Undefined,
    final Object? aDoubleKey = _Undefined,
    final Object? aDateTimeKey = _Undefined,
    final Object? aStringKey = _Undefined,
    final Object? aByteDataKey = _Undefined,
    final Object? aDurationKey = _Undefined,
    final Object? aUuidKey = _Undefined,
    final Object? aUriKey = _Undefined,
    final Object? aBigIntKey = _Undefined,
    final Object? anEnumKey = _Undefined,
    final Object? aStringifiedEnumKey = _Undefined,
    final Object? anObjectKey = _Undefined,
    final Object? aMapKey = _Undefined,
    final Object? aListKey = _Undefined,
    final Object? aRecordKey = _Undefined,
    final Object? anIntValue = _Undefined,
    final Object? aBoolValue = _Undefined,
    final Object? aDoubleValue = _Undefined,
    final Object? aDateTimeValue = _Undefined,
    final Object? aStringValue = _Undefined,
    final Object? aByteDataValue = _Undefined,
    final Object? aDurationValue = _Undefined,
    final Object? aUuidValue = _Undefined,
    final Object? aUriValue = _Undefined,
    final Object? aBigIntValue = _Undefined,
    final Object? anEnumValue = _Undefined,
    final Object? aStringifiedEnumValue = _Undefined,
    final Object? anObjectValue = _Undefined,
    final Object? aMapValue = _Undefined,
    final Object? aListValue = _Undefined,
    final Object? aRecordValue = _Undefined,
    final Object? aNullableRecordValue = _Undefined,
    final Object? aNullableRecordKey = _Undefined,
  }) {
    return TypesMap(
      anIntKey: anIntKey is Map<int, String>?
          ? anIntKey
          : this.anIntKey?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aBoolKey: aBoolKey is Map<bool, String>?
          ? aBoolKey
          : this.aBoolKey?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aDoubleKey: aDoubleKey is Map<double, String>?
          ? aDoubleKey
          : this.aDoubleKey?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aDateTimeKey: aDateTimeKey is Map<DateTime, String>?
          ? aDateTimeKey
          : this.aDateTimeKey?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aStringKey: aStringKey is Map<String, String>?
          ? aStringKey
          : this.aStringKey?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aByteDataKey: aByteDataKey is Map<_i2.ByteData, String>?
          ? aByteDataKey
          : this.aByteDataKey?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0.clone(),
                value0,
              ),
            ),
      aDurationKey: aDurationKey is Map<Duration, String>?
          ? aDurationKey
          : this.aDurationKey?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aUuidKey: aUuidKey is Map<_i1.UuidValue, String>?
          ? aUuidKey
          : this.aUuidKey?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aUriKey: aUriKey is Map<Uri, String>?
          ? aUriKey
          : this.aUriKey?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aBigIntKey: aBigIntKey is Map<BigInt, String>?
          ? aBigIntKey
          : this.aBigIntKey?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      anEnumKey: anEnumKey is Map<_i3.TestEnum, String>?
          ? anEnumKey
          : this.anEnumKey?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aStringifiedEnumKey:
          aStringifiedEnumKey is Map<_i4.TestEnumStringified, String>?
          ? aStringifiedEnumKey
          : this.aStringifiedEnumKey?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      anObjectKey: anObjectKey is Map<_i5.Types, String>?
          ? anObjectKey
          : this.anObjectKey?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0.copyWith(),
                value0,
              ),
            ),
      aMapKey: aMapKey is Map<Map<_i5.Types, String>, String>?
          ? aMapKey
          : this.aMapKey?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0.map(
                  (
                    final key1,
                    final value1,
                  ) => MapEntry(
                    key1.copyWith(),
                    value1,
                  ),
                ),
                value0,
              ),
            ),
      aListKey: aListKey is Map<List<_i5.Types>, String>?
          ? aListKey
          : this.aListKey?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0.map((final e1) => e1.copyWith()).toList(),
                value0,
              ),
            ),
      aRecordKey: aRecordKey is Map<(String,), String>?
          ? aRecordKey
          : this.aRecordKey?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                (key0.$1,),
                value0,
              ),
            ),
      anIntValue: anIntValue is Map<String, int>?
          ? anIntValue
          : this.anIntValue?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aBoolValue: aBoolValue is Map<String, bool>?
          ? aBoolValue
          : this.aBoolValue?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aDoubleValue: aDoubleValue is Map<String, double>?
          ? aDoubleValue
          : this.aDoubleValue?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aDateTimeValue: aDateTimeValue is Map<String, DateTime>?
          ? aDateTimeValue
          : this.aDateTimeValue?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aStringValue: aStringValue is Map<String, String>?
          ? aStringValue
          : this.aStringValue?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aByteDataValue: aByteDataValue is Map<String, _i2.ByteData>?
          ? aByteDataValue
          : this.aByteDataValue?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0.clone(),
              ),
            ),
      aDurationValue: aDurationValue is Map<String, Duration>?
          ? aDurationValue
          : this.aDurationValue?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aUuidValue: aUuidValue is Map<String, _i1.UuidValue>?
          ? aUuidValue
          : this.aUuidValue?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aUriValue: aUriValue is Map<String, Uri>?
          ? aUriValue
          : this.aUriValue?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aBigIntValue: aBigIntValue is Map<String, BigInt>?
          ? aBigIntValue
          : this.aBigIntValue?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      anEnumValue: anEnumValue is Map<String, _i3.TestEnum>?
          ? anEnumValue
          : this.anEnumValue?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aStringifiedEnumValue:
          aStringifiedEnumValue is Map<String, _i4.TestEnumStringified>?
          ? aStringifiedEnumValue
          : this.aStringifiedEnumValue?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      anObjectValue: anObjectValue is Map<String, _i5.Types>?
          ? anObjectValue
          : this.anObjectValue?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0.copyWith(),
              ),
            ),
      aMapValue: aMapValue is Map<String, Map<String, _i5.Types>>?
          ? aMapValue
          : this.aMapValue?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0.map(
                  (
                    final key1,
                    final value1,
                  ) => MapEntry(
                    key1,
                    value1.copyWith(),
                  ),
                ),
              ),
            ),
      aListValue: aListValue is Map<String, List<_i5.Types>>?
          ? aListValue
          : this.aListValue?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0.map((final e1) => e1.copyWith()).toList(),
              ),
            ),
      aRecordValue: aRecordValue is Map<String, (String,)>?
          ? aRecordValue
          : this.aRecordValue?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                (value0.$1,),
              ),
            ),
      aNullableRecordValue: aNullableRecordValue is Map<String, (String,)?>?
          ? aNullableRecordValue
          : this.aNullableRecordValue?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0 == null ? null : (value0.$1,),
              ),
            ),
      aNullableRecordKey: aNullableRecordKey is Map<(String,)?, String>?
          ? aNullableRecordKey
          : this.aNullableRecordKey?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0 == null ? null : (key0.$1,),
                value0,
              ),
            ),
    );
  }
}
