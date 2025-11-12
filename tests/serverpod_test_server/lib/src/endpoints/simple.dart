import 'package:serverpod/serverpod.dart';

int globalInt = 0;

/// A simple endpoint that modifies a global integer. This class is meant for
/// testing and the documentation has multiple lines.
class SimpleEndpoint extends Endpoint {
  /// Sets a global integer.
  Future<void> setGlobalInt(
    final Session session,
    final int? value, [
    final int? secondValue,
  ]) async {
    globalInt = value!;
  }

  /// Adds 1 to the global integer.
  Future<void> addToGlobalInt(final Session session) async {
    globalInt += 1;
  }

  /// Retrieves a global integer.
  Future<int> getGlobalInt(final Session session) async {
    return globalInt;
  }

  Future<String> hello(final Session session, final String name) async {
    return 'Hello $name';
  }
}
