import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import 'package:test/test.dart';

import '../../test_tools/serverpod_test_tools.dart';

void main() {
  final config = EmailIDPConfig(passwordHashPepper: 'test');
  final emailIDP = EmailIDP(config: config);

  withServerpod(
    'Given a user created through `EmailIDP.admin.createUser`,',
    (final sessionBuilder, final endpoints) {
      const email = 'test@serverpod.dev';
      const password = 'Abcdef123!!!';

      late Session session;
      late UuidValue authUserId;

      setUp(() async {
        session = sessionBuilder.build();

        authUserId = await emailIDP.admin.createUser(
          session,
          email: email,
          password: password,
        );
      });

      test(
          "when getting the user's profile, then it is found and the email set.",
          () async {
        final profile = await UserProfiles.findUserProfileByUserId(
          session,
          authUserId,
        );

        expect(
          profile.email,
          email,
        );
      });

      test(
        'when authenticating with the credentials, then it succeeds.',
        () async {
          final authenticatedUserId = await emailIDP.utils.authenticate(
            session,
            email: email,
            password: password,
            transaction: null,
          );

          expect(
            authenticatedUserId,
            authUserId,
          );
        },
      );
    },
  );
}
