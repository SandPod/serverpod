import 'package:clock/clock.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import 'package:test/test.dart';

import '../../test_tags.dart';
import '../../test_tools/serverpod_test_tools.dart';
import '../test_utils.dart';

void main() {
  withServerpod(
    'Given no auth users,',
    (final sessionBuilder, final endpoints) {
      late Session session;
      final testConfig = EmailIDPConfig(passwordHashPepper: 'test');
      final emailIDP = EmailIDP(config: testConfig);

      setUp(() async {
        session = sessionBuilder.build();
      });

      tearDown(() async {
        await cleanUpEmailAccountDatabaseEntities(session);
      });

      test(
          'when requesting a reset for a non-existent email, it returns "email does not exist" status (for internal use).',
          () async {
        final result = await emailIDP.utils.startPasswordReset(
          session,
          email: '404@serverpod.dev',
          transaction: null,
        );

        expect(result.result, PasswordResetResult.emailDoesNotExist);
        expect(result.passwordResetRequestId, isNull);
      });
    },
    rollbackDatabase: RollbackDatabase.disabled,
    testGroupTagsOverride: TestTags.concurrencyOneTestTags,
  );

  withServerpod('Given a registered email account,',
      (final sessionBuilder, final endpoints) {
    const email = 'Test1@serverpod.dev';
    const password = 'asdf1234';
    late Session session;
    late UuidValue authUserId;
    late UuidValue receivedPasswordResetRequestId;
    late String receivedVerificationCode;
    late EmailIDP emailIDP;

    setUp(() async {
      session = sessionBuilder.build();
      final config = EmailIDPConfig(
        passwordHashPepper: 'test',
        sendPasswordResetVerificationCode: (
          final session, {
          required final email,
          required final passwordResetRequestId,
          required final verificationCode,
          required final transaction,
        }) {
          receivedPasswordResetRequestId = passwordResetRequestId;
          receivedVerificationCode = verificationCode;
        },
      );
      emailIDP = EmailIDP(config: config);

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

    test(
        'when requesting a password reset for the account, then the process ID and verification code are given to the configured callback.',
        () async {
      final result = await emailIDP.utils.startPasswordReset(
        session,
        email: email.toUpperCase(),
        transaction: null,
      );

      expect(receivedPasswordResetRequestId, isNotNull);
      expect(receivedVerificationCode, isNotNull);

      expect(result.result, PasswordResetResult.passwordResetSent);
      expect(result.passwordResetRequestId, receivedPasswordResetRequestId);
    });
  });

  withServerpod(
    'Given a configuration with a limited number of password reset attempts,',
    (final sessionBuilder, final endpoints) {
      late Session session;
      late EmailIDP emailIDP;
      const email = 'Test1@serverpod.dev';

      setUp(() async {
        session = sessionBuilder.build();
        final config = EmailIDPConfig(
          passwordHashPepper: 'test',
          maxPasswordResetAttempts: (
            maxAttempts: 1,
            timeframe: const Duration(hours: 1)
          ),
        );
        emailIDP = EmailIDP(config: config);
      });

      tearDown(() async {
        await cleanUpEmailAccountDatabaseEntities(session);
      });

      test(
          'when requesting too many password resets, '
          'then it throws a "too many attempts" exception.', () async {
        await emailIDP.utils.startPasswordReset(
          session,
          email: email,
          transaction: null,
        );

        await expectLater(
          () => emailIDP.utils.startPasswordReset(
            session,
            email: email.toUpperCase(),
            transaction: null,
          ),
          throwsA(isA<EmailPasswordResetTooManyAttemptsException>()),
        );
      });
    },
    rollbackDatabase: RollbackDatabase.disabled,
    testGroupTagsOverride: TestTags.concurrencyOneTestTags,
  );

  withServerpod(
    'Given a pending password reset request,',
    (final sessionBuilder, final endpoints) {
      const email = 'Test1@serverpod.dev';
      const password = 'asdf1234';
      late Session session;
      late UuidValue authUserId;
      late UuidValue passwordResetRequestId;
      late String verificationCode;
      late EmailIDP emailIDP;
      late EmailIDPConfig testConfig;

      setUp(() async {
        session = sessionBuilder.build();
        testConfig = EmailIDPConfig(
          passwordResetVerificationCodeLifetime: const Duration(minutes: 1),
          passwordHashPepper: 'test',
          passwordResetVerificationCodeAllowedAttempts: 1,
        );
        emailIDP = EmailIDP(config: testConfig);

        final authUser = await createAuthUser(session);
        authUserId = authUser.id;

        await createVerifiedEmailAccount(
          session,
          authUserId: authUserId,
          email: email,
          password: password,
        );

        (passwordResetRequestId, verificationCode) = await requestPasswordReset(
          session,
          email: email,
        );
      });

      tearDown(() async {
        await cleanUpEmailAccountDatabaseEntities(session);
      });

      test(
          'when changing the password with the correct verification code, then it returns the auth user ID.',
          () async {
        final result = await emailIDP.utils.completePasswordReset(
          session,
          passwordResetRequestId: passwordResetRequestId,
          verificationCode: verificationCode,
          newPassword: '1234asdf!!!',
          transaction: null,
        );

        expect(result, authUserId);
      });

      test(
          'when completing a password reset after the associated account was deleted, '
          'then it throws an "reset not found" exception.', () async {
        final account = await EmailAccount.db.findFirstRow(
          session,
          where: (final t) => t.authUserId.equals(authUserId),
        );

        if (account != null) {
          await EmailAccount.db.deleteRow(
            session,
            account,
          );
        }

        await expectLater(
          () => emailIDP.utils.completePasswordReset(
            session,
            passwordResetRequestId: passwordResetRequestId,
            verificationCode: verificationCode,
            newPassword: '1234asdf!!!',
            transaction: null,
          ),
          throwsA(isA<EmailPasswordResetRequestNotFoundException>()),
        );
      });

      test(
          'when completing a password reset with a password that violates policy, '
          'then it throws a "password policy violation" exception regardless of the verification code.',
          () async {
        await expectLater(
          () => emailIDP.utils.completePasswordReset(
            session,
            passwordResetRequestId: passwordResetRequestId,
            verificationCode: 'wrong',
            newPassword: 'short',
            transaction: null,
          ),
          throwsA(isA<EmailPasswordResetPasswordPolicyViolationException>()),
        );
      });

      test(
          'when trying to complete an expired password reset request with the correct verification code'
          'then it throws an "expired" exception.', () async {
        await expectLater(
          () => withClock(
            Clock.fixed(DateTime.now()
                .add(testConfig.passwordResetVerificationCodeLifetime)),
            () => emailIDP.utils.completePasswordReset(
              session,
              passwordResetRequestId: passwordResetRequestId,
              verificationCode: verificationCode,
              newPassword: '1234asdf!!!',
              transaction: null,
            ),
          ),
          throwsA(isA<EmailPasswordResetRequestExpiredException>()),
        );
      });

      test(
          'when trying to complete an expired password reset request with the wrong verification code'
          'then it throws an "invalid verification code" exception to not leak that the request exists.',
          () async {
        await expectLater(
          () => withClock(
            Clock.fixed(DateTime.now()
                .add(testConfig.passwordResetVerificationCodeLifetime)),
            () => emailIDP.utils.completePasswordReset(
              session,
              passwordResetRequestId: passwordResetRequestId,
              verificationCode: 'wrong',
              newPassword: '1234asdf!!!',
              transaction: null,
            ),
          ),
          throwsA(isA<EmailPasswordResetInvalidVerificationCodeException>()),
        );
      });

      test(
          'when changing the password with an incorrect verification code, '
          'then it throws a "too many attempts" on the second attempt and "not found" on the next ones. ',
          () async {
        await expectLater(
          () => emailIDP.utils.completePasswordReset(
            session,
            passwordResetRequestId: passwordResetRequestId,
            verificationCode: 'wrong',
            newPassword: '1234asdf!!!',
            transaction: null,
          ),
          throwsA(isA<EmailPasswordResetInvalidVerificationCodeException>()),
        );

        await expectLater(
          () => emailIDP.utils.completePasswordReset(
            session,
            passwordResetRequestId: passwordResetRequestId,
            verificationCode: 'wrong',
            newPassword: '1234asdf!!!',
            transaction: null,
          ),
          throwsA(
              isA<EmailPasswordResetTooManyVerificationAttemptsException>()),
        );

        await expectLater(
          () => emailIDP.utils.completePasswordReset(
            session,
            passwordResetRequestId: passwordResetRequestId,
            verificationCode: 'wrong',
            newPassword: '1234asdf!!!',
            transaction: null,
          ),
          throwsA(isA<EmailPasswordResetRequestNotFoundException>()),
        );
      });
    },
    rollbackDatabase: RollbackDatabase.disabled,
    testGroupTagsOverride: TestTags.concurrencyOneTestTags,
  );

  withServerpod(
    'Given a completed password reset,',
    (final sessionBuilder, final endpoints) {
      const email = 'Test1@serverpod.dev';
      const oldPassword = 'old123456';
      const newPassword = 'new1234!';
      late Session session;
      late UuidValue authUserId;
      late EmailIDP emailIDP;
      setUp(() async {
        session = sessionBuilder.build();
        final testConfig = EmailIDPConfig(
          passwordHashPepper: 'test',
        );
        emailIDP = EmailIDP(config: testConfig);

        final authUser = await createAuthUser(session);
        authUserId = authUser.id;

        await createVerifiedEmailAccount(
          session,
          authUserId: authUserId,
          email: email,
          password: oldPassword,
        );

        await resetPassword(
          session,
          email: email,
          newPassword: newPassword,
        );
      });

      tearDown(() async {
        await cleanUpEmailAccountDatabaseEntities(session);
      });

      test(
          'when using the new credentials for an authentication, then it succeeds.',
          () async {
        final userId = await emailIDP.utils.authenticate(
          session,
          email: email,
          password: newPassword,
          transaction: null,
        );

        expect(userId, authUserId);
      });

      test(
          'when using the old credentials for the login, '
          'then it throws an "invalid credentials" exception.', () async {
        await expectLater(
          () => emailIDP.utils.authenticate(
            session,
            email: email,
            password: oldPassword,
            transaction: null,
          ),
          throwsA(isA<EmailAuthenticationInvalidCredentialsException>()),
        );
      });
    },
    rollbackDatabase: RollbackDatabase.disabled,
    testGroupTagsOverride: TestTags.concurrencyOneTestTags,
  );
}
