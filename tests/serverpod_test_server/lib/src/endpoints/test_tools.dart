import 'dart:async';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_module_server/serverpod_test_module_server.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

class TestToolsEndpoint extends Endpoint {
  Future<UuidValue> returnsSessionId(final Session session) async {
    return session.sessionId;
  }

  Future<List<String?>> returnsSessionEndpointAndMethod(final Session session) async {
    return [session.endpoint, session.method];
  }

  Stream<UuidValue> returnsSessionIdFromStream(final Session session) async* {
    yield session.sessionId;
  }

  Stream<String?> returnsSessionEndpointAndMethodFromStream(
    final Session session,
  ) async* {
    yield session.endpoint;
    yield session.method;
  }

  Future<String> returnsString(final Session session, final String string) async {
    return string;
  }

  Stream<int> returnsStream(final Session session, final int n) {
    return Stream<int>.fromIterable(
      List<int>.generate(n, (final index) => index),
    );
  }

  Future<List<int>> returnsListFromInputStream(
    final Session session,
    final Stream<int> numbers,
  ) async {
    return numbers.toList();
  }

  Future<List<SimpleData>> returnsSimpleDataListFromInputStream(
    final Session session,
    final Stream<SimpleData> simpleDatas,
  ) async {
    return simpleDatas.toList();
  }

  Stream<int> returnsStreamFromInputStream(
    final Session session,
    final Stream<int> numbers,
  ) async* {
    await for (final number in numbers) {
      yield number;
    }
  }

  Stream<SimpleData> returnsSimpleDataStreamFromInputStream(
    final Session session,
    final Stream<SimpleData> simpleDatas,
  ) async* {
    await for (final simpleData in simpleDatas) {
      yield simpleData;
    }
  }

  static const sharedStreamName = 'shared-stream';
  Future<void> postNumberToSharedStream(final Session session, final int number) async {
    await session.messages.postMessage(
      sharedStreamName,
      SimpleData(num: number),
    );
  }

  // This obscure scenario is to demonstrate that the stream is consumed right away by the test tools.
  // The test code does not have to start to start listening to the returned stream for it to execute up to the yield.
  Stream<int> postNumberToSharedStreamAndReturnStream(
    final Session session,
    final int number,
  ) async* {
    await session.messages.postMessage(
      sharedStreamName,
      SimpleData(num: number),
    );
    yield 1;
  }

  Stream<int> listenForNumbersOnSharedStream(final Session session) async* {
    final sharedStream = session.messages.createStream<SimpleData>(
      sharedStreamName,
    );

    await for (final message in sharedStream) {
      yield message.num;
    }
  }

  Future<void> createSimpleData(final Session session, final int data) async {
    await SimpleData.db.insertRow(
      session,
      SimpleData(
        num: data,
      ),
    );
  }

  Future<List<SimpleData>> getAllSimpleData(final Session session) async {
    return SimpleData.db.find(session);
  }

  Future<void> createSimpleDatasInsideTransactions(
    final Session session,
    final int data,
  ) async {
    await session.db.transaction((final transaction) async {
      await SimpleData.db.insertRow(
        session,
        SimpleData(
          num: data,
        ),
        transaction: transaction,
      );
    });

    await session.db.transaction((final transaction) async {
      await SimpleData.db.insertRow(
        session,
        SimpleData(
          num: data,
        ),
        transaction: transaction,
      );
    });
  }

  Future<void> createSimpleDataAndThrowInsideTransaction(
    final Session session,
    final int data,
  ) async {
    await session.db.transaction((final transaction) async {
      await SimpleData.db.insertRow(
        session,
        SimpleData(
          num: data,
        ),
        transaction: transaction,
      );
    });

    await session.db.transaction((final transaction) async {
      await SimpleData.db.insertRow(
        session,
        SimpleData(
          num: data,
        ),
        transaction: transaction,
      );

      throw Exception(
        'Some error occurred and transaction should not be committed.',
      );
    });
  }

  Future<void> createSimpleDatasInParallelTransactionCalls(
    final Session session,
  ) async {
    Future<void> createSimpleDataInTransaction(final int num) async {
      await session.db.transaction((final transaction) async {
        await SimpleData.db.insertRow(
          session,
          SimpleData(
            num: num,
          ),
          transaction: transaction,
        );
      });
    }

    await Future.wait([
      createSimpleDataInTransaction(1),
      createSimpleDataInTransaction(2),
      createSimpleDataInTransaction(3),
      createSimpleDataInTransaction(4),
    ]);
  }

  Future<SimpleData> echoSimpleData(
    final Session session,
    final SimpleData simpleData,
  ) async {
    return simpleData;
  }

  Future<List<SimpleData>> echoSimpleDatas(
    final Session session,
    final List<SimpleData> simpleDatas,
  ) async {
    return simpleDatas;
  }

  Future<Types> echoTypes(
    final Session session,
    final Types typesModel,
  ) async {
    return typesModel;
  }

  Future<List<Types>> echoTypesList(
    final Session session,
    final List<Types> typesList,
  ) async {
    return typesList;
  }

  /// Returns a model class which fields reference `ModuleClass` defined in another module
  Future<ModuleDatatype> echoModuleDatatype(
    final Session session,
    final ModuleDatatype moduleDatatype,
  ) async {
    return moduleDatatype;
  }

