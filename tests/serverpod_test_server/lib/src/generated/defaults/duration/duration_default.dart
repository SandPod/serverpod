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

abstract class DurationDefault
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DurationDefault._({
    this.id,
    final Duration? durationDefault,
    final Duration? durationDefaultNull,
  }) : durationDefault =
           durationDefault ??
           const Duration(
             days: 1,
             hours: 2,
             minutes: 10,
             seconds: 30,
             milliseconds: 100,
           ),
       durationDefaultNull =
           durationDefaultNull ??
           const Duration(
             days: 2,
             hours: 1,
             minutes: 20,
             seconds: 40,
             milliseconds: 100,
           );

  factory DurationDefault({
    final int? id,
    final Duration? durationDefault,
    final Duration? durationDefaultNull,
  }) = _DurationDefaultImpl;

  factory DurationDefault.fromJson(final Map<String, dynamic> jsonSerialization) {
    return DurationDefault(
      id: jsonSerialization['id'] as int?,
      durationDefault: _i1.DurationJsonExtension.fromJson(
        jsonSerialization['durationDefault'],
      ),
      durationDefaultNull: jsonSerialization['durationDefaultNull'] == null
          ? null
          : _i1.DurationJsonExtension.fromJson(
              jsonSerialization['durationDefaultNull'],
            ),
    );
  }

  static final t = DurationDefaultTable();

  static const db = DurationDefaultRepository._();

  @override
  int? id;

  Duration durationDefault;

  Duration? durationDefaultNull;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DurationDefault]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DurationDefault copyWith({
    final int? id,
    final Duration? durationDefault,
    final Duration? durationDefaultNull,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'durationDefault': durationDefault.toJson(),
      if (durationDefaultNull != null)
        'durationDefaultNull': durationDefaultNull?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'durationDefault': durationDefault.toJson(),
      if (durationDefaultNull != null)
        'durationDefaultNull': durationDefaultNull?.toJson(),
    };
  }

  static DurationDefaultInclude include() {
    return DurationDefaultInclude._();
  }

  static DurationDefaultIncludeList includeList({
    final _i1.WhereExpressionBuilder<DurationDefaultTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<DurationDefaultTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<DurationDefaultTable>? orderByList,
    final DurationDefaultInclude? include,
  }) {
    return DurationDefaultIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DurationDefault.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DurationDefault.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DurationDefaultImpl extends DurationDefault {
  _DurationDefaultImpl({
    final int? id,
    final Duration? durationDefault,
    final Duration? durationDefaultNull,
  }) : super._(
         id: id,
         durationDefault: durationDefault,
         durationDefaultNull: durationDefaultNull,
       );

  /// Returns a shallow copy of this [DurationDefault]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DurationDefault copyWith({
    final Object? id = _Undefined,
    final Duration? durationDefault,
    final Object? durationDefaultNull = _Undefined,
  }) {
    return DurationDefault(
      id: id is int? ? id : this.id,
      durationDefault: durationDefault ?? this.durationDefault,
      durationDefaultNull: durationDefaultNull is Duration?
          ? durationDefaultNull
          : this.durationDefaultNull,
    );
  }
}

class DurationDefaultUpdateTable extends _i1.UpdateTable<DurationDefaultTable> {
  DurationDefaultUpdateTable(super.table);

  _i1.ColumnValue<Duration, Duration> durationDefault(final Duration value) =>
      _i1.ColumnValue(
        table.durationDefault,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefaultNull(final Duration? value) =>
      _i1.ColumnValue(
        table.durationDefaultNull,
        value,
      );
}

class DurationDefaultTable extends _i1.Table<int?> {
  DurationDefaultTable({super.tableRelation})
    : super(tableName: 'duration_default') {
    updateTable = DurationDefaultUpdateTable(this);
    durationDefault = _i1.ColumnDuration(
      'durationDefault',
      this,
      hasDefault: true,
    );
    durationDefaultNull = _i1.ColumnDuration(
      'durationDefaultNull',
      this,
      hasDefault: true,
    );
  }

  late final DurationDefaultUpdateTable updateTable;

  late final _i1.ColumnDuration durationDefault;

