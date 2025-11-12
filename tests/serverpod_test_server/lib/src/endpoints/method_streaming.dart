import 'dart:async';

import 'package:async/async.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

class MethodStreaming extends Endpoint {
  final Map<String, Completer> _delayedResponses = {};

  /// Returns a simple stream of integers from 0 to 9.
  Stream<int> simpleStream(final Session session) async* {
    for (var i = 0; i < 10; i++) {
      yield i;
    }
  }

  static Completer<StreamController<int>>? neverEndingStreamController;
  Stream<int> neverEndingStreamWithDelay(
    final Session session,
    final int millisecondsDelay,
  ) {
    final controller = StreamController<int>();
    neverEndingStreamController?.complete(controller);
    controller.addStream(
      Stream.periodic(
        Duration(milliseconds: millisecondsDelay),
        (final i) => i,
      ),
    );

    return controller.stream;
  }

  Future<void> methodCallEndpoint(final Session session) async {}

  Future<int> intReturnFromStream(
    final Session session,
    final Stream<int> stream,
  ) async {
    return stream.first;
  }

  Future<int?> nullableIntReturnFromStream(
    final Session session,
    final Stream<int?> stream,
  ) async {
    return stream.first;
  }

  static const cancelStreamChannelName = 'cancelStreamChannel';
  static const sessionClosedChannelName = 'sessionClosedChannel';
  Stream<int?> getBroadcastStream(final Session session) {
    session.addWillCloseListener((final localSession) {
      localSession.messages.postMessage(
        sessionClosedChannelName,
        SimpleData(num: 1),
      );
    });
    final stream = StreamController<int?>.broadcast(
      onCancel: () {
        session.messages.postMessage(
          cancelStreamChannelName,
          SimpleData(num: 1),
        );
      },
    );
    return stream.stream;
  }

  Future<bool> wasBroadcastStreamCanceled(final Session session) async {
    final streamWasCanceled = Completer<bool>();
    session.messages.addListener(cancelStreamChannelName, (final data) {
      streamWasCanceled.complete(true);
    });
    return streamWasCanceled.future;
  }

  Future<bool> wasSessionWillCloseListenerCalled(final Session session) async {
    final sessionWillCloseListenerWasCalled = Completer<bool>();
    session.messages.addListener(sessionClosedChannelName, (final data) {
      sessionWillCloseListenerWasCalled.complete(true);
    });
    return sessionWillCloseListenerWasCalled.future;
  }

  Stream<int> intStreamFromValue(final Session session, final int value) async* {
    for (final i in List.generate(value, (final index) => index)) {
      yield i;
    }
  }

  Stream<int> intEchoStream(final Session session, final Stream<int> stream) async* {
    await for (final value in stream) {
      yield value;
    }
  }

  Stream dynamicEchoStream(final Session session, final Stream stream) async* {
    await for (final value in stream) {
      yield value;
    }
  }

  Stream<int?> nullableIntEchoStream(
    final Session session,
    final Stream<int?> stream,
  ) async* {
    await for (final value in stream) {
      yield value;
    }
  }

  Future<void> voidReturnAfterStream(
    final Session session,
    final Stream<int> stream,
  ) async {
    await for (final _ in stream) {
      // Do nothing
    }
    return;
  }

  Stream<int> multipleIntEchoStreams(
    final Session session,
    final Stream<int> stream1,
    final Stream<int> stream2,
  ) async* {
    final streamGroup = StreamGroup.merge([stream1, stream2]);

    await for (final value in streamGroup) {
      yield value;
    }
  }

  Future<void> directVoidReturnWithStreamInput(
    final Session session,
    final Stream<int> stream,
  ) async {
    stream.listen((final event) {
      // Do nothing
    });

    return;
  }

  Future<int> directOneIntReturnWithStreamInput(
    final Session session,
    final Stream<int> stream,
  ) async {
    stream.listen((final event) {
      // Do nothing
    });

    return 1;
  }

  Future<int> simpleInputReturnStream(
    final Session session,
    final Stream<int> stream,
  ) async {
    return stream.first;
  }

  Stream<int> simpleStreamWithParameter(final Session session, final int value) async* {
    for (final i in List.generate(value, (final index) => index)) {
      yield i;
    }
  }

