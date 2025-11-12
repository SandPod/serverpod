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

abstract class ObjectFieldScopes
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ObjectFieldScopes._({
    this.id,
    required this.normal,
    this.api,
    this.database,
  });

  factory ObjectFieldScopes({
    final int? id,
    required final String normal,
    final String? api,
    final String? database,
  }) = _ObjectFieldScopesImpl;

  factory ObjectFieldScopes.fromJson(final Map<String, dynamic> jsonSerialization) {
    return ObjectFieldScopes(
      id: jsonSerialization['id'] as int?,
      normal: jsonSerialization['normal'] as String,
      api: jsonSerialization['api'] as String?,
      database: jsonSerialization['database'] as String?,
    );
  }

  static final t = ObjectFieldScopesTable();

  static const db = ObjectFieldScopesRepository._();

  @override
  int? id;

  String normal;

  String? api;

  String? database;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ObjectFieldScopes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ObjectFieldScopes copyWith({
    final int? id,
    final String? normal,
    final String? api,
    final String? database,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'normal': normal,
      if (api != null) 'api': api,
      if (database != null) 'database': database,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'normal': normal,
      if (api != null) 'api': api,
    };
  }

  static ObjectFieldScopesInclude include() {
    return ObjectFieldScopesInclude._();
  }

  static ObjectFieldScopesIncludeList includeList({
    final _i1.WhereExpressionBuilder<ObjectFieldScopesTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<ObjectFieldScopesTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<ObjectFieldScopesTable>? orderByList,
    final ObjectFieldScopesInclude? include,
  }) {
    return ObjectFieldScopesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ObjectFieldScopes.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ObjectFieldScopes.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ObjectFieldScopesImpl extends ObjectFieldScopes {
  _ObjectFieldScopesImpl({
    final int? id,
    required final String normal,
    final String? api,
    final String? database,
  }) : super._(
         id: id,
         normal: normal,
         api: api,
         database: database,
       );

  /// Returns a shallow copy of this [ObjectFieldScopes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ObjectFieldScopes copyWith({
    final Object? id = _Undefined,
    final String? normal,
    final Object? api = _Undefined,
    final Object? database = _Undefined,
  }) {
    return ObjectFieldScopes(
      id: id is int? ? id : this.id,
      normal: normal ?? this.normal,
      api: api is String? ? api : this.api,
      database: database is String? ? database : this.database,
    );
  }
}

class ObjectFieldScopesUpdateTable
    extends _i1.UpdateTable<ObjectFieldScopesTable> {
  ObjectFieldScopesUpdateTable(super.table);

  _i1.ColumnValue<String, String> normal(final String value) => _i1.ColumnValue(
    table.normal,
    value,
  );

  _i1.ColumnValue<String, String> database(final String? value) => _i1.ColumnValue(
    table.database,
    value,
  );
}

class ObjectFieldScopesTable extends _i1.Table<int?> {
  ObjectFieldScopesTable({super.tableRelation})
    : super(tableName: 'object_field_scopes') {
    updateTable = ObjectFieldScopesUpdateTable(this);
    normal = _i1.ColumnString(
      'normal',
      this,
    );
    database = _i1.ColumnString(
      'database',
      this,
    );
  }

  late final ObjectFieldScopesUpdateTable updateTable;

  late final _i1.ColumnString normal;

  late final _i1.ColumnString database;

  @override
  List<_i1.Column> get columns => [
    id,
    normal,
    database,
  ];
}

class ObjectFieldScopesInclude extends _i1.IncludeObject {
  ObjectFieldScopesInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ObjectFieldScopes.t;
}

