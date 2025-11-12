import 'package:serverpod/protocol.dart';
import 'package:serverpod/serverpod.dart';

class LoggingUtil {
  static Future<void> clearAllLogs(final Session session) async {
    // Only need to delete the session log entries, the rest will be deleted by the cascade.
    await SessionLogEntry.db.deleteWhere(
      session,
      where: (final t) => Constant.bool(true),
    );
  }

  static Future<List<SessionLogInfo>> findAllLogs(
    final Session session,
  ) async {
    final rows = (await SessionLogEntry.db.find(
      session,
      orderBy: (final t) => t.id,
      orderDescending: true,
    ));

    final sessionLogInfo = <SessionLogInfo>[];
    for (final logEntry in rows) {
      final futureLogRows = LogEntry.db.find(
        session,
        where: (final t) => t.sessionLogId.equals(logEntry.id),
        orderBy: (final t) => t.order,
      );

      final futureQueryRows = QueryLogEntry.db.find(
        session,
        where: (final t) => t.sessionLogId.equals(logEntry.id),
        orderBy: (final t) => t.order,
      );

      final futureMessageRows = MessageLogEntry.db.find(
        session,
        where: (final t) => t.sessionLogId.equals(logEntry.id),
        orderBy: (final t) => t.order,
      );

      final logRows = await futureLogRows;
      final queryRows = await futureQueryRows;
      final messageRows = await futureMessageRows;

      sessionLogInfo.add(
        SessionLogInfo(
          sessionLogEntry: logEntry,
          logs: logRows,
          queries: queryRows,
          messages: messageRows,
        ),
      );
    }

    return sessionLogInfo;
  }
}
