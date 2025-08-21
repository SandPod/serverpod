import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/src/generated/protocol.dart';

typedef IssueTokenFunction = Future<AuthSuccess> Function({
  required Session session,
  required UuidValue authUserId,
  required String method,
  required Set<Scope>? scopes,
  required Transaction? transaction,
});

abstract interface class TokenIssuer {
  IssueTokenFunction get issueToken;
}

abstract class CommonLogic {
  IssueTokenFunction get tokenIssuer;
}

abstract interface class ProviderConfiguration {
  void initialize(CommonLogic conf);
}

class AuthenticationConfiguration {
  static late AuthenticationConfiguration _config;
  static AuthenticationConfiguration get instance => _config;

  final List<ProviderConfiguration> providers;
  final TokenIssuer tokenIssuer;

  AuthenticationConfiguration({
    required this.providers,
    required this.tokenIssuer,
  }) {
    _config = this;
  }
}
