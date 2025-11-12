import 'dart:async';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

class ServerOnlyScopedFieldModelEndpoint extends Endpoint {
  Future<ScopeServerOnlyField> getScopeServerOnlyField(
    final Session session,
  ) async {
    return ScopeServerOnlyField(
      serverOnlyScope: Types(anInt: 2),
      nested: ScopeServerOnlyField(
        allScope: Types(anInt: 1),
        serverOnlyScope: Types(anInt: 2),
      ),
    );
  }

  @override
  Future<void> streamOpened(final StreamingSession session) async {
    unawaited(
      Future.delayed(const Duration(seconds: 1)).then(
        (final value) async {
          // ignore: deprecated_member_use
          await sendStreamMessage(
            session,
            ScopeServerOnlyField(
              serverOnlyScope: Types(anInt: 2),
              nested: ScopeServerOnlyField(
                allScope: Types(anInt: 1),
                serverOnlyScope: Types(anInt: 2),
              ),
            ),
          );
        },
      ),
    );
  }
}
