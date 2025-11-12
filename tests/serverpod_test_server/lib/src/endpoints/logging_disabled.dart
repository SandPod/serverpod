import 'package:serverpod/serverpod.dart';

class LoggingDisabledEndpoint extends Endpoint {
  @override
  bool get logSessions => false;

  Future<void> logInfo(final Session session, final String message) async {
    session.log(message);
  }
}
