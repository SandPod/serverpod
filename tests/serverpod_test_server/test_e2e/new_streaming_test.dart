import 'dart:async';

import 'package:serverpod_test_client/serverpod_test_client.dart';
import 'package:serverpod_test_server/test_util/config.dart';
import 'package:test/test.dart';

void main() {
  var client = Client(serverUrl);

  test('In out stream', () async {
    var stream = Stream.fromIterable(
        [SimpleData(num: 1), SimpleData(num: 2), SimpleData(num: 3)]);
    var result = client.newStreaming.inOutStream(stream);
    var list = await result.toList();
    expect(list.length, equals(3));
    expect(list[0].num, equals(2));
    expect(list[1].num, equals(4));
    expect(list[2].num, equals(6));
  });

  test('In stream', () async {
    var stream = Stream.fromIterable(
        [SimpleData(num: 1), SimpleData(num: 2), SimpleData(num: 3)]);
    expectLater(
      client.newStreaming.inStream(stream),
      isA<void>(),
    );
  });

  test('In stream with return', () async {
    var stream = Stream.fromIterable(
        [SimpleData(num: 1), SimpleData(num: 2), SimpleData(num: 3)]);
    var result = await client.newStreaming.inStreamWithReturn(stream);
    expect(result.num, equals(5));
  });

  test('In out stream with params', () async {
    var stream = Stream.fromIterable(
        [SimpleData(num: 1), SimpleData(num: 2), SimpleData(num: 3)]);
    var result = client.newStreaming.inOutStreamWithParams(stream, 5);
    var list = await result.toList();
    expect(list.length, equals(3));
    expect(list[0].num, equals(5));
    expect(list[1].num, equals(10));
    expect(list[2].num, equals(15));
  });

  test('multiple in streams', () async {
    var streamController1 = StreamController<SimpleData>();
    var streamController2 = StreamController<SimpleData>();

    var result = client.newStreaming.multipleInStreams(
      streamController1.stream,
      streamController2.stream,
    );

    streamController1.add(SimpleData(num: 1));
    streamController2.add(SimpleData(num: 2));
    await streamController2.close();
    streamController1.add(SimpleData(num: 3));
    await streamController1.close();

    var list = await result.toList();
    expect(list.length, equals(3));
    expect(list[0].num, equals(1));
    expect(list[1].num, equals(2));
    expect(list[2].num, equals(3));
  });
}
