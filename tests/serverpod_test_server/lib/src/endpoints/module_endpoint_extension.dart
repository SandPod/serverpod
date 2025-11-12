import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_module_server/serverpod_test_module_server.dart';

/// Plain extension of the existing endpoint
class ModuleEndpointSubclass extends IgnoredModuleEndpoint {}

class ModuleEndpointAdaptation extends IgnoredModuleEndpoint {
  @override
  Future<String> echoString(final Session sesion, final String value) {
    return super.echoString(sesion, 're-exposed: $value');
  }

  /// Extended `echoRecord` which takes an optional argument for a multiplier
  ///
  /// This shows a backwards-compatible extension of the method, which is enforced by the Dart type system.
  @override
  Future<(int, BigInt)> echoRecord(
    final Session sesion,
    final (int, BigInt) value, [
    int? multiplier,
  ]) async {
    multiplier ??= 1;
    return super.echoRecord(
      sesion,
      (value.$1 * multiplier, value.$2 * BigInt.from(multiplier)),
    );
  }


}

class ModuleEndpointReduction extends IgnoredModuleEndpoint {
  /// Hide the `echoString` endpoint
  ///
  /// Since this requires an implementation on the Dart-level, we throw `UnimplementedError` by convention,
  /// even though this would never be called via the protocol.
  @override
  @doNotGenerate
  Future<String> echoString(final Session sesion, final String value) {
    throw UnimplementedError();
  }
}

/// Subclass inheriting all base class methods and adding a furhter method itself
class ModuleEndpointExtension extends IgnoredModuleEndpoint {
  Future<String> greet(final Session session, final String name) async {
    return 'Hello $name';
  }

  @override
  Future<void> ignoredMethod(final Session session) async {}
}
