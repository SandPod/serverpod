/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../long_identifiers/multiple_max_field_name.dart' as _i2;

abstract class RelationToMultipleMaxFieldName
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  RelationToMultipleMaxFieldName._({
    this.id,
    required this.name,
    this.multipleMaxFieldNames,
  });

  factory RelationToMultipleMaxFieldName({
    final int? id,
    required final String name,
    final List<_i2.MultipleMaxFieldName>? multipleMaxFieldNames,
  }) = _RelationToMultipleMaxFieldNameImpl;

  factory RelationToMultipleMaxFieldName.fromJson(
    final Map<String, dynamic> jsonSerialization,
  ) {
    return RelationToMultipleMaxFieldName(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      multipleMaxFieldNames:
          (jsonSerialization['multipleMaxFieldNames'] as List?)
              ?.map(
                (final e) => _i2.MultipleMaxFieldName.fromJson(
                  (e as Map<String, dynamic>),
                ),
              )
              .toList(),
    );
  }

  static final t = RelationToMultipleMaxFieldNameTable();

  static const db = RelationToMultipleMaxFieldNameRepository._();

  @override
  int? id;

  String name;

  List<_i2.MultipleMaxFieldName>? multipleMaxFieldNames;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [RelationToMultipleMaxFieldName]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RelationToMultipleMaxFieldName copyWith({
    final int? id,
    final String? name,
    final List<_i2.MultipleMaxFieldName>? multipleMaxFieldNames,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (multipleMaxFieldNames != null)
        'multipleMaxFieldNames': multipleMaxFieldNames?.toJson(
          valueToJson: (final v) => v.toJson(),
        ),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (multipleMaxFieldNames != null)
        'multipleMaxFieldNames': multipleMaxFieldNames?.toJson(
          valueToJson: (final v) => v.toJsonForProtocol(),
        ),
    };
  }

  static RelationToMultipleMaxFieldNameInclude include({
    final _i2.MultipleMaxFieldNameIncludeList? multipleMaxFieldNames,
  }) {
    return RelationToMultipleMaxFieldNameInclude._(
      multipleMaxFieldNames: multipleMaxFieldNames,
    );
  }

  static RelationToMultipleMaxFieldNameIncludeList includeList({
    final _i1.WhereExpressionBuilder<RelationToMultipleMaxFieldNameTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<RelationToMultipleMaxFieldNameTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<RelationToMultipleMaxFieldNameTable>? orderByList,
    final RelationToMultipleMaxFieldNameInclude? include,
  }) {
    return RelationToMultipleMaxFieldNameIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RelationToMultipleMaxFieldName.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RelationToMultipleMaxFieldName.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RelationToMultipleMaxFieldNameImpl
    extends RelationToMultipleMaxFieldName {
  _RelationToMultipleMaxFieldNameImpl({
    final int? id,
    required final String name,
    final List<_i2.MultipleMaxFieldName>? multipleMaxFieldNames,
  }) : super._(
         id: id,
         name: name,
         multipleMaxFieldNames: multipleMaxFieldNames,
       );

  /// Returns a shallow copy of this [RelationToMultipleMaxFieldName]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RelationToMultipleMaxFieldName copyWith({
    final Object? id = _Undefined,
    final String? name,
    final Object? multipleMaxFieldNames = _Undefined,
  }) {
    return RelationToMultipleMaxFieldName(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      multipleMaxFieldNames:
          multipleMaxFieldNames is List<_i2.MultipleMaxFieldName>?
          ? multipleMaxFieldNames
          : this.multipleMaxFieldNames?.map((final e0) => e0.copyWith()).toList(),
    );
  }
}

class RelationToMultipleMaxFieldNameUpdateTable
    extends _i1.UpdateTable<RelationToMultipleMaxFieldNameTable> {
  RelationToMultipleMaxFieldNameUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(final String value) => _i1.ColumnValue(
    table.name,
    value,
  );
}

class RelationToMultipleMaxFieldNameTable extends _i1.Table<int?> {
  RelationToMultipleMaxFieldNameTable({super.tableRelation})
    : super(tableName: 'relation_to_multiple_max_field_name') {
    updateTable = RelationToMultipleMaxFieldNameUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
  }

  late final RelationToMultipleMaxFieldNameUpdateTable updateTable;

  late final _i1.ColumnString name;

  _i2.MultipleMaxFieldNameTable? ___multipleMaxFieldNames;

  _i1.ManyRelation<_i2.MultipleMaxFieldNameTable>? _multipleMaxFieldNames;

