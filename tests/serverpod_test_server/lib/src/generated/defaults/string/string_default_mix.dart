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

abstract class StringDefaultMix
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  StringDefaultMix._({
    this.id,
    final String? stringDefaultAndDefaultModel,
    final String? stringDefaultAndDefaultPersist,
    final String? stringDefaultModelAndDefaultPersist,
  }) : stringDefaultAndDefaultModel =
           stringDefaultAndDefaultModel ?? 'This is a default model value',
       stringDefaultAndDefaultPersist =
           stringDefaultAndDefaultPersist ?? 'This is a default value',
       stringDefaultModelAndDefaultPersist =
           stringDefaultModelAndDefaultPersist ?? 'This is a default value';

  factory StringDefaultMix({
    final int? id,
    final String? stringDefaultAndDefaultModel,
    final String? stringDefaultAndDefaultPersist,
    final String? stringDefaultModelAndDefaultPersist,
  }) = _StringDefaultMixImpl;

  factory StringDefaultMix.fromJson(final Map<String, dynamic> jsonSerialization) {
    return StringDefaultMix(
      id: jsonSerialization['id'] as int?,
      stringDefaultAndDefaultModel:
          jsonSerialization['stringDefaultAndDefaultModel'] as String,
      stringDefaultAndDefaultPersist:
          jsonSerialization['stringDefaultAndDefaultPersist'] as String,
      stringDefaultModelAndDefaultPersist:
          jsonSerialization['stringDefaultModelAndDefaultPersist'] as String,
    );
  }

  static final t = StringDefaultMixTable();

  static const db = StringDefaultMixRepository._();

  @override
  int? id;

  String stringDefaultAndDefaultModel;

  String stringDefaultAndDefaultPersist;

  String stringDefaultModelAndDefaultPersist;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [StringDefaultMix]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StringDefaultMix copyWith({
    final int? id,
    final String? stringDefaultAndDefaultModel,
    final String? stringDefaultAndDefaultPersist,
    final String? stringDefaultModelAndDefaultPersist,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'stringDefaultAndDefaultModel': stringDefaultAndDefaultModel,
      'stringDefaultAndDefaultPersist': stringDefaultAndDefaultPersist,
      'stringDefaultModelAndDefaultPersist':
          stringDefaultModelAndDefaultPersist,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'stringDefaultAndDefaultModel': stringDefaultAndDefaultModel,
      'stringDefaultAndDefaultPersist': stringDefaultAndDefaultPersist,
      'stringDefaultModelAndDefaultPersist':
          stringDefaultModelAndDefaultPersist,
    };
  }

  static StringDefaultMixInclude include() {
    return StringDefaultMixInclude._();
  }

  static StringDefaultMixIncludeList includeList({
    final _i1.WhereExpressionBuilder<StringDefaultMixTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<StringDefaultMixTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<StringDefaultMixTable>? orderByList,
    final StringDefaultMixInclude? include,
  }) {
    return StringDefaultMixIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StringDefaultMix.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(StringDefaultMix.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StringDefaultMixImpl extends StringDefaultMix {
  _StringDefaultMixImpl({
    final int? id,
    final String? stringDefaultAndDefaultModel,
    final String? stringDefaultAndDefaultPersist,
    final String? stringDefaultModelAndDefaultPersist,
  }) : super._(
         id: id,
         stringDefaultAndDefaultModel: stringDefaultAndDefaultModel,
         stringDefaultAndDefaultPersist: stringDefaultAndDefaultPersist,
         stringDefaultModelAndDefaultPersist:
             stringDefaultModelAndDefaultPersist,
       );

  /// Returns a shallow copy of this [StringDefaultMix]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StringDefaultMix copyWith({
    final Object? id = _Undefined,
    final String? stringDefaultAndDefaultModel,
    final String? stringDefaultAndDefaultPersist,
    final String? stringDefaultModelAndDefaultPersist,
  }) {
    return StringDefaultMix(
      id: id is int? ? id : this.id,
      stringDefaultAndDefaultModel:
          stringDefaultAndDefaultModel ?? this.stringDefaultAndDefaultModel,
      stringDefaultAndDefaultPersist:
          stringDefaultAndDefaultPersist ?? this.stringDefaultAndDefaultPersist,
      stringDefaultModelAndDefaultPersist:
          stringDefaultModelAndDefaultPersist ??
          this.stringDefaultModelAndDefaultPersist,
    );
  }
}

class StringDefaultMixUpdateTable
    extends _i1.UpdateTable<StringDefaultMixTable> {
  StringDefaultMixUpdateTable(super.table);

  _i1.ColumnValue<String, String> stringDefaultAndDefaultModel(final String value) =>
      _i1.ColumnValue(
        table.stringDefaultAndDefaultModel,
        value,
      );

  _i1.ColumnValue<String, String> stringDefaultAndDefaultPersist(
    final String value,
  ) => _i1.ColumnValue(
    table.stringDefaultAndDefaultPersist,
    value,
  );

  _i1.ColumnValue<String, String> stringDefaultModelAndDefaultPersist(
    final String value,
  ) => _i1.ColumnValue(
    table.stringDefaultModelAndDefaultPersist,
    value,
  );
}