  Stream<ModuleDatatype?> streamModuleDatatype(
    final Session session,
    final ModuleDatatype? initialValue,
    final Stream<ModuleDatatype?> values,
  ) async* {
    yield initialValue;

    await for (final value in values) {
      yield value;
    }
  }

  /// Returns the given `ModuleClass` instance
  ///
  /// `ModuleClass` is defined in another module
  Future<ModuleClass> echoModuleClass(
    final Session session,
    final ModuleClass moduleClass,
  ) async {
    return moduleClass;
  }

  Stream<ModuleClass?> streamModuleClass(
    final Session session,
    final ModuleClass? initialValue,
    final Stream<ModuleClass?> values,
  ) async* {
    yield initialValue;

    await for (final value in values) {
      yield value;
    }
  }

  Future<(String, (int, bool))> echoRecord(
    final Session session,
    final (String, (int, bool)) record,
  ) async {
    return record;
  }

  Future<List<(String, (int, bool))>> echoRecords(
    final Session session,
    final List<(String, (int, bool))> records,
  ) async {
    return records;
  }

  Stream<(String, (Map<String, int>, {SimpleData simpleData, bool flag}))>
  recordEchoStream(
    final Session session,
    final (String, (Map<String, int>, {SimpleData simpleData, bool flag}))
    initialValue,
    final Stream<(String, (Map<String, int>, {SimpleData simpleData, bool flag}))>
    stream,
  ) async* {
    yield initialValue;
    await for (final value in stream) {
      yield value;
    }
  }

  Stream<List<(String, int)>> listOfRecordEchoStream(
    final Session session,
    final List<(String, int)> initialValue,
    final Stream<List<(String, int)>> stream,
  ) async* {
    yield initialValue;
    await for (final value in stream) {
      yield value;
    }
  }

  Stream<(String, (Map<String, int>, {SimpleData simpleData, bool flag}))?>
  nullableRecordEchoStream(
    final Session session,
    final (String, (Map<String, int>, {SimpleData simpleData, bool flag}))?
    initialValue,
    final Stream<(String, (Map<String, int>, {SimpleData simpleData, bool flag}))?>
    stream,
  ) async* {
    yield initialValue;
    await for (final value in stream) {
      yield value;
    }
  }

  Stream<List<(String, int)>?> nullableListOfRecordEchoStream(
    final Session session,
    final List<(String, int)>? initialValue,
    final Stream<List<(String, int)>?> stream,
  ) async* {
    yield initialValue;
    await for (final value in stream) {
      yield value;
    }
  }

  Stream<TypesRecord?> modelWithRecordsEchoStream(
    final Session session,
    final TypesRecord? initialValue,
    final Stream<TypesRecord?> stream,
  ) async* {
    yield initialValue;
    await for (final value in stream) {
      yield value;
    }
  }

  Future<void> logMessageWithSession(final Session session) async {
    session.log('test session log in endpoint');
  }

  static Completer<void>? willCloseListenerCalled;

  Future<void> addWillCloseListenerToSessionAndThrow(final Session session) async {
    session.addWillCloseListener((final Session s) {
      willCloseListenerCalled?.complete();
    });

    throw Exception();
  }

  Stream<int> addWillCloseListenerToSessionIntStreamMethodAndThrow(
    final Session session,
  ) {
    session.addWillCloseListener((final Session s) {
      willCloseListenerCalled?.complete();
    });

    throw Exception();
  }

  // Cache testing methods
  Future<void> putInLocalCache(
    final Session session,
    final String key,
    final SimpleData data,
  ) async {
    await session.caches.local.put(key, data);
  }

  Future<SimpleData?> getFromLocalCache(final Session session, final String key) async {
    return await session.caches.local.get<SimpleData>(key);
  }

  Future<void> putInLocalPrioCache(
    final Session session,
    final String key,
    final SimpleData data,
  ) async {
    await session.caches.localPrio.put(key, data);
  }

  Future<SimpleData?> getFromLocalPrioCache(final Session session, final String key) async {
    return await session.caches.localPrio.get<SimpleData>(key);
  }

  Future<void> putInQueryCache(
    final Session session,
    final String key,
    final SimpleData data,
  ) async {
    await session.caches.query.put(key, data);
  }

  Future<SimpleData?> getFromQueryCache(final Session session, final String key) async {
    return await session.caches.query.get<SimpleData>(key);
  }

  Future<void> putInLocalCacheWithGroup(
    final Session session,
    final String key,
    final SimpleData data,
    final String group,
  ) async {
    await session.caches.local.put(key, data, group: group);
  }
}

class AuthenticatedTestToolsEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  @override
  Set<Scope> get requiredScopes => {const Scope('user')};

  Future<String> returnsString(final Session session, final String string) async {
    return string;
  }

  Stream<int> returnsStream(final Session session, final int n) {
    return Stream<int>.fromIterable(
      List<int>.generate(n, (final index) => index),
    );
  }

  Future<List<int>> returnsListFromInputStream(
    final Session session,
    final Stream<int> numbers,
  ) async {
    return numbers.toList();
  }

  Stream<int> intEchoStream(final Session session, final Stream<int> stream) async* {
    await for (final value in stream) {
      yield value;
    }
  }
}
