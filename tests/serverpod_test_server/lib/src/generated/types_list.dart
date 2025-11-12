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

abstract class TypesList
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TypesList._({
    this.anInt,
    this.aBool,
    this.aDouble,
    this.aDateTime,
    this.aString,
    this.aByteData,
    this.aDuration,
    this.aUuid,
    this.aUri,
    this.aBigInt,
    this.anEnum,
    this.aStringifiedEnum,
    this.anObject,
    this.aMap,
    this.aList,
    this.aRecord,
    this.aNullableRecord,
    this.anEnumRecord,
    this.anEnum2Record,
  });

  factory TypesList({
    final List<int>? anInt,
    final List<bool>? aBool,
    final List<double>? aDouble,
    final List<DateTime>? aDateTime,
    final List<String>? aString,
    final List<_i2.ByteData>? aByteData,
    final List<Duration>? aDuration,
    final List<_i1.UuidValue>? aUuid,
    final List<Uri>? aUri,
    final List<BigInt>? aBigInt,
    final List<_i3.TestEnum>? anEnum,
    final List<_i4.TestEnumStringified>? aStringifiedEnum,
    final List<_i5.Types>? anObject,
    final List<Map<String, _i5.Types>>? aMap,
    final List<List<_i5.Types>>? aList,
    final List<(int,)>? aRecord,
    final List<(int,)?>? aNullableRecord,
    final List<(_i3.TestEnum,)>? anEnumRecord,
    final List<(_i4.TestEnumStringified,)>? anEnum2Record,
  }) = _TypesListImpl;

  factory TypesList.fromJson(final Map<String, dynamic> jsonSerialization) {
    return TypesList(
      anInt: (jsonSerialization['anInt'] as List?)
          ?.map((final e) => e as int)
          .toList(),
      aBool: (jsonSerialization['aBool'] as List?)
          ?.map((final e) => e as bool)
          .toList(),
      aDouble: (jsonSerialization['aDouble'] as List?)
          ?.map((final e) => (e as num).toDouble())
          .toList(),
      aDateTime: (jsonSerialization['aDateTime'] as List?)
          ?.map((final e) => _i1.DateTimeJsonExtension.fromJson(e))
          .toList(),
      aString: (jsonSerialization['aString'] as List?)
          ?.map((final e) => e as String)
          .toList(),
      aByteData: (jsonSerialization['aByteData'] as List?)
          ?.map((final e) => _i1.ByteDataJsonExtension.fromJson(e))
          .toList(),
      aDuration: (jsonSerialization['aDuration'] as List?)
          ?.map((final e) => _i1.DurationJsonExtension.fromJson(e))
          .toList(),
      aUuid: (jsonSerialization['aUuid'] as List?)
          ?.map((final e) => _i1.UuidValueJsonExtension.fromJson(e))
          .toList(),
      aUri: (jsonSerialization['aUri'] as List?)
          ?.map((final e) => _i1.UriJsonExtension.fromJson(e))
          .toList(),
      aBigInt: (jsonSerialization['aBigInt'] as List?)
          ?.map((final e) => _i1.BigIntJsonExtension.fromJson(e))
          .toList(),
      anEnum: (jsonSerialization['anEnum'] as List?)
          ?.map((final e) => _i3.TestEnum.fromJson((e as int)))
          .toList(),
      aStringifiedEnum: (jsonSerialization['aStringifiedEnum'] as List?)
          ?.map((final e) => _i4.TestEnumStringified.fromJson((e as String)))
          .toList(),
      anObject: (jsonSerialization['anObject'] as List?)
          ?.map((final e) => _i5.Types.fromJson((e as Map<String, dynamic>)))
          .toList(),
      aMap: (jsonSerialization['aMap'] as List?)
          ?.map(
            (final e) => (e as Map).map(
              (final k, final v) => MapEntry(
                k as String,
                _i5.Types.fromJson((v as Map<String, dynamic>)),
              ),
            ),
          )
          .toList(),
      aList: (jsonSerialization['aList'] as List?)
          ?.map(
            (final e) => (e as List)
                .map((final e) => _i5.Types.fromJson((e as Map<String, dynamic>)))
                .toList(),
          )
          .toList(),
      aRecord: (jsonSerialization['aRecord'] as List?)
          ?.map(
            (final e) =>
                _i6.Protocol().deserialize<(int,)>((e as Map<String, dynamic>)),
          )
          .toList(),
      aNullableRecord: (jsonSerialization['aNullableRecord'] as List?)
          ?.map(
            (final e) => e == null
                ? null
                : _i6.Protocol().deserialize<(int,)?>(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      anEnumRecord: (jsonSerialization['anEnumRecord'] as List?)
          ?.map(
            (final e) => _i6.Protocol().deserialize<(_i3.TestEnum,)>(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      anEnum2Record: (jsonSerialization['anEnum2Record'] as List?)
          ?.map(
            (final e) => _i6.Protocol().deserialize<(_i4.TestEnumStringified,)>(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
    );
  }

  List<int>? anInt;

  List<bool>? aBool;

  List<double>? aDouble;

  List<DateTime>? aDateTime;

  List<String>? aString;

  List<_i2.ByteData>? aByteData;

  List<Duration>? aDuration;

  List<_i1.UuidValue>? aUuid;

  List<Uri>? aUri;

  List<BigInt>? aBigInt;

  List<_i3.TestEnum>? anEnum;

  List<_i4.TestEnumStringified>? aStringifiedEnum;

  List<_i5.Types>? anObject;

  List<Map<String, _i5.Types>>? aMap;

  List<List<_i5.Types>>? aList;

  List<(int,)>? aRecord;

  List<(int,)?>? aNullableRecord;

  List<(_i3.TestEnum,)>? anEnumRecord;

  List<(_i4.TestEnumStringified,)>? anEnum2Record;

  /// Returns a shallow copy of this [TypesList]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TypesList copyWith({
    final List<int>? anInt,
    final List<bool>? aBool,
    final List<double>? aDouble,
    final List<DateTime>? aDateTime,
    final List<String>? aString,
    final List<_i2.ByteData>? aByteData,
    final List<Duration>? aDuration,
    final List<_i1.UuidValue>? aUuid,
    final List<Uri>? aUri,
    final List<BigInt>? aBigInt,
    final List<_i3.TestEnum>? anEnum,
    final List<_i4.TestEnumStringified>? aStringifiedEnum,
    final List<_i5.Types>? anObject,
    final List<Map<String, _i5.Types>>? aMap,
    final List<List<_i5.Types>>? aList,
    final List<(int,)>? aRecord,
    final List<(int,)?>? aNullableRecord,
    final List<(_i3.TestEnum,)>? anEnumRecord,
    final List<(_i4.TestEnumStringified,)>? anEnum2Record,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (anInt != null) 'anInt': anInt?.toJson(),
      if (aBool != null) 'aBool': aBool?.toJson(),
      if (aDouble != null) 'aDouble': aDouble?.toJson(),
      if (aDateTime != null)
        'aDateTime': aDateTime?.toJson(valueToJson: (final v) => v.toJson()),
      if (aString != null) 'aString': aString?.toJson(),
      if (aByteData != null)
        'aByteData': aByteData?.toJson(valueToJson: (final v) => v.toJson()),
      if (aDuration != null)
        'aDuration': aDuration?.toJson(valueToJson: (final v) => v.toJson()),
      if (aUuid != null) 'aUuid': aUuid?.toJson(valueToJson: (final v) => v.toJson()),
      if (aUri != null) 'aUri': aUri?.toJson(valueToJson: (final v) => v.toJson()),
      if (aBigInt != null)
        'aBigInt': aBigInt?.toJson(valueToJson: (final v) => v.toJson()),
      if (anEnum != null)
        'anEnum': anEnum?.toJson(valueToJson: (final v) => v.toJson()),
      if (aStringifiedEnum != null)
        'aStringifiedEnum': aStringifiedEnum?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      if (anObject != null)
        'anObject': anObject?.toJson(valueToJson: (final v) => v.toJson()),
      if (aMap != null)
        'aMap': aMap?.toJson(
          valueToJson: (final v) => v.toJson(valueToJson: (final v) => v.toJson()),
        ),
      if (aList != null)
        'aList': aList?.toJson(
          valueToJson: (final v) => v.toJson(valueToJson: (final v) => v.toJson()),
        ),
      if (aRecord != null) 'aRecord': _i6.mapContainerToJson(aRecord!),
      if (aNullableRecord != null)
        'aNullableRecord': _i6.mapContainerToJson(aNullableRecord!),
      if (anEnumRecord != null)
        'anEnumRecord': _i6.mapContainerToJson(anEnumRecord!),
      if (anEnum2Record != null)
        'anEnum2Record': _i6.mapContainerToJson(anEnum2Record!),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (anInt != null) 'anInt': anInt?.toJson(),
      if (aBool != null) 'aBool': aBool?.toJson(),
      if (aDouble != null) 'aDouble': aDouble?.toJson(),
      if (aDateTime != null)
        'aDateTime': aDateTime?.toJson(valueToJson: (final v) => v.toJson()),
      if (aString != null) 'aString': aString?.toJson(),
      if (aByteData != null)
        'aByteData': aByteData?.toJson(valueToJson: (final v) => v.toJson()),
      if (aDuration != null)
        'aDuration': aDuration?.toJson(valueToJson: (final v) => v.toJson()),
      if (aUuid != null) 'aUuid': aUuid?.toJson(valueToJson: (final v) => v.toJson()),
      if (aUri != null) 'aUri': aUri?.toJson(valueToJson: (final v) => v.toJson()),
      if (aBigInt != null)
        'aBigInt': aBigInt?.toJson(valueToJson: (final v) => v.toJson()),
      if (anEnum != null)
        'anEnum': anEnum?.toJson(valueToJson: (final v) => v.toJson()),
      if (aStringifiedEnum != null)
        'aStringifiedEnum': aStringifiedEnum?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      if (anObject != null)
        'anObject': anObject?.toJson(valueToJson: (final v) => v.toJsonForProtocol()),
      if (aMap != null)
        'aMap': aMap?.toJson(
          valueToJson: (final v) =>
              v.toJson(valueToJson: (final v) => v.toJsonForProtocol()),
        ),
      if (aList != null)
        'aList': aList?.toJson(
          valueToJson: (final v) =>
              v.toJson(valueToJson: (final v) => v.toJsonForProtocol()),
        ),
      if (aRecord != null) 'aRecord': _i6.mapContainerToJson(aRecord!),
      if (aNullableRecord != null)
        'aNullableRecord': _i6.mapContainerToJson(aNullableRecord!),
      if (anEnumRecord != null)
        'anEnumRecord': _i6.mapContainerToJson(anEnumRecord!),
      if (anEnum2Record != null)
        'anEnum2Record': _i6.mapContainerToJson(anEnum2Record!),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TypesListImpl extends TypesList {
  _TypesListImpl({
    final List<int>? anInt,
    final List<bool>? aBool,
    final List<double>? aDouble,
    final List<DateTime>? aDateTime,
    final List<String>? aString,
    final List<_i2.ByteData>? aByteData,
    final List<Duration>? aDuration,
    final List<_i1.UuidValue>? aUuid,
    final List<Uri>? aUri,
    final List<BigInt>? aBigInt,
    final List<_i3.TestEnum>? anEnum,
    final List<_i4.TestEnumStringified>? aStringifiedEnum,
    final List<_i5.Types>? anObject,
    final List<Map<String, _i5.Types>>? aMap,
    final List<List<_i5.Types>>? aList,
    final List<(int,)>? aRecord,
    final List<(int,)?>? aNullableRecord,
    final List<(_i3.TestEnum,)>? anEnumRecord,
    final List<(_i4.TestEnumStringified,)>? anEnum2Record,
  }) : super._(
         anInt: anInt,
         aBool: aBool,
         aDouble: aDouble,
         aDateTime: aDateTime,
         aString: aString,
         aByteData: aByteData,
         aDuration: aDuration,
         aUuid: aUuid,
         aUri: aUri,
         aBigInt: aBigInt,
         anEnum: anEnum,
         aStringifiedEnum: aStringifiedEnum,
         anObject: anObject,
         aMap: aMap,
         aList: aList,
         aRecord: aRecord,
         aNullableRecord: aNullableRecord,
         anEnumRecord: anEnumRecord,
         anEnum2Record: anEnum2Record,
       );

  /// Returns a shallow copy of this [TypesList]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TypesList copyWith({
    final Object? anInt = _Undefined,
    final Object? aBool = _Undefined,
    final Object? aDouble = _Undefined,
    final Object? aDateTime = _Undefined,
    final Object? aString = _Undefined,
    final Object? aByteData = _Undefined,
    final Object? aDuration = _Undefined,
    final Object? aUuid = _Undefined,
    final Object? aUri = _Undefined,
    final Object? aBigInt = _Undefined,
    final Object? anEnum = _Undefined,
    final Object? aStringifiedEnum = _Undefined,
    final Object? anObject = _Undefined,
    final Object? aMap = _Undefined,
    final Object? aList = _Undefined,
    final Object? aRecord = _Undefined,
    final Object? aNullableRecord = _Undefined,
    final Object? anEnumRecord = _Undefined,
    final Object? anEnum2Record = _Undefined,
  }) {
    return TypesList(
      anInt: anInt is List<int>? ? anInt : this.anInt?.map((final e0) => e0).toList(),
      aBool: aBool is List<bool>?
          ? aBool
          : this.aBool?.map((final e0) => e0).toList(),
      aDouble: aDouble is List<double>?
          ? aDouble
          : this.aDouble?.map((final e0) => e0).toList(),
      aDateTime: aDateTime is List<DateTime>?
          ? aDateTime
          : this.aDateTime?.map((final e0) => e0).toList(),
      aString: aString is List<String>?
          ? aString
          : this.aString?.map((final e0) => e0).toList(),
      aByteData: aByteData is List<_i2.ByteData>?
          ? aByteData
          : this.aByteData?.map((final e0) => e0.clone()).toList(),
      aDuration: aDuration is List<Duration>?
          ? aDuration
          : this.aDuration?.map((final e0) => e0).toList(),
      aUuid: aUuid is List<_i1.UuidValue>?
          ? aUuid
          : this.aUuid?.map((final e0) => e0).toList(),
      aUri: aUri is List<Uri>? ? aUri : this.aUri?.map((final e0) => e0).toList(),
      aBigInt: aBigInt is List<BigInt>?
          ? aBigInt
          : this.aBigInt?.map((final e0) => e0).toList(),
      anEnum: anEnum is List<_i3.TestEnum>?
          ? anEnum
          : this.anEnum?.map((final e0) => e0).toList(),
      aStringifiedEnum: aStringifiedEnum is List<_i4.TestEnumStringified>?
          ? aStringifiedEnum
          : this.aStringifiedEnum?.map((final e0) => e0).toList(),
      anObject: anObject is List<_i5.Types>?
          ? anObject
          : this.anObject?.map((final e0) => e0.copyWith()).toList(),
      aMap: aMap is List<Map<String, _i5.Types>>?
          ? aMap
          : this.aMap
                ?.map(
                  (final e0) => e0.map(
                    (
                      final key1,
                      final value1,
                    ) => MapEntry(
                      key1,
                      value1.copyWith(),
                    ),
                  ),
                )
                .toList(),
      aList: aList is List<List<_i5.Types>>?
          ? aList
          : this.aList
                ?.map((final e0) => e0.map((final e1) => e1.copyWith()).toList())
                .toList(),
      aRecord: aRecord is List<(int,)>?
          ? aRecord
          : this.aRecord?.map((final e0) => (e0.$1,)).toList(),
      aNullableRecord: aNullableRecord is List<(int,)?>?
          ? aNullableRecord
          : this.aNullableRecord
                ?.map((final e0) => e0 == null ? null : (e0.$1,))
                .toList(),
      anEnumRecord: anEnumRecord is List<(_i3.TestEnum,)>?
          ? anEnumRecord
          : this.anEnumRecord?.map((final e0) => (e0.$1,)).toList(),
      anEnum2Record: anEnum2Record is List<(_i4.TestEnumStringified,)>?
          ? anEnum2Record
          : this.anEnum2Record?.map((final e0) => (e0.$1,)).toList(),
    );
  }
}
