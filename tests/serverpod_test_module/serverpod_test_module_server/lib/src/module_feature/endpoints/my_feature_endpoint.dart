import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_module_server/src/generated/protocol.dart';

class MyModuleFeatureEndpoint extends Endpoint {
  Future<String> myFeatureMethod(final Session session) async {
    return 'Hello, world!';
  }

  Future<MyModuleFeatureModel> myFeatureModel(final Session session) async {
    return MyModuleFeatureModel(name: 'Isak');
  }
}
