import 'package:serverpod/serverpod.dart';

class DiagnosticEventTestEndpoint extends Endpoint {
  Future<String> submitExceptionEvent(final Session session) async {
    try {
      throw Exception('An exception is thrown');
    } catch (e, stackTrace) {
      session.serverpod.experimental.submitDiagnosticEvent(
        ExceptionEvent(
          e,
          stackTrace,
          custom: {'customKey': 'customValue'},
        ),
        session: session,
      );
    }
    return 'success';
  }
}
