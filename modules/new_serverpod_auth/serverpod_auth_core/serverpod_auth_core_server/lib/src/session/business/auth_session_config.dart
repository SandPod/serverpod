import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/src/common/common.dart';

import 'auth_sessions.dart';

/// Configuration options for the session module.
class AuthSessionConfig implements TokenIssuer {
  static late AuthSessionConfig _config;

  static AuthSessionConfig get instance => _config;

  /// Length of the session key secret (which is only stored on the client).
  ///
  /// Defaults to 32 bytes.
  final int sessionKeySecretLength;

  /// Length of the salt used for the session key hash.
  ///
  /// Defaults to 16 bytes.
  final int sessionKeyHashSaltLength;

  /// Create a new user session configuration.
  AuthSessionConfig({
    this.sessionKeySecretLength = 32,
    this.sessionKeyHashSaltLength = 16,
  }) {
    _config = this;
  }

  @override
  IssueTokenFunction get issueToken => ({
        required Session session,
        required UuidValue authUserId,
        required String method,
        required Set<Scope>? scopes,
        required Transaction? transaction,
      }) =>
          AuthSessions.createSession(
            session,
            authUserId: authUserId,
            method: method,
            scopes: scopes,
            transaction: transaction,
          );
}
