import 'package:serverpod_auth_server/module.dart';
import 'package:test/test.dart';

import '../../test_tools/serverpod_test_tools.dart';

void main() async {
  AuthConfig.set(
    AuthConfig(
      sendValidationEmail: (final session, final email, final validationCode) async {
        print('Sending validation email to $email with code $validationCode');
        return true;
      },
      passwordHashValidator:
          ({
            required final password,
            required final email,
            required final hash,
            final onError,
            final onValidationFailure,
          }) async =>
              // Always return true to allow the test to proceed
              const PasswordValidationSuccess(),
      // Custom password hash generator that does not hash the password
      passwordHashGenerator: (final password) async => password,
      extraSaltyHash: false,
    ),
  );

  withServerpod(
    'Given a custom non-hashing password hash generator and a create account request',
    (final sessionBuilder, _) {
      final session = sessionBuilder.build();
      const userName = 'test';
      const email = 'test8@serverpod.dev';
      const password = 'password';

      setUp(() async {
        await Emails.createAccountRequest(session, userName, email, password);
      });

      test(
        'when inspecting password hash then password is not hashed',
        () async {
          final emailAuth = await EmailCreateAccountRequest.db.findFirstRow(
            session,
            where: (final t) => t.email.equals(email),
          );

          expect(
            emailAuth,
            isNotNull,
            reason: 'Failed to find create account',
          );
          final passwordHash = emailAuth!.hash;

          expect(
            passwordHash,
            password,
            reason: 'Password hash is not the same as password',
          );
        },
      );
    },
  );

  withServerpod(
    'Given a custom always true password hash validator and a created user',
    (final sessionBuilder, _) {
      final session = sessionBuilder.build();
      const userName = 'test';
      const email = 'test8@serverpod.dev';
      const password = 'password';

      setUp(() async {
        await Emails.createUser(session, userName, email, password);
      });

      test(
        'when authenticating with incorrect password then user can authenticate',
        () async {
          const incorrectPassword = '$password-incorrect';
          final authResponse = await Emails.authenticate(
            session,
            email,
            incorrectPassword,
          );
          expect(
            authResponse.success,
            isTrue,
            reason: 'Failed to authenticate user.',
          );
        },
      );
    },
  );

  withServerpod(
    'Given custom hash generator and a stored legacy password in the database',
    (final sessionBuilder, _) {
      final session = sessionBuilder.build();
      const userName = 'test';
      const email = 'test@serverpod.dev';
      const password = 'hunter2';
      // Legacy hash of the password 'hunter2'
      const legacyHash =
          '0713234b3cb6a6f98f6978f17a55a54578c580698dc1d56371502be6abb457eb';

      setUp(() async {
        await Emails.createUser(session, userName, email, password);
        final entry = await EmailAuth.db.findFirstRow(
          session,
          where: (final t) => t.email.equals(email),
        );
        assert(entry != null, 'Failed to find email auth entry');
        final withLegacyHash = entry!.copyWith(
          // Legacy hash of the password 'hunter2'
          hash: legacyHash,
        );
        await EmailAuth.db.updateRow(session, withLegacyHash);
      });

      test('when authenticating then hash is not migrated.', () async {
        await Emails.authenticate(session, email, password);
        final emailAuth = await EmailAuth.db.findFirstRow(
          session,
          where: (final t) => t.email.equals(email),
        );
        expect(
          emailAuth,
          isNotNull,
          reason: 'Failed to find email auth entry for user.',
        );

        final passwordHash = emailAuth!.hash;
        expect(
          passwordHash,
          legacyHash,
          reason: 'Password hash was altered during authentication.',
        );
      });
    },
  );
}
