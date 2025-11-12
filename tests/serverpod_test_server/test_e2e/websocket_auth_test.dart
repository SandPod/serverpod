import 'dart:async';

import 'package:serverpod_test_client/serverpod_test_client.dart';
import 'package:serverpod_test_server/test_util/config.dart';
import 'package:serverpod_test_server/test_util/test_key_manager.dart';
import 'package:test/test.dart';

void main() {
  group('Given a websocket that requires authentication', () {
    final TestAuthKeyManager authKeyManager = TestAuthKeyManager();
    late Client client;

    setUp(() async {
      client = Client(
        serverUrl,
        authenticationKeyManager: authKeyManager,
      );
    });

    tearDown(() async {
      // ignore: deprecated_member_use
      await client.authenticationKeyManager?.remove();
      await client.authentication.removeAllUsers();
      await client.authentication.signOut();
      assert(
        await client.modules.auth.status.isSignedIn() == false,
        'Still signed in after teardown',
      );
      client.close();
    });

    test(
      'when sending a message to a restricted endpoint without authentication '
      'then the message should be ignored',
      () async {
        // ignore: deprecated_member_use
        await client.openStreamingConnection(
          disconnectOnLostInternetConnection: false,
        );

        // This should be ignored by the server as user isn't authenticated.
        await client.signInRequired.sendStreamMessage(SimpleData(num: 666));
        final streamingStream = client.signInRequired.stream.timeout(
          const Duration(seconds: 2),
        );
        final receivedData = streamingStream.single;

        expect(receivedData, throwsA(isA<TimeoutException>()));
      },
    );

    test('when sending a message to a restricted endpoint with authentication '
        'then the message should succeed', () async {
      final response = await client.authentication.authenticate(
        'test@foo.bar',
        'password',
      );
      expect(response.success, isTrue);
      expect(response.userInfo, isNotNull);
      expect(response.key, isNotNull);
      expect(response.keyId, isNotNull);

      final key = '${response.keyId}:${response.key}';
      await authKeyManager.put(key);

      // ignore: deprecated_member_use
      await client.openStreamingConnection(
        disconnectOnLostInternetConnection: false,
      );

      await client.signInRequired.sendStreamMessage(SimpleData(num: 666));
      final streamingStream = client.signInRequired.stream.timeout(
        const Duration(seconds: 2),
      );
      final receivedData = streamingStream.first;

      final message = await receivedData;
      final simpleData = message as SimpleData;
      expect(simpleData.num, 666);
    });
  });
}
