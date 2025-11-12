import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

class TestExceptionCall extends FutureCall<SimpleData> {
  @override
  Future<void> invoke(final Session session, final SimpleData? object) async {
    if (object != null) {
      final data = object;
      session.log('${data.num}');
    } else {
      session.log('null');
    }
    throw Exception('TestExceptionCall throwing an exception');
  }
}
