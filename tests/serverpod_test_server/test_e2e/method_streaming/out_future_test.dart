// Same tests as in out_stream_test.dart but for a future return and check what happens when it never returns.

import 'dart:async';

import 'package:serverpod_test_client/serverpod_test_client.dart';
import 'package:serverpod_test_server/test_util/config.dart';
import 'package:serverpod_test_server/test_util/test_key_manager.dart';
import 'package:test/test.dart';

void main() {
  final client = Client(
    serverUrl,
    authenticationKeyManager: TestAuthKeyManager(),
  );

  test(
    'Given a streaming method that returns first value from stream, when calling the method, then the first value is received.',
    () async {
      final stream = Stream<int>.fromIterable([1, 2, 3]);
      final result = client.methodStreaming.intReturnFromStream(stream);
      expect(await result, 1);
    },
  );

  test(
    'Given a streaming method with void return after input stream is closed when calling the method, then the method returns once input stream is complete.',
    () async {
      final stream = Stream<int>.fromIterable([1, 2, 3]);
      final responseFuture = client.methodStreaming.voidReturnAfterStream(stream);
      expect(responseFuture, completes);
    },
  );

  test(
    'Given a streaming method with int return that throws an exception when calling the method, then ServerpodClientException is thrown.',
    () async {
      final stream = Stream<int>.fromIterable([1, 2, 3]);
      final responseFuture = client.methodStreaming.throwsException(stream);
      await expectLater(
        responseFuture,
        throwsA(isA<ConnectionClosedException>()),
      );
    },
  );

  test(
    'Given a streaming method with int return that throws a serializable exception when calling the method, then the exception is thrown.',
    () async {
      final stream = Stream<int>.fromIterable([1, 2, 3]);
      final responseFuture = client.methodStreaming.throwsSerializableException(
        stream,
      );
      await expectLater(responseFuture, throwsA(isA<ExceptionWithData>()));
    },
  );

  test(
    'Given a streaming method with void return that throws an exception when calling the method, then ServerpodClientException is thrown.',
    () async {
      final stream = Stream<int>.fromIterable([1, 2, 3]);
      final responseFuture = client.methodStreaming.throwsExceptionVoid(stream);
      await expectLater(
        responseFuture,
        throwsA(isA<ConnectionClosedException>()),
      );
    },
  );

  test(
    'Given a streaming method with void return that throws a serializable exception when calling the method, then the exception is thrown.',
    () async {
      final stream = Stream<int>.fromIterable([1, 2, 3]);
      final responseFuture = client.methodStreaming
          .throwsSerializableExceptionVoid(stream);
      await expectLater(responseFuture, throwsA(isA<ExceptionWithData>()));
    },
  );
}