  late final _i1.ColumnDuration durationDefaultNull;

  @override
  List<_i1.Column> get columns => [
    id,
    durationDefault,
    durationDefaultNull,
  ];
}

class DurationDefaultInclude extends _i1.IncludeObject {
  DurationDefaultInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => DurationDefault.t;
}

class DurationDefaultIncludeList extends _i1.IncludeList {
  DurationDefaultIncludeList._({
    final _i1.WhereExpressionBuilder<DurationDefaultTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DurationDefault.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DurationDefault.t;
}

class DurationDefaultRepository {
  const DurationDefaultRepository._();

  /// Returns a list of [DurationDefault]s matching the given query parameters.
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
  Future<List<DurationDefault>> find(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<DurationDefaultTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<DurationDefaultTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<DurationDefaultTable>? orderByList,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.find<DurationDefault>(
      where: where?.call(DurationDefault.t),
      orderBy: orderBy?.call(DurationDefault.t),
      orderByList: orderByList?.call(DurationDefault.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [DurationDefault] matching the given query parameters.
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
  Future<DurationDefault?> findFirstRow(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<DurationDefaultTable>? where,
    final int? offset,
    final _i1.OrderByBuilder<DurationDefaultTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<DurationDefaultTable>? orderByList,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DurationDefault>(
      where: where?.call(DurationDefault.t),
      orderBy: orderBy?.call(DurationDefault.t),
      orderByList: orderByList?.call(DurationDefault.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [DurationDefault] by its [id] or null if no such row exists.
  Future<DurationDefault?> findById(
    final _i1.Session session,
    final int id, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DurationDefault>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [DurationDefault]s in the list and returns the inserted rows.
  ///
  /// The returned [DurationDefault]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DurationDefault>> insert(
    final _i1.Session session,
    final List<DurationDefault> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DurationDefault>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DurationDefault] and returns the inserted row.
  ///
  /// The returned [DurationDefault] will have its `id` field set.
  Future<DurationDefault> insertRow(
    final _i1.Session session,
    final DurationDefault row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DurationDefault>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DurationDefault]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DurationDefault>> update(
    final _i1.Session session,
    final List<DurationDefault> rows, {
    final _i1.ColumnSelections<DurationDefaultTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.update<DurationDefault>(
      rows,
      columns: columns?.call(DurationDefault.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DurationDefault]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DurationDefault> updateRow(
    final _i1.Session session,
    final DurationDefault row, {
    final _i1.ColumnSelections<DurationDefaultTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DurationDefault>(
      row,
      columns: columns?.call(DurationDefault.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DurationDefault] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<DurationDefault?> updateById(
    final _i1.Session session,
    final int id, {
    required final _i1.ColumnValueListBuilder<DurationDefaultUpdateTable>
    columnValues,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<DurationDefault>(
      id,
      columnValues: columnValues(DurationDefault.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [DurationDefault]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<DurationDefault>> updateWhere(
    final _i1.Session session, {
    required final _i1.ColumnValueListBuilder<DurationDefaultUpdateTable>
    columnValues,
    required final _i1.WhereExpressionBuilder<DurationDefaultTable> where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<DurationDefaultTable>? orderBy,
    final _i1.OrderByListBuilder<DurationDefaultTable>? orderByList,
    final bool orderDescending = false,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<DurationDefault>(
      columnValues: columnValues(DurationDefault.t.updateTable),
      where: where(DurationDefault.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DurationDefault.t),
      orderByList: orderByList?.call(DurationDefault.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [DurationDefault]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DurationDefault>> delete(
    final _i1.Session session,
    final List<DurationDefault> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DurationDefault>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DurationDefault].
  Future<DurationDefault> deleteRow(
    final _i1.Session session,
    final DurationDefault row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DurationDefault>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DurationDefault>> deleteWhere(
    final _i1.Session session, {
    required final _i1.WhereExpressionBuilder<DurationDefaultTable> where,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DurationDefault>(
      where: where(DurationDefault.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<DurationDefaultTable>? where,
    final int? limit,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.count<DurationDefault>(
      where: where?.call(DurationDefault.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
