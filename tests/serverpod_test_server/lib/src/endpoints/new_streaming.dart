import 'package:async/async.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

class NewStreamingEndpoint extends Endpoint {
  // Should have attached the passed in stream to the websocket.
  Future<void> inStream(Session session, Stream<SimpleData> stream) async {
    print('inStream opened');
    stream.listen((data) => print(data.num)).onDone(() {
      print('InStream closed');
    });
    return;
  }

  // Should attach and return a value to the websocket.
  Future<SimpleData> inStreamWithReturn(
    Session session,
    Stream<SimpleData> stream,
  ) async {
    print('inStreamWithReturn opened');
    stream.listen((data) => print(data.num)).onDone(() {
      print('inStreamWithReturn closed');
    });
    return SimpleData(num: 5);
  }

  // Should have attached the passed in stream to the websocket and attach
  // the yielded values to the websocket.
  Stream<SimpleData> inOutStream(
    Session session,
    Stream<SimpleData> stream,
  ) async* {
    print('inOutStream opened');
    await for (var data in stream) {
      print(data.num);
      yield SimpleData(num: data.num * 2);
    }
    print('inOutStream closed');
  }

  Stream<SimpleData> inOutStreamWithParams(
    Session session,
    Stream<SimpleData> stream,
    int value,
  ) async* {
    await for (var data in stream) {
      yield SimpleData(num: data.num * value);
    }
  }

  Stream<SimpleData> multipleInStreams(
    Session session,
    Stream<SimpleData> stream1,
    Stream<SimpleData> stream2,
  ) async* {
    var streams = StreamGroup.merge([stream1, stream2]);
    await for (var data in streams) {
      yield SimpleData(num: data.num);
    }
  }
}
