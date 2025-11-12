import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod(
    'Given call to MethodStreamingEndpoint',
    (final sessionBuilder, final endpoints) {
      test(
        'when calling an endpoint returning a non-broadcast stream and cancelling '
        'then will cancel',
        () async {
          final stream = endpoints.methodStreaming.intStreamFromValue(
            sessionBuilder,
            1,
          );
          final subscription = stream.listen((final event) {});

          await expectLater(subscription.cancel(), completes);
        },
      );

      test(
        'when calling an endpoint returning a broadcast stream and cancelling '
        'then it should cancel and trigger the onCancel hook on the stream controller',
        () async {
          final wasStreamCancelled = endpoints.methodStreaming
              .wasBroadcastStreamCanceled(sessionBuilder);

          final stream = endpoints.methodStreaming.getBroadcastStream(
            sessionBuilder,
          );
          // Wait for the stream to be created, otherwise cancel is called before creation
          await flushEventQueue();

          final subscription = stream.listen((final event) {});
          await subscription.cancel();

          await expectLater(
            wasStreamCancelled,
            completion(true),
          );
        },
      );

      test(
        'when calling an endpoint returning a broadcast stream and cancelling '
        'then it should close the session and call its will close listener',
        () async {
          final wasSessionWillCloseListenerCalled = endpoints.methodStreaming
              .wasSessionWillCloseListenerCalled(sessionBuilder);

          final stream = endpoints.methodStreaming.getBroadcastStream(
            sessionBuilder,
          );
          // Wait for the stream to be created, otherwise cancel is called before creation
          await flushEventQueue();

          final subscription = stream.listen((final event) {});
          await subscription.cancel();

          await expectLater(
            wasSessionWillCloseListenerCalled,
            completion(true),
          );
        },
      );
    },
  );
}
