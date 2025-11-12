import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class TransactionsDatabaseEndpoint extends Endpoint {
  Future<void> removeRow(final Session session, final int num) async {
    await session.db.transaction((final transaction) async {
      await SimpleData.db.deleteWhere(
        session,
        where: (final t) => t.num.equals(num),
        transaction: transaction,
      );
    });
  }

  Future<bool> updateInsertDelete(
    final Session session,
    final int numUpdate,
    final int numInsert,
    final int numDelete,
  ) async {
    final data = await SimpleData.db.findFirstRow(
      session,
      where: (final t) => t.num.equals(numUpdate),
    );

    return await session.db.transaction((final transaction) async {
      data!.num = 1000;
      await SimpleData.db.updateRow(session, data, transaction: transaction);

      final newData = SimpleData(
        num: numInsert,
      );
      await SimpleData.db.insertRow(session, newData, transaction: transaction);

      await SimpleData.db.deleteWhere(
        session,
        where: (final t) => t.num.equals(numDelete),
        transaction: transaction,
      );

      return true;
    });
  }
}
