import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

class RedisEndpoint extends Endpoint {
  Future<void> setSimpleData(
    final Session session,
    final String key,
    final SimpleData data,
  ) async {
    await session.caches.global.put(key, data);
  }

  Future<void> setSimpleDataWithLifetime(
    final Session session,
    final String key,
    final SimpleData data,
  ) async {
    await session.caches.global.put(
      key,
      data,
      lifetime: const Duration(seconds: 1),
    );
  }

  Future<SimpleData?> getSimpleData(final Session session, final String key) async {
    return (await session.caches.global.get<SimpleData>(key));
  }

  Future<void> deleteSimpleData(final Session session, final String key) async {
    await session.caches.global.invalidateKey(key);
  }

  Future<void> resetMessageCentralTest(final Session session) async {}

  Future<SimpleData?> listenToChannel(final Session session, final String channel) async {
    SimpleData? data;
    session.messages.addListener(channel, (final message) {
      data = message as SimpleData?;
    });
    await Future.delayed(const Duration(seconds: 2));
    return data;
  }

  Future<void> postToChannel(
    final Session session,
    final String channel,
    final SimpleData data,
  ) async {
    session.messages.postMessage(channel, data, global: true);
  }

  Future<int> countSubscribedChannels(final Session session) async {
    return session.serverpod.redisController!.subscribedChannels.length;
  }
}
