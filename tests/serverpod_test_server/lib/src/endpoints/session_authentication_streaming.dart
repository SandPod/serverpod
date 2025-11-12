import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

class SessionAuthenticationStreamingEndpoint extends Endpoint {
  @override
  Future<void> streamOpened(final StreamingSession session) async {
    final auth = session.authenticated;
    // ignore: deprecated_member_use
    await sendStreamMessage(
      session,
      SimpleData(num: auth != null ? 1 : 0),
    );
  }

  @override
  Future<void> handleStreamMessage(
    final StreamingSession session,
    final SerializableModel message,
  ) async {
    final auth = session.authenticated;
    // ignore: deprecated_member_use
    await sendStreamMessage(
      session,
      SimpleData(num: auth != null ? 1 : 0),
    );
  }

  @override
  Future<void> streamClosed(final StreamingSession session) async {}
}