  _i2.MultipleMaxFieldNameTable get __multipleMaxFieldNames {
    if (___multipleMaxFieldNames != null) return ___multipleMaxFieldNames!;
    ___multipleMaxFieldNames = _i1.createRelationTable(
      relationFieldName: '__multipleMaxFieldNames',
      field: RelationToMultipleMaxFieldName.t.id,
      foreignField: _i2
          .MultipleMaxFieldName
          .t
          .$_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i2.MultipleMaxFieldNameTable(tableRelation: foreignTableRelation),
    );
    return ___multipleMaxFieldNames!;
  }

  _i1.ManyRelation<_i2.MultipleMaxFieldNameTable> get multipleMaxFieldNames {
    if (_multipleMaxFieldNames != null) return _multipleMaxFieldNames!;
    final relationTable = _i1.createRelationTable(
      relationFieldName: 'multipleMaxFieldNames',
      field: RelationToMultipleMaxFieldName.t.id,
      foreignField: _i2
          .MultipleMaxFieldName
          .t
          .$_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i2.MultipleMaxFieldNameTable(tableRelation: foreignTableRelation),
    );
    _multipleMaxFieldNames = _i1.ManyRelation<_i2.MultipleMaxFieldNameTable>(
      tableWithRelations: relationTable,
      table: _i2.MultipleMaxFieldNameTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _multipleMaxFieldNames!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    name,
  ];

  @override
  _i1.Table? getRelationTable(final String relationField) {
    if (relationField == 'multipleMaxFieldNames') {
      return __multipleMaxFieldNames;
    }
    return null;
  }
}

class RelationToMultipleMaxFieldNameInclude extends _i1.IncludeObject {
  RelationToMultipleMaxFieldNameInclude._({
    final _i2.MultipleMaxFieldNameIncludeList? multipleMaxFieldNames,
  }) {
    _multipleMaxFieldNames = multipleMaxFieldNames;
  }

  _i2.MultipleMaxFieldNameIncludeList? _multipleMaxFieldNames;

  @override
  Map<String, _i1.Include?> get includes => {
    'multipleMaxFieldNames': _multipleMaxFieldNames,
  };

