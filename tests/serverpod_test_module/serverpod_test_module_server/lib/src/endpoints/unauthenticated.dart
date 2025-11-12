import 'package:serverpod/serverpod.dart';

/// An endpoint class with all methods marked as unauthenticated.
@unauthenticatedClientCall
class UnauthenticatedEndpoint extends Endpoint {
  Future<bool> unauthenticatedMethod(final Session session) async {
    return session.isUserSignedIn;
  }

  Stream<bool> unauthenticatedStream(final Session session) async* {
    yield session.isUserSignedIn;
  }
}

/// An endpoint with only one method marked as unauthenticated.
class PartiallyUnauthenticatedEndpoint extends Endpoint {
  @unauthenticatedClientCall
  Future<bool> unauthenticatedMethod(final Session session) async {
    return session.isUserSignedIn;
  }

  @unauthenticatedClientCall
  Stream<bool> unauthenticatedStream(final Session session) async* {
    yield session.isUserSignedIn;
  }

  Future<bool> authenticatedMethod(final Session session) async {
    return session.isUserSignedIn;
  }

  Stream<bool> authenticatedStream(final Session session) async* {
    yield session.isUserSignedIn;
  }
}
