import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class ModuleEndpoint extends Endpoint {
  Future<String> hello(final Session session, final String name) async {
    return 'Hello $name';
  }

  Future<ModuleClass> modifyModuleObject(
    final Session session,
    final ModuleClass object,
  ) async {
    object.data = 42;
    return object;
  }
}
