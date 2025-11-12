import 'dart:async';

import 'package:serverpod_test_client/serverpod_test_client.dart';
import 'package:serverpod_test_server/test_util/config.dart';
import 'package:test/test.dart';

void main() {
  test('Given a client '
      'when calling an endpoint multiple times in quick succession '
      'then all streams complete successfully', () async {
    final client = Client(serverUrl);
    const numMessages = 1000;
    final List<Future> streamCompleteFutures = [];
    for (var i = 0; i < 10; i++) {
      final stream = client.methodStreaming.intStreamFromValue(numMessages);
      streamCompleteFutures.add(stream.last);
    }

    await [
      for (final future in streamCompleteFutures) expectLater(future, completes),
    ].wait;
  });

  test('Given multiple method streaming connections to the same endpoint '
      'when streams are listened, paused and resumed '
      'then all streams complete successfully', () async {
    final client = Client(serverUrl);
    const numMessages = 1000;
    final List<Future> streamCompleteFutures = [];
    for (var i = 0; i < 10; i++) {
      final streamIsComplete = Completer();
      streamCompleteFutures.add(streamIsComplete.future);

      final stream = client.methodStreaming.intStreamFromValue(numMessages);
      var beenPaused = false;
      late StreamSubscription<int> subscription;
      subscription = stream.listen(
        (final data) async {
          if (!beenPaused) {
            subscription.pause();
            beenPaused = true;
            await Future.delayed(const Duration(milliseconds: 100), () {
              subscription.resume();
            });
          }
        },
        onDone: () => streamIsComplete.complete(),
      );
    }

    await [
      for (final future in streamCompleteFutures) expectLater(future, completes),
    ].wait;
  });
}
