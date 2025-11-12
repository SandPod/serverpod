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

abstract class DateTimeDefaultModel
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DateTimeDefaultModel._({
    this.id,
    final DateTime? dateTimeDefaultModelNow,
    final DateTime? dateTimeDefaultModelStr,
    final DateTime? dateTimeDefaultModelStrNull,
  }) : dateTimeDefaultModelNow = dateTimeDefaultModelNow ?? DateTime.now(),
       dateTimeDefaultModelStr =
           dateTimeDefaultModelStr ??
           DateTime.parse('2024-05-24T22:00:00.000Z'),
       dateTimeDefaultModelStrNull =
           dateTimeDefaultModelStrNull ??
           DateTime.parse('2024-05-24T22:00:00.000Z');

  factory DateTimeDefaultModel({
    final int? id,
    final DateTime? dateTimeDefaultModelNow,
    final DateTime? dateTimeDefaultModelStr,
    final DateTime? dateTimeDefaultModelStrNull,
  }) = _DateTimeDefaultModelImpl;

  factory DateTimeDefaultModel.fromJson(
    final Map<String, dynamic> jsonSerialization,
  ) {
    return DateTimeDefaultModel(
      id: jsonSerialization['id'] as int?,
      dateTimeDefaultModelNow: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['dateTimeDefaultModelNow'],
      ),
      dateTimeDefaultModelStr: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['dateTimeDefaultModelStr'],
      ),
      dateTimeDefaultModelStrNull:
          jsonSerialization['dateTimeDefaultModelStrNull'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateTimeDefaultModelStrNull'],
            ),
    );
  }

  static final t = DateTimeDefaultModelTable();

  static const db = DateTimeDefaultModelRepository._();

  @override
  int? id;

  DateTime dateTimeDefaultModelNow;

  DateTime dateTimeDefaultModelStr;

  DateTime? dateTimeDefaultModelStrNull;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DateTimeDefaultModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DateTimeDefaultModel copyWith({
    final int? id,
    final DateTime? dateTimeDefaultModelNow,
    final DateTime? dateTimeDefaultModelStr,
    final DateTime? dateTimeDefaultModelStrNull,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'dateTimeDefaultModelNow': dateTimeDefaultModelNow.toJson(),
      'dateTimeDefaultModelStr': dateTimeDefaultModelStr.toJson(),
      if (dateTimeDefaultModelStrNull != null)
        'dateTimeDefaultModelStrNull': dateTimeDefaultModelStrNull?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'dateTimeDefaultModelNow': dateTimeDefaultModelNow.toJson(),
      'dateTimeDefaultModelStr': dateTimeDefaultModelStr.toJson(),
      if (dateTimeDefaultModelStrNull != null)
        'dateTimeDefaultModelStrNull': dateTimeDefaultModelStrNull?.toJson(),
    };
  }

  static DateTimeDefaultModelInclude include() {
    return DateTimeDefaultModelInclude._();
  }

  static DateTimeDefaultModelIncludeList includeList({
    final _i1.WhereExpressionBuilder<DateTimeDefaultModelTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<DateTimeDefaultModelTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<DateTimeDefaultModelTable>? orderByList,
    final DateTimeDefaultModelInclude? include,
  }) {
    return DateTimeDefaultModelIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DateTimeDefaultModel.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DateTimeDefaultModel.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DateTimeDefaultModelImpl extends DateTimeDefaultModel {
  _DateTimeDefaultModelImpl({
    final int? id,
    final DateTime? dateTimeDefaultModelNow,
    final DateTime? dateTimeDefaultModelStr,
    final DateTime? dateTimeDefaultModelStrNull,
  }) : super._(
         id: id,
         dateTimeDefaultModelNow: dateTimeDefaultModelNow,
         dateTimeDefaultModelStr: dateTimeDefaultModelStr,
         dateTimeDefaultModelStrNull: dateTimeDefaultModelStrNull,
       );

  /// Returns a shallow copy of this [DateTimeDefaultModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DateTimeDefaultModel copyWith({
    final Object? id = _Undefined,
    final DateTime? dateTimeDefaultModelNow,
    final DateTime? dateTimeDefaultModelStr,
    final Object? dateTimeDefaultModelStrNull = _Undefined,
  }) {
    return DateTimeDefaultModel(
      id: id is int? ? id : this.id,
      dateTimeDefaultModelNow:
          dateTimeDefaultModelNow ?? this.dateTimeDefaultModelNow,
      dateTimeDefaultModelStr:
          dateTimeDefaultModelStr ?? this.dateTimeDefaultModelStr,
      dateTimeDefaultModelStrNull: dateTimeDefaultModelStrNull is DateTime?
          ? dateTimeDefaultModelStrNull
          : this.dateTimeDefaultModelStrNull,
    );
  }
}

