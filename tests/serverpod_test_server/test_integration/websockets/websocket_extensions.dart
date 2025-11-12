import 'dart:async';
import 'package:web_socket/web_socket.dart';

/// Extension to provide backward-compatible stream-based API for WebSocket.
extension WebSocketExtensions on WebSocket {
  Stream<String> get textEvents => events
      .where((final event) => event is TextDataReceived)
      .cast<TextDataReceived>()
      .map((final e) => e.text);

  Future<void> tryClose([final int? code, final String? reason]) async {
    try {
      await close(code, reason);
    } on WebSocketConnectionClosed {
      // Connection is already closed
    }
  }
}
