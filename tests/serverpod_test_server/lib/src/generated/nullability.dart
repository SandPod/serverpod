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

import 'simple_data.dart' as _i3;

abstract class Nullability
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  Nullability._({
    required this.anInt,
    this.aNullableInt,
    required this.aDouble,
    this.aNullableDouble,
    required this.aBool,
    this.aNullableBool,
    required this.aString,
    this.aNullableString,
    required this.aDateTime,
    this.aNullableDateTime,
    required this.aByteData,
    this.aNullableByteData,
    required this.aDuration,
    this.aNullableDuration,
    required this.aUuid,
    this.aNullableUuid,
    required this.anObject,
    this.aNullableObject,
    required this.anIntList,
    this.aNullableIntList,
    required this.aListWithNullableInts,
    this.aNullableListWithNullableInts,
    required this.anObjectList,
    this.aNullableObjectList,
    required this.aListWithNullableObjects,
    this.aNullableListWithNullableObjects,
    required this.aDateTimeList,
    this.aNullableDateTimeList,
    required this.aListWithNullableDateTimes,
    this.aNullableListWithNullableDateTimes,
    required this.aByteDataList,
    this.aNullableByteDataList,
    required this.aListWithNullableByteDatas,
    this.aNullableListWithNullableByteDatas,
    required this.aDurationList,
    this.aNullableDurationList,
    required this.aListWithNullableDurations,
    this.aNullableListWithNullableDurations,
    required this.aUuidList,
    this.aNullableUuidList,
    required this.aListWithNullableUuids,
    this.aNullableListWithNullableUuids,
    required this.anIntMap,
    this.aNullableIntMap,
    required this.aMapWithNullableInts,
    this.aNullableMapWithNullableInts,
  });

  factory Nullability({
    required final int anInt,
    final int? aNullableInt,
    required final double aDouble,
    final double? aNullableDouble,
    required final bool aBool,
    final bool? aNullableBool,
    required final String aString,
    final String? aNullableString,
    required final DateTime aDateTime,
    final DateTime? aNullableDateTime,
    required final _i2.ByteData aByteData,
    final _i2.ByteData? aNullableByteData,
    required final Duration aDuration,
    final Duration? aNullableDuration,
    required final _i1.UuidValue aUuid,
    final _i1.UuidValue? aNullableUuid,
    required final _i3.SimpleData anObject,
    final _i3.SimpleData? aNullableObject,
    required final List<int> anIntList,
    final List<int>? aNullableIntList,
    required final List<int?> aListWithNullableInts,
    final List<int?>? aNullableListWithNullableInts,
    required final List<_i3.SimpleData> anObjectList,
    final List<_i3.SimpleData>? aNullableObjectList,
    required final List<_i3.SimpleData?> aListWithNullableObjects,
    final List<_i3.SimpleData?>? aNullableListWithNullableObjects,
    required final List<DateTime> aDateTimeList,
    final List<DateTime>? aNullableDateTimeList,
    required final List<DateTime?> aListWithNullableDateTimes,
    final List<DateTime?>? aNullableListWithNullableDateTimes,
    required final List<_i2.ByteData> aByteDataList,
    final List<_i2.ByteData>? aNullableByteDataList,
    required final List<_i2.ByteData?> aListWithNullableByteDatas,
    final List<_i2.ByteData?>? aNullableListWithNullableByteDatas,
    required final List<Duration> aDurationList,
    final List<Duration>? aNullableDurationList,
    required final List<Duration?> aListWithNullableDurations,
    final List<Duration?>? aNullableListWithNullableDurations,
    required final List<_i1.UuidValue> aUuidList,
    final List<_i1.UuidValue>? aNullableUuidList,
    required final List<_i1.UuidValue?> aListWithNullableUuids,
    final List<_i1.UuidValue?>? aNullableListWithNullableUuids,
    required final Map<String, int> anIntMap,
    final Map<String, int>? aNullableIntMap,
    required final Map<String, int?> aMapWithNullableInts,
    final Map<String, int?>? aNullableMapWithNullableInts,
  }) = _NullabilityImpl;

  factory Nullability.fromJson(final Map<String, dynamic> jsonSerialization) {
    return Nullability(
      anInt: jsonSerialization['anInt'] as int,
      aNullableInt: jsonSerialization['aNullableInt'] as int?,
      aDouble: (jsonSerialization['aDouble'] as num).toDouble(),
      aNullableDouble: (jsonSerialization['aNullableDouble'] as num?)
          ?.toDouble(),
      aBool: jsonSerialization['aBool'] as bool,
      aNullableBool: jsonSerialization['aNullableBool'] as bool?,
      aString: jsonSerialization['aString'] as String,
      aNullableString: jsonSerialization['aNullableString'] as String?,
      aDateTime: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['aDateTime'],
      ),
      aNullableDateTime: jsonSerialization['aNullableDateTime'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['aNullableDateTime'],
            ),
      aByteData: _i1.ByteDataJsonExtension.fromJson(
        jsonSerialization['aByteData'],
      ),
      aNullableByteData: jsonSerialization['aNullableByteData'] == null
          ? null
          : _i1.ByteDataJsonExtension.fromJson(
              jsonSerialization['aNullableByteData'],
            ),
      aDuration: _i1.DurationJsonExtension.fromJson(
        jsonSerialization['aDuration'],
      ),
      aNullableDuration: jsonSerialization['aNullableDuration'] == null
          ? null
          : _i1.DurationJsonExtension.fromJson(
              jsonSerialization['aNullableDuration'],
            ),
      aUuid: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['aUuid']),
      aNullableUuid: jsonSerialization['aNullableUuid'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['aNullableUuid'],
            ),
      anObject: _i3.SimpleData.fromJson(
        (jsonSerialization['anObject'] as Map<String, dynamic>),
      ),
      aNullableObject: jsonSerialization['aNullableObject'] == null
          ? null
          : _i3.SimpleData.fromJson(
              (jsonSerialization['aNullableObject'] as Map<String, dynamic>),
            ),
      anIntList: (jsonSerialization['anIntList'] as List)
          .map((final e) => e as int)
          .toList(),
      aNullableIntList: (jsonSerialization['aNullableIntList'] as List?)
          ?.map((final e) => e as int)
          .toList(),
      aListWithNullableInts:
          (jsonSerialization['aListWithNullableInts'] as List)
              .map((final e) => e as int?)
              .toList(),
      aNullableListWithNullableInts:
          (jsonSerialization['aNullableListWithNullableInts'] as List?)
              ?.map((final e) => e as int?)
              .toList(),
      anObjectList: (jsonSerialization['anObjectList'] as List)
          .map((final e) => _i3.SimpleData.fromJson((e as Map<String, dynamic>)))
          .toList(),
      aNullableObjectList: (jsonSerialization['aNullableObjectList'] as List?)
          ?.map((final e) => _i3.SimpleData.fromJson((e as Map<String, dynamic>)))
          .toList(),
      aListWithNullableObjects:
          (jsonSerialization['aListWithNullableObjects'] as List)
              .map(
                (final e) => e == null
                    ? null
                    : _i3.SimpleData.fromJson((e as Map<String, dynamic>)),
              )
              .toList(),
      aNullableListWithNullableObjects:
          (jsonSerialization['aNullableListWithNullableObjects'] as List?)
              ?.map(
                (final e) => e == null
                    ? null
                    : _i3.SimpleData.fromJson((e as Map<String, dynamic>)),
              )
              .toList(),
      aDateTimeList: (jsonSerialization['aDateTimeList'] as List)
          .map((final e) => _i1.DateTimeJsonExtension.fromJson(e))
          .toList(),
      aNullableDateTimeList:
          (jsonSerialization['aNullableDateTimeList'] as List?)
              ?.map((final e) => _i1.DateTimeJsonExtension.fromJson(e))
              .toList(),
      aListWithNullableDateTimes:
          (jsonSerialization['aListWithNullableDateTimes'] as List)
              .map(
                (final e) => e == null ? null : _i1.DateTimeJsonExtension.fromJson(e),
              )
              .toList(),
      aNullableListWithNullableDateTimes:
          (jsonSerialization['aNullableListWithNullableDateTimes'] as List?)
              ?.map(
                (final e) => e == null ? null : _i1.DateTimeJsonExtension.fromJson(e),
              )
              .toList(),
      aByteDataList: (jsonSerialization['aByteDataList'] as List)
          .map((final e) => _i1.ByteDataJsonExtension.fromJson(e))
          .toList(),
      aNullableByteDataList:
          (jsonSerialization['aNullableByteDataList'] as List?)
              ?.map((final e) => _i1.ByteDataJsonExtension.fromJson(e))
              .toList(),
      aListWithNullableByteDatas:
          (jsonSerialization['aListWithNullableByteDatas'] as List)
              .map(
                (final e) => e == null ? null : _i1.ByteDataJsonExtension.fromJson(e),
              )
              .toList(),
      aNullableListWithNullableByteDatas:
          (jsonSerialization['aNullableListWithNullableByteDatas'] as List?)
              ?.map(
                (final e) => e == null ? null : _i1.ByteDataJsonExtension.fromJson(e),
              )
              .toList(),
      aDurationList: (jsonSerialization['aDurationList'] as List)
          .map((final e) => _i1.DurationJsonExtension.fromJson(e))
          .toList(),
      aNullableDurationList:
          (jsonSerialization['aNullableDurationList'] as List?)
              ?.map((final e) => _i1.DurationJsonExtension.fromJson(e))
              .toList(),
      aListWithNullableDurations:
          (jsonSerialization['aListWithNullableDurations'] as List)
              .map(
                (final e) => e == null ? null : _i1.DurationJsonExtension.fromJson(e),
              )
              .toList(),
      aNullableListWithNullableDurations:
          (jsonSerialization['aNullableListWithNullableDurations'] as List?)
              ?.map(
                (final e) => e == null ? null : _i1.DurationJsonExtension.fromJson(e),
              )
              .toList(),
      aUuidList: (jsonSerialization['aUuidList'] as List)
          .map((final e) => _i1.UuidValueJsonExtension.fromJson(e))
          .toList(),
      aNullableUuidList: (jsonSerialization['aNullableUuidList'] as List?)
          ?.map((final e) => _i1.UuidValueJsonExtension.fromJson(e))
          .toList(),
      aListWithNullableUuids:
          (jsonSerialization['aListWithNullableUuids'] as List)
              .map(
                (final e) =>
                    e == null ? null : _i1.UuidValueJsonExtension.fromJson(e),
              )
              .toList(),
      aNullableListWithNullableUuids:
          (jsonSerialization['aNullableListWithNullableUuids'] as List?)
              ?.map(
                (final e) =>
                    e == null ? null : _i1.UuidValueJsonExtension.fromJson(e),
              )
              .toList(),
      anIntMap: (jsonSerialization['anIntMap'] as Map).map(
        (final k, final v) => MapEntry(
          k as String,
          v as int,
        ),
      ),
      aNullableIntMap: (jsonSerialization['aNullableIntMap'] as Map?)?.map(
        (final k, final v) => MapEntry(
          k as String,
          v as int,
        ),
      ),
      aMapWithNullableInts: (jsonSerialization['aMapWithNullableInts'] as Map)
          .map(
            (final k, final v) => MapEntry(
              k as String,
              v as int?,
            ),
          ),
      aNullableMapWithNullableInts:
          (jsonSerialization['aNullableMapWithNullableInts'] as Map?)?.map(
            (final k, final v) => MapEntry(
              k as String,
              v as int?,
            ),
          ),
    );
  }

  int anInt;

  int? aNullableInt;

  double aDouble;

  double? aNullableDouble;

  bool aBool;

  bool? aNullableBool;

  String aString;

  String? aNullableString;

  DateTime aDateTime;

  DateTime? aNullableDateTime;

  _i2.ByteData aByteData;

  _i2.ByteData? aNullableByteData;

  Duration aDuration;

  Duration? aNullableDuration;

  _i1.UuidValue aUuid;

  _i1.UuidValue? aNullableUuid;

  _i3.SimpleData anObject;

  _i3.SimpleData? aNullableObject;

  List<int> anIntList;

  List<int>? aNullableIntList;

  List<int?> aListWithNullableInts;

  List<int?>? aNullableListWithNullableInts;

  List<_i3.SimpleData> anObjectList;

  List<_i3.SimpleData>? aNullableObjectList;

  List<_i3.SimpleData?> aListWithNullableObjects;

  List<_i3.SimpleData?>? aNullableListWithNullableObjects;

  List<DateTime> aDateTimeList;

  List<DateTime>? aNullableDateTimeList;

  List<DateTime?> aListWithNullableDateTimes;

  List<DateTime?>? aNullableListWithNullableDateTimes;

  List<_i2.ByteData> aByteDataList;

  List<_i2.ByteData>? aNullableByteDataList;

  List<_i2.ByteData?> aListWithNullableByteDatas;

  List<_i2.ByteData?>? aNullableListWithNullableByteDatas;

  List<Duration> aDurationList;

  List<Duration>? aNullableDurationList;

  List<Duration?> aListWithNullableDurations;

  List<Duration?>? aNullableListWithNullableDurations;

  List<_i1.UuidValue> aUuidList;

  List<_i1.UuidValue>? aNullableUuidList;

  List<_i1.UuidValue?> aListWithNullableUuids;

  List<_i1.UuidValue?>? aNullableListWithNullableUuids;

  Map<String, int> anIntMap;

  Map<String, int>? aNullableIntMap;

  Map<String, int?> aMapWithNullableInts;

  Map<String, int?>? aNullableMapWithNullableInts;

  /// Returns a shallow copy of this [Nullability]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Nullability copyWith({
    final int? anInt,
    final int? aNullableInt,
    final double? aDouble,
    final double? aNullableDouble,
    final bool? aBool,
    final bool? aNullableBool,
    final String? aString,
    final String? aNullableString,
    final DateTime? aDateTime,
    final DateTime? aNullableDateTime,
    final _i2.ByteData? aByteData,
    final _i2.ByteData? aNullableByteData,
    final Duration? aDuration,
    final Duration? aNullableDuration,
    final _i1.UuidValue? aUuid,
    final _i1.UuidValue? aNullableUuid,
    final _i3.SimpleData? anObject,
    final _i3.SimpleData? aNullableObject,
    final List<int>? anIntList,
    final List<int>? aNullableIntList,
    final List<int?>? aListWithNullableInts,
    final List<int?>? aNullableListWithNullableInts,
    final List<_i3.SimpleData>? anObjectList,
    final List<_i3.SimpleData>? aNullableObjectList,
    final List<_i3.SimpleData?>? aListWithNullableObjects,
    final List<_i3.SimpleData?>? aNullableListWithNullableObjects,
    final List<DateTime>? aDateTimeList,
    final List<DateTime>? aNullableDateTimeList,
    final List<DateTime?>? aListWithNullableDateTimes,
    final List<DateTime?>? aNullableListWithNullableDateTimes,
    final List<_i2.ByteData>? aByteDataList,
    final List<_i2.ByteData>? aNullableByteDataList,
    final List<_i2.ByteData?>? aListWithNullableByteDatas,
    final List<_i2.ByteData?>? aNullableListWithNullableByteDatas,
    final List<Duration>? aDurationList,
    final List<Duration>? aNullableDurationList,
    final List<Duration?>? aListWithNullableDurations,
    final List<Duration?>? aNullableListWithNullableDurations,
    final List<_i1.UuidValue>? aUuidList,
    final List<_i1.UuidValue>? aNullableUuidList,
    final List<_i1.UuidValue?>? aListWithNullableUuids,
    final List<_i1.UuidValue?>? aNullableListWithNullableUuids,
    final Map<String, int>? anIntMap,
    final Map<String, int>? aNullableIntMap,
    final Map<String, int?>? aMapWithNullableInts,
    final Map<String, int?>? aNullableMapWithNullableInts,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'anInt': anInt,
      if (aNullableInt != null) 'aNullableInt': aNullableInt,
      'aDouble': aDouble,
      if (aNullableDouble != null) 'aNullableDouble': aNullableDouble,
      'aBool': aBool,
      if (aNullableBool != null) 'aNullableBool': aNullableBool,
      'aString': aString,
      if (aNullableString != null) 'aNullableString': aNullableString,
      'aDateTime': aDateTime.toJson(),
      if (aNullableDateTime != null)
        'aNullableDateTime': aNullableDateTime?.toJson(),
      'aByteData': aByteData.toJson(),
      if (aNullableByteData != null)
        'aNullableByteData': aNullableByteData?.toJson(),
      'aDuration': aDuration.toJson(),
      if (aNullableDuration != null)
        'aNullableDuration': aNullableDuration?.toJson(),
      'aUuid': aUuid.toJson(),
      if (aNullableUuid != null) 'aNullableUuid': aNullableUuid?.toJson(),
      'anObject': anObject.toJson(),
      if (aNullableObject != null) 'aNullableObject': aNullableObject?.toJson(),
      'anIntList': anIntList.toJson(),
      if (aNullableIntList != null)
        'aNullableIntList': aNullableIntList?.toJson(),
      'aListWithNullableInts': aListWithNullableInts.toJson(),
      if (aNullableListWithNullableInts != null)
        'aNullableListWithNullableInts': aNullableListWithNullableInts
            ?.toJson(),
      'anObjectList': anObjectList.toJson(valueToJson: (final v) => v.toJson()),
      if (aNullableObjectList != null)
        'aNullableObjectList': aNullableObjectList?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      'aListWithNullableObjects': aListWithNullableObjects.toJson(
        valueToJson: (final v) => v?.toJson(),
      ),
      if (aNullableListWithNullableObjects != null)
        'aNullableListWithNullableObjects': aNullableListWithNullableObjects
            ?.toJson(valueToJson: (final v) => v?.toJson()),
      'aDateTimeList': aDateTimeList.toJson(valueToJson: (final v) => v.toJson()),
      if (aNullableDateTimeList != null)
        'aNullableDateTimeList': aNullableDateTimeList?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      'aListWithNullableDateTimes': aListWithNullableDateTimes.toJson(
        valueToJson: (final v) => v?.toJson(),
      ),
      if (aNullableListWithNullableDateTimes != null)
        'aNullableListWithNullableDateTimes': aNullableListWithNullableDateTimes
            ?.toJson(valueToJson: (final v) => v?.toJson()),
      'aByteDataList': aByteDataList.toJson(valueToJson: (final v) => v.toJson()),
      if (aNullableByteDataList != null)
        'aNullableByteDataList': aNullableByteDataList?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      'aListWithNullableByteDatas': aListWithNullableByteDatas.toJson(
        valueToJson: (final v) => v?.toJson(),
      ),
      if (aNullableListWithNullableByteDatas != null)
        'aNullableListWithNullableByteDatas': aNullableListWithNullableByteDatas
            ?.toJson(valueToJson: (final v) => v?.toJson()),
      'aDurationList': aDurationList.toJson(valueToJson: (final v) => v.toJson()),
      if (aNullableDurationList != null)
        'aNullableDurationList': aNullableDurationList?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      'aListWithNullableDurations': aListWithNullableDurations.toJson(
        valueToJson: (final v) => v?.toJson(),
      ),
      if (aNullableListWithNullableDurations != null)
        'aNullableListWithNullableDurations': aNullableListWithNullableDurations
            ?.toJson(valueToJson: (final v) => v?.toJson()),
      'aUuidList': aUuidList.toJson(valueToJson: (final v) => v.toJson()),
      if (aNullableUuidList != null)
        'aNullableUuidList': aNullableUuidList?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      'aListWithNullableUuids': aListWithNullableUuids.toJson(
        valueToJson: (final v) => v?.toJson(),
      ),
      if (aNullableListWithNullableUuids != null)
        'aNullableListWithNullableUuids': aNullableListWithNullableUuids
            ?.toJson(valueToJson: (final v) => v?.toJson()),
      'anIntMap': anIntMap.toJson(),
      if (aNullableIntMap != null) 'aNullableIntMap': aNullableIntMap?.toJson(),
      'aMapWithNullableInts': aMapWithNullableInts.toJson(),
      if (aNullableMapWithNullableInts != null)
        'aNullableMapWithNullableInts': aNullableMapWithNullableInts?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'anInt': anInt,
      if (aNullableInt != null) 'aNullableInt': aNullableInt,
      'aDouble': aDouble,
      if (aNullableDouble != null) 'aNullableDouble': aNullableDouble,
      'aBool': aBool,
      if (aNullableBool != null) 'aNullableBool': aNullableBool,
      'aString': aString,
      if (aNullableString != null) 'aNullableString': aNullableString,
      'aDateTime': aDateTime.toJson(),
      if (aNullableDateTime != null)
        'aNullableDateTime': aNullableDateTime?.toJson(),
      'aByteData': aByteData.toJson(),
      if (aNullableByteData != null)
        'aNullableByteData': aNullableByteData?.toJson(),
      'aDuration': aDuration.toJson(),
      if (aNullableDuration != null)
        'aNullableDuration': aNullableDuration?.toJson(),
      'aUuid': aUuid.toJson(),
      if (aNullableUuid != null) 'aNullableUuid': aNullableUuid?.toJson(),
      'anObject': anObject.toJsonForProtocol(),
      if (aNullableObject != null)
        'aNullableObject': aNullableObject?.toJsonForProtocol(),
      'anIntList': anIntList.toJson(),
      if (aNullableIntList != null)
        'aNullableIntList': aNullableIntList?.toJson(),
      'aListWithNullableInts': aListWithNullableInts.toJson(),
      if (aNullableListWithNullableInts != null)
        'aNullableListWithNullableInts': aNullableListWithNullableInts
            ?.toJson(),
      'anObjectList': anObjectList.toJson(
        valueToJson: (final v) => v.toJsonForProtocol(),
      ),
      if (aNullableObjectList != null)
        'aNullableObjectList': aNullableObjectList?.toJson(
          valueToJson: (final v) => v.toJsonForProtocol(),
        ),
      'aListWithNullableObjects': aListWithNullableObjects.toJson(
        valueToJson: (final v) => v?.toJsonForProtocol(),
      ),
      if (aNullableListWithNullableObjects != null)
        'aNullableListWithNullableObjects': aNullableListWithNullableObjects
            ?.toJson(valueToJson: (final v) => v?.toJsonForProtocol()),
      'aDateTimeList': aDateTimeList.toJson(valueToJson: (final v) => v.toJson()),
      if (aNullableDateTimeList != null)
        'aNullableDateTimeList': aNullableDateTimeList?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      'aListWithNullableDateTimes': aListWithNullableDateTimes.toJson(
        valueToJson: (final v) => v?.toJson(),
      ),
      if (aNullableListWithNullableDateTimes != null)
        'aNullableListWithNullableDateTimes': aNullableListWithNullableDateTimes
            ?.toJson(valueToJson: (final v) => v?.toJson()),
      'aByteDataList': aByteDataList.toJson(valueToJson: (final v) => v.toJson()),
      if (aNullableByteDataList != null)
        'aNullableByteDataList': aNullableByteDataList?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      'aListWithNullableByteDatas': aListWithNullableByteDatas.toJson(
        valueToJson: (final v) => v?.toJson(),
      ),
      if (aNullableListWithNullableByteDatas != null)
        'aNullableListWithNullableByteDatas': aNullableListWithNullableByteDatas
            ?.toJson(valueToJson: (final v) => v?.toJson()),
      'aDurationList': aDurationList.toJson(valueToJson: (final v) => v.toJson()),
      if (aNullableDurationList != null)
        'aNullableDurationList': aNullableDurationList?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      'aListWithNullableDurations': aListWithNullableDurations.toJson(
        valueToJson: (final v) => v?.toJson(),
      ),
      if (aNullableListWithNullableDurations != null)
        'aNullableListWithNullableDurations': aNullableListWithNullableDurations
            ?.toJson(valueToJson: (final v) => v?.toJson()),
      'aUuidList': aUuidList.toJson(valueToJson: (final v) => v.toJson()),
      if (aNullableUuidList != null)
        'aNullableUuidList': aNullableUuidList?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
      'aListWithNullableUuids': aListWithNullableUuids.toJson(
        valueToJson: (final v) => v?.toJson(),
      ),
      if (aNullableListWithNullableUuids != null)
        'aNullableListWithNullableUuids': aNullableListWithNullableUuids
            ?.toJson(valueToJson: (final v) => v?.toJson()),
      'anIntMap': anIntMap.toJson(),
      if (aNullableIntMap != null) 'aNullableIntMap': aNullableIntMap?.toJson(),
      'aMapWithNullableInts': aMapWithNullableInts.toJson(),
      if (aNullableMapWithNullableInts != null)
        'aNullableMapWithNullableInts': aNullableMapWithNullableInts?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NullabilityImpl extends Nullability {
  _NullabilityImpl({
    required final int anInt,
    final int? aNullableInt,
    required final double aDouble,
    final double? aNullableDouble,
    required final bool aBool,
    final bool? aNullableBool,
    required final String aString,
    final String? aNullableString,
    required final DateTime aDateTime,
    final DateTime? aNullableDateTime,
    required final _i2.ByteData aByteData,
    final _i2.ByteData? aNullableByteData,
    required final Duration aDuration,
    final Duration? aNullableDuration,
    required final _i1.UuidValue aUuid,
    final _i1.UuidValue? aNullableUuid,
    required final _i3.SimpleData anObject,
    final _i3.SimpleData? aNullableObject,
    required final List<int> anIntList,
    final List<int>? aNullableIntList,
    required final List<int?> aListWithNullableInts,
    final List<int?>? aNullableListWithNullableInts,
    required final List<_i3.SimpleData> anObjectList,
    final List<_i3.SimpleData>? aNullableObjectList,
    required final List<_i3.SimpleData?> aListWithNullableObjects,
    final List<_i3.SimpleData?>? aNullableListWithNullableObjects,
    required final List<DateTime> aDateTimeList,
    final List<DateTime>? aNullableDateTimeList,
    required final List<DateTime?> aListWithNullableDateTimes,
    final List<DateTime?>? aNullableListWithNullableDateTimes,
    required final List<_i2.ByteData> aByteDataList,
    final List<_i2.ByteData>? aNullableByteDataList,
    required final List<_i2.ByteData?> aListWithNullableByteDatas,
    final List<_i2.ByteData?>? aNullableListWithNullableByteDatas,
    required final List<Duration> aDurationList,
    final List<Duration>? aNullableDurationList,
    required final List<Duration?> aListWithNullableDurations,
    final List<Duration?>? aNullableListWithNullableDurations,
    required final List<_i1.UuidValue> aUuidList,
    final List<_i1.UuidValue>? aNullableUuidList,
    required final List<_i1.UuidValue?> aListWithNullableUuids,
    final List<_i1.UuidValue?>? aNullableListWithNullableUuids,
    required final Map<String, int> anIntMap,
    final Map<String, int>? aNullableIntMap,
    required final Map<String, int?> aMapWithNullableInts,
    final Map<String, int?>? aNullableMapWithNullableInts,
  }) : super._(
         anInt: anInt,
         aNullableInt: aNullableInt,
         aDouble: aDouble,
         aNullableDouble: aNullableDouble,
         aBool: aBool,
         aNullableBool: aNullableBool,
         aString: aString,
         aNullableString: aNullableString,
         aDateTime: aDateTime,
         aNullableDateTime: aNullableDateTime,
         aByteData: aByteData,
         aNullableByteData: aNullableByteData,
         aDuration: aDuration,
         aNullableDuration: aNullableDuration,
         aUuid: aUuid,
         aNullableUuid: aNullableUuid,
         anObject: anObject,
         aNullableObject: aNullableObject,
         anIntList: anIntList,
         aNullableIntList: aNullableIntList,
         aListWithNullableInts: aListWithNullableInts,
         aNullableListWithNullableInts: aNullableListWithNullableInts,
         anObjectList: anObjectList,
         aNullableObjectList: aNullableObjectList,
         aListWithNullableObjects: aListWithNullableObjects,
         aNullableListWithNullableObjects: aNullableListWithNullableObjects,
         aDateTimeList: aDateTimeList,
         aNullableDateTimeList: aNullableDateTimeList,
         aListWithNullableDateTimes: aListWithNullableDateTimes,
         aNullableListWithNullableDateTimes: aNullableListWithNullableDateTimes,
         aByteDataList: aByteDataList,
         aNullableByteDataList: aNullableByteDataList,
         aListWithNullableByteDatas: aListWithNullableByteDatas,
         aNullableListWithNullableByteDatas: aNullableListWithNullableByteDatas,
         aDurationList: aDurationList,
         aNullableDurationList: aNullableDurationList,
         aListWithNullableDurations: aListWithNullableDurations,
         aNullableListWithNullableDurations: aNullableListWithNullableDurations,
         aUuidList: aUuidList,
         aNullableUuidList: aNullableUuidList,
         aListWithNullableUuids: aListWithNullableUuids,
         aNullableListWithNullableUuids: aNullableListWithNullableUuids,
         anIntMap: anIntMap,
         aNullableIntMap: aNullableIntMap,
         aMapWithNullableInts: aMapWithNullableInts,
         aNullableMapWithNullableInts: aNullableMapWithNullableInts,
       );

  /// Returns a shallow copy of this [Nullability]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Nullability copyWith({
    final int? anInt,
    final Object? aNullableInt = _Undefined,
    final double? aDouble,
    final Object? aNullableDouble = _Undefined,
    final bool? aBool,
    final Object? aNullableBool = _Undefined,
    final String? aString,
    final Object? aNullableString = _Undefined,
    final DateTime? aDateTime,
    final Object? aNullableDateTime = _Undefined,
    final _i2.ByteData? aByteData,
    final Object? aNullableByteData = _Undefined,
    final Duration? aDuration,
    final Object? aNullableDuration = _Undefined,
    final _i1.UuidValue? aUuid,
    final Object? aNullableUuid = _Undefined,
    final _i3.SimpleData? anObject,
    final Object? aNullableObject = _Undefined,
    final List<int>? anIntList,
    final Object? aNullableIntList = _Undefined,
    final List<int?>? aListWithNullableInts,
    final Object? aNullableListWithNullableInts = _Undefined,
    final List<_i3.SimpleData>? anObjectList,
    final Object? aNullableObjectList = _Undefined,
    final List<_i3.SimpleData?>? aListWithNullableObjects,
    final Object? aNullableListWithNullableObjects = _Undefined,
    final List<DateTime>? aDateTimeList,
    final Object? aNullableDateTimeList = _Undefined,
    final List<DateTime?>? aListWithNullableDateTimes,
    final Object? aNullableListWithNullableDateTimes = _Undefined,
    final List<_i2.ByteData>? aByteDataList,
    final Object? aNullableByteDataList = _Undefined,
    final List<_i2.ByteData?>? aListWithNullableByteDatas,
    final Object? aNullableListWithNullableByteDatas = _Undefined,
    final List<Duration>? aDurationList,
    final Object? aNullableDurationList = _Undefined,
    final List<Duration?>? aListWithNullableDurations,
    final Object? aNullableListWithNullableDurations = _Undefined,
    final List<_i1.UuidValue>? aUuidList,
    final Object? aNullableUuidList = _Undefined,
    final List<_i1.UuidValue?>? aListWithNullableUuids,
    final Object? aNullableListWithNullableUuids = _Undefined,
    final Map<String, int>? anIntMap,
    final Object? aNullableIntMap = _Undefined,
    final Map<String, int?>? aMapWithNullableInts,
    final Object? aNullableMapWithNullableInts = _Undefined,
  }) {
    return Nullability(
      anInt: anInt ?? this.anInt,
      aNullableInt: aNullableInt is int? ? aNullableInt : this.aNullableInt,
      aDouble: aDouble ?? this.aDouble,
      aNullableDouble: aNullableDouble is double?
          ? aNullableDouble
          : this.aNullableDouble,
      aBool: aBool ?? this.aBool,
      aNullableBool: aNullableBool is bool?
          ? aNullableBool
          : this.aNullableBool,
      aString: aString ?? this.aString,
      aNullableString: aNullableString is String?
          ? aNullableString
          : this.aNullableString,
      aDateTime: aDateTime ?? this.aDateTime,
      aNullableDateTime: aNullableDateTime is DateTime?
          ? aNullableDateTime
          : this.aNullableDateTime,
      aByteData: aByteData ?? this.aByteData.clone(),
      aNullableByteData: aNullableByteData is _i2.ByteData?
          ? aNullableByteData
          : this.aNullableByteData?.clone(),
      aDuration: aDuration ?? this.aDuration,
      aNullableDuration: aNullableDuration is Duration?
          ? aNullableDuration
          : this.aNullableDuration,
      aUuid: aUuid ?? this.aUuid,
      aNullableUuid: aNullableUuid is _i1.UuidValue?
          ? aNullableUuid
          : this.aNullableUuid,
      anObject: anObject ?? this.anObject.copyWith(),
      aNullableObject: aNullableObject is _i3.SimpleData?
          ? aNullableObject
          : this.aNullableObject?.copyWith(),
      anIntList: anIntList ?? this.anIntList.map((final e0) => e0).toList(),
      aNullableIntList: aNullableIntList is List<int>?
          ? aNullableIntList
          : this.aNullableIntList?.map((final e0) => e0).toList(),
      aListWithNullableInts:
          aListWithNullableInts ??
          this.aListWithNullableInts.map((final e0) => e0).toList(),
      aNullableListWithNullableInts:
          aNullableListWithNullableInts is List<int?>?
          ? aNullableListWithNullableInts
          : this.aNullableListWithNullableInts?.map((final e0) => e0).toList(),
      anObjectList:
          anObjectList ?? this.anObjectList.map((final e0) => e0.copyWith()).toList(),
      aNullableObjectList: aNullableObjectList is List<_i3.SimpleData>?
          ? aNullableObjectList
          : this.aNullableObjectList?.map((final e0) => e0.copyWith()).toList(),
      aListWithNullableObjects:
          aListWithNullableObjects ??
          this.aListWithNullableObjects.map((final e0) => e0?.copyWith()).toList(),
      aNullableListWithNullableObjects:
          aNullableListWithNullableObjects is List<_i3.SimpleData?>?
          ? aNullableListWithNullableObjects
          : this.aNullableListWithNullableObjects
                ?.map((final e0) => e0?.copyWith())
                .toList(),
      aDateTimeList:
          aDateTimeList ?? this.aDateTimeList.map((final e0) => e0).toList(),
      aNullableDateTimeList: aNullableDateTimeList is List<DateTime>?
          ? aNullableDateTimeList
          : this.aNullableDateTimeList?.map((final e0) => e0).toList(),
      aListWithNullableDateTimes:
          aListWithNullableDateTimes ??
          this.aListWithNullableDateTimes.map((final e0) => e0).toList(),
      aNullableListWithNullableDateTimes:
          aNullableListWithNullableDateTimes is List<DateTime?>?
          ? aNullableListWithNullableDateTimes
          : this.aNullableListWithNullableDateTimes?.map((final e0) => e0).toList(),
      aByteDataList:
          aByteDataList ?? this.aByteDataList.map((final e0) => e0.clone()).toList(),
      aNullableByteDataList: aNullableByteDataList is List<_i2.ByteData>?
          ? aNullableByteDataList
          : this.aNullableByteDataList?.map((final e0) => e0.clone()).toList(),
      aListWithNullableByteDatas:
          aListWithNullableByteDatas ??
          this.aListWithNullableByteDatas.map((final e0) => e0?.clone()).toList(),
      aNullableListWithNullableByteDatas:
          aNullableListWithNullableByteDatas is List<_i2.ByteData?>?
          ? aNullableListWithNullableByteDatas
          : this.aNullableListWithNullableByteDatas
                ?.map((final e0) => e0?.clone())
                .toList(),
      aDurationList:
          aDurationList ?? this.aDurationList.map((final e0) => e0).toList(),
      aNullableDurationList: aNullableDurationList is List<Duration>?
          ? aNullableDurationList
          : this.aNullableDurationList?.map((final e0) => e0).toList(),
      aListWithNullableDurations:
          aListWithNullableDurations ??
          this.aListWithNullableDurations.map((final e0) => e0).toList(),
      aNullableListWithNullableDurations:
          aNullableListWithNullableDurations is List<Duration?>?
          ? aNullableListWithNullableDurations
          : this.aNullableListWithNullableDurations?.map((final e0) => e0).toList(),
      aUuidList: aUuidList ?? this.aUuidList.map((final e0) => e0).toList(),
      aNullableUuidList: aNullableUuidList is List<_i1.UuidValue>?
          ? aNullableUuidList
          : this.aNullableUuidList?.map((final e0) => e0).toList(),
      aListWithNullableUuids:
          aListWithNullableUuids ??
          this.aListWithNullableUuids.map((final e0) => e0).toList(),
      aNullableListWithNullableUuids:
          aNullableListWithNullableUuids is List<_i1.UuidValue?>?
          ? aNullableListWithNullableUuids
          : this.aNullableListWithNullableUuids?.map((final e0) => e0).toList(),
      anIntMap:
          anIntMap ??
          this.anIntMap.map(
            (
              final key0,
              final value0,
            ) => MapEntry(
              key0,
              value0,
            ),
          ),
      aNullableIntMap: aNullableIntMap is Map<String, int>?
          ? aNullableIntMap
          : this.aNullableIntMap?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      aMapWithNullableInts:
          aMapWithNullableInts ??
          this.aMapWithNullableInts.map(
            (
              final key0,
              final value0,
            ) => MapEntry(
              key0,
              value0,
            ),
          ),
      aNullableMapWithNullableInts:
          aNullableMapWithNullableInts is Map<String, int?>?
          ? aNullableMapWithNullableInts
          : this.aNullableMapWithNullableInts?.map(
              (
                final key0,
                final value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
    );
  }
}