class StringDefaultMixTable extends _i1.Table<int?> {
  StringDefaultMixTable({super.tableRelation})
    : super(tableName: 'string_default_mix') {
    updateTable = StringDefaultMixUpdateTable(this);
    stringDefaultAndDefaultModel = _i1.ColumnString(
      'stringDefaultAndDefaultModel',
      this,
      hasDefault: true,
    );
    stringDefaultAndDefaultPersist = _i1.ColumnString(
      'stringDefaultAndDefaultPersist',
      this,
      hasDefault: true,
    );
    stringDefaultModelAndDefaultPersist = _i1.ColumnString(
      'stringDefaultModelAndDefaultPersist',
      this,
      hasDefault: true,
    );
  }

  late final StringDefaultMixUpdateTable updateTable;

  late final _i1.ColumnString stringDefaultAndDefaultModel;

  late final _i1.ColumnString stringDefaultAndDefaultPersist;

  late final _i1.ColumnString stringDefaultModelAndDefaultPersist;

  @override
  List<_i1.Column> get columns => [
    id,
    stringDefaultAndDefaultModel,
    stringDefaultAndDefaultPersist,
    stringDefaultModelAndDefaultPersist,
  ];
}

class StringDefaultMixInclude extends _i1.IncludeObject {
  StringDefaultMixInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => StringDefaultMix.t;
}

class StringDefaultMixIncludeList extends _i1.IncludeList {
  StringDefaultMixIncludeList._({
    final _i1.WhereExpressionBuilder<StringDefaultMixTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(StringDefaultMix.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => StringDefaultMix.t;
}

class StringDefaultMixRepository {
  const StringDefaultMixRepository._();

  /// Returns a list of [StringDefaultMix]s matching the given query parameters.
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
  Future<List<StringDefaultMix>> find(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<StringDefaultMixTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<StringDefaultMixTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<StringDefaultMixTable>? orderByList,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.find<StringDefaultMix>(
      where: where?.call(StringDefaultMix.t),
      orderBy: orderBy?.call(StringDefaultMix.t),
      orderByList: orderByList?.call(StringDefaultMix.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [StringDefaultMix] matching the given query parameters.
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
  Future<StringDefaultMix?> findFirstRow(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<StringDefaultMixTable>? where,
    final int? offset,
    final _i1.OrderByBuilder<StringDefaultMixTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<StringDefaultMixTable>? orderByList,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<StringDefaultMix>(
      where: where?.call(StringDefaultMix.t),
      orderBy: orderBy?.call(StringDefaultMix.t),
      orderByList: orderByList?.call(StringDefaultMix.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [StringDefaultMix] by its [id] or null if no such row exists.
  Future<StringDefaultMix?> findById(
    final _i1.Session session,
    final int id, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.findById<StringDefaultMix>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [StringDefaultMix]s in the list and returns the inserted rows.
  ///
  /// The returned [StringDefaultMix]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<StringDefaultMix>> insert(
    final _i1.Session session,
    final List<StringDefaultMix> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insert<StringDefaultMix>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [StringDefaultMix] and returns the inserted row.
  ///
  /// The returned [StringDefaultMix] will have its `id` field set.
  Future<StringDefaultMix> insertRow(
    final _i1.Session session,
    final StringDefaultMix row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<StringDefaultMix>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [StringDefaultMix]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<StringDefaultMix>> update(
    final _i1.Session session,
    final List<StringDefaultMix> rows, {
    final _i1.ColumnSelections<StringDefaultMixTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.update<StringDefaultMix>(
      rows,
      columns: columns?.call(StringDefaultMix.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StringDefaultMix]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<StringDefaultMix> updateRow(
    final _i1.Session session,
    final StringDefaultMix row, {
    final _i1.ColumnSelections<StringDefaultMixTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<StringDefaultMix>(
      row,
      columns: columns?.call(StringDefaultMix.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StringDefaultMix] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<StringDefaultMix?> updateById(
    final _i1.Session session,
    final int id, {
    required final _i1.ColumnValueListBuilder<StringDefaultMixUpdateTable>
    columnValues,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<StringDefaultMix>(
      id,
      columnValues: columnValues(StringDefaultMix.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [StringDefaultMix]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<StringDefaultMix>> updateWhere(
    final _i1.Session session, {
    required final _i1.ColumnValueListBuilder<StringDefaultMixUpdateTable>
    columnValues,
    required final _i1.WhereExpressionBuilder<StringDefaultMixTable> where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<StringDefaultMixTable>? orderBy,
    final _i1.OrderByListBuilder<StringDefaultMixTable>? orderByList,
    final bool orderDescending = false,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<StringDefaultMix>(
      columnValues: columnValues(StringDefaultMix.t.updateTable),
      where: where(StringDefaultMix.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StringDefaultMix.t),
      orderByList: orderByList?.call(StringDefaultMix.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [StringDefaultMix]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<StringDefaultMix>> delete(
    final _i1.Session session,
    final List<StringDefaultMix> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.delete<StringDefaultMix>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [StringDefaultMix].
  Future<StringDefaultMix> deleteRow(
    final _i1.Session session,
    final StringDefaultMix row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<StringDefaultMix>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<StringDefaultMix>> deleteWhere(
    final _i1.Session session, {
    required final _i1.WhereExpressionBuilder<StringDefaultMixTable> where,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<StringDefaultMix>(
      where: where(StringDefaultMix.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<StringDefaultMixTable>? where,
    final int? limit,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.count<StringDefaultMix>(
      where: where?.call(StringDefaultMix.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
