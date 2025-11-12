import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';

class BasicTypesEndpoint extends Endpoint {
  Future<int?> testInt(final Session session, final int? value) async {
    return value;
  }

  Future<double?> testDouble(final Session session, final double? value) async {
    return value;
  }

  Future<bool?> testBool(final Session session, final bool? value) async {
    return value;
  }

  Future<DateTime?> testDateTime(final Session session, final DateTime? dateTime) async {
    return dateTime;
  }

  Future<String?> testString(final Session session, final String? value) async {
    return value;
  }

  Future<ByteData?> testByteData(final Session session, final ByteData? value) async {
    return value;
  }

  Future<Duration?> testDuration(final Session session, final Duration? value) async {
    return value;
  }

  Future<UuidValue?> testUuid(final Session session, final UuidValue? value) async {
    return value;
  }

  Future<Uri?> testUri(final Session session, final Uri? value) async {
    return value;
  }

  Future<BigInt?> testBigInt(final Session session, final BigInt? value) async {
    return value;
  }
}
