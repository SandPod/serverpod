import 'dart:async';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  late Session session;
  late Serverpod server;

  setUp(() async {
    server = IntegrationTestServer.create();
    await server.start();
    session = await server.createSession();
  });

  tearDown(() async {
    await session.close();
    await server.shutdown(exitProcess: false);
  });

  test(
    'Given a session with a will close listener when the session is closed then listener is called.',
    () async {
      final listenerCalledCompleter = Completer();
      session.addWillCloseListener((final Session session) {
        listenerCalledCompleter.complete();
      });

      await session.close();
      await expectLater(listenerCalledCompleter.future, completes);
    },
  );

  test(
    'Given a session with a will close listener when the session is closed multiple times then listener is only called once.',
    () async {
      var callCount = 0;
      session.addWillCloseListener((final Session session) {
        callCount++;
      });

      await session.close();
      await session.close();
      await session.close();
      expect(callCount, 1);
    },
  );

  test(
    'Given a session with a will close when listener is removed and the session is closed then the listener is not called.',
    () async {
      final listenerCalledCompleter = Completer();
      void listener(final Session session) {
        listenerCalledCompleter.complete();
      }
      session.addWillCloseListener(listener);
      session.removeWillCloseListener(listener);

      expect(listenerCalledCompleter.future, doesNotComplete);
      await expectLater(session.close(), completes);
    },
  );

  test(
    'Given a session with multiple will close listeners when the session is closed then listener are called in order.',
    () async {
      final completeOrder = <int>[];
      final listener1CalledCompleter = Completer();
      final listener2CalledCompleter = Completer();
      final listener3CalledCompleter = Completer();
      session.addWillCloseListener((final Session session) {
        completeOrder.add(1);
        listener1CalledCompleter.complete();
      });
      session.addWillCloseListener((final Session session) {
        completeOrder.add(2);
        listener2CalledCompleter.complete();
      });
      session.addWillCloseListener((final Session session) {
        completeOrder.add(3);
        listener3CalledCompleter.complete();
      });

      await session.close();
      await expectLater(listener1CalledCompleter.future, completes);
      await expectLater(listener2CalledCompleter.future, completes);
      await expectLater(listener3CalledCompleter.future, completes);
      expect(completeOrder, [1, 2, 3]);
    },
  );

  test(
    'Given a session with multiple will close listeners when one is removed and the session is closed then remaining listener are called in order.',
    () async {
      final completeOrder = <int>[];
      final listener1CalledCompleter = Completer();
      final listener2CalledCompleter = Completer();
      final listener3CalledCompleter = Completer();
      session.addWillCloseListener((final Session session) {
        completeOrder.add(1);
        listener1CalledCompleter.complete();
      });

      void listener2Callback(final Session session) {
        completeOrder.add(2);
        listener2CalledCompleter.complete();
      }
      session.addWillCloseListener(listener2Callback);

      session.addWillCloseListener((final Session session) {
        completeOrder.add(3);
        listener3CalledCompleter.complete();
      });

      session.removeWillCloseListener(listener2Callback);
      expect(listener2CalledCompleter.future, doesNotComplete);
      await session.close();

      await expectLater(listener1CalledCompleter.future, completes);
      await expectLater(listener3CalledCompleter.future, completes);
      expect(completeOrder, [1, 3]);
    },
  );
}
