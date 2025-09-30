import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class EndpointRequests extends Endpoint {
  Future<SmallMessage> echoSmall(Session session, SmallMessage message) async {
    return message;
  }

  Future<LargeMessage> echoLarge(Session session, LargeMessage message) async {
    return message;
  }

  Future<void> inputSmall(Session session, SmallMessage message) async {
    return;
  }

  Future<void> inputLarge(Session session, LargeMessage message) async {
    return;
  }

  Future<SmallMessage> fetchSmall(
    Session session,
  ) async {
    return SmallMessage();
  }

  Future<LargeMessage> fetchLarge(
    Session session,
  ) async {
    return LargeMessage();
  }
}