class ObjectFieldScopesIncludeList extends _i1.IncludeList {
  ObjectFieldScopesIncludeList._({
    final _i1.WhereExpressionBuilder<ObjectFieldScopesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ObjectFieldScopes.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ObjectFieldScopes.t;
}

class ObjectFieldScopesRepository {
  const ObjectFieldScopesRepository._();

  /// Returns a list of [ObjectFieldScopes]s matching the given query parameters.
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
  Future<List<ObjectFieldScopes>> find(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<ObjectFieldScopesTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<ObjectFieldScopesTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<ObjectFieldScopesTable>? orderByList,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.find<ObjectFieldScopes>(
      where: where?.call(ObjectFieldScopes.t),
      orderBy: orderBy?.call(ObjectFieldScopes.t),
      orderByList: orderByList?.call(ObjectFieldScopes.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [ObjectFieldScopes] matching the given query parameters.
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
  Future<ObjectFieldScopes?> findFirstRow(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<ObjectFieldScopesTable>? where,
    final int? offset,
    final _i1.OrderByBuilder<ObjectFieldScopesTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<ObjectFieldScopesTable>? orderByList,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ObjectFieldScopes>(
      where: where?.call(ObjectFieldScopes.t),
      orderBy: orderBy?.call(ObjectFieldScopes.t),
      orderByList: orderByList?.call(ObjectFieldScopes.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [ObjectFieldScopes] by its [id] or null if no such row exists.
  Future<ObjectFieldScopes?> findById(
    final _i1.Session session,
    final int id, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ObjectFieldScopes>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [ObjectFieldScopes]s in the list and returns the inserted rows.
  ///
  /// The returned [ObjectFieldScopes]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ObjectFieldScopes>> insert(
    final _i1.Session session,
    final List<ObjectFieldScopes> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ObjectFieldScopes>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ObjectFieldScopes] and returns the inserted row.
  ///
  /// The returned [ObjectFieldScopes] will have its `id` field set.
  Future<ObjectFieldScopes> insertRow(
    final _i1.Session session,
    final ObjectFieldScopes row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ObjectFieldScopes>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ObjectFieldScopes]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ObjectFieldScopes>> update(
    final _i1.Session session,
    final List<ObjectFieldScopes> rows, {
    final _i1.ColumnSelections<ObjectFieldScopesTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.update<ObjectFieldScopes>(
      rows,
      columns: columns?.call(ObjectFieldScopes.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ObjectFieldScopes]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ObjectFieldScopes> updateRow(
    final _i1.Session session,
    final ObjectFieldScopes row, {
    final _i1.ColumnSelections<ObjectFieldScopesTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ObjectFieldScopes>(
      row,
      columns: columns?.call(ObjectFieldScopes.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ObjectFieldScopes] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ObjectFieldScopes?> updateById(
    final _i1.Session session,
    final int id, {
    required final _i1.ColumnValueListBuilder<ObjectFieldScopesUpdateTable>
    columnValues,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ObjectFieldScopes>(
      id,
      columnValues: columnValues(ObjectFieldScopes.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ObjectFieldScopes]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ObjectFieldScopes>> updateWhere(
    final _i1.Session session, {
    required final _i1.ColumnValueListBuilder<ObjectFieldScopesUpdateTable>
    columnValues,
    required final _i1.WhereExpressionBuilder<ObjectFieldScopesTable> where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<ObjectFieldScopesTable>? orderBy,
    final _i1.OrderByListBuilder<ObjectFieldScopesTable>? orderByList,
    final bool orderDescending = false,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ObjectFieldScopes>(
      columnValues: columnValues(ObjectFieldScopes.t.updateTable),
      where: where(ObjectFieldScopes.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ObjectFieldScopes.t),
      orderByList: orderByList?.call(ObjectFieldScopes.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ObjectFieldScopes]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ObjectFieldScopes>> delete(
    final _i1.Session session,
    final List<ObjectFieldScopes> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ObjectFieldScopes>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ObjectFieldScopes].
  Future<ObjectFieldScopes> deleteRow(
    final _i1.Session session,
    final ObjectFieldScopes row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ObjectFieldScopes>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ObjectFieldScopes>> deleteWhere(
    final _i1.Session session, {
    required final _i1.WhereExpressionBuilder<ObjectFieldScopesTable> where,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ObjectFieldScopes>(
      where: where(ObjectFieldScopes.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<ObjectFieldScopesTable>? where,
    final int? limit,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.count<ObjectFieldScopes>(
      where: where?.call(ObjectFieldScopes.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
