import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

class MyFeatureEndpoint extends Endpoint {
  Future<String> myFeatureMethod(final Session session) async {
    return 'Hello, world!';
  }

  Future<MyFeatureModel> myFeatureModel(final Session session) async {
    return MyFeatureModel(name: 'Alex');
  }
}
