import 'package:serverpod/serverpod.dart';

import 'generated/protocol.dart';

class GreetingEndpoint extends Endpoint {
  Future<Greeting> hello(final Session session, final String name) async {
    return Greeting(
      message: 'Hello $name',
      author: 'Serverpod',
      timestamp: DateTime.now(),
    );
  }
}
