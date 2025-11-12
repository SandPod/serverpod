import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

class ListParametersEndpoint extends Endpoint {
  Future<List<int>> returnIntList(final Session session, final List<int> list) async {
    return list;
  }

  Future<List<List<int>>> returnIntListList(
    final Session session,
    final List<List<int>> list,
  ) async {
    return list;
  }

  Future<List<int>?> returnIntListNullable(
    final Session session,
    final List<int>? list,
  ) async {
    return list;
  }

  Future<List<List<int>?>> returnIntListNullableList(
    final Session session,
    final List<List<int>?> list,
  ) async {
    return list;
  }

  Future<List<List<int>>?> returnIntListListNullable(
    final Session session,
    final List<List<int>>? list,
  ) async {
    return list;
  }

  Future<List<int?>> returnIntListNullableInts(
    final Session session,
    final List<int?> list,
  ) async {
    return list;
  }

  Future<List<int?>?> returnNullableIntListNullableInts(
    final Session session,
    final List<int?>? list,
  ) async {
    return list;
  }

  Future<List<double>> returnDoubleList(
    final Session session,
    final List<double> list,
  ) async {
    return list;
  }

  Future<List<double?>> returnDoubleListNullableDoubles(
    final Session session,
    final List<double?> list,
  ) async {
    return list;
  }

  Future<List<bool>> returnBoolList(
    final Session session,
    final List<bool> list,
  ) async {
    return list;
  }

  Future<List<bool?>> returnBoolListNullableBools(
    final Session session,
    final List<bool?> list,
  ) async {
    return list;
  }

  Future<List<String>> returnStringList(
    final Session session,
    final List<String> list,
  ) async {
    return list;
  }

  Future<List<String?>> returnStringListNullableStrings(
    final Session session,
    final List<String?> list,
  ) async {
    return list;
  }

  Future<List<DateTime>> returnDateTimeList(
    final Session session,
    final List<DateTime> list,
  ) async {
    return list;
  }

  Future<List<DateTime?>> returnDateTimeListNullableDateTimes(
    final Session session,
    final List<DateTime?> list,
  ) async {
    return list;
  }

  Future<List<ByteData>> returnByteDataList(
    final Session session,
    final List<ByteData> list,
  ) async {
    return list;
  }

  Future<List<ByteData?>> returnByteDataListNullableByteDatas(
    final Session session,
    final List<ByteData?> list,
  ) async {
    return list;
  }

  Future<List<SimpleData>> returnSimpleDataList(
    final Session session,
    final List<SimpleData> list,
  ) async {
    return list;
  }

  Future<List<SimpleData?>> returnSimpleDataListNullableSimpleData(
    final Session session,
    final List<SimpleData?> list,
  ) async {
    return list;
  }

  Future<List<SimpleData>?> returnSimpleDataListNullable(
    final Session session,
    final List<SimpleData>? list,
  ) async {
    return list;
  }

  Future<List<SimpleData?>?> returnNullableSimpleDataListNullableSimpleData(
    final Session session,
    final List<SimpleData?>? list,
  ) async {
    return list;
  }

  Future<List<Duration>> returnDurationList(
    final Session session,
    final List<Duration> list,
  ) async {
    return list;
  }

  Future<List<Duration?>> returnDurationListNullableDurations(
    final Session session,
    final List<Duration?> list,
  ) async {
    return list;
  }
}
