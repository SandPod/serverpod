import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import 'package:test/test.dart';

import '../../test_tags.dart';
import '../../test_tools/serverpod_test_tools.dart';
import '../test_utils.dart';

void main() {
  const email = 'Test1@serverpod.dev';

  withServerpod('Given a registered email account,',
      (final sessionBuilder, final endpoints) {
    final testConfig = EmailIDPConfig(passwordHashPepper: 'test');
    final emailIDP = EmailIDP(config: testConfig);
    const email = 'Test1@serverpod.dev';
    const password = 'asdf1234';
    late Session session;
    late UuidValue authUserId;

    setUp(() async {
      session = sessionBuilder.build();

      final authUser = await createAuthUser(session);
      authUserId = authUser.id;

      await createVerifiedEmailAccount(
        session,
        authUserId: authUserId,
        email: email,
        password: password,
      );
    });

    tearDown(() async {
      await cleanUpEmailAccountDatabaseEntities(session);
    });

    test('when authenticating with the original credentials, then it succeeds.',
        () async {
      final loggedInUser = await emailIDP.login(
        session,
        email: email,
        password: password,
      );

      expect(loggedInUser.authUserId, authUserId);
    });

    test(
        'when authenticating with the lower-case email variant of the credentials, then it succeeds.',
        () async {
      final loggedInUser = await emailIDP.login(
        session,
        email: email.toLowerCase(),
        password: password,
      );

      expect(loggedInUser.authUserId, authUserId);
    });
  });

  withServerpod(
    'Given a configuration with a limited number of login attempts,',
    (final sessionBuilder, final endpoints) {
      late Session session;
      late EmailIDP emailIDP;

      setUp(() async {
        session = sessionBuilder.build();
        final testConfig = EmailIDPConfig(
          passwordHashPepper: 'test',
          failedLoginRateLimit: const RateLimit(
            maxAttempts: 1,
            timeframe: Duration(hours: 1),
          ),
        );
        emailIDP = EmailIDP(config: testConfig);
      });

      tearDown(() async {
        await cleanUpEmailAccountDatabaseEntities(session);
      });

      test(
          'when trying to authenticate with an invalid password, '
          'then it throws a "invalid credentials" exception initially and then blocks further attempts with "too many attempts" exception.',
          () async {
        await expectLater(
          () => emailIDP.login(
            session,
            email: email,
            password: 'some other password',
          ),
          throwsA(isA<EmailAccountLoginException>().having(
            (final e) => e.reason,
            'reason',
            EmailAccountLoginExceptionReason.invalidCredentials,
          )),
        );

        await expectLater(
          () => emailIDP.login(
            session,
            email: email,
            password: 'some other password',
          ),
          throwsA(isA<EmailAccountLoginException>().having(
            (final e) => e.reason,
            'reason',
            EmailAccountLoginExceptionReason.tooManyAttempts,
          )),
        );
      });

      test(
          'when attempting to log into a non-existent account, '
          'then it throws a "account not found" exception initially and then blocks further attempts with "too many attempts" exception.',
          () async {
        const unknownEmail = '404@serverpod.dev';

        await expectLater(
          () => emailIDP.login(
            session,
            email: unknownEmail,
            password: 'some other password',
          ),
          throwsA(isA<EmailAccountLoginException>().having(
            (final e) => e.reason,
            'reason',
            EmailAccountLoginExceptionReason.invalidCredentials,
          )),
        );

        await expectLater(
          () => emailIDP.login(
            session,
            email: unknownEmail,
            password: 'some other password',
          ),
          throwsA(isA<EmailAccountLoginException>().having(
            (final e) => e.reason,
            'reason',
            EmailAccountLoginExceptionReason.tooManyAttempts,
          )),
        );
      });
    },
    rollbackDatabase: RollbackDatabase.disabled,
    testGroupTagsOverride: TestTags.concurrencyOneTestTags,
  );
}
