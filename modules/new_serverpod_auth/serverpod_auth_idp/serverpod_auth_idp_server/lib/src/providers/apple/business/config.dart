import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:sign_in_with_apple_server/sign_in_with_apple_server.dart';

import 'apple_accounts_admin.dart';

/// Configuration for the Apple account module.
class AppleAccountConfig implements ProviderConfiguration {
  static late AppleAccountConfig _config;

  static AppleAccountConfig get instance => _config;

  static IssueTokenFunction? _issueToken;

  late AppleAccountsAdmin _admin;

  late SignInWithApple _siwa;

  /// The service identifier for the Sign in with Apple project.
  final String serviceIdentifier;

  /// The bundle ID of the Apple-native app using Sign in with Apple.
  final String bundleIdentifier;

  /// The redirect URL used for 3rd party platforms, e.g. Android.
  final String redirectUri;

  /// The team identifier of the parent Apple Developer account.
  final String teamId;

  /// The ID of the key associated with the Sign in with Apple service.
  final String keyId;

  /// The secret contents of the private key file received once from Apple.
  final String key;

  /// Creates a new Sign in with Apple configuration.
  AppleAccountConfig({
    required this.serviceIdentifier,
    required this.bundleIdentifier,
    required this.redirectUri,
    required this.teamId,
    required this.keyId,
    required this.key,
  });

  @override
  void initialize(CommonLogic conf) {
    _config = this;
    _issueToken = conf.tokenIssuer;
    _siwa = SignInWithApple(
      config: SignInWithAppleConfiguration(
        serviceIdentifier: _config.serviceIdentifier,
        bundleIdentifier: _config.bundleIdentifier,
        redirectUri: _config.redirectUri,
        teamId: _config.teamId,
        keyId: _config.keyId,
        key: _config.key,
      ),
    );

    _admin = AppleAccountsAdmin(_siwa);
  }
}

extension HiddenAppleAccountConfigExtension on AppleAccountConfig {
  /// Issues a token for the given user.
  static Future<AuthSuccess> issueToken({
    required Session session,
    required UuidValue authUserId,
    required String method,
    required Set<Scope>? scopes,
    required Transaction? transaction,
  }) async {
    var tokenIssuer = AppleAccountConfig._issueToken;
    if (tokenIssuer == null) {
      throw StateError('EmailAccountConfig is not initialized');
    }

    return tokenIssuer(
      session: session,
      authUserId: authUserId,
      method: method,
      scopes: scopes,
      transaction: transaction,
    );
  }

  SignInWithApple get siwa => _siwa;

  AppleAccountsAdmin get admin => _admin;
}