  Stream<SimpleData> simpleDataStream(final Session session, final int value) async* {
    for (final i in List.generate(value, (final index) => index)) {
      yield SimpleData(
        num: i,
      );
    }
  }

  Stream<SimpleData> simpleInOutDataStream(
    final Session session,
    final Stream<SimpleData> simpleDataStream,
  ) async* {
    await for (final data in simpleDataStream) {
      yield data;
    }
  }

  Stream<List<int>> simpleListInOutIntStream(
    final Session session,
    final Stream<List<int>> simpleDataListStream,
  ) async* {
    await for (final data in simpleDataListStream) {
      yield data;
    }
  }

  Stream<List<SimpleData>> simpleListInOutDataStream(
    final Session session,
    final Stream<List<SimpleData>> simpleDataListStream,
  ) async* {
    await for (final data in simpleDataListStream) {
      yield data;
    }
  }

  Stream<List<UserInfo>> simpleListInOutOtherModuleTypeStream(
    final Session session,
    final Stream<List<UserInfo>> userInfoListStream,
  ) async* {
    await for (final data in userInfoListStream) {
      yield data;
    }
  }

  Stream<List<SimpleData>?> simpleNullableListInOutNullableDataStream(
    final Session session,
    final Stream<List<SimpleData>?> simpleDataListStream,
  ) async* {
    await for (final data in simpleDataListStream) {
      yield data;
    }
  }

  Stream<List<SimpleData?>> simpleListInOutNullableDataStream(
    final Session session,
    final Stream<List<SimpleData?>> simpleDataListStream,
  ) async* {
    await for (final data in simpleDataListStream) {
      yield data;
    }
  }

  Stream<Set<int>> simpleSetInOutIntStream(
    final Session session,
    final Stream<Set<int>> simpleDataSetStream,
  ) async* {
    await for (final data in simpleDataSetStream) {
      yield data;
    }
  }

  Stream<Set<SimpleData>> simpleSetInOutDataStream(
    final Session session,
    final Stream<Set<SimpleData>> simpleDataSetStream,
  ) async* {
    await for (final data in simpleDataSetStream) {
      yield data;
    }
  }

  Stream<Set<SimpleData>> nestedSetInListInOutDataStream(
    final Session session,
    // Important that this type is only declared once as a parameter, but still code is generated for it
    final Stream<List<Set<SimpleData>>> simpleDataSetStream,
  ) async* {
    await for (final list in simpleDataSetStream) {
      for (final data in list) {
        yield data;
      }
    }
  }

  Future<void> simpleEndpoint(final Session session) async {}

  Future<void> intParameter(final Session session, final int value) async {}

  Future<int> doubleInputValue(final Session session, final int value) async {
    return value * 2;
  }

  /// Delays the response for [delay] seconds.
  ///
  /// Responses can be closed by calling [completeAllDelayedResponses].
  Future<void> delayedResponse(final Session session, final int delay) async {
    final uuid = const Uuid().v4();
    final completer = Completer<void>();
    _delayedResponses[uuid] = completer;

    Future.delayed(Duration(seconds: delay), () {
      _delayedResponses.remove(uuid)?.complete();
    });

    return completer.future;
  }

  static Completer<StreamController<int>>? delayedStreamResponseController;
  Stream<int> delayedStreamResponse(final Session session, final int delay) {
    final controller = StreamController<int>();
    delayedStreamResponseController?.complete(controller);

    Future.delayed(Duration(seconds: delay), () {
      controller.add(42);
    });

    return controller.stream;
  }

  static Completer<Session>? delayedNeverListenedInputStreamCompleter;
  Future<void> delayedNeverListenedInputStream(
    final Session session,
    final int delay,
    final Stream<int> stream,
  ) async {
    delayedNeverListenedInputStreamCompleter?.complete(session);
    final uuid = const Uuid().v4();
    final completer = Completer<void>();
    _delayedResponses[uuid] = completer;

    Future.delayed(Duration(seconds: delay), () {
      _delayedResponses.remove(uuid)?.complete();
    });

    await completer.future;
  }

  static Completer<Session>? delayedPausedInputStreamCompleter;
  Future<void> delayedPausedInputStream(
    final Session session,
    final int delay,
    final Stream<int> stream,
  ) async {
    delayedPausedInputStreamCompleter?.complete(session);
    final uuid = const Uuid().v4();
    final completer = Completer<void>();
    _delayedResponses[uuid] = completer;

    Future.delayed(Duration(seconds: delay), () {
      _delayedResponses.remove(uuid)?.complete();
    });

    stream
        .listen((final event) {
          // Do nothing
        })
        .pause(completer.future);

    await completer.future;
  }

