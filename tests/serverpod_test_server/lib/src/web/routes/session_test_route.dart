import 'dart:async';
import 'dart:convert';
import 'package:serverpod/serverpod.dart';

class SessionTestRoute extends Route {
  @override
  FutureOr<Result> handleCall(final Session session, final Request request) async {
    final auth = session.authenticated;
    final body = jsonEncode({
      'isAuthenticated': auth != null,
      'userId': auth?.userIdentifier,
      'scopes': auth?.scopes.map((final s) => s.name).toList() ?? [],
      'authId': auth?.authId,
    });
    return Response.ok(
      body: Body.fromString(body),
      headers: Headers.build((final mh) {
        mh['Content-Type'] = ['application/json'];
      }),
    );
  }
}
