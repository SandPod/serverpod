import 'package:serverpod/serverpod.dart';

/// This class is meant for echoing / reflecting the received headers,
/// auth keys, parameters etc in endpoint invocations.
class EchoRequestEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Echo the authentication key of the session.
  /// Returns null if the key is not set.
  Future<String?> echoAuthenticationKey(final Session session) async {
    return session.authenticationKey;
  }

  /// Echo a specified header of the HTTP request.
  /// Returns null of the header is not set.
  Future<List<String>?> echoHttpHeader(
    final Session session,
    final String headerName,
  ) async {
    final ms = session as MethodCallSession;
    final Iterable<String>? headerValue = ms.request.headers[headerName];
    return headerValue?.toList();
  }
}