  /// Completes all delayed responses.
  /// This makes the delayedResponse return directly.
  Future<void> completeAllDelayedResponses(final Session session) async {
    final delayedResponses = _delayedResponses.values.toList();
    _delayedResponses.clear();
    for (final response in delayedResponses) {
      response.complete();
    }
  }

  Future<void> inStreamThrowsException(
    final Session session,
    final Stream<int> stream,
  ) async {
    throw Exception('This is an exception');
  }

  Future<void> inStreamThrowsSerializableException(
    final Session session,
    final Stream<int> stream,
  ) async {
    throw ExceptionWithData(
      message: 'Throwing an exception',
      creationDate: DateTime.now(),
      errorFields: [
        'first line error',
        'second line error',
      ],
      someNullableField: 1,
    );
  }

  Stream<int> outStreamThrowsException(final Session session) async* {
    throw Exception('This is an exception');
  }

  Stream<int> outStreamThrowsSerializableException(final Session session) async* {
    throw ExceptionWithData(
      message: 'Throwing an exception',
      creationDate: DateTime.now(),
      errorFields: [
        'first line error',
        'second line error',
      ],
      someNullableField: 1,
    );
  }

  Future<void> throwsExceptionVoid(final Session session, final Stream<int> stream) async {
    throw Exception('This is an exception');
  }

  Future<void> throwsSerializableExceptionVoid(
    final Session session,
    final Stream<int> stream,
  ) async {
    throw ExceptionWithData(
      message: 'Throwing an exception',
      creationDate: DateTime.now(),
      errorFields: [
        'first line error',
        'second line error',
      ],
      someNullableField: 1,
    );
  }

  Future<int> throwsException(final Session session, final Stream<int> stream) async {
    throw Exception('This is an exception');
  }

  Future<int> throwsSerializableException(
    final Session session,
    final Stream<int> stream,
  ) async {
    throw ExceptionWithData(
      message: 'Throwing an exception',
      creationDate: DateTime.now(),
      errorFields: [
        'first line error',
        'second line error',
      ],
      someNullableField: 1,
    );
  }

  Stream<int> throwsExceptionStream(final Session session) async* {
    throw Exception('This is an exception');
  }

  Stream<int> exceptionThrownBeforeStreamReturn(final Session session) {
    throw Exception('This is an exception');
  }

  Stream<int> exceptionThrownInStreamReturn(final Session session) {
    final controller = StreamController<int>();
    controller.addError(Exception('This is an exception'));
    return controller.stream;
  }

  Stream<int> throwsSerializableExceptionStream(final Session session) async* {
    throw ExceptionWithData(
      message: 'Throwing an exception',
      creationDate: DateTime.now(),
      errorFields: [
        'first line error',
        'second line error',
      ],
      someNullableField: 1,
    );
  }

  Future<bool> didInputStreamHaveError(
    final Session session,
    final Stream<int> stream,
  ) async {
    final errorCompleter = Completer<bool>();
    stream.listen(
      (final event) {},
      onDone: () => errorCompleter.complete(false),
      onError: (final e) => errorCompleter.complete(true),
      cancelOnError: true,
    );

    final value = await errorCompleter.future;
    return value;
  }

  Future<bool> didInputStreamHaveSerializableExceptionError(
    final Session session,
    final Stream<int> stream,
  ) async {
    final errorCompleter = Completer<bool>();
    stream.listen(
      (final event) {},
      onDone: () => errorCompleter.complete(false),
      onError: (final e) => errorCompleter.complete(e is SerializableException),
      cancelOnError: true,
    );

    final value = await errorCompleter.future;
    return value;
  }
}

class AuthenticatedMethodStreaming extends Endpoint {
  @override
  bool get requireLogin => true;

  @override
  Set<Scope> get requiredScopes => {Scope.admin};

  Stream<int> simpleStream(final Session session) async* {
    for (var i = 0; i < 10; i++) {
      yield i;
    }
  }

  Stream<int> intEchoStream(final Session session, final Stream<int> stream) async* {
    await for (final value in stream) {
      yield value;
    }
  }
}
