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
      final config = EmailIDPConfig(passwordHashPepper: 'test');
      final emailIDP = EmailIDP(config: config);

      setUp(() async {
        session = sessionBuilder.build();
      });

      tearDown(() async {
        await cleanUpEmailAccountDatabaseEntities(session);
      });

      test(
          'when trying to create a new account with an invalid email, '
          'then no account request is created and the correct status returned.',
          () async {
        final accountCreationResult =
            await emailIDP.utils.accountCreationUtils.startAccountCreation(
          session,
          email: 'test@serverpod',
          password: 'Afine123Pw!',
          transaction: null,
        );

        expect(accountCreationResult.accountRequestId, isNull);
        expect(
          accountCreationResult.result,
          EmailAccountRequestResult.emailInvalid,
        );
      });

      test(
          'when trying to create a new account with a short password, '
          'then it throws a "password policy violation" exception.', () async {
        await expectLater(
          () => emailIDP.utils.accountCreationUtils.startAccountCreation(
            session,
            email: 'test@serverpod.dev',
            password: 'short',
            transaction: null,
          ),
          throwsA(isA<EmailPasswordPolicyViolationException>()),
        );
      });

      test(
          'when requesting a new account, '
          'then the configured callback is invoked with a valid process ID and verification code.',
          () async {
        UuidValue? receivedAccountRequestId;
        String? receivedVerificationCode;

        final result =
            await emailIDP.utils.accountCreationUtils.startAccountCreation(
          session,
          email: 'test123@serverpod.dev',
          password: 'Abc1234!',
          transaction: null,
        );

        expect(receivedAccountRequestId, isNotNull);
        expect(receivedVerificationCode, isNotNull);

        expect(result.result, EmailAccountRequestResult.accountRequestCreated);
        expect(result.accountRequestId, receivedAccountRequestId);
      });
    },
    rollbackDatabase: RollbackDatabase.disabled,
    testGroupTagsOverride: TestTags.concurrencyOneTestTags,
  );

  withServerpod(
    'Given a pending email account request,',
    (final sessionBuilder, final endpoints) {
      const email = 'Test1@serverpod.dev';
      late Session session;
      late UuidValue pendingAccountRequestId;
      late String pendingAccountVerificationCode;
      late EmailIDP emailIDP;
      const verificationCodeLifetime = Duration(minutes: 15);

      setUp(() async {
        session = sessionBuilder.build();

        final config = EmailIDPConfig(
          passwordHashPepper: 'test',
          sendRegistrationVerificationCode: (
            final session, {
            required final email,
            required final accountRequestId,
            required final verificationCode,
            required final transaction,
          }) {
            pendingAccountRequestId = accountRequestId;
            pendingAccountVerificationCode = verificationCode;
          },
          registrationVerificationCodeLifetime: verificationCodeLifetime,
        );

        emailIDP = EmailIDP(config: config);

        await emailIDP.utils.accountCreationUtils.startAccountCreation(
          session,
          email: email,
          password: 'Abc1234!',
          transaction: null,
        );
      });

      tearDown(() async {
        await cleanUpEmailAccountDatabaseEntities(session);
      });

      test(
          'when requesting a new account for the same email address, then it fails with an "already requested" error.',
          () async {
        final result =
            await emailIDP.utils.accountCreationUtils.startAccountCreation(
          session,
          email: email,
          password: '1223456789',
          transaction: null,
        );

        expect(
          result.result,
          EmailAccountRequestResult.emailAlreadyRequested,
        );
        expect(result.accountRequestId, isNull);
      });

      test(
          'when requesting a new account for the same email address in all lower-case, then it fails with an "already requested" error.',
          () async {
        final result =
            await emailIDP.utils.accountCreationUtils.startAccountCreation(
          session,
          email: email.toLowerCase(),
          password: '1223456789',
          transaction: null,
        );

        expect(
          result.result,
          EmailAccountRequestResult.emailAlreadyRequested,
        );
        expect(result.accountRequestId, isNull);
      });

      test(
          'when verifying the account request with the correct code, then it passes and returns the associated email.',
          () async {
        final result =
            await emailIDP.utils.accountCreationUtils.verifyAccountCreation(
          session,
          accountRequestId: pendingAccountRequestId,
          verificationCode: pendingAccountVerificationCode,
          transaction: null,
        );

        expect(result.requestId, pendingAccountRequestId);
        expect(result.email, email.toLowerCase());
      });

      test(
          'when verifying the account request with an incorrect code, '
          'then it throws an "invalid verification code" exception.', () async {
        await expectLater(
          () => emailIDP.utils.accountCreationUtils.verifyAccountCreation(
            session,
            accountRequestId: pendingAccountRequestId,
            verificationCode: 'some invalid code',
            transaction: null,
          ),
          throwsA(isA<EmailAccountRequestInvalidVerificationCodeException>()),
        );
      });

      test(
          'when verifying the account request with the correct verification code after it has expired, '
          'then it throws an "expired" exception.', () async {
        await expectLater(
          () => withClock(
            Clock.fixed(DateTime.now().add(verificationCodeLifetime)),
            () => emailIDP.utils.accountCreationUtils.verifyAccountCreation(
              session,
              accountRequestId: pendingAccountRequestId,
              verificationCode: pendingAccountVerificationCode,
              transaction: null,
            ),
          ),
          throwsA(isA<EmailAccountRequestVerificationExpiredException>()),
        );
      });

      test(
          'when verifying the account request with the wrong verification code after it has expired '
          'then it throws an "invalid verification code" exception to not leak that the request exists.',
          () async {
        await expectLater(
          () => withClock(
            Clock.fixed(DateTime.now().add(verificationCodeLifetime)),
            () => emailIDP.utils.accountCreationUtils.verifyAccountCreation(
              session,
              accountRequestId: pendingAccountRequestId,
              verificationCode: 'wrong',
              transaction: null,
            ),
          ),
          throwsA(isA<EmailAccountRequestInvalidVerificationCodeException>()),
        );
      });
    },
    rollbackDatabase: RollbackDatabase.disabled,
    testGroupTagsOverride: TestTags.concurrencyOneTestTags,
  );

  withServerpod(
    'Given a configuration with a limited number of verification code attempts,',
    (final sessionBuilder, final endpoints) {
      late EmailIDP emailIDP;
      late Session session;
      const email = 'Test1@serverpod.dev';
      late UuidValue pendingAccountRequestId;
      const verificationCodeLifetime = Duration(minutes: 15);

      setUp(() async {
        session = sessionBuilder.build();
        final config = EmailIDPConfig(
          passwordHashPepper: 'test',
          registrationVerificationCodeAllowedAttempts: 1,
          sendRegistrationVerificationCode: (
            final session, {
            required final email,
            required final accountRequestId,
            required final verificationCode,
            required final transaction,
          }) {
            pendingAccountRequestId = accountRequestId;
          },
          registrationVerificationCodeLifetime: verificationCodeLifetime,
        );
        emailIDP = EmailIDP(config: config);
      });

      test(
          'when verifying the account request with an invalid verification code multiple times, '
          'then it throws an "invalid verification code" exception on the second attempt and "request not found" on the next ones. ',
          () async {
        await expectLater(
          () => emailIDP.utils.accountCreationUtils.verifyAccountCreation(
            session,
            accountRequestId: pendingAccountRequestId,
            verificationCode: 'wrong code',
            transaction: null,
          ),
          throwsA(isA<EmailAccountRequestInvalidVerificationCodeException>()),
        );

        await expectLater(
          () => emailIDP.utils.accountCreationUtils.verifyAccountCreation(
            session,
            accountRequestId: pendingAccountRequestId,
            verificationCode: 'wrong code',
            transaction: null,
          ),
          throwsA(
              isA<EmailAccountRequestVerificationTooManyAttemptsException>()),
        );

        await expectLater(
          () => emailIDP.utils.accountCreationUtils.verifyAccountCreation(
            session,
            accountRequestId: pendingAccountRequestId,
            verificationCode: 'wrong code',
            transaction: null,
          ),
          throwsA(isA<EmailAccountRequestNotFoundException>()),
        );
      });

      test(
          'when creating an account from the unverified request, '
          'then it throws an "account request not verified" exception.',
          () async {
        final authUser = await createAuthUser(session);

        await expectLater(
          () => emailIDP.utils.accountCreationUtils.completeAccountCreation(
            session,
            authUserId: authUser.id,
            accountRequestId: pendingAccountRequestId,
            transaction: null,
          ),
          throwsA(isA<EmailAccountRequestNotVerifiedException>()),
        );
      });

      test(
          'when looking up the request using `EmailAccountsAdmin.findEmailAccountRequest`, then the associated email is returned.',
          () async {
        final requestInfo = await emailIDP.admin.findEmailAccountRequest(
          session,
          accountRequestId: pendingAccountRequestId,
        );

        expect(
          requestInfo?.email,
          email.toLowerCase(),
        );
      });

      test(
          'when looking up the request using `EmailAccountsAdmin.findEmailAccountRequest`, then it is not verified.',
          () async {
        final requestInfo = await emailIDP.admin.findEmailAccountRequest(
          session,
          accountRequestId: pendingAccountRequestId,
        );

        expect(
          requestInfo?.isVerified,
          isFalse,
        );
      });

      test(
          'when looking up the request using `EmailAccountsAdmin.findEmailAccountRequest` after it has expired, then it returns `null`.',
          () async {
        final requestInfo = await withClock(
          Clock.fixed(DateTime.now().add(verificationCodeLifetime)),
          () => emailIDP.admin.findEmailAccountRequest(
            session,
            accountRequestId: pendingAccountRequestId,
          ),
        );

        expect(requestInfo, isNull);
      });
    },
    rollbackDatabase: RollbackDatabase.disabled,
    testGroupTagsOverride: TestTags.concurrencyOneTestTags,
  );

  withServerpod(
    'Given a verified email account request,',
    (final sessionBuilder, final endpoints) {
      const email = 'Test1@serverpod.dev';
      late EmailIDP emailIDP;
      late Session session;
      late UuidValue pendingAccountRequestId;

      setUp(() async {
        session = sessionBuilder.build();

        late final String pendingAccountVerificationCode;
        final config = EmailIDPConfig(
          passwordHashPepper: 'test',
          sendRegistrationVerificationCode: (
            final session, {
            required final email,
            required final accountRequestId,
            required final verificationCode,
            required final transaction,
          }) {
            pendingAccountRequestId = accountRequestId;
            pendingAccountVerificationCode = verificationCode;
          },
        );

        emailIDP = EmailIDP(config: config);

        await emailIDP.utils.accountCreationUtils.startAccountCreation(
          session,
          email: email,
          password: 'Abc1234!',
          transaction: null,
        );

        await emailIDP.utils.accountCreationUtils.verifyAccountCreation(
          session,
          accountRequestId: pendingAccountRequestId,
          verificationCode: pendingAccountVerificationCode,
          transaction: null,
        );
      });

      tearDown(() async {
        await cleanUpEmailAccountDatabaseEntities(session);
      });

      test(
          'when creating an account from the verified request, then it succeeds.',
          () async {
        final authUser = await createAuthUser(session);

        final result =
            await emailIDP.utils.accountCreationUtils.completeAccountCreation(
          session,
          authUserId: authUser.id,
          accountRequestId: pendingAccountRequestId,
          transaction: null,
        );

        expect(result.email, email.toLowerCase());
      });

      test(
          'when looking up the request using `EmailAccountsAdmin.findEmailAccountRequest`, then it is verified.',
          () async {
        final requestInfo = await emailIDP.admin.findEmailAccountRequest(
          session,
          accountRequestId: pendingAccountRequestId,
        );

        expect(requestInfo?.isVerified, isTrue);
      });
    },
    rollbackDatabase: RollbackDatabase.disabled,
    testGroupTagsOverride: TestTags.concurrencyOneTestTags,
  );

  withServerpod(
    'Given a registered email account,',
    (final sessionBuilder, final endpoints) {
      const email = 'Test1@serverpod.dev';
      const password = 'asdf1234';
      late Session session;
      late UuidValue authUserId;
      late EmailIDP emailIDP;
      late ({
        UuidValue accountRequestId,
        String verificationCode,
      }) accountCreationParameters;

      setUp(() async {
        session = sessionBuilder.build();

        final config = EmailIDPConfig(
          passwordHashPepper: 'test',
        );
        emailIDP = EmailIDP(config: config);

        final authUser = await createAuthUser(session);
        authUserId = authUser.id;

        final accountCreationDetails = await createVerifiedEmailAccount(
          session,
          authUserId: authUserId,
          email: email,
          password: password,
        );

        accountCreationParameters = (
          accountRequestId: accountCreationDetails.accountRequestId,
          verificationCode: accountCreationDetails.verificationCode,
        );
      });

      tearDown(() async {
        await cleanUpEmailAccountDatabaseEntities(session);
      });

      test(
          'when attempting to create a new account using the same email in upper case, then it fails.',
          () async {
        final result =
            await emailIDP.utils.accountCreationUtils.startAccountCreation(
          session,
          email: email.toUpperCase(),
          password: password,
          transaction: null,
        );

        expect(result.result, EmailAccountRequestResult.emailAlreadyRegistered);
      });

      test(
          'when attempting to create the account again with same account request data, '
          'then it throws an "account request not found" exception.', () async {
        await expectLater(
          () => emailIDP.utils.accountCreationUtils.verifyAccountCreation(
            session,
            accountRequestId: accountCreationParameters.accountRequestId,
            verificationCode: accountCreationParameters.verificationCode,
            transaction: null,
          ),
          throwsA(isA<EmailAccountRequestNotFoundException>()),
        );
      });

      test(
          'when looking up the request using `EmailAccountsAdmin.findEmailAccountRequest`, then it returns `null`.',
          () async {
        final requestInfo = await emailIDP.admin.findEmailAccountRequest(
          session,
          accountRequestId: accountCreationParameters.accountRequestId,
        );

        expect(requestInfo, isNull);
      });
    },
    rollbackDatabase: RollbackDatabase.disabled,
    testGroupTagsOverride: TestTags.concurrencyOneTestTags,
  );
}
