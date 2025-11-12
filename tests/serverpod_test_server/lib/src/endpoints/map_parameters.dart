import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

class MapParametersEndpoint extends Endpoint {
  Future<Map<String, int>> returnIntMap(
    final Session session,
    final Map<String, int> map,
  ) async {
    return map;
  }

  Future<Map<String, int>?> returnIntMapNullable(
    final Session session,
    final Map<String, int>? map,
  ) async {
    return map;
  }

  Future<Map<String, Map<String, int>>> returnNestedIntMap(
    final Session session,
    final Map<String, Map<String, int>> map,
  ) async {
    return map;
  }

  Future<Map<String, int?>> returnIntMapNullableInts(
    final Session session,
    final Map<String, int?> map,
  ) async {
    return map;
  }

  Future<Map<String, int?>?> returnNullableIntMapNullableInts(
    final Session session,
    final Map<String, int?>? map,
  ) async {
    return map;
  }

  Future<Map<int, int>> returnIntIntMap(
    final Session session,
    final Map<int, int> map,
  ) async {
    return map;
  }

  Future<Map<String, Map<int, int>>> returnNestedIntIntMap(
    final Session session,
    final Map<String, Map<int, int>> map,
  ) async {
    return map;
  }

  Future<Map<TestEnum, int>> returnEnumIntMap(
    final Session session,
    final Map<TestEnum, int> map,
  ) async {
    return map;
  }

  Future<Map<String, TestEnum>> returnEnumMap(
    final Session session,
    final Map<String, TestEnum> map,
  ) async {
    return map;
  }

  Future<Map<String, double>> returnDoubleMap(
    final Session session,
    final Map<String, double> map,
  ) async {
    return map;
  }

  Future<Map<String, double?>> returnDoubleMapNullableDoubles(
    final Session session,
    final Map<String, double?> map,
  ) async {
    return map;
  }

  Future<Map<String, bool>> returnBoolMap(
    final Session session,
    final Map<String, bool> map,
  ) async {
    return map;
  }

  Future<Map<String, bool?>> returnBoolMapNullableBools(
    final Session session,
    final Map<String, bool?> map,
  ) async {
    return map;
  }

  Future<Map<String, String>> returnStringMap(
    final Session session,
    final Map<String, String> map,
  ) async {
    return map;
  }

  Future<Map<String, String?>> returnStringMapNullableStrings(
    final Session session,
    final Map<String, String?> map,
  ) async {
    return map;
  }

  Future<Map<String, DateTime>> returnDateTimeMap(
    final Session session,
    final Map<String, DateTime> map,
  ) async {
    return map;
  }

  Future<Map<String, DateTime?>> returnDateTimeMapNullableDateTimes(
    final Session session,
    final Map<String, DateTime?> map,
  ) async {
    return map;
  }

  Future<Map<String, ByteData>> returnByteDataMap(
    final Session session,
    final Map<String, ByteData> map,
  ) async {
    return map;
  }

  Future<Map<String, ByteData?>> returnByteDataMapNullableByteDatas(
    final Session session,
    final Map<String, ByteData?> map,
  ) async {
    return map;
  }

  Future<Map<String, SimpleData>> returnSimpleDataMap(
    final Session session,
    final Map<String, SimpleData> map,
  ) async {
    return map;
  }

  Future<Map<String, SimpleData?>> returnSimpleDataMapNullableSimpleData(
    final Session session,
    final Map<String, SimpleData?> map,
  ) async {
    return map;
  }

  Future<Map<String, SimpleData>?> returnSimpleDataMapNullable(
    final Session session,
    final Map<String, SimpleData>? map,
  ) async {
    return map;
  }

  Future<Map<String, SimpleData?>?>
  returnNullableSimpleDataMapNullableSimpleData(
    final Session session,
    final Map<String, SimpleData?>? map,
  ) async {
    return map;
  }

  Future<Map<String, Duration>> returnDurationMap(
    final Session session,
    final Map<String, Duration> map,
  ) async {
    return map;
  }

  Future<Map<String, Duration?>> returnDurationMapNullableDurations(
    final Session session,
    final Map<String, Duration?> map,
  ) async {
    return map;
  }

  Future<Map<(Map<int, String>, String), String>>
  returnNestedNonStringKeyedMapInsideRecordInsideMap(
    final Session session,
    final Map<(Map<int, String>, String), String> map,
  ) async {
    return map;
  }

  Future<Map<String, (Map<int, int>,)>>
  returnDeeplyNestedNonStringKeyedMapInsideRecordInsideMap(
    final Session session,
    final Map<String, (Map<int, int>,)> map,
  ) async {
    return map;
  }
}
