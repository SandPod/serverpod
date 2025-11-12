import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';

class BasicTypesStreamingEndpoint extends Endpoint {
  Stream<int?> testInt(final Session session, final Stream<int?> value) async* {
    await for (final v in value) {
      yield v;
    }
  }

  Stream<double?> testDouble(final Session session, final Stream<double?> value) async* {
    await for (final v in value) {
      yield v;
    }
  }

  Stream<bool?> testBool(final Session session, final Stream<bool?> value) async* {
    await for (final v in value) {
      yield v;
    }
  }

  Stream<DateTime?> testDateTime(
    final Session session,
    final Stream<DateTime?> value,
  ) async* {
    await for (final v in value) {
      yield v;
    }
  }

  Stream<String?> testString(final Session session, final Stream<String?> value) async* {
    await for (final v in value) {
      yield v;
    }
  }

  Stream<ByteData?> testByteData(
    final Session session,
    final Stream<ByteData?> value,
  ) async* {
    await for (final v in value) {
      yield v;
    }
  }

  Stream<Duration?> testDuration(
    final Session session,
    final Stream<Duration?> value,
  ) async* {
    await for (final v in value) {
      yield v;
    }
  }

  Stream<UuidValue?> testUuid(
    final Session session,
    final Stream<UuidValue?> value,
  ) async* {
    await for (final v in value) {
      yield v;
    }
  }

  Stream<Uri?> testUri(final Session session, final Stream<Uri?> value) async* {
    await for (final v in value) {
      yield v;
    }
  }

  Stream<BigInt?> testBigInt(final Session session, final Stream<BigInt?> value) async* {
    await for (final v in value) {
      yield v;
    }
  }
}
