import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  final session = await IntegrationTestServer().session();
  test(
    'Given that a table does not exist in the database when querying that table then the database exception prompt the user to check if a migration was applied.',
    () async {
      final randomName = 't_${const Uuid().v4().replaceAll('-', '_')}';

      await expectLater(
        session.db.unsafeQuery('SELECT * FROM $randomName'),
        throwsA(
          allOf(
            isA<DatabaseQueryException>().having(
              (final e) => e.code,
              'code',
              PgErrorCode.undefinedTable,
            ),
            predicate<DatabaseQueryException>(
              (final e) => e.message.contains(
                'Table not found, have you applied the database migration? (',
              ),
            ),
          ),
        ),
      );
    },
  );
}
