import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  final session = await IntegrationTestServer().session();

  tearDown(() async {
    await SimpleData.db.deleteWhere(session, where: (_) => Constant.bool(true));
  });

  test('Given a transaction with data inserted after savepoint '
      'when rolling back to savepoint '
      'then no data is persisted in the database', () async {
    await session.db.transaction<void>(
      (final transaction) async {
        final savepoint = await transaction.createSavepoint();
        await SimpleData.db.insertRow(
          session,
          SimpleData(num: 1),
          transaction: transaction,
        );
        await savepoint.rollback();
      },
    );

    final fetchedData = await SimpleData.db.find(session);

    expect(fetchedData, isEmpty);
  });

  test('Given a transaction with data inserted after savepoint '
      'when rolling back multiple times to same savepoint '
      'then no data is persisted in the database', () async {
    await session.db.transaction<void>(
      (final transaction) async {
        final savepoint = await transaction.createSavepoint();
        await SimpleData.db.insertRow(
          session,
          SimpleData(num: 1),
          transaction: transaction,
        );
        await savepoint.rollback();
        await savepoint.rollback();
      },
    );

    final fetchedData = await SimpleData.db.find(session);

    expect(fetchedData, isEmpty);
  });

  test('Given a transaction with data inserted after savepoint '
      'when adding new savepoint with data and rolling back to it after '
      'rolling back to the first savepoint '
      'then no data is persisted in the database', () async {
    await session.db.transaction<void>(
      (final transaction) async {
        final firstSavepoint = await transaction.createSavepoint();
        await SimpleData.db.insertRow(
          session,
          SimpleData(num: 1),
          transaction: transaction,
        );
        await firstSavepoint.rollback();

        final secondSavepoint = await transaction.createSavepoint();
        await SimpleData.db.insertRow(
          session,
          SimpleData(num: 2),
          transaction: transaction,
        );
        await secondSavepoint.rollback();
      },
    );

    final fetchedData = await SimpleData.db.find(session);

    expect(fetchedData, isEmpty);
  });

  test('Given a transaction with data inserted after savepoint '
      'when releasing savepoint '
      'then data is persisted in the database', () async {
    await session.db.transaction<void>(
      (final transaction) async {
        final savepoint = await transaction.createSavepoint();
        await SimpleData.db.insertRow(
          session,
          SimpleData(num: 1),
          transaction: transaction,
        );
        await savepoint.release();
      },
    );

    final fetchedData = await SimpleData.db.find(session);

    expect(fetchedData, hasLength(1));
    expect(fetchedData.first.num, 1);
  });

  group('Given a transaction with data inserted after savepoint '
      'when rolling back to savepoint after it has been released ', () {
    late Future<void> transactionFuture;
    setUp(() async {
      transactionFuture = session.db.transaction<void>(
        (final transaction) async {
          final savepoint = await transaction.createSavepoint();
          await SimpleData.db.insertRow(
            session,
            SimpleData(num: 1),
            transaction: transaction,
          );
          await savepoint.release();
          await savepoint.rollback();
        },
      );
    });

    test('then database exception is thrown', () async {
      await expectLater(
        transactionFuture,
        throwsA(
          isA<DatabaseQueryException>().having(
            (final e) => e.code,
            'code',
            PgErrorCode.invalidSavepointSpecification,
          ),
        ),
      );
    });

    test('then no data is persisted in the database', () async {
      await transactionFuture.catchError((final e) => null);

      final fetchedData = await SimpleData.db.find(session);

      expect(fetchedData, isEmpty);
    });
  });

  group(
    'Given a transaction with two savepoints with data insertion in between '
    'when rolling back to first second savepoint after first has been released ',
    () {
      late Future<void> transactionFuture;
      setUp(() async {
        transactionFuture = session.db.transaction<void>(
          (final transaction) async {
            final savepoint = await transaction.createSavepoint();
            await SimpleData.db.insertRow(
              session,
              SimpleData(num: 1),
              transaction: transaction,
            );
            final savepoint2 = await transaction.createSavepoint();
            await SimpleData.db.insertRow(
              session,
              SimpleData(num: 2),
              transaction: transaction,
            );
            await savepoint.release();
            await savepoint2.rollback();
          },
        );
      });

      test('then database exception is thrown', () async {
        await expectLater(
          transactionFuture,
          throwsA(
            isA<DatabaseQueryException>().having(
              (final e) => e.code,
              'code',
              PgErrorCode.invalidSavepointSpecification,
            ),
          ),
        );
      });

      test('then no data is persisted in the database', () async {
        await transactionFuture.catchError((final e) => null);

        final fetchedData = await SimpleData.db.find(session);

        expect(fetchedData, isEmpty);
      });
    },
  );

  test(
    'Given a transaction with data inserted before and after savepoint '
    'when rolling back to savepoint '
    'then data inserted before savepoint is persisted in the database',
    () async {
      final data1 = SimpleData(num: 1);
      final data2 = SimpleData(num: 2);

      await session.db.transaction<void>(
        (final transaction) async {
          await SimpleData.db.insertRow(
            session,
            data1,
            transaction: transaction,
          );
          final savepoint = await transaction.createSavepoint();
          await SimpleData.db.insertRow(
            session,
            data2,
            transaction: transaction,
          );
          await savepoint.rollback();
        },
      );

      final fetchedData = await SimpleData.db.find(session);

      expect(fetchedData, hasLength(1));
      expect(fetchedData.first.num, 1);
    },
  );
}