  @override
  _i1.Table<int?> get table => RelationToMultipleMaxFieldName.t;
}

class RelationToMultipleMaxFieldNameIncludeList extends _i1.IncludeList {
  RelationToMultipleMaxFieldNameIncludeList._({
    final _i1.WhereExpressionBuilder<RelationToMultipleMaxFieldNameTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RelationToMultipleMaxFieldName.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => RelationToMultipleMaxFieldName.t;
}

class RelationToMultipleMaxFieldNameRepository {
  const RelationToMultipleMaxFieldNameRepository._();

  final attach = const RelationToMultipleMaxFieldNameAttachRepository._();

  final attachRow = const RelationToMultipleMaxFieldNameAttachRowRepository._();

  final detach = const RelationToMultipleMaxFieldNameDetachRepository._();

  final detachRow = const RelationToMultipleMaxFieldNameDetachRowRepository._();

  /// Returns a list of [RelationToMultipleMaxFieldName]s matching the given query parameters.
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
  Future<List<RelationToMultipleMaxFieldName>> find(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<RelationToMultipleMaxFieldNameTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<RelationToMultipleMaxFieldNameTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<RelationToMultipleMaxFieldNameTable>? orderByList,
    final _i1.Transaction? transaction,
    final RelationToMultipleMaxFieldNameInclude? include,
  }) async {
    return session.db.find<RelationToMultipleMaxFieldName>(
      where: where?.call(RelationToMultipleMaxFieldName.t),
      orderBy: orderBy?.call(RelationToMultipleMaxFieldName.t),
      orderByList: orderByList?.call(RelationToMultipleMaxFieldName.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [RelationToMultipleMaxFieldName] matching the given query parameters.
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
  Future<RelationToMultipleMaxFieldName?> findFirstRow(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<RelationToMultipleMaxFieldNameTable>? where,
    final int? offset,
    final _i1.OrderByBuilder<RelationToMultipleMaxFieldNameTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<RelationToMultipleMaxFieldNameTable>? orderByList,
    final _i1.Transaction? transaction,
    final RelationToMultipleMaxFieldNameInclude? include,
  }) async {
    return session.db.findFirstRow<RelationToMultipleMaxFieldName>(
      where: where?.call(RelationToMultipleMaxFieldName.t),
      orderBy: orderBy?.call(RelationToMultipleMaxFieldName.t),
      orderByList: orderByList?.call(RelationToMultipleMaxFieldName.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [RelationToMultipleMaxFieldName] by its [id] or null if no such row exists.
  Future<RelationToMultipleMaxFieldName?> findById(
    final _i1.Session session,
    final int id, {
    final _i1.Transaction? transaction,
    final RelationToMultipleMaxFieldNameInclude? include,
  }) async {
    return session.db.findById<RelationToMultipleMaxFieldName>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [RelationToMultipleMaxFieldName]s in the list and returns the inserted rows.
  ///
  /// The returned [RelationToMultipleMaxFieldName]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<RelationToMultipleMaxFieldName>> insert(
    final _i1.Session session,
    final List<RelationToMultipleMaxFieldName> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insert<RelationToMultipleMaxFieldName>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [RelationToMultipleMaxFieldName] and returns the inserted row.
  ///
  /// The returned [RelationToMultipleMaxFieldName] will have its `id` field set.
  Future<RelationToMultipleMaxFieldName> insertRow(
    final _i1.Session session,
    final RelationToMultipleMaxFieldName row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RelationToMultipleMaxFieldName>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RelationToMultipleMaxFieldName]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RelationToMultipleMaxFieldName>> update(
    final _i1.Session session,
    final List<RelationToMultipleMaxFieldName> rows, {
    final _i1.ColumnSelections<RelationToMultipleMaxFieldNameTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.update<RelationToMultipleMaxFieldName>(
      rows,
      columns: columns?.call(RelationToMultipleMaxFieldName.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RelationToMultipleMaxFieldName]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RelationToMultipleMaxFieldName> updateRow(
    final _i1.Session session,
    final RelationToMultipleMaxFieldName row, {
    final _i1.ColumnSelections<RelationToMultipleMaxFieldNameTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RelationToMultipleMaxFieldName>(
      row,
      columns: columns?.call(RelationToMultipleMaxFieldName.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RelationToMultipleMaxFieldName] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RelationToMultipleMaxFieldName?> updateById(
    final _i1.Session session,
    final int id, {
    required final _i1.ColumnValueListBuilder<
      RelationToMultipleMaxFieldNameUpdateTable
    >
    columnValues,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<RelationToMultipleMaxFieldName>(
      id,
      columnValues: columnValues(RelationToMultipleMaxFieldName.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RelationToMultipleMaxFieldName]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<RelationToMultipleMaxFieldName>> updateWhere(
    final _i1.Session session, {
    required final _i1.ColumnValueListBuilder<
      RelationToMultipleMaxFieldNameUpdateTable
    >
    columnValues,
    required final _i1.WhereExpressionBuilder<RelationToMultipleMaxFieldNameTable>
    where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<RelationToMultipleMaxFieldNameTable>? orderBy,
    final _i1.OrderByListBuilder<RelationToMultipleMaxFieldNameTable>? orderByList,
    final bool orderDescending = false,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<RelationToMultipleMaxFieldName>(
      columnValues: columnValues(RelationToMultipleMaxFieldName.t.updateTable),
      where: where(RelationToMultipleMaxFieldName.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RelationToMultipleMaxFieldName.t),
      orderByList: orderByList?.call(RelationToMultipleMaxFieldName.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [RelationToMultipleMaxFieldName]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RelationToMultipleMaxFieldName>> delete(
    final _i1.Session session,
    final List<RelationToMultipleMaxFieldName> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RelationToMultipleMaxFieldName>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RelationToMultipleMaxFieldName].
  Future<RelationToMultipleMaxFieldName> deleteRow(
    final _i1.Session session,
    final RelationToMultipleMaxFieldName row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RelationToMultipleMaxFieldName>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RelationToMultipleMaxFieldName>> deleteWhere(
    final _i1.Session session, {
    required final _i1.WhereExpressionBuilder<RelationToMultipleMaxFieldNameTable>
    where,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RelationToMultipleMaxFieldName>(
      where: where(RelationToMultipleMaxFieldName.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<RelationToMultipleMaxFieldNameTable>? where,
    final int? limit,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.count<RelationToMultipleMaxFieldName>(
      where: where?.call(RelationToMultipleMaxFieldName.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class RelationToMultipleMaxFieldNameAttachRepository {
  const RelationToMultipleMaxFieldNameAttachRepository._();

  /// Creates a relation between this [RelationToMultipleMaxFieldName] and the given [MultipleMaxFieldName]s
  /// by setting each [MultipleMaxFieldName]'s foreign key `_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId` to refer to this [RelationToMultipleMaxFieldName].
  Future<void> multipleMaxFieldNames(
    final _i1.Session session,
    final RelationToMultipleMaxFieldName relationToMultipleMaxFieldName,
    final List<_i2.MultipleMaxFieldName> multipleMaxFieldName, {
    final _i1.Transaction? transaction,
  }) async {
    if (multipleMaxFieldName.any((final e) => e.id == null)) {
      throw ArgumentError.notNull('multipleMaxFieldName.id');
    }
    if (relationToMultipleMaxFieldName.id == null) {
      throw ArgumentError.notNull('relationToMultipleMaxFieldName.id');
    }

    final $multipleMaxFieldName = multipleMaxFieldName
        .map(
          (final e) => _i2.MultipleMaxFieldNameImplicit(
            e,
            $_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId:
                relationToMultipleMaxFieldName.id,
          ),
        )
        .toList();
    await session.db.update<_i2.MultipleMaxFieldName>(
      $multipleMaxFieldName,
      columns: [
        _i2
            .MultipleMaxFieldName
            .t
            .$_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId,
      ],
      transaction: transaction,
    );
  }
}

class RelationToMultipleMaxFieldNameAttachRowRepository {
  const RelationToMultipleMaxFieldNameAttachRowRepository._();

  /// Creates a relation between this [RelationToMultipleMaxFieldName] and the given [MultipleMaxFieldName]
  /// by setting the [MultipleMaxFieldName]'s foreign key `_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId` to refer to this [RelationToMultipleMaxFieldName].
  Future<void> multipleMaxFieldNames(
    final _i1.Session session,
    final RelationToMultipleMaxFieldName relationToMultipleMaxFieldName,
    final _i2.MultipleMaxFieldName multipleMaxFieldName, {
    final _i1.Transaction? transaction,
  }) async {
    if (multipleMaxFieldName.id == null) {
      throw ArgumentError.notNull('multipleMaxFieldName.id');
    }
    if (relationToMultipleMaxFieldName.id == null) {
      throw ArgumentError.notNull('relationToMultipleMaxFieldName.id');
    }

    final $multipleMaxFieldName = _i2.MultipleMaxFieldNameImplicit(
      multipleMaxFieldName,
      $_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId:
          relationToMultipleMaxFieldName.id,
    );
    await session.db.updateRow<_i2.MultipleMaxFieldName>(
      $multipleMaxFieldName,
      columns: [
        _i2
            .MultipleMaxFieldName
            .t
            .$_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId,
      ],
      transaction: transaction,
    );
  }
}

class RelationToMultipleMaxFieldNameDetachRepository {
  const RelationToMultipleMaxFieldNameDetachRepository._();

  /// Detaches the relation between this [RelationToMultipleMaxFieldName] and the given [MultipleMaxFieldName]
  /// by setting the [MultipleMaxFieldName]'s foreign key `_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> multipleMaxFieldNames(
    final _i1.Session session,
    final List<_i2.MultipleMaxFieldName> multipleMaxFieldName, {
    final _i1.Transaction? transaction,
  }) async {
    if (multipleMaxFieldName.any((final e) => e.id == null)) {
      throw ArgumentError.notNull('multipleMaxFieldName.id');
    }

    final $multipleMaxFieldName = multipleMaxFieldName
        .map(
          (final e) => _i2.MultipleMaxFieldNameImplicit(
            e,
            $_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId:
                null,
          ),
        )
        .toList();
    await session.db.update<_i2.MultipleMaxFieldName>(
      $multipleMaxFieldName,
      columns: [
        _i2
            .MultipleMaxFieldName
            .t
            .$_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId,
      ],
      transaction: transaction,
    );
  }
}

class RelationToMultipleMaxFieldNameDetachRowRepository {
  const RelationToMultipleMaxFieldNameDetachRowRepository._();

  /// Detaches the relation between this [RelationToMultipleMaxFieldName] and the given [MultipleMaxFieldName]
  /// by setting the [MultipleMaxFieldName]'s foreign key `_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> multipleMaxFieldNames(
    final _i1.Session session,
    final _i2.MultipleMaxFieldName multipleMaxFieldName, {
    final _i1.Transaction? transaction,
  }) async {
    if (multipleMaxFieldName.id == null) {
      throw ArgumentError.notNull('multipleMaxFieldName.id');
    }

    final $multipleMaxFieldName = _i2.MultipleMaxFieldNameImplicit(
      multipleMaxFieldName,
      $_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId: null,
    );
    await session.db.updateRow<_i2.MultipleMaxFieldName>(
      $multipleMaxFieldName,
      columns: [
        _i2
            .MultipleMaxFieldName
            .t
            .$_relationToMultipleMaxFieldNameMultiplemaxfieldnamesRelat674eId,
      ],
      transaction: transaction,
    );
  }
}
