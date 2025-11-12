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
import '../../../models_with_relations/self_relation/one_to_many/cat.dart'
    as _i2;

abstract class Cat implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Cat._({
    this.id,
    required this.name,
    this.motherId,
    this.mother,
    this.kittens,
  });

  factory Cat({
    final int? id,
    required final String name,
    final int? motherId,
    final _i2.Cat? mother,
    final List<_i2.Cat>? kittens,
  }) = _CatImpl;

  factory Cat.fromJson(final Map<String, dynamic> jsonSerialization) {
    return Cat(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      motherId: jsonSerialization['motherId'] as int?,
      mother: jsonSerialization['mother'] == null
          ? null
          : _i2.Cat.fromJson(
              (jsonSerialization['mother'] as Map<String, dynamic>),
            ),
      kittens: (jsonSerialization['kittens'] as List?)
          ?.map((final e) => _i2.Cat.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = CatTable();

  static const db = CatRepository._();

  @override
  int? id;

  String name;

  int? motherId;

  _i2.Cat? mother;

  List<_i2.Cat>? kittens;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Cat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Cat copyWith({
    final int? id,
    final String? name,
    final int? motherId,
    final _i2.Cat? mother,
    final List<_i2.Cat>? kittens,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (motherId != null) 'motherId': motherId,
      if (mother != null) 'mother': mother?.toJson(),
      if (kittens != null)
        'kittens': kittens?.toJson(valueToJson: (final v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (motherId != null) 'motherId': motherId,
      if (mother != null) 'mother': mother?.toJsonForProtocol(),
      if (kittens != null)
        'kittens': kittens?.toJson(valueToJson: (final v) => v.toJsonForProtocol()),
    };
  }

  static CatInclude include({
    final _i2.CatInclude? mother,
    final _i2.CatIncludeList? kittens,
  }) {
    return CatInclude._(
      mother: mother,
      kittens: kittens,
    );
  }

  static CatIncludeList includeList({
    final _i1.WhereExpressionBuilder<CatTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<CatTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<CatTable>? orderByList,
    final CatInclude? include,
  }) {
    return CatIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Cat.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Cat.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CatImpl extends Cat {
  _CatImpl({
    final int? id,
    required final String name,
    final int? motherId,
    final _i2.Cat? mother,
    final List<_i2.Cat>? kittens,
  }) : super._(
         id: id,
         name: name,
         motherId: motherId,
         mother: mother,
         kittens: kittens,
       );

  /// Returns a shallow copy of this [Cat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Cat copyWith({
    final Object? id = _Undefined,
    final String? name,
    final Object? motherId = _Undefined,
    final Object? mother = _Undefined,
    final Object? kittens = _Undefined,
  }) {
    return Cat(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      motherId: motherId is int? ? motherId : this.motherId,
      mother: mother is _i2.Cat? ? mother : this.mother?.copyWith(),
      kittens: kittens is List<_i2.Cat>?
          ? kittens
          : this.kittens?.map((final e0) => e0.copyWith()).toList(),
    );
  }
}

class CatUpdateTable extends _i1.UpdateTable<CatTable> {
  CatUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(final String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<int, int> motherId(final int? value) => _i1.ColumnValue(
    table.motherId,
    value,
  );
}

class CatTable extends _i1.Table<int?> {
  CatTable({super.tableRelation}) : super(tableName: 'cat') {
    updateTable = CatUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    motherId = _i1.ColumnInt(
      'motherId',
      this,
    );
  }

  late final CatUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnInt motherId;

  _i2.CatTable? _mother;

  _i2.CatTable? ___kittens;

  _i1.ManyRelation<_i2.CatTable>? _kittens;

  _i2.CatTable get mother {
    if (_mother != null) return _mother!;
    _mother = _i1.createRelationTable(
      relationFieldName: 'mother',
      field: Cat.t.motherId,
      foreignField: _i2.Cat.t.id,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i2.CatTable(tableRelation: foreignTableRelation),
    );
    return _mother!;
  }

  _i2.CatTable get __kittens {
    if (___kittens != null) return ___kittens!;
    ___kittens = _i1.createRelationTable(
      relationFieldName: '__kittens',
      field: Cat.t.id,
      foreignField: _i2.Cat.t.motherId,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i2.CatTable(tableRelation: foreignTableRelation),
    );
    return ___kittens!;
  }

  _i1.ManyRelation<_i2.CatTable> get kittens {
    if (_kittens != null) return _kittens!;
    final relationTable = _i1.createRelationTable(
      relationFieldName: 'kittens',
      field: Cat.t.id,
      foreignField: _i2.Cat.t.motherId,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i2.CatTable(tableRelation: foreignTableRelation),
    );
    _kittens = _i1.ManyRelation<_i2.CatTable>(
      tableWithRelations: relationTable,
      table: _i2.CatTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _kittens!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    motherId,
  ];

  @override
  _i1.Table? getRelationTable(final String relationField) {
    if (relationField == 'mother') {
      return mother;
    }
    if (relationField == 'kittens') {
      return __kittens;
    }
    return null;
  }
}

class CatInclude extends _i1.IncludeObject {
  CatInclude._({
    final _i2.CatInclude? mother,
    final _i2.CatIncludeList? kittens,
  }) {
    _mother = mother;
    _kittens = kittens;
  }

  _i2.CatInclude? _mother;

  _i2.CatIncludeList? _kittens;

  @override
  Map<String, _i1.Include?> get includes => {
    'mother': _mother,
    'kittens': _kittens,
  };

  @override
  _i1.Table<int?> get table => Cat.t;
}

class CatIncludeList extends _i1.IncludeList {
  CatIncludeList._({
    final _i1.WhereExpressionBuilder<CatTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Cat.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Cat.t;
}

class CatRepository {
  const CatRepository._();

  final attach = const CatAttachRepository._();

  final attachRow = const CatAttachRowRepository._();

  final detach = const CatDetachRepository._();

  final detachRow = const CatDetachRowRepository._();

  /// Returns a list of [Cat]s matching the given query parameters.
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
  Future<List<Cat>> find(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<CatTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<CatTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<CatTable>? orderByList,
    final _i1.Transaction? transaction,
    final CatInclude? include,
  }) async {
    return session.db.find<Cat>(
      where: where?.call(Cat.t),
      orderBy: orderBy?.call(Cat.t),
      orderByList: orderByList?.call(Cat.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Cat] matching the given query parameters.
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
  Future<Cat?> findFirstRow(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<CatTable>? where,
    final int? offset,
    final _i1.OrderByBuilder<CatTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<CatTable>? orderByList,
    final _i1.Transaction? transaction,
    final CatInclude? include,
  }) async {
    return session.db.findFirstRow<Cat>(
      where: where?.call(Cat.t),
      orderBy: orderBy?.call(Cat.t),
      orderByList: orderByList?.call(Cat.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Cat] by its [id] or null if no such row exists.
  Future<Cat?> findById(
    final _i1.Session session,
    final int id, {
    final _i1.Transaction? transaction,
    final CatInclude? include,
  }) async {
    return session.db.findById<Cat>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Cat]s in the list and returns the inserted rows.
  ///
  /// The returned [Cat]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Cat>> insert(
    final _i1.Session session,
    final List<Cat> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Cat>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Cat] and returns the inserted row.
  ///
  /// The returned [Cat] will have its `id` field set.
  Future<Cat> insertRow(
    final _i1.Session session,
    final Cat row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Cat>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Cat]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Cat>> update(
    final _i1.Session session,
    final List<Cat> rows, {
    final _i1.ColumnSelections<CatTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.update<Cat>(
      rows,
      columns: columns?.call(Cat.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Cat]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Cat> updateRow(
    final _i1.Session session,
    final Cat row, {
    final _i1.ColumnSelections<CatTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Cat>(
      row,
      columns: columns?.call(Cat.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Cat] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Cat?> updateById(
    final _i1.Session session,
    final int id, {
    required final _i1.ColumnValueListBuilder<CatUpdateTable> columnValues,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Cat>(
      id,
      columnValues: columnValues(Cat.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Cat]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Cat>> updateWhere(
    final _i1.Session session, {
    required final _i1.ColumnValueListBuilder<CatUpdateTable> columnValues,
    required final _i1.WhereExpressionBuilder<CatTable> where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<CatTable>? orderBy,
    final _i1.OrderByListBuilder<CatTable>? orderByList,
    final bool orderDescending = false,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Cat>(
      columnValues: columnValues(Cat.t.updateTable),
      where: where(Cat.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Cat.t),
      orderByList: orderByList?.call(Cat.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Cat]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Cat>> delete(
    final _i1.Session session,
    final List<Cat> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Cat>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Cat].
  Future<Cat> deleteRow(
    final _i1.Session session,
    final Cat row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Cat>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Cat>> deleteWhere(
    final _i1.Session session, {
    required final _i1.WhereExpressionBuilder<CatTable> where,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Cat>(
      where: where(Cat.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<CatTable>? where,
    final int? limit,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.count<Cat>(
      where: where?.call(Cat.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CatAttachRepository {
  const CatAttachRepository._();

  /// Creates a relation between this [Cat] and the given [Cat]s
  /// by setting each [Cat]'s foreign key `motherId` to refer to this [Cat].
  Future<void> kittens(
    final _i1.Session session,
    final Cat cat,
    final List<_i2.Cat> nestedCat, {
    final _i1.Transaction? transaction,
  }) async {
    if (nestedCat.any((final e) => e.id == null)) {
      throw ArgumentError.notNull('nestedCat.id');
    }
    if (cat.id == null) {
      throw ArgumentError.notNull('cat.id');
    }

    final $nestedCat = nestedCat
        .map((final e) => e.copyWith(motherId: cat.id))
        .toList();
    await session.db.update<_i2.Cat>(
      $nestedCat,
      columns: [_i2.Cat.t.motherId],
      transaction: transaction,
    );
  }
}

class CatAttachRowRepository {
  const CatAttachRowRepository._();

  /// Creates a relation between the given [Cat] and [Cat]
  /// by setting the [Cat]'s foreign key `motherId` to refer to the [Cat].
  Future<void> mother(
    final _i1.Session session,
    final Cat cat,
    final _i2.Cat mother, {
    final _i1.Transaction? transaction,
  }) async {
    if (cat.id == null) {
      throw ArgumentError.notNull('cat.id');
    }
    if (mother.id == null) {
      throw ArgumentError.notNull('mother.id');
    }

    final $cat = cat.copyWith(motherId: mother.id);
    await session.db.updateRow<Cat>(
      $cat,
      columns: [Cat.t.motherId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Cat] and the given [Cat]
  /// by setting the [Cat]'s foreign key `motherId` to refer to this [Cat].
  Future<void> kittens(
    final _i1.Session session,
    final Cat cat,
    final _i2.Cat nestedCat, {
    final _i1.Transaction? transaction,
  }) async {
    if (nestedCat.id == null) {
      throw ArgumentError.notNull('nestedCat.id');
    }
    if (cat.id == null) {
      throw ArgumentError.notNull('cat.id');
    }

    final $nestedCat = nestedCat.copyWith(motherId: cat.id);
    await session.db.updateRow<_i2.Cat>(
      $nestedCat,
      columns: [_i2.Cat.t.motherId],
      transaction: transaction,
    );
  }
}

class CatDetachRepository {
  const CatDetachRepository._();

  /// Detaches the relation between this [Cat] and the given [Cat]
  /// by setting the [Cat]'s foreign key `motherId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> kittens(
    final _i1.Session session,
    final List<_i2.Cat> cat, {
    final _i1.Transaction? transaction,
  }) async {
    if (cat.any((final e) => e.id == null)) {
      throw ArgumentError.notNull('cat.id');
    }

    final $cat = cat.map((final e) => e.copyWith(motherId: null)).toList();
    await session.db.update<_i2.Cat>(
      $cat,
      columns: [_i2.Cat.t.motherId],
      transaction: transaction,
    );
  }
}

class CatDetachRowRepository {
  const CatDetachRowRepository._();

  /// Detaches the relation between this [Cat] and the [Cat] set in `mother`
  /// by setting the [Cat]'s foreign key `motherId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> mother(
    final _i1.Session session,
    final Cat cat, {
    final _i1.Transaction? transaction,
  }) async {
    if (cat.id == null) {
      throw ArgumentError.notNull('cat.id');
    }

    final $cat = cat.copyWith(motherId: null);
    await session.db.updateRow<Cat>(
      $cat,
      columns: [Cat.t.motherId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Cat] and the given [Cat]
  /// by setting the [Cat]'s foreign key `motherId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> kittens(
    final _i1.Session session,
    final _i2.Cat cat, {
    final _i1.Transaction? transaction,
  }) async {
    if (cat.id == null) {
      throw ArgumentError.notNull('cat.id');
    }

    final $cat = cat.copyWith(motherId: null);
    await session.db.updateRow<_i2.Cat>(
      $cat,
      columns: [_i2.Cat.t.motherId],
      transaction: transaction,
    );
  }
}
