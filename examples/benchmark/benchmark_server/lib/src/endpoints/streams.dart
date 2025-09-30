import 'package:benchmark_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class Streams extends Endpoint {
  Stream<SmallMessage> echoSmall(
    Session session,
    Stream<SmallMessage> messageStream,
  ) async* {
    await for (var message in messageStream) {
      yield message;
    }
  }

  Stream<LargeMessage> echoLarge(
    Session session,
    Stream<LargeMessage> messageStream,
  ) async* {
    await for (var message in messageStream) {
      yield message;
    }
  }

  Stream<SmallMessage> continuousInSmall(
    Session session,
    Stream<SmallMessage> messageStream,
  ) async* {
    await for (var _ in messageStream) {
      // Just consume the message.
    }
  }

  Stream<LargeMessage> continuousInLarge(
    Session session,
    Stream<LargeMessage> messageStream,
  ) async* {
    await for (var _ in messageStream) {
      // Just consume the message.
    }
  }

  Stream<SmallMessage> continuousOutSmall(
    Session session,
  ) async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 10));
      yield SmallMessage();
    }
  }

  Stream<LargeMessage> continuousOutLarge(
    Session session,
  ) async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 10));
      yield LargeMessage();
    }
  }
}