class DateTimeDefaultModelUpdateTable
    extends _i1.UpdateTable<DateTimeDefaultModelTable> {
  DateTimeDefaultModelUpdateTable(super.table);

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultModelNow(final DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultModelNow,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultModelStr(final DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultModelStr,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultModelStrNull(
    final DateTime? value,
  ) => _i1.ColumnValue(
    table.dateTimeDefaultModelStrNull,
    value,
  );
}

class DateTimeDefaultModelTable extends _i1.Table<int?> {
  DateTimeDefaultModelTable({super.tableRelation})
    : super(tableName: 'datetime_default_model') {
    updateTable = DateTimeDefaultModelUpdateTable(this);
    dateTimeDefaultModelNow = _i1.ColumnDateTime(
      'dateTimeDefaultModelNow',
      this,
    );
    dateTimeDefaultModelStr = _i1.ColumnDateTime(
      'dateTimeDefaultModelStr',
      this,
    );
    dateTimeDefaultModelStrNull = _i1.ColumnDateTime(
      'dateTimeDefaultModelStrNull',
      this,
    );
  }

  late final DateTimeDefaultModelUpdateTable updateTable;

  late final _i1.ColumnDateTime dateTimeDefaultModelNow;

  late final _i1.ColumnDateTime dateTimeDefaultModelStr;

  late final _i1.ColumnDateTime dateTimeDefaultModelStrNull;

  @override
  List<_i1.Column> get columns => [
    id,
    dateTimeDefaultModelNow,
    dateTimeDefaultModelStr,
    dateTimeDefaultModelStrNull,
  ];
}

class DateTimeDefaultModelInclude extends _i1.IncludeObject {
  DateTimeDefaultModelInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => DateTimeDefaultModel.t;
}

class DateTimeDefaultModelIncludeList extends _i1.IncludeList {
  DateTimeDefaultModelIncludeList._({
    final _i1.WhereExpressionBuilder<DateTimeDefaultModelTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DateTimeDefaultModel.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DateTimeDefaultModel.t;
}

class DateTimeDefaultModelRepository {
  const DateTimeDefaultModelRepository._();

  /// Returns a list of [DateTimeDefaultModel]s matching the given query parameters.
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
  Future<List<DateTimeDefaultModel>> find(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<DateTimeDefaultModelTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<DateTimeDefaultModelTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<DateTimeDefaultModelTable>? orderByList,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.find<DateTimeDefaultModel>(
      where: where?.call(DateTimeDefaultModel.t),
      orderBy: orderBy?.call(DateTimeDefaultModel.t),
      orderByList: orderByList?.call(DateTimeDefaultModel.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [DateTimeDefaultModel] matching the given query parameters.
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
  Future<DateTimeDefaultModel?> findFirstRow(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<DateTimeDefaultModelTable>? where,
    final int? offset,
    final _i1.OrderByBuilder<DateTimeDefaultModelTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<DateTimeDefaultModelTable>? orderByList,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DateTimeDefaultModel>(
      where: where?.call(DateTimeDefaultModel.t),
      orderBy: orderBy?.call(DateTimeDefaultModel.t),
      orderByList: orderByList?.call(DateTimeDefaultModel.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [DateTimeDefaultModel] by its [id] or null if no such row exists.
  Future<DateTimeDefaultModel?> findById(
    final _i1.Session session,
    final int id, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DateTimeDefaultModel>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [DateTimeDefaultModel]s in the list and returns the inserted rows.
  ///
  /// The returned [DateTimeDefaultModel]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DateTimeDefaultModel>> insert(
    final _i1.Session session,
    final List<DateTimeDefaultModel> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DateTimeDefaultModel>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DateTimeDefaultModel] and returns the inserted row.
  ///
  /// The returned [DateTimeDefaultModel] will have its `id` field set.
  Future<DateTimeDefaultModel> insertRow(
    final _i1.Session session,
    final DateTimeDefaultModel row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DateTimeDefaultModel>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DateTimeDefaultModel]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DateTimeDefaultModel>> update(
    final _i1.Session session,
    final List<DateTimeDefaultModel> rows, {
    final _i1.ColumnSelections<DateTimeDefaultModelTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.update<DateTimeDefaultModel>(
      rows,
      columns: columns?.call(DateTimeDefaultModel.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DateTimeDefaultModel]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DateTimeDefaultModel> updateRow(
    final _i1.Session session,
    final DateTimeDefaultModel row, {
    final _i1.ColumnSelections<DateTimeDefaultModelTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DateTimeDefaultModel>(
      row,
      columns: columns?.call(DateTimeDefaultModel.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DateTimeDefaultModel] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<DateTimeDefaultModel?> updateById(
    final _i1.Session session,
    final int id, {
    required final _i1.ColumnValueListBuilder<DateTimeDefaultModelUpdateTable>
    columnValues,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<DateTimeDefaultModel>(
      id,
      columnValues: columnValues(DateTimeDefaultModel.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [DateTimeDefaultModel]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<DateTimeDefaultModel>> updateWhere(
    final _i1.Session session, {
    required final _i1.ColumnValueListBuilder<DateTimeDefaultModelUpdateTable>
    columnValues,
    required final _i1.WhereExpressionBuilder<DateTimeDefaultModelTable> where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<DateTimeDefaultModelTable>? orderBy,
    final _i1.OrderByListBuilder<DateTimeDefaultModelTable>? orderByList,
    final bool orderDescending = false,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<DateTimeDefaultModel>(
      columnValues: columnValues(DateTimeDefaultModel.t.updateTable),
      where: where(DateTimeDefaultModel.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DateTimeDefaultModel.t),
      orderByList: orderByList?.call(DateTimeDefaultModel.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [DateTimeDefaultModel]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DateTimeDefaultModel>> delete(
    final _i1.Session session,
    final List<DateTimeDefaultModel> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DateTimeDefaultModel>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DateTimeDefaultModel].
  Future<DateTimeDefaultModel> deleteRow(
    final _i1.Session session,
    final DateTimeDefaultModel row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DateTimeDefaultModel>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DateTimeDefaultModel>> deleteWhere(
    final _i1.Session session, {
    required final _i1.WhereExpressionBuilder<DateTimeDefaultModelTable> where,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DateTimeDefaultModel>(
      where: where(DateTimeDefaultModel.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<DateTimeDefaultModelTable>? where,
    final int? limit,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.count<DateTimeDefaultModel>(
      where: where?.call(DateTimeDefaultModel.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
