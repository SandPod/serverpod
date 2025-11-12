import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

class SessionAuthenticationEndpoint extends Endpoint {
  /// Returns authenticated user identifier or null
  Future<String?> getAuthenticatedUserId(final Session session) async {
    return session.authenticated?.userIdentifier;
  }

  /// Returns all scope names
  Future<List<String>> getAuthenticatedScopes(final Session session) async {
    return session.authenticated?.scopes.map((final s) => s.name).nonNulls.toList() ??
        [];
  }

  /// Returns authenticated auth ID or null
  Future<String?> getAuthenticatedAuthId(final Session session) async {
    return session.authenticated?.authId;
  }

  /// Returns full authentication info
  Future<SessionAuthInfo> getAuthenticationInfo(final Session session) async {
    final auth = session.authenticated;
    return SessionAuthInfo(
      isAuthenticated: auth != null,
      userId: auth?.userIdentifier,
      scopes: auth?.scopes.map((final s) => s.name).nonNulls.toList() ?? [],
      authId: auth?.authId,
    );
  }

  /// Returns authentication status as boolean
  Future<bool> isAuthenticated(final Session session) async {
    return session.authenticated != null;
  }

  // ========== Streaming Methods ==========

  /// Stream that yields authenticated user ID
  Stream<String?> streamAuthenticatedUserId(final Session session) async* {
    yield session.authenticated?.userIdentifier;
  }

  /// Stream that yields authentication status
  Stream<bool> streamIsAuthenticated(final Session session) async* {
    yield session.authenticated != null;
  }
}
