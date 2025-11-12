import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

class BasicDatabase extends Endpoint {
  Future<void> deleteAllSimpleTestData(final Session session) async {
    await SimpleData.db.deleteWhere(session, where: (final t) => Constant.bool(true));
  }

  Future<void> deleteSimpleTestDataLessThan(final Session session, final int num) async {
    await SimpleData.db.deleteWhere(session, where: (final t) => t.num < num);
  }

  Future<void> findAndDeleteSimpleTestData(final Session session, final int num) async {
    final data = await SimpleData.db.findFirstRow(
      session,
      where: (final t) => t.num.equals(num),
    );

    await SimpleData.db.deleteRow(session, data!);
  }

  Future<void> createSimpleTestData(final Session session, final int numRows) async {
    final List<SimpleData> data = [];
    for (var i = 0; i < numRows; i++) {
      data.add(SimpleData(num: i));
    }

    await SimpleData.db.insert(session, data);
  }

  Future<List<SimpleData>> findSimpleData(
    final Session session, {
    required final int limit,
    required final int offset,
  }) async {
    return SimpleData.db.find(
      session,
      orderBy: (final t) => t.id,
      limit: limit,
      offset: offset,
    );
  }

  Future<SimpleData?> findFirstRowSimpleData(final Session session, final int num) async {
    return SimpleData.db.findFirstRow(
      session,
      where: (final t) => t.num.equals(num),
    );
  }

  Future<SimpleData?> findByIdSimpleData(
    final Session session,
    final int id,
  ) async {
    return SimpleData.db.findById(
      session,
      id,
    );
  }

  Future<SimpleDataList?> findSimpleDataRowsLessThan(
    final Session session,
    final int num,
    final int offset,
    final int limit,
    final bool descending,
  ) async {
    final rows = await SimpleData.db.find(
      session,
      where: (final t) => t.num < num,
      offset: offset,
      limit: limit,
      orderBy: (final t) => t.num,
      orderDescending: descending,
    );

    return SimpleDataList(
      rows: rows,
    );
  }

  Future<SimpleData> insertRowSimpleData(
    final Session session,
    final SimpleData simpleData,
  ) {
    return SimpleData.db.insertRow(
      session,
      simpleData,
    );
  }

  Future<SimpleData> updateRowSimpleData(
    final Session session,
    final SimpleData simpleData,
  ) {
    return SimpleData.db.updateRow(
      session,
      simpleData,
    );
  }

  Future<int> deleteRowSimpleData(
    final Session session,
    final SimpleData simpleData,
  ) async {
    final result = await SimpleData.db.deleteRow(
      session,
      simpleData,
    );

    return result.id!;
  }

  Future<List<int>> deleteWhereSimpleData(
    final Session session,
  ) async {
    final result = await SimpleData.db.deleteWhere(
      where: (final t) => Constant.bool(true),
      session,
    );

    return result.map((final e) => e.id!).toList();
  }

  Future<int> countSimpleData(final Session session) async {
    return SimpleData.db.count(
      session,
      where: (final t) => Constant.bool(true),
    );
  }

  Future<Types> insertTypes(
    final Session session,
    final Types value,
  ) async {
    return Types.db.insertRow(session, value);
  }

  Future<Types> updateTypes(
    final Session session,
    final Types value,
  ) async {
    return Types.db.updateRow(session, value);
  }

  Future<int?> countTypesRows(final Session session) async {
    return await Types.db.count(session);
  }

  Future<List<int>> deleteAllInTypes(final Session session) async {
    final result = await Types.db.deleteWhere(
      session,
      where: (final t) => Constant.bool(true),
    );

    return result.map((final e) => e.id!).toList();
  }

  Future<Types?> getTypes(final Session session, final int id) async {
    return await Types.db.findById(session, id);
  }

  Future<int?> getTypesRawQuery(final Session session, final int id) async {
    final query = 'SELECT * FROM types WHERE id = $id';
    final result = await session.db.unsafeQuery(query);
    if (result.length != 1) {
      return null;
    }
    final row = result[0];
    if (row.length != Types.t.columns.length) {
      return null;
    }
    return row[0] as int;
  }

  Future<ObjectWithEnum> storeObjectWithEnum(
    final Session session,
    final ObjectWithEnum object,
  ) async {
    return await ObjectWithEnum.db.insertRow(session, object);
  }

  Future<ObjectWithEnum?> getObjectWithEnum(final Session session, final int id) async {
    return await ObjectWithEnum.db.findById(session, id);
  }

  Future<ObjectWithObject> storeObjectWithObject(
    final Session session,
    final ObjectWithObject object,
  ) async {
    return await ObjectWithObject.db.insertRow(session, object);
  }

  Future<ObjectWithObject?> getObjectWithObject(final Session session, final int id) async {
    return await ObjectWithObject.db.findById(session, id);
  }

  Future<int> deleteAll(final Session session) async {
    final simpleDataIds = await SimpleData.db.deleteWhere(
      session,
      where: (final t) => Constant.bool(true),
    );

    final typesIds = await Types.db.deleteWhere(
      session,
      where: (final t) => Constant.bool(true),
    );

    final objectsWithEnumIds = await ObjectWithEnum.db.deleteWhere(
      session,
      where: (final t) => Constant.bool(true),
    );

    final objectsWithObjectIds = await ObjectWithObject.db.deleteWhere(
      session,
      where: (final t) => Constant.bool(true),
    );

    return simpleDataIds.length +
        typesIds.length +
        objectsWithEnumIds.length +
        objectsWithObjectIds.length;
  }

  Future<bool> testByteDataStore(
    final Session session,
  ) async {
    // Clear database.
    await ObjectWithByteData.db.deleteWhere(
      session,
      where: (final t) => Constant.bool(true),
    );

    // Create byte data.
    final byteData = ByteData(256);
    for (var i = 0; i < 256; i += 1) {
      byteData.setUint8(i, i);
    }

    // Insert a row.
    var row = ObjectWithByteData(byteData: byteData);
    await ObjectWithByteData.db.insertRow(session, row);

    // Fetch the row.
    row = (await ObjectWithByteData.db.findFirstRow(session))!;

    // Verify the data.
    for (var i = 0; i < 256; i += 1) {
      if (row.byteData.getUint8(i) != i) {
        return false;
      }
    }

    return true;
  }
}
