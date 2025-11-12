import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_module_server/src/generated/protocol.dart';

/// A sample endpoint which is not built into the modules server or client
/// Rather consuming app should subclass this one, and thus also gain the ability to override methods at will.
@doNotGenerate
class IgnoredModuleEndpoint extends Endpoint {
  Future<void> voidMethod() async {}

  Future<String> echoString(final Session sesion, final String value) async {
    return value;
  }

  Future<(int, BigInt)> echoRecord(final Session sesion, final (int, BigInt) value) async {
    return value;
  }

  Future<Set<int>> echoContainer(final Session sesion, final Set<int> value) async {
    return value;
  }

  Future<ModuleClass> echoModel(final Session sesion, final ModuleClass value) async {
    return value;
  }

  @doNotGenerate
  Future<void> ignoredMethod(final Session session) async {
    throw UnimplementedError();
  }
}
