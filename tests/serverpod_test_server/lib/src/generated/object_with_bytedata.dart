/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

import 'dart:typed_data' as _i2;

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class ObjectWithByteData
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ObjectWithByteData._({
    this.id,
    required this.byteData,
  });

  factory ObjectWithByteData({
    final int? id,
    required final _i2.ByteData byteData,
  }) = _ObjectWithByteDataImpl;

  factory ObjectWithByteData.fromJson(final Map<String, dynamic> jsonSerialization) {
    return ObjectWithByteData(
      id: jsonSerialization['id'] as int?,
      byteData: _i1.ByteDataJsonExtension.fromJson(
        jsonSerialization['byteData'],
      ),
    );
  }

  static final t = ObjectWithByteDataTable();

  static const db = ObjectWithByteDataRepository._();

  @override
  int? id;

  _i2.ByteData byteData;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ObjectWithByteData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ObjectWithByteData copyWith({
    final int? id,
    final _i2.ByteData? byteData,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'byteData': byteData.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'byteData': byteData.toJson(),
    };
  }

  static ObjectWithByteDataInclude include() {
    return ObjectWithByteDataInclude._();
  }

  static ObjectWithByteDataIncludeList includeList({
    final _i1.WhereExpressionBuilder<ObjectWithByteDataTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<ObjectWithByteDataTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<ObjectWithByteDataTable>? orderByList,
    final ObjectWithByteDataInclude? include,
  }) {
    return ObjectWithByteDataIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ObjectWithByteData.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ObjectWithByteData.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ObjectWithByteDataImpl extends ObjectWithByteData {
  _ObjectWithByteDataImpl({
    final int? id,
    required final _i2.ByteData byteData,
  }) : super._(
         id: id,
         byteData: byteData,
       );

  /// Returns a shallow copy of this [ObjectWithByteData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ObjectWithByteData copyWith({
    final Object? id = _Undefined,
    final _i2.ByteData? byteData,
  }) {
    return ObjectWithByteData(
      id: id is int? ? id : this.id,
      byteData: byteData ?? this.byteData.clone(),
    );
  }
}

class ObjectWithByteDataUpdateTable
    extends _i1.UpdateTable<ObjectWithByteDataTable> {
  ObjectWithByteDataUpdateTable(super.table);

  _i1.ColumnValue<_i2.ByteData, _i2.ByteData> byteData(final _i2.ByteData value) =>
      _i1.ColumnValue(
        table.byteData,
        value,
      );
}

class ObjectWithByteDataTable extends _i1.Table<int?> {
  ObjectWithByteDataTable({super.tableRelation})
    : super(tableName: 'object_with_bytedata') {
    updateTable = ObjectWithByteDataUpdateTable(this);
    byteData = _i1.ColumnByteData(
      'byteData',
      this,
    );
  }

  late final ObjectWithByteDataUpdateTable updateTable;

  late final _i1.ColumnByteData byteData;

  @override
  List<_i1.Column> get columns => [
    id,
    byteData,
  ];
}

class ObjectWithByteDataInclude extends _i1.IncludeObject {
  ObjectWithByteDataInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ObjectWithByteData.t;
}

class ObjectWithByteDataIncludeList extends _i1.IncludeList {
  ObjectWithByteDataIncludeList._({
    final _i1.WhereExpressionBuilder<ObjectWithByteDataTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ObjectWithByteData.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ObjectWithByteData.t;
}

class ObjectWithByteDataRepository {
  const ObjectWithByteDataRepository._();

  /// Returns a list of [ObjectWithByteData]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<ObjectWithByteData>> find(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<ObjectWithByteDataTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<ObjectWithByteDataTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<ObjectWithByteDataTable>? orderByList,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.find<ObjectWithByteData>(
      where: where?.call(ObjectWithByteData.t),
      orderBy: orderBy?.call(ObjectWithByteData.t),
      orderByList: orderByList?.call(ObjectWithByteData.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [ObjectWithByteData] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<ObjectWithByteData?> findFirstRow(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<ObjectWithByteDataTable>? where,
    final int? offset,
    final _i1.OrderByBuilder<ObjectWithByteDataTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<ObjectWithByteDataTable>? orderByList,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ObjectWithByteData>(
      where: where?.call(ObjectWithByteData.t),
      orderBy: orderBy?.call(ObjectWithByteData.t),
      orderByList: orderByList?.call(ObjectWithByteData.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [ObjectWithByteData] by its [id] or null if no such row exists.
  Future<ObjectWithByteData?> findById(
    final _i1.Session session,
    final int id, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ObjectWithByteData>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [ObjectWithByteData]s in the list and returns the inserted rows.
  ///
  /// The returned [ObjectWithByteData]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ObjectWithByteData>> insert(
    final _i1.Session session,
    final List<ObjectWithByteData> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ObjectWithByteData>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ObjectWithByteData] and returns the inserted row.
  ///
  /// The returned [ObjectWithByteData] will have its `id` field set.
  Future<ObjectWithByteData> insertRow(
    final _i1.Session session,
    final ObjectWithByteData row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ObjectWithByteData>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ObjectWithByteData]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ObjectWithByteData>> update(
    final _i1.Session session,
    final List<ObjectWithByteData> rows, {
    final _i1.ColumnSelections<ObjectWithByteDataTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.update<ObjectWithByteData>(
      rows,
      columns: columns?.call(ObjectWithByteData.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ObjectWithByteData]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ObjectWithByteData> updateRow(
    final _i1.Session session,
    final ObjectWithByteData row, {
    final _i1.ColumnSelections<ObjectWithByteDataTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ObjectWithByteData>(
      row,
      columns: columns?.call(ObjectWithByteData.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ObjectWithByteData] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ObjectWithByteData?> updateById(
    final _i1.Session session,
    final int id, {
    required final _i1.ColumnValueListBuilder<ObjectWithByteDataUpdateTable>
    columnValues,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ObjectWithByteData>(
      id,
      columnValues: columnValues(ObjectWithByteData.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ObjectWithByteData]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ObjectWithByteData>> updateWhere(
    final _i1.Session session, {
    required final _i1.ColumnValueListBuilder<ObjectWithByteDataUpdateTable>
    columnValues,
    required final _i1.WhereExpressionBuilder<ObjectWithByteDataTable> where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<ObjectWithByteDataTable>? orderBy,
    final _i1.OrderByListBuilder<ObjectWithByteDataTable>? orderByList,
    final bool orderDescending = false,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ObjectWithByteData>(
      columnValues: columnValues(ObjectWithByteData.t.updateTable),
      where: where(ObjectWithByteData.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ObjectWithByteData.t),
      orderByList: orderByList?.call(ObjectWithByteData.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ObjectWithByteData]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ObjectWithByteData>> delete(
    final _i1.Session session,
    final List<ObjectWithByteData> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ObjectWithByteData>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ObjectWithByteData].
  Future<ObjectWithByteData> deleteRow(
    final _i1.Session session,
    final ObjectWithByteData row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ObjectWithByteData>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ObjectWithByteData>> deleteWhere(
    final _i1.Session session, {
    required final _i1.WhereExpressionBuilder<ObjectWithByteDataTable> where,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ObjectWithByteData>(
      where: where(ObjectWithByteData.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<ObjectWithByteDataTable>? where,
    final int? limit,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.count<ObjectWithByteData>(
      where: where?.call(ObjectWithByteData.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
