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

abstract class IntDefaultMix
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  IntDefaultMix._({
    this.id,
    final int? intDefaultAndDefaultModel,
    final int? intDefaultAndDefaultPersist,
    final int? intDefaultModelAndDefaultPersist,
  }) : intDefaultAndDefaultModel = intDefaultAndDefaultModel ?? 20,
       intDefaultAndDefaultPersist = intDefaultAndDefaultPersist ?? 10,
       intDefaultModelAndDefaultPersist =
           intDefaultModelAndDefaultPersist ?? 10;

  factory IntDefaultMix({
    final int? id,
    final int? intDefaultAndDefaultModel,
    final int? intDefaultAndDefaultPersist,
    final int? intDefaultModelAndDefaultPersist,
  }) = _IntDefaultMixImpl;

  factory IntDefaultMix.fromJson(final Map<String, dynamic> jsonSerialization) {
    return IntDefaultMix(
      id: jsonSerialization['id'] as int?,
      intDefaultAndDefaultModel:
          jsonSerialization['intDefaultAndDefaultModel'] as int,
      intDefaultAndDefaultPersist:
          jsonSerialization['intDefaultAndDefaultPersist'] as int,
      intDefaultModelAndDefaultPersist:
          jsonSerialization['intDefaultModelAndDefaultPersist'] as int,
    );
  }

  static final t = IntDefaultMixTable();

  static const db = IntDefaultMixRepository._();

  @override
  int? id;

  int intDefaultAndDefaultModel;

  int intDefaultAndDefaultPersist;

  int intDefaultModelAndDefaultPersist;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [IntDefaultMix]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  IntDefaultMix copyWith({
    final int? id,
    final int? intDefaultAndDefaultModel,
    final int? intDefaultAndDefaultPersist,
    final int? intDefaultModelAndDefaultPersist,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'intDefaultAndDefaultModel': intDefaultAndDefaultModel,
      'intDefaultAndDefaultPersist': intDefaultAndDefaultPersist,
      'intDefaultModelAndDefaultPersist': intDefaultModelAndDefaultPersist,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'intDefaultAndDefaultModel': intDefaultAndDefaultModel,
      'intDefaultAndDefaultPersist': intDefaultAndDefaultPersist,
      'intDefaultModelAndDefaultPersist': intDefaultModelAndDefaultPersist,
    };
  }

  static IntDefaultMixInclude include() {
    return IntDefaultMixInclude._();
  }

  static IntDefaultMixIncludeList includeList({
    final _i1.WhereExpressionBuilder<IntDefaultMixTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<IntDefaultMixTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<IntDefaultMixTable>? orderByList,
    final IntDefaultMixInclude? include,
  }) {
    return IntDefaultMixIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(IntDefaultMix.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(IntDefaultMix.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _IntDefaultMixImpl extends IntDefaultMix {
  _IntDefaultMixImpl({
    final int? id,
    final int? intDefaultAndDefaultModel,
    final int? intDefaultAndDefaultPersist,
    final int? intDefaultModelAndDefaultPersist,
  }) : super._(
         id: id,
         intDefaultAndDefaultModel: intDefaultAndDefaultModel,
         intDefaultAndDefaultPersist: intDefaultAndDefaultPersist,
         intDefaultModelAndDefaultPersist: intDefaultModelAndDefaultPersist,
       );

  /// Returns a shallow copy of this [IntDefaultMix]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  IntDefaultMix copyWith({
    final Object? id = _Undefined,
    final int? intDefaultAndDefaultModel,
    final int? intDefaultAndDefaultPersist,
    final int? intDefaultModelAndDefaultPersist,
  }) {
    return IntDefaultMix(
      id: id is int? ? id : this.id,
      intDefaultAndDefaultModel:
          intDefaultAndDefaultModel ?? this.intDefaultAndDefaultModel,
      intDefaultAndDefaultPersist:
          intDefaultAndDefaultPersist ?? this.intDefaultAndDefaultPersist,
      intDefaultModelAndDefaultPersist:
          intDefaultModelAndDefaultPersist ??
          this.intDefaultModelAndDefaultPersist,
    );
  }
}

class IntDefaultMixUpdateTable extends _i1.UpdateTable<IntDefaultMixTable> {
  IntDefaultMixUpdateTable(super.table);

  _i1.ColumnValue<int, int> intDefaultAndDefaultModel(final int value) =>
      _i1.ColumnValue(
        table.intDefaultAndDefaultModel,
        value,
      );

  _i1.ColumnValue<int, int> intDefaultAndDefaultPersist(final int value) =>
      _i1.ColumnValue(
        table.intDefaultAndDefaultPersist,
        value,
      );

  _i1.ColumnValue<int, int> intDefaultModelAndDefaultPersist(final int value) =>
      _i1.ColumnValue(
        table.intDefaultModelAndDefaultPersist,
        value,
      );
}

class IntDefaultMixTable extends _i1.Table<int?> {
  IntDefaultMixTable({super.tableRelation})
    : super(tableName: 'int_default_mix') {
    updateTable = IntDefaultMixUpdateTable(this);
    intDefaultAndDefaultModel = _i1.ColumnInt(
      'intDefaultAndDefaultModel',
      this,
      hasDefault: true,
    );
    intDefaultAndDefaultPersist = _i1.ColumnInt(
      'intDefaultAndDefaultPersist',
      this,
      hasDefault: true,
    );
    intDefaultModelAndDefaultPersist = _i1.ColumnInt(
      'intDefaultModelAndDefaultPersist',
      this,
      hasDefault: true,
    );
  }

  late final IntDefaultMixUpdateTable updateTable;

  late final _i1.ColumnInt intDefaultAndDefaultModel;

  late final _i1.ColumnInt intDefaultAndDefaultPersist;

  late final _i1.ColumnInt intDefaultModelAndDefaultPersist;

  @override
  List<_i1.Column> get columns => [
    id,
    intDefaultAndDefaultModel,
    intDefaultAndDefaultPersist,
    intDefaultModelAndDefaultPersist,
  ];
}

class IntDefaultMixInclude extends _i1.IncludeObject {
  IntDefaultMixInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => IntDefaultMix.t;
}

class IntDefaultMixIncludeList extends _i1.IncludeList {
  IntDefaultMixIncludeList._({
    final _i1.WhereExpressionBuilder<IntDefaultMixTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(IntDefaultMix.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => IntDefaultMix.t;
}

class IntDefaultMixRepository {
  const IntDefaultMixRepository._();

  /// Returns a list of [IntDefaultMix]s matching the given query parameters.
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
  Future<List<IntDefaultMix>> find(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<IntDefaultMixTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<IntDefaultMixTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<IntDefaultMixTable>? orderByList,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.find<IntDefaultMix>(
      where: where?.call(IntDefaultMix.t),
      orderBy: orderBy?.call(IntDefaultMix.t),
      orderByList: orderByList?.call(IntDefaultMix.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [IntDefaultMix] matching the given query parameters.
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
  Future<IntDefaultMix?> findFirstRow(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<IntDefaultMixTable>? where,
    final int? offset,
    final _i1.OrderByBuilder<IntDefaultMixTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<IntDefaultMixTable>? orderByList,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<IntDefaultMix>(
      where: where?.call(IntDefaultMix.t),
      orderBy: orderBy?.call(IntDefaultMix.t),
      orderByList: orderByList?.call(IntDefaultMix.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [IntDefaultMix] by its [id] or null if no such row exists.
  Future<IntDefaultMix?> findById(
    final _i1.Session session,
    final int id, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.findById<IntDefaultMix>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [IntDefaultMix]s in the list and returns the inserted rows.
  ///
  /// The returned [IntDefaultMix]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<IntDefaultMix>> insert(
    final _i1.Session session,
    final List<IntDefaultMix> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insert<IntDefaultMix>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [IntDefaultMix] and returns the inserted row.
  ///
  /// The returned [IntDefaultMix] will have its `id` field set.
  Future<IntDefaultMix> insertRow(
    final _i1.Session session,
    final IntDefaultMix row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<IntDefaultMix>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [IntDefaultMix]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<IntDefaultMix>> update(
    final _i1.Session session,
    final List<IntDefaultMix> rows, {
    final _i1.ColumnSelections<IntDefaultMixTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.update<IntDefaultMix>(
      rows,
      columns: columns?.call(IntDefaultMix.t),
      transaction: transaction,
    );
  }

  /// Updates a single [IntDefaultMix]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<IntDefaultMix> updateRow(
    final _i1.Session session,
    final IntDefaultMix row, {
    final _i1.ColumnSelections<IntDefaultMixTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<IntDefaultMix>(
      row,
      columns: columns?.call(IntDefaultMix.t),
      transaction: transaction,
    );
  }

  /// Updates a single [IntDefaultMix] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<IntDefaultMix?> updateById(
    final _i1.Session session,
    final int id, {
    required final _i1.ColumnValueListBuilder<IntDefaultMixUpdateTable> columnValues,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<IntDefaultMix>(
      id,
      columnValues: columnValues(IntDefaultMix.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [IntDefaultMix]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<IntDefaultMix>> updateWhere(
    final _i1.Session session, {
    required final _i1.ColumnValueListBuilder<IntDefaultMixUpdateTable> columnValues,
    required final _i1.WhereExpressionBuilder<IntDefaultMixTable> where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<IntDefaultMixTable>? orderBy,
    final _i1.OrderByListBuilder<IntDefaultMixTable>? orderByList,
    final bool orderDescending = false,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<IntDefaultMix>(
      columnValues: columnValues(IntDefaultMix.t.updateTable),
      where: where(IntDefaultMix.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(IntDefaultMix.t),
      orderByList: orderByList?.call(IntDefaultMix.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [IntDefaultMix]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<IntDefaultMix>> delete(
    final _i1.Session session,
    final List<IntDefaultMix> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.delete<IntDefaultMix>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [IntDefaultMix].
  Future<IntDefaultMix> deleteRow(
    final _i1.Session session,
    final IntDefaultMix row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<IntDefaultMix>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<IntDefaultMix>> deleteWhere(
    final _i1.Session session, {
    required final _i1.WhereExpressionBuilder<IntDefaultMixTable> where,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<IntDefaultMix>(
      where: where(IntDefaultMix.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<IntDefaultMixTable>? where,
    final int? limit,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.count<IntDefaultMix>(
      where: where?.call(IntDefaultMix.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
