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

abstract class MultipleMaxFieldName
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  MultipleMaxFieldName._({
    this.id,
    required this.thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1,
    required this.thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2,
  }) : _relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId = null;

  factory MultipleMaxFieldName({
    final int? id,
    required final String
    thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1,
    required final String
    thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2,
  }) = _MultipleMaxFieldNameImpl;

  factory MultipleMaxFieldName.fromJson(
    final Map<String, dynamic> jsonSerialization,
  ) {
    return MultipleMaxFieldNameImplicit._(
      id: jsonSerialization['id'] as int?,
      thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1:
          jsonSerialization['thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1']
              as String,
      thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2:
          jsonSerialization['thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2']
              as String,
      $_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId:
          jsonSerialization['_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId']
              as int?,
    );
  }

  static final t = MultipleMaxFieldNameTable();

  static const db = MultipleMaxFieldNameRepository._();

  @override
  int? id;

  String thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1;

  String thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2;

  final int? _relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [MultipleMaxFieldName]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MultipleMaxFieldName copyWith({
    final int? id,
    final String? thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1,
    final String? thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1':
          thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1,
      'thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2':
          thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2,
      if (_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId !=
          null)
        '_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId':
            _relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1':
          thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1,
      'thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2':
          thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2,
    };
  }

  static MultipleMaxFieldNameInclude include() {
    return MultipleMaxFieldNameInclude._();
  }

  static MultipleMaxFieldNameIncludeList includeList({
    final _i1.WhereExpressionBuilder<MultipleMaxFieldNameTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<MultipleMaxFieldNameTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<MultipleMaxFieldNameTable>? orderByList,
    final MultipleMaxFieldNameInclude? include,
  }) {
    return MultipleMaxFieldNameIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MultipleMaxFieldName.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MultipleMaxFieldName.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MultipleMaxFieldNameImpl extends MultipleMaxFieldName {
  _MultipleMaxFieldNameImpl({
    final int? id,
    required final String
    thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1,
    required final String
    thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2,
  }) : super._(
         id: id,
         thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1:
             thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1,
         thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2:
             thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2,
       );

  /// Returns a shallow copy of this [MultipleMaxFieldName]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MultipleMaxFieldName copyWith({
    final Object? id = _Undefined,
    final String? thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1,
    final String? thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2,
  }) {
    return MultipleMaxFieldNameImplicit._(
      id: id is int? ? id : this.id,
      thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1:
          thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1 ??
          this.thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1,
      thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2:
          thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2 ??
          this.thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2,
      $_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId:
          _relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId,
    );
  }
}

class MultipleMaxFieldNameImplicit extends _MultipleMaxFieldNameImpl {
  MultipleMaxFieldNameImplicit._({
    final int? id,
    required final String
    thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1,
    required final String
    thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2,
    final int? $_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId,
  }) : _relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId =
           $_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId,
       super(
         id: id,
         thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1:
             thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1,
         thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2:
             thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2,
       );

  factory MultipleMaxFieldNameImplicit(
    final MultipleMaxFieldName multipleMaxFieldName, {
    final int? $_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId,
  }) {
    return MultipleMaxFieldNameImplicit._(
      id: multipleMaxFieldName.id,
      thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1:
          multipleMaxFieldName
              .thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1,
      thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2:
          multipleMaxFieldName
              .thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2,
      $_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId:
          $_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId,
    );
  }

  @override
  final int? _relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId;
}

class MultipleMaxFieldNameUpdateTable
    extends _i1.UpdateTable<MultipleMaxFieldNameTable> {
  MultipleMaxFieldNameUpdateTable(super.table);

  _i1.ColumnValue<String, String>
  thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1(final String value) =>
      _i1.ColumnValue(
        table.thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1,
        value,
      );

  _i1.ColumnValue<String, String>
  thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2(final String value) =>
      _i1.ColumnValue(
        table.thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2,
        value,
      );

  _i1.ColumnValue<int, int>
  $_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId(
    final int? value,
  ) => _i1.ColumnValue(
    table.$_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId,
    value,
  );
}

class MultipleMaxFieldNameTable extends _i1.Table<int?> {
  MultipleMaxFieldNameTable({super.tableRelation})
    : super(tableName: 'multiple_max_field_name') {
    updateTable = MultipleMaxFieldNameUpdateTable(this);
    thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1 =
        _i1.ColumnString(
          'thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1',
          this,
        );
    thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2 =
        _i1.ColumnString(
          'thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2',
          this,
        );
    $_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId =
        _i1.ColumnInt(
          '_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId',
          this,
        );
  }

  late final MultipleMaxFieldNameUpdateTable updateTable;

  late final _i1.ColumnString
  thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1;

  late final _i1.ColumnString
  thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2;

  late final _i1.ColumnInt
  $_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId;

  @override
  List<_i1.Column> get columns => [
    id,
    thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1,
    thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2,
    $_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId,
  ];

