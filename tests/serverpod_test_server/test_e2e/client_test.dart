import 'package:serverpod_test_client/serverpod_test_client.dart';
import 'package:serverpod_test_server/test_util/config.dart';
import 'package:test/test.dart';

void main() {
  group('Given client with onSucceededCall callback', () {
    group('when successfully calling endpoint', () {
      final succeededContexts = <MethodCallContext>[];
      setUpAll(() async {
        final client = Client(
          serverUrl,
          onSucceededCall: (final MethodCallContext context) {
            succeededContexts.add(context);
          },
        );

        await client.simple.hello('test');
      });

      test('then callback is called.', () {
        expect(
          succeededContexts,
          hasLength(1),
          reason: 'Callback was not called even if call succeeded.',
        );
      });

      test('then method call context has correct endpoint name.', () {
        final callContext = succeededContexts.firstOrNull;

        expect(
          callContext?.endpointName,
          'simple',
          reason: 'Call context did not contain correct method name.',
        );
      });

      test('then method call context has correct method name.', () {
        final callContext = succeededContexts.firstOrNull;

        expect(
          callContext?.methodName,
          'hello',
          reason: 'Call context did not contain correct method name.',
        );
      });
    });

    test('when endpoint call fails then callback is not called.', () async {
      final succeededContexts = <MethodCallContext>[];
      final client = Client(
        serverUrl,
        onSucceededCall: (final MethodCallContext context) {
          succeededContexts.add(context);
        },
      );

      try {
        await client.failedCalls.failedCall();
      } catch (_) {}

      expect(
        succeededContexts,
        hasLength(0),
        reason: 'Callback was called even if call failed.',
      );
    });
  });

  group('Given client with onFailedCall callback', () {
    group('when endpoint call fails ', () {
      final failedContexts = <MethodCallContext>[];
      setUpAll(() async {
        final client = Client(
          serverUrl,
          onFailedCall:
              (
                final MethodCallContext context,
                final Object error,
                final StackTrace stackTrace,
              ) {
                failedContexts.add(context);
              },
        );

        try {
          await client.failedCalls.failedCall();
        } catch (_) {}
      });

      test('then callback is called.', () {
        expect(
          failedContexts,
          hasLength(1),
          reason: 'Callback was not called even if call succeeded.',
        );
      });

      test('then method call context has correct endpoint name.', () {
        final callContext = failedContexts.firstOrNull;

        expect(
          callContext?.endpointName,
          'failedCalls',
          reason: 'Call context did not contain correct method name.',
        );
      });

      test('then method call context has correct method name.', () {
        final callContext = failedContexts.firstOrNull;

        expect(
          callContext?.methodName,
          'failedCall',
          reason: 'Call context did not contain correct method name.',
        );
      });
    });

    test(
      'when successfully calling endpoint then callback is not called.',
      () async {
        final failedContexts = <MethodCallContext>[];
        final client = Client(
          serverUrl,
          onFailedCall:
              (
                final MethodCallContext context,
                final Object error,
                final StackTrace stackTrace,
              ) {
                failedContexts.add(context);
              },
        );

        await client.simple.hello('test');
        expect(
          failedContexts,
          hasLength(0),
          reason: 'Callback was called even if call failed.',
        );
      },
    );
  });
}
