import 'package:serverpod/serverpod.dart';

class NamedParametersEndpoint extends Endpoint {
  Future<bool> namedParametersMethod(
    final Session session, {
    required final int namedInt,
    final int intWithDefaultValue = 42,
    final int? nullableInt,
    final int? nullableIntWithDefaultValue = 42,
  }) async {
    return true;
  }

  Future<bool> namedParametersMethodEqualInts(
    final Session session, {
    required final int namedInt,
    final int? nullableInt,
  }) async {
    return namedInt == nullableInt;
  }
}
