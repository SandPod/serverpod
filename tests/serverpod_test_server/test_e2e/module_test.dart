// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:serverpod_test_client/serverpod_test_client.dart';
import 'package:serverpod_test_module_client/serverpod_test_module_client.dart'
    as module;
import 'package:serverpod_test_server/test_util/config.dart';
import 'package:test/test.dart';

void main() {
  final client = Client(serverUrl);

  group('Given a module', () {
    test('when calling a non-module endpoint that uses a module object '
        'then should return true to indicate nothing went wrong', () async {
      final success = await client.moduleSerialization.serializeModuleObject();
      expect(success, equals(true));
    });

    test('when calling endpoint method hello'
        'then returns greeting', () async {
      final result = await client.modules.module.module.hello('World');
      expect(result, equals('Hello World'));
    });

    test('when calling a non-module endpoint that modifies a module object '
        'then should return modified object', () async {
      final moduleClass = module.ModuleClass(
        name: 'foo',
        data: 0,
      );
      final result = await client.moduleSerialization.modifyModuleObject(
        moduleClass,
      );
      expect(result.data, equals(42));
    });

    test('when calling endpoint method that modifies object '
        'then returns modified object', () async {
      final moduleClass = module.ModuleClass(
        name: 'foo',
        data: 0,
      );
      final result = await client.modules.module.module.modifyModuleObject(
        moduleClass,
      );
      expect(result.data, equals(42));
    });

    group('when calling endpoint streams on module', () {
      late Stream streamingStream;
      setUpAll(() async {
        streamingStream = client.modules.module.streaming.stream
            .asBroadcastStream();
      });
      setUp(() async {
        await client.openStreamingConnection(
          disconnectOnLostInternetConnection: false,
        );
      });

      tearDown(() async {
        await client.closeStreamingConnection();
      });

      test(
        'then should be possible to send to and read from endpoint stream',
        () async {
          final nums = [42, 1337, 69];

          for (final num in nums) {
            await client.modules.module.streaming.sendStreamMessage(
              module.ModuleClass(name: 'name', data: num),
            );
          }

          final resultNums = (await streamingStream.take(3).toList()).map(
            (final o) => o.data,
          );
          expect(resultNums, equals(nums));
        },
      );

      test('then stream opened should have been called', () async {
        await expectLater(
          client.modules.module.streaming.wasStreamOpenCalled(),
          completion(isTrue),
        );
      });

      test('then stream closed should have been called', () async {
        await client.closeStreamingConnection();

        await expectLater(
          client.modules.module.streaming.wasStreamClosedCalled(),
          completion(isTrue),
        );
      });
    });

    test(
      'when calling stream-returning method that takes stream as a parameter '
      'then should return a stream',
      () async {
        final streamComplete = Completer();
        final numberGenerator = List.generate(10, (index) => index++);
        final inputStream = Stream<int>.fromIterable(numberGenerator);
        final stream = client.modules.module.streaming.intEchoStream(inputStream);

        final received = <int>[];
        stream.listen(
          (final event) {
            received.add(event);
          },
          onDone: () {
            streamComplete.complete();
          },
          cancelOnError: true,
        );

        await streamComplete.future;
        expect(received, numberGenerator);
      },
    );

    test(
      'when calling future-returning method that takes stream as a parameter '
      'then should return a future value',
      () async {
        final inputStream = Stream<int>.fromIterable([1]);
        final value = await client.modules.module.streaming
            .simpleInputReturnStream(inputStream);

        expect(value, 1);
      },
    );
  });

  group('Nested modules classes.', () {
    test(
      'Given a generated protocol class with a custom class, then serialize the internal data.',
      () async {
        final result = await client.moduleSerialization
            .serializeNestedModuleObject();
        expect(result.model.data, equals(42));
        expect(result.list[0].data, equals(42));
        expect(result.map['foo']?.data, equals(42));
      },
    );
  });
}
