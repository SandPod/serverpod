import 'package:serverpod/serverpod.dart';

class OptionalParametersEndpoint extends Endpoint {
  Future<int?> returnOptionalInt(final Session session, [final int? optionalInt]) async {
    return optionalInt;
  }
}
