import 'dart:async';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_tags.dart';
import 'package:test/test.dart';

import '../../test_tools/serverpod_test_tools.dart';

void main() async {
  withServerpod(
    'Given read committed transaction isolation level and single row in database',
    rollbackDatabase: RollbackDatabase.disabled,
    testGroupTagsOverride: [TestTags.concurrencyOneTestTag],
    (final sessionBuilder, _) {
      final session = sessionBuilder.build();

      tearDown(() async {
        await SimpleData.db.deleteWhere(
          session,
          where: (final t) => Constant.bool(true),
        );
      });

      group(
        'Given read committed transaction isolation level and single row in database',
        () {
          const settings = TransactionSettings(
            isolationLevel: IsolationLevel.readCommitted,
          );

          late SimpleData testData;
          setUp(() async {
            testData = await SimpleData.db.insertRow(
              session,
              SimpleData(num: 1),
            );
          });

          test('when row is modified after first statement in transaction '
              'then transaction observes the updated value.', () async {
            final c1 = Completer();
            final c2 = Completer();
            final transactionFuture = session.db.transaction(
              (final t) async {
                await SimpleData.db.findById(
                  session,
                  testData.id!,
                  transaction: t,
                );

                c1.complete();
                await c2.future;

                return await SimpleData.db.findById(
                  session,
                  testData.id!,
                  transaction: t,
                );
              },
              settings: settings,
            );

            await c1.future;
            await SimpleData.db.updateRow(
              session,
              testData.copyWith(num: 2),
            );
            c2.complete();

            final transactionResult = await transactionFuture;
            expect(transactionResult?.num, 2);
          });
        },
      );
    },
  );

  withServerpod(
    'Given repeatable read transaction isolation level',
    rollbackDatabase: RollbackDatabase.disabled,
    testGroupTagsOverride: [TestTags.concurrencyOneTestTag],
    (final sessionBuilder, _) {
      final session = sessionBuilder.build();

      tearDown(() async {
        await SimpleData.db.deleteWhere(
          session,
          where: (final t) => Constant.bool(true),
        );
      });

      const settings = TransactionSettings(
        isolationLevel: IsolationLevel.repeatableRead,
      );

      test('when row is modified after first statement in transaction '
          'then transaction does NOT observe the updated value.', () async {
        final testData = await SimpleData.db.insertRow(
          session,
          SimpleData(num: 1),
        );

        final c1 = Completer();
        final c2 = Completer();
        final transactionFuture = session.db.transaction(
          (final t) async {
            await SimpleData.db.findById(
              session,
              testData.id!,
              transaction: t,
            );

            c1.complete();
            await c2.future;

            return await SimpleData.db.findById(
              session,
              testData.id!,
              transaction: t,
            );
          },
          settings: settings,
        );

        await c1.future;
        await SimpleData.db.updateRow(
          session,
          testData.copyWith(num: 2),
        );
        c2.complete();

        final result = await transactionFuture;
        expect(result?.num, 1);
      });

      test('when read row is concurrently modified by other transaction '
          'then modifications are preserved', () async {
        final testData1 = await SimpleData.db.insertRow(
          session,
          SimpleData(num: 1),
        );
        final testData2 = await SimpleData.db.insertRow(
          session,
          SimpleData(num: 2),
        );
        final c1 = Completer();
        final c2 = Completer();

        final transaction1 = session.db.transaction(
          (final t) async {
            final data1 = await SimpleData.db.findById(
              session,
              testData1.id!,
              transaction: t,
            );

            c1.complete();
            await c2.future;

            await SimpleData.db.updateRow(
              session,
              testData2.copyWith(num: data1!.num + 10),
              transaction: t,
            );
          },
          settings: settings,
        );

        final transaction2 = session.db.transaction(
          (final t) async {
            final data2 = await SimpleData.db.findById(
              session,
              testData2.id!,
              transaction: t,
            );

            await c1.future;

            await SimpleData.db.updateRow(
              session,
              testData1.copyWith(num: data2!.num + 20),
              transaction: t,
            );
            c2.complete();
          },
          settings: settings,
        );

        await Future.wait([transaction1, transaction2]);
        final data1AfterTransaction = await SimpleData.db.findById(
          session,
          testData1.id!,
        );
        expect(data1AfterTransaction?.num, 22);
        final data2AfterTransaction = await SimpleData.db.findById(
          session,
          testData2.id!,
        );
        expect(data2AfterTransaction?.num, 11);
      });
    },
  );

  withServerpod(
    'Given serializable transaction isolation level',
    rollbackDatabase: RollbackDatabase.disabled,
    testGroupTagsOverride: [TestTags.concurrencyOneTestTag],
    (final sessionBuilder, _) {
      final session = sessionBuilder.build();

      tearDown(() async {
        await SimpleData.db.deleteWhere(
          session,
          where: (final t) => Constant.bool(true),
        );
      });

      const settings = TransactionSettings(
        isolationLevel: IsolationLevel.serializable,
      );

      test('when row is modified after first statement in transaction '
          'then transaction does NOT observe the updated value.', () async {
        final testData = await SimpleData.db.insertRow(
          session,
          SimpleData(num: 1),
        );
        final c1 = Completer();
        final c2 = Completer();
        final transactionFuture = session.db.transaction(
          (final t) async {
            await SimpleData.db.findById(
              session,
              testData.id!,
              transaction: t,
            );

            c1.complete();
            await c2.future;

            return await SimpleData.db.findById(
              session,
              testData.id!,
              transaction: t,
            );
          },
          settings: settings,
        );

        await c1.future;
        await SimpleData.db.updateRow(
          session,
          testData.copyWith(num: 2),
        );
        c2.complete();

        final result = await transactionFuture;
        expect(result?.num, 1);
      });

      test('when read row is concurrently modified by other transaction '
          'then database exception is thrown for one transaction', () async {
        final testData1 = await SimpleData.db.insertRow(
          session,
          SimpleData(num: 1),
        );
        final testData2 = await SimpleData.db.insertRow(
          session,
          SimpleData(num: 2),
        );
        final c1 = Completer();
        final c2 = Completer();

        final transaction1 = session.db.transaction(
          (final t) async {
            final data1 = await SimpleData.db.findById(
              session,
              testData1.id!,
              transaction: t,
            );

            await Future.delayed(const Duration(milliseconds: 100));

            c1.complete();
            await c2.future;

            await SimpleData.db.updateRow(
              session,
              testData2.copyWith(num: data1!.num + 10),
              transaction: t,
            );
          },
          settings: settings,
        );

        final transaction2 = session.db.transaction(
          (final t) async {
            final data2 = await SimpleData.db.findById(
              session,
              testData2.id!,
              transaction: t,
            );

            await c1.future;

            await SimpleData.db.updateRow(
              session,
              testData1.copyWith(num: data2!.num + 20),
              transaction: t,
            );
            c2.complete();
          },
          settings: settings,
        );

        expectLater(
          transaction1,
          throwsA(
            isA<DatabaseQueryException>().having(
              (final e) => e.code,
              'code',
              PgErrorCode.serializationFailure,
            ),
          ),
        );
        await transaction2;
        final data1AfterTransaction = await SimpleData.db.findById(
          session,
          testData1.id!,
        );
        expect(data1AfterTransaction?.num, 22);
        final data2AfterTransaction = await SimpleData.db.findById(
          session,
          testData2.id!,
        );
        expect(data2AfterTransaction?.num, 2);
      });
    },
  );
}
