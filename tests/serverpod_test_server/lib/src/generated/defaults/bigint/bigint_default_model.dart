/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class BigIntDefaultModel
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  BigIntDefaultModel._({
    this.id,
    final BigInt? bigIntDefaultModelStr,
    final BigInt? bigIntDefaultModelStrNull,
  }) : bigIntDefaultModelStr =
           bigIntDefaultModelStr ??
           BigInt.parse('1234567890123456789099999999'),
       bigIntDefaultModelStrNull =
           bigIntDefaultModelStrNull ??
           BigInt.parse('-1234567890123456789099999999');

  factory BigIntDefaultModel({
    final int? id,
    final BigInt? bigIntDefaultModelStr,
    final BigInt? bigIntDefaultModelStrNull,
  }) = _BigIntDefaultModelImpl;

  factory BigIntDefaultModel.fromJson(final Map<String, dynamic> jsonSerialization) {
    return BigIntDefaultModel(
      id: jsonSerialization['id'] as int?,
      bigIntDefaultModelStr: _i1.BigIntJsonExtension.fromJson(
        jsonSerialization['bigIntDefaultModelStr'],
      ),
      bigIntDefaultModelStrNull:
          jsonSerialization['bigIntDefaultModelStrNull'] == null
          ? null
          : _i1.BigIntJsonExtension.fromJson(
              jsonSerialization['bigIntDefaultModelStrNull'],
            ),
    );
  }

  static final t = BigIntDefaultModelTable();

  static const db = BigIntDefaultModelRepository._();

  @override
  int? id;

  BigInt bigIntDefaultModelStr;

  BigInt? bigIntDefaultModelStrNull;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [BigIntDefaultModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BigIntDefaultModel copyWith({
    final int? id,
    final BigInt? bigIntDefaultModelStr,
    final BigInt? bigIntDefaultModelStrNull,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'bigIntDefaultModelStr': bigIntDefaultModelStr.toJson(),
      if (bigIntDefaultModelStrNull != null)
        'bigIntDefaultModelStrNull': bigIntDefaultModelStrNull?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'bigIntDefaultModelStr': bigIntDefaultModelStr.toJson(),
      if (bigIntDefaultModelStrNull != null)
        'bigIntDefaultModelStrNull': bigIntDefaultModelStrNull?.toJson(),
    };
  }

  static BigIntDefaultModelInclude include() {
    return BigIntDefaultModelInclude._();
  }

  static BigIntDefaultModelIncludeList includeList({
    final _i1.WhereExpressionBuilder<BigIntDefaultModelTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<BigIntDefaultModelTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<BigIntDefaultModelTable>? orderByList,
    final BigIntDefaultModelInclude? include,
  }) {
    return BigIntDefaultModelIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BigIntDefaultModel.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(BigIntDefaultModel.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BigIntDefaultModelImpl extends BigIntDefaultModel {
  _BigIntDefaultModelImpl({
    final int? id,
    final BigInt? bigIntDefaultModelStr,
    final BigInt? bigIntDefaultModelStrNull,
  }) : super._(
         id: id,
         bigIntDefaultModelStr: bigIntDefaultModelStr,
         bigIntDefaultModelStrNull: bigIntDefaultModelStrNull,
       );

  /// Returns a shallow copy of this [BigIntDefaultModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BigIntDefaultModel copyWith({
    final Object? id = _Undefined,
    final BigInt? bigIntDefaultModelStr,
    final Object? bigIntDefaultModelStrNull = _Undefined,
  }) {
    return BigIntDefaultModel(
      id: id is int? ? id : this.id,
      bigIntDefaultModelStr:
          bigIntDefaultModelStr ?? this.bigIntDefaultModelStr,
      bigIntDefaultModelStrNull: bigIntDefaultModelStrNull is BigInt?
          ? bigIntDefaultModelStrNull
          : this.bigIntDefaultModelStrNull,
    );
  }
}

class BigIntDefaultModelUpdateTable
    extends _i1.UpdateTable<BigIntDefaultModelTable> {
  BigIntDefaultModelUpdateTable(super.table);

  _i1.ColumnValue<BigInt, BigInt> bigIntDefaultModelStr(final BigInt value) =>
      _i1.ColumnValue(
        table.bigIntDefaultModelStr,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigIntDefaultModelStrNull(final BigInt? value) =>
      _i1.ColumnValue(
        table.bigIntDefaultModelStrNull,
        value,
      );
}

class BigIntDefaultModelTable extends _i1.Table<int?> {
  BigIntDefaultModelTable({super.tableRelation})
    : super(tableName: 'bigint_default_model') {
    updateTable = BigIntDefaultModelUpdateTable(this);
    bigIntDefaultModelStr = _i1.ColumnBigInt(
      'bigIntDefaultModelStr',
      this,
    );
    bigIntDefaultModelStrNull = _i1.ColumnBigInt(
      'bigIntDefaultModelStrNull',
      this,
    );
  }

  late final BigIntDefaultModelUpdateTable updateTable;

  late final _i1.ColumnBigInt bigIntDefaultModelStr;

  late final _i1.ColumnBigInt bigIntDefaultModelStrNull;

  @override
  List<_i1.Column> get columns => [
    id,
    bigIntDefaultModelStr,
    bigIntDefaultModelStrNull,
  ];
}

class BigIntDefaultModelInclude extends _i1.IncludeObject {
  BigIntDefaultModelInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => BigIntDefaultModel.t;
}

class BigIntDefaultModelIncludeList extends _i1.IncludeList {
  BigIntDefaultModelIncludeList._({
    final _i1.WhereExpressionBuilder<BigIntDefaultModelTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BigIntDefaultModel.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => BigIntDefaultModel.t;
}

class BigIntDefaultModelRepository {
  const BigIntDefaultModelRepository._();

  /// Returns a list of [BigIntDefaultModel]s matching the given query parameters.
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
  Future<List<BigIntDefaultModel>> find(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<BigIntDefaultModelTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<BigIntDefaultModelTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<BigIntDefaultModelTable>? orderByList,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.find<BigIntDefaultModel>(
      where: where?.call(BigIntDefaultModel.t),
      orderBy: orderBy?.call(BigIntDefaultModel.t),
      orderByList: orderByList?.call(BigIntDefaultModel.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [BigIntDefaultModel] matching the given query parameters.
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
  Future<BigIntDefaultModel?> findFirstRow(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<BigIntDefaultModelTable>? where,
    final int? offset,
    final _i1.OrderByBuilder<BigIntDefaultModelTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<BigIntDefaultModelTable>? orderByList,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<BigIntDefaultModel>(
      where: where?.call(BigIntDefaultModel.t),
      orderBy: orderBy?.call(BigIntDefaultModel.t),
      orderByList: orderByList?.call(BigIntDefaultModel.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [BigIntDefaultModel] by its [id] or null if no such row exists.
  Future<BigIntDefaultModel?> findById(
    final _i1.Session session,
    final int id, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.findById<BigIntDefaultModel>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [BigIntDefaultModel]s in the list and returns the inserted rows.
  ///
  /// The returned [BigIntDefaultModel]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<BigIntDefaultModel>> insert(
    final _i1.Session session,
    final List<BigIntDefaultModel> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BigIntDefaultModel>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [BigIntDefaultModel] and returns the inserted row.
  ///
  /// The returned [BigIntDefaultModel] will have its `id` field set.
  Future<BigIntDefaultModel> insertRow(
    final _i1.Session session,
    final BigIntDefaultModel row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BigIntDefaultModel>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [BigIntDefaultModel]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<BigIntDefaultModel>> update(
    final _i1.Session session,
    final List<BigIntDefaultModel> rows, {
    final _i1.ColumnSelections<BigIntDefaultModelTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.update<BigIntDefaultModel>(
      rows,
      columns: columns?.call(BigIntDefaultModel.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BigIntDefaultModel]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BigIntDefaultModel> updateRow(
    final _i1.Session session,
    final BigIntDefaultModel row, {
    final _i1.ColumnSelections<BigIntDefaultModelTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BigIntDefaultModel>(
      row,
      columns: columns?.call(BigIntDefaultModel.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BigIntDefaultModel] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<BigIntDefaultModel?> updateById(
    final _i1.Session session,
    final int id, {
    required final _i1.ColumnValueListBuilder<BigIntDefaultModelUpdateTable>
    columnValues,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<BigIntDefaultModel>(
      id,
      columnValues: columnValues(BigIntDefaultModel.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [BigIntDefaultModel]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<BigIntDefaultModel>> updateWhere(
    final _i1.Session session, {
    required final _i1.ColumnValueListBuilder<BigIntDefaultModelUpdateTable>
    columnValues,
    required final _i1.WhereExpressionBuilder<BigIntDefaultModelTable> where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<BigIntDefaultModelTable>? orderBy,
    final _i1.OrderByListBuilder<BigIntDefaultModelTable>? orderByList,
    final bool orderDescending = false,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<BigIntDefaultModel>(
      columnValues: columnValues(BigIntDefaultModel.t.updateTable),
      where: where(BigIntDefaultModel.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BigIntDefaultModel.t),
      orderByList: orderByList?.call(BigIntDefaultModel.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [BigIntDefaultModel]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<BigIntDefaultModel>> delete(
    final _i1.Session session,
    final List<BigIntDefaultModel> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BigIntDefaultModel>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [BigIntDefaultModel].
  Future<BigIntDefaultModel> deleteRow(
    final _i1.Session session,
    final BigIntDefaultModel row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BigIntDefaultModel>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<BigIntDefaultModel>> deleteWhere(
    final _i1.Session session, {
    required final _i1.WhereExpressionBuilder<BigIntDefaultModelTable> where,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BigIntDefaultModel>(
      where: where(BigIntDefaultModel.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<BigIntDefaultModelTable>? where,
    final int? limit,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.count<BigIntDefaultModel>(
      where: where?.call(BigIntDefaultModel.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
