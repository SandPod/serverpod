// Add tests for when passing an input parameter to the stream.
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
    'Given an integer stream when calling a streaming method that echoes input stream then values are returned from the server.',
    () async {
      final streamComplete = Completer();
      final numberGenerator = List.generate(10, (index) => index++);
      final inputStream = Stream<int>.fromIterable(numberGenerator);
      final stream = client.methodStreaming.intEchoStream(inputStream);

      final received = <int>[];
      stream.listen(
        (final event) {
          received.add(event);
        },
        onDone: () {
          streamComplete.complete();
        },
      );

      await streamComplete.future;
      expect(received, numberGenerator);
    },
  );

  test(
    'Given a stream with mixed value types when calling a streaming method that echoes input stream then values are returned from the server.',
    () async {
      final streamComplete = Completer();
      final simpleData = SimpleData(num: 42);
      final mixedValues = [1, 'two', simpleData];
      final inputStream = Stream<dynamic>.fromIterable(mixedValues);
      final stream = client.methodStreaming.dynamicEchoStream(inputStream);

      final received = [];
      stream.listen(
        (final event) {
          received.add(event);
        },
        onDone: () {
          streamComplete.complete();
        },
      );

      await streamComplete.future;
      expect(received, hasLength(3));
      expect(received[0], mixedValues[0]);
      expect(received[1], mixedValues[1]);
      expect(
        received[2],
        isA<SimpleData>().having((final s) => s.num, 'num', simpleData.num),
      );
    },
  );

  test(
    'Given a stream with nullable integer values when calling a streaming method that echoes input stream then values are echoed from the server.',
    () async {
      final streamComplete = Completer();
      final numberGenerator = List.generate(10, (index) {
        index++;
        if (index % 2 == 0) {
          return null;
        }
        return index;
      });
      final inputStream = Stream<int?>.fromIterable(numberGenerator);
      final stream = client.methodStreaming.nullableIntEchoStream(inputStream);

      final received = <int?>[];
      stream.listen(
        (final event) {
          received.add(event);
        },
        onDone: () {
          streamComplete.complete();
        },
      );

      await streamComplete.future;
      expect(received, numberGenerator);
    },
  );

  test(
    'Given multiple integer streams when calling a streaming method that echoes multiple input streams then values are echoed from the server.',
    () async {
      final streamComplete = Completer();
      final sequence = List.generate(4, (index) => index++);
      final inputStream1 = StreamController<int>();
      final inputStream2 = StreamController<int>();
      final stream = client.methodStreaming.multipleIntEchoStreams(
        inputStream1.stream,
        inputStream2.stream,
      );
      var valueEchoed = Completer();
      final received = <int>[];
      stream.listen(
        (final event) {
          received.add(event);
          valueEchoed.complete();
        },
        onDone: () {
          streamComplete.complete();
        },
      );

      for (final i in sequence) {
        if (i % 2 == 0) {
          inputStream1.add(i);
        } else {
          inputStream2.add(i);
        }
        await valueEchoed.future;
        valueEchoed = Completer();
      }

      await inputStream1.close();
      await inputStream2.close();
      await streamComplete.future;
      expect(received, sequence);
    },
  );

  test(
    'Given multiple integer streams when one stream is finished when calling a streaming method that echoes multiple input streams then values are still echoed from open stream.',
    () async {
      final streamComplete = Completer();
      final sequence = List.generate(4, (index) => index++);
      final inputStream1 = StreamController<int>();
      final inputStream2 = StreamController<int>();
      final stream = client.methodStreaming.multipleIntEchoStreams(
        inputStream1.stream,
        inputStream2.stream,
      );
      final received = <int>[];
      stream.listen(
        (final event) {
          received.add(event);
        },
        onDone: () {
          streamComplete.complete();
        },
      );

      await inputStream1.close();
      await inputStream2.addStream(Stream.fromIterable(sequence));
      await inputStream2.close();

      await streamComplete.future;
      expect(received, sequence);
    },
  );

  test(
    'Given an input stream that throws an exception when calling a streaming method that returns true if exception is thrown on input stream then server responds with true,',
    () async {
      final inputStream = StreamController<int>();
      final responseFuture = client.methodStreaming.didInputStreamHaveError(
        inputStream.stream,
      );

      inputStream.addError(Exception('This is an exception'));
      inputStream.close();

      expect(await responseFuture, true);
    },
  );

  test(
    'Given an input stream that throws a serializable exception when calling a streaming method that returns true if exception is thrown on input stream then server responds with true,',
    () async {
      final inputStream = StreamController<int>();
      final responseFuture = client.methodStreaming
          .didInputStreamHaveSerializableExceptionError(inputStream.stream);

      inputStream.addError(
        ExceptionWithData(
          message: 'Throwing an exception',
          creationDate: DateTime.now(),
          errorFields: [
            'first line error',
            'second line error',
          ],
          someNullableField: 1,
        ),
      );
      inputStream.close();

      expect(await responseFuture, true);
    },
  );
}
