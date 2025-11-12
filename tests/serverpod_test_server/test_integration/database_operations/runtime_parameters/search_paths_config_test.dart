import 'package:serverpod/database.dart';
import 'package:serverpod_shared/serverpod_shared.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  group('Given SearchPathsConfig runtime parameters', () {
    test(
      'when setting parameters globally then options are applied globally.',
      () async {
        final session = await IntegrationTestServer(
          runtimeParametersBuilder: (final params) => [
            params.searchPaths(['custom_schema', 'public']),
          ],
        ).session();

        final checkQuery = const SearchPathsConfig().buildCheckValues();
        final result = await session.db.unsafeQuery(checkQuery);

        expect(result.length, 1);
        final row = result.first.toColumnMap();
        expect(row['search_path'], 'custom_schema, public');
      },
    );

    test(
      'when setting parameters in transaction then they do not affect global settings.',
      () async {
        final checkQuery = const SearchPathsConfig().buildCheckValues();

        final session = await IntegrationTestServer(
          runtimeParametersBuilder: (final params) => [
            params.searchPaths(['custom_schema', 'public']),
          ],
        ).session();

        await session.db.transaction((final transaction) async {
          await transaction.setRuntimeParameters(
            (final params) => [
              params.searchPaths(['transaction_schema', 'temp_schema']),
            ],
          );

          final localResult = await session.db.unsafeQuery(
            checkQuery,
            transaction: transaction,
          );
          final localRow = localResult.first.toColumnMap();

          expect(localRow['search_path'], 'transaction_schema, temp_schema');
        });

        final globalResult = await session.db.unsafeQuery(checkQuery);
        final globalRow = globalResult.first.toColumnMap();
        expect(globalRow['search_path'], 'custom_schema, public');
      },
    );

    group('when the server has search_paths configured in the config', () {
      final config = ServerpodConfig(
        apiServer: ServerConfig(
          port: 8080,
          publicHost: 'localhost',
          publicPort: 8080,
          publicScheme: 'http',
        ),
        webServer: ServerConfig(
          port: 8080,
          publicHost: 'localhost',
          publicPort: 8081,
          publicScheme: 'http',
        ),
        database: DatabaseConfig(
          host: 'postgres',
          port: 5432,
          name: 'serverpod_test',
          user: 'postgres',
          password: 'password',
          searchPaths: ['first_path', 'second_path'],
        ),
        serviceSecret: 'longpasswordthatisrequired',
      );

      test(
        'when no runtime parameters override config search paths then config search paths are used.',
        () async {
          final session = await IntegrationTestServer(
            config: config,
          ).session();

          final checkQuery = const SearchPathsConfig().buildCheckValues();
          final result = await session.db.unsafeQuery(checkQuery);

          expect(result.length, 1);
          final row = result.first.toColumnMap();
          expect(row['search_path'], 'first_path, second_path');
        },
      );

      test(
        'when runtime parameters override config search paths then runtime parameters take precedence.',
        () async {
          final session = await IntegrationTestServer(
            config: config,
            runtimeParametersBuilder: (final params) => [
              params.searchPaths(['runtime_schema', 'runtime_public']),
            ],
          ).session();

          final checkQuery = const SearchPathsConfig().buildCheckValues();
          final result = await session.db.unsafeQuery(checkQuery);

          expect(result.length, 1);
          final row = result.first.toColumnMap();
          expect(row['search_path'], 'runtime_schema, runtime_public');
        },
      );

      test(
        'when setting search paths to null via runtime parameters then search paths are cleared.',
        () async {
          final session = await IntegrationTestServer(
            config: config,
            runtimeParametersBuilder: (final params) => [
              params.searchPaths(),
            ],
          ).session();

          final checkQuery = const SearchPathsConfig().buildCheckValues();
          final result = await session.db.unsafeQuery(checkQuery);

          expect(result.length, 1);
          final row = result.first.toColumnMap();
          expect(row['search_path'], '"\$user", public');
        },
      );
    });
  });
}
