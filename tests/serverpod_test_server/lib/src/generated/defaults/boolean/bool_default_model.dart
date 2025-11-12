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

abstract class BoolDefaultModel
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  BoolDefaultModel._({
    this.id,
    final bool? boolDefaultModelTrue,
    final bool? boolDefaultModelFalse,
    final bool? boolDefaultModelNullFalse,
  }) : boolDefaultModelTrue = boolDefaultModelTrue ?? true,
       boolDefaultModelFalse = boolDefaultModelFalse ?? false,
       boolDefaultModelNullFalse = boolDefaultModelNullFalse ?? false;

  factory BoolDefaultModel({
    final int? id,
    final bool? boolDefaultModelTrue,
    final bool? boolDefaultModelFalse,
    final bool? boolDefaultModelNullFalse,
  }) = _BoolDefaultModelImpl;

  factory BoolDefaultModel.fromJson(final Map<String, dynamic> jsonSerialization) {
    return BoolDefaultModel(
      id: jsonSerialization['id'] as int?,
      boolDefaultModelTrue: jsonSerialization['boolDefaultModelTrue'] as bool,
      boolDefaultModelFalse: jsonSerialization['boolDefaultModelFalse'] as bool,
      boolDefaultModelNullFalse:
          jsonSerialization['boolDefaultModelNullFalse'] as bool,
    );
  }

  static final t = BoolDefaultModelTable();

  static const db = BoolDefaultModelRepository._();

  @override
  int? id;

  bool boolDefaultModelTrue;

  bool boolDefaultModelFalse;

  bool boolDefaultModelNullFalse;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [BoolDefaultModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BoolDefaultModel copyWith({
    final int? id,
    final bool? boolDefaultModelTrue,
    final bool? boolDefaultModelFalse,
    final bool? boolDefaultModelNullFalse,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'boolDefaultModelTrue': boolDefaultModelTrue,
      'boolDefaultModelFalse': boolDefaultModelFalse,
      'boolDefaultModelNullFalse': boolDefaultModelNullFalse,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'boolDefaultModelTrue': boolDefaultModelTrue,
      'boolDefaultModelFalse': boolDefaultModelFalse,
      'boolDefaultModelNullFalse': boolDefaultModelNullFalse,
    };
  }

  static BoolDefaultModelInclude include() {
    return BoolDefaultModelInclude._();
  }

  static BoolDefaultModelIncludeList includeList({
    final _i1.WhereExpressionBuilder<BoolDefaultModelTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<BoolDefaultModelTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<BoolDefaultModelTable>? orderByList,
    final BoolDefaultModelInclude? include,
  }) {
    return BoolDefaultModelIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BoolDefaultModel.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(BoolDefaultModel.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BoolDefaultModelImpl extends BoolDefaultModel {
  _BoolDefaultModelImpl({
    final int? id,
    final bool? boolDefaultModelTrue,
    final bool? boolDefaultModelFalse,
    final bool? boolDefaultModelNullFalse,
  }) : super._(
         id: id,
         boolDefaultModelTrue: boolDefaultModelTrue,
         boolDefaultModelFalse: boolDefaultModelFalse,
         boolDefaultModelNullFalse: boolDefaultModelNullFalse,
       );

  /// Returns a shallow copy of this [BoolDefaultModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BoolDefaultModel copyWith({
    final Object? id = _Undefined,
    final bool? boolDefaultModelTrue,
    final bool? boolDefaultModelFalse,
    final bool? boolDefaultModelNullFalse,
  }) {
    return BoolDefaultModel(
      id: id is int? ? id : this.id,
      boolDefaultModelTrue: boolDefaultModelTrue ?? this.boolDefaultModelTrue,
      boolDefaultModelFalse:
          boolDefaultModelFalse ?? this.boolDefaultModelFalse,
      boolDefaultModelNullFalse:
          boolDefaultModelNullFalse ?? this.boolDefaultModelNullFalse,
    );
  }
}

class BoolDefaultModelUpdateTable
    extends _i1.UpdateTable<BoolDefaultModelTable> {
  BoolDefaultModelUpdateTable(super.table);

  _i1.ColumnValue<bool, bool> boolDefaultModelTrue(final bool value) =>
      _i1.ColumnValue(
        table.boolDefaultModelTrue,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultModelFalse(final bool value) =>
      _i1.ColumnValue(
        table.boolDefaultModelFalse,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultModelNullFalse(final bool value) =>
      _i1.ColumnValue(
        table.boolDefaultModelNullFalse,
        value,
      );
}

class BoolDefaultModelTable extends _i1.Table<int?> {
  BoolDefaultModelTable({super.tableRelation})
    : super(tableName: 'bool_default_model') {
    updateTable = BoolDefaultModelUpdateTable(this);
    boolDefaultModelTrue = _i1.ColumnBool(
      'boolDefaultModelTrue',
      this,
    );
    boolDefaultModelFalse = _i1.ColumnBool(
      'boolDefaultModelFalse',
      this,
    );
    boolDefaultModelNullFalse = _i1.ColumnBool(
      'boolDefaultModelNullFalse',
      this,
    );
  }

  late final BoolDefaultModelUpdateTable updateTable;

  late final _i1.ColumnBool boolDefaultModelTrue;

  late final _i1.ColumnBool boolDefaultModelFalse;

  late final _i1.ColumnBool boolDefaultModelNullFalse;

  @override
  List<_i1.Column> get columns => [
    id,
    boolDefaultModelTrue,
    boolDefaultModelFalse,
    boolDefaultModelNullFalse,
  ];
}

class BoolDefaultModelInclude extends _i1.IncludeObject {
  BoolDefaultModelInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => BoolDefaultModel.t;
}

class BoolDefaultModelIncludeList extends _i1.IncludeList {
  BoolDefaultModelIncludeList._({
    final _i1.WhereExpressionBuilder<BoolDefaultModelTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BoolDefaultModel.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => BoolDefaultModel.t;
}

class BoolDefaultModelRepository {
  const BoolDefaultModelRepository._();

  /// Returns a list of [BoolDefaultModel]s matching the given query parameters.
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
  Future<List<BoolDefaultModel>> find(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<BoolDefaultModelTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<BoolDefaultModelTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<BoolDefaultModelTable>? orderByList,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.find<BoolDefaultModel>(
      where: where?.call(BoolDefaultModel.t),
      orderBy: orderBy?.call(BoolDefaultModel.t),
      orderByList: orderByList?.call(BoolDefaultModel.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [BoolDefaultModel] matching the given query parameters.
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
  Future<BoolDefaultModel?> findFirstRow(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<BoolDefaultModelTable>? where,
    final int? offset,
    final _i1.OrderByBuilder<BoolDefaultModelTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<BoolDefaultModelTable>? orderByList,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<BoolDefaultModel>(
      where: where?.call(BoolDefaultModel.t),
      orderBy: orderBy?.call(BoolDefaultModel.t),
      orderByList: orderByList?.call(BoolDefaultModel.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [BoolDefaultModel] by its [id] or null if no such row exists.
  Future<BoolDefaultModel?> findById(
    final _i1.Session session,
    final int id, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.findById<BoolDefaultModel>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [BoolDefaultModel]s in the list and returns the inserted rows.
  ///
  /// The returned [BoolDefaultModel]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<BoolDefaultModel>> insert(
    final _i1.Session session,
    final List<BoolDefaultModel> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BoolDefaultModel>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [BoolDefaultModel] and returns the inserted row.
  ///
  /// The returned [BoolDefaultModel] will have its `id` field set.
  Future<BoolDefaultModel> insertRow(
    final _i1.Session session,
    final BoolDefaultModel row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BoolDefaultModel>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [BoolDefaultModel]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<BoolDefaultModel>> update(
    final _i1.Session session,
    final List<BoolDefaultModel> rows, {
    final _i1.ColumnSelections<BoolDefaultModelTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.update<BoolDefaultModel>(
      rows,
      columns: columns?.call(BoolDefaultModel.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BoolDefaultModel]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BoolDefaultModel> updateRow(
    final _i1.Session session,
    final BoolDefaultModel row, {
    final _i1.ColumnSelections<BoolDefaultModelTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BoolDefaultModel>(
      row,
      columns: columns?.call(BoolDefaultModel.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BoolDefaultModel] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<BoolDefaultModel?> updateById(
    final _i1.Session session,
    final int id, {
    required final _i1.ColumnValueListBuilder<BoolDefaultModelUpdateTable>
    columnValues,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<BoolDefaultModel>(
      id,
      columnValues: columnValues(BoolDefaultModel.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [BoolDefaultModel]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<BoolDefaultModel>> updateWhere(
    final _i1.Session session, {
    required final _i1.ColumnValueListBuilder<BoolDefaultModelUpdateTable>
    columnValues,
    required final _i1.WhereExpressionBuilder<BoolDefaultModelTable> where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<BoolDefaultModelTable>? orderBy,
    final _i1.OrderByListBuilder<BoolDefaultModelTable>? orderByList,
    final bool orderDescending = false,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<BoolDefaultModel>(
      columnValues: columnValues(BoolDefaultModel.t.updateTable),
      where: where(BoolDefaultModel.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BoolDefaultModel.t),
      orderByList: orderByList?.call(BoolDefaultModel.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [BoolDefaultModel]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<BoolDefaultModel>> delete(
    final _i1.Session session,
    final List<BoolDefaultModel> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BoolDefaultModel>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [BoolDefaultModel].
  Future<BoolDefaultModel> deleteRow(
    final _i1.Session session,
    final BoolDefaultModel row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BoolDefaultModel>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<BoolDefaultModel>> deleteWhere(
    final _i1.Session session, {
    required final _i1.WhereExpressionBuilder<BoolDefaultModelTable> where,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BoolDefaultModel>(
      where: where(BoolDefaultModel.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<BoolDefaultModelTable>? where,
    final int? limit,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.count<BoolDefaultModel>(
      where: where?.call(BoolDefaultModel.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