  @override
  List<_i1.Column> get managedColumns => [
    id,
    thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames1,
    thisFieldIsExactly61CharactersLongAndIsThereforeValidAsNames2,
  ];
}

class MultipleMaxFieldNameInclude extends _i1.IncludeObject {
  MultipleMaxFieldNameInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => MultipleMaxFieldName.t;
}

class MultipleMaxFieldNameIncludeList extends _i1.IncludeList {
  MultipleMaxFieldNameIncludeList._({
    final _i1.WhereExpressionBuilder<MultipleMaxFieldNameTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MultipleMaxFieldName.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MultipleMaxFieldName.t;
}

class MultipleMaxFieldNameRepository {
  const MultipleMaxFieldNameRepository._();

  /// Returns a list of [MultipleMaxFieldName]s matching the given query parameters.
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
  Future<List<MultipleMaxFieldName>> find(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<MultipleMaxFieldNameTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<MultipleMaxFieldNameTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<MultipleMaxFieldNameTable>? orderByList,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.find<MultipleMaxFieldName>(
      where: where?.call(MultipleMaxFieldName.t),
      orderBy: orderBy?.call(MultipleMaxFieldName.t),
      orderByList: orderByList?.call(MultipleMaxFieldName.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [MultipleMaxFieldName] matching the given query parameters.
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
  Future<MultipleMaxFieldName?> findFirstRow(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<MultipleMaxFieldNameTable>? where,
    final int? offset,
    final _i1.OrderByBuilder<MultipleMaxFieldNameTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<MultipleMaxFieldNameTable>? orderByList,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<MultipleMaxFieldName>(
      where: where?.call(MultipleMaxFieldName.t),
      orderBy: orderBy?.call(MultipleMaxFieldName.t),
      orderByList: orderByList?.call(MultipleMaxFieldName.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [MultipleMaxFieldName] by its [id] or null if no such row exists.
  Future<MultipleMaxFieldName?> findById(
    final _i1.Session session,
    final int id, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.findById<MultipleMaxFieldName>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [MultipleMaxFieldName]s in the list and returns the inserted rows.
  ///
  /// The returned [MultipleMaxFieldName]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MultipleMaxFieldName>> insert(
    final _i1.Session session,
    final List<MultipleMaxFieldName> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MultipleMaxFieldName>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MultipleMaxFieldName] and returns the inserted row.
  ///
  /// The returned [MultipleMaxFieldName] will have its `id` field set.
  Future<MultipleMaxFieldName> insertRow(
    final _i1.Session session,
    final MultipleMaxFieldName row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MultipleMaxFieldName>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MultipleMaxFieldName]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MultipleMaxFieldName>> update(
    final _i1.Session session,
    final List<MultipleMaxFieldName> rows, {
    final _i1.ColumnSelections<MultipleMaxFieldNameTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.update<MultipleMaxFieldName>(
      rows,
      columns: columns?.call(MultipleMaxFieldName.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MultipleMaxFieldName]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MultipleMaxFieldName> updateRow(
    final _i1.Session session,
    final MultipleMaxFieldName row, {
    final _i1.ColumnSelections<MultipleMaxFieldNameTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MultipleMaxFieldName>(
      row,
      columns: columns?.call(MultipleMaxFieldName.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MultipleMaxFieldName] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MultipleMaxFieldName?> updateById(
    final _i1.Session session,
    final int id, {
    required final _i1.ColumnValueListBuilder<MultipleMaxFieldNameUpdateTable>
    columnValues,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MultipleMaxFieldName>(
      id,
      columnValues: columnValues(MultipleMaxFieldName.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MultipleMaxFieldName]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MultipleMaxFieldName>> updateWhere(
    final _i1.Session session, {
    required final _i1.ColumnValueListBuilder<MultipleMaxFieldNameUpdateTable>
    columnValues,
    required final _i1.WhereExpressionBuilder<MultipleMaxFieldNameTable> where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<MultipleMaxFieldNameTable>? orderBy,
    final _i1.OrderByListBuilder<MultipleMaxFieldNameTable>? orderByList,
    final bool orderDescending = false,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MultipleMaxFieldName>(
      columnValues: columnValues(MultipleMaxFieldName.t.updateTable),
      where: where(MultipleMaxFieldName.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MultipleMaxFieldName.t),
      orderByList: orderByList?.call(MultipleMaxFieldName.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MultipleMaxFieldName]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MultipleMaxFieldName>> delete(
    final _i1.Session session,
    final List<MultipleMaxFieldName> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MultipleMaxFieldName>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MultipleMaxFieldName].
  Future<MultipleMaxFieldName> deleteRow(
    final _i1.Session session,
    final MultipleMaxFieldName row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MultipleMaxFieldName>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MultipleMaxFieldName>> deleteWhere(
    final _i1.Session session, {
    required final _i1.WhereExpressionBuilder<MultipleMaxFieldNameTable> where,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MultipleMaxFieldName>(
      where: where(MultipleMaxFieldName.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<MultipleMaxFieldNameTable>? where,
    final int? limit,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.count<MultipleMaxFieldName>(
      where: where?.call(MultipleMaxFieldName.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
