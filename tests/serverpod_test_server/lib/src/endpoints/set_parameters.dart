import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

class SetParametersEndpoint extends Endpoint {
  Future<Set<int>> returnIntSet(final Session session, final Set<int> set) async {
    return set;
  }

  Future<Set<Set<int>>> returnIntSetSet(
    final Session session,
    final Set<Set<int>> set,
  ) async {
    return set;
  }

  Future<Set<List<int>>> returnIntListSet(
    final Session session,
    final Set<List<int>> set,
  ) async {
    return set;
  }

  Future<Set<int>?> returnIntSetNullable(
    final Session session,
    final Set<int>? set,
  ) async {
    return set;
  }

  Future<Set<Set<int>?>> returnIntSetNullableSet(
    final Session session,
    final Set<Set<int>?> set,
  ) async {
    return set;
  }

  Future<Set<Set<int>>?> returnIntSetSetNullable(
    final Session session,
    final Set<Set<int>>? set,
  ) async {
    return set;
  }

  Future<Set<int?>> returnIntSetNullableInts(
    final Session session,
    final Set<int?> set,
  ) async {
    return set;
  }

  Future<Set<int?>?> returnNullableIntSetNullableInts(
    final Session session,
    final Set<int?>? set,
  ) async {
    return set;
  }

  Future<Set<double>> returnDoubleSet(
    final Session session,
    final Set<double> set,
  ) async {
    return set;
  }

  Future<Set<double?>> returnDoubleSetNullableDoubles(
    final Session session,
    final Set<double?> set,
  ) async {
    return set;
  }

  Future<Set<bool>> returnBoolSet(
    final Session session,
    final Set<bool> set,
  ) async {
    return set;
  }

  Future<Set<bool?>> returnBoolSetNullableBools(
    final Session session,
    final Set<bool?> set,
  ) async {
    return set;
  }

  Future<Set<String>> returnStringSet(
    final Session session,
    final Set<String> set,
  ) async {
    return set;
  }

  Future<Set<String?>> returnStringSetNullableStrings(
    final Session session,
    final Set<String?> set,
  ) async {
    return set;
  }

  Future<Set<DateTime>> returnDateTimeSet(
    final Session session,
    final Set<DateTime> set,
  ) async {
    return set;
  }

  Future<Set<DateTime?>> returnDateTimeSetNullableDateTimes(
    final Session session,
    final Set<DateTime?> set,
  ) async {
    return set;
  }

  Future<Set<ByteData>> returnByteDataSet(
    final Session session,
    final Set<ByteData> set,
  ) async {
    return set;
  }

  Future<Set<ByteData?>> returnByteDataSetNullableByteDatas(
    final Session session,
    final Set<ByteData?> set,
  ) async {
    return set;
  }

  Future<Set<SimpleData>> returnSimpleDataSet(
    final Session session,
    final Set<SimpleData> set,
  ) async {
    return set;
  }

  Future<Set<SimpleData?>> returnSimpleDataSetNullableSimpleData(
    final Session session,
    final Set<SimpleData?> set,
  ) async {
    return set;
  }

  Future<Set<Duration>> returnDurationSet(
    final Session session,
    final Set<Duration> set,
  ) async {
    return set;
  }

  Future<Set<Duration?>> returnDurationSetNullableDurations(
    final Session session,
    final Set<Duration?> set,
  ) async {
    return set;
  }
}
