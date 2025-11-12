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
import '../../../models_with_relations/self_relation/many_to_many/blocking.dart'
    as _i2;

abstract class Member implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Member._({
    this.id,
    required this.name,
    this.blocking,
    this.blockedBy,
  });

  factory Member({
    final int? id,
    required final String name,
    final List<_i2.Blocking>? blocking,
    final List<_i2.Blocking>? blockedBy,
  }) = _MemberImpl;

  factory Member.fromJson(final Map<String, dynamic> jsonSerialization) {
    return Member(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      blocking: (jsonSerialization['blocking'] as List?)
          ?.map((final e) => _i2.Blocking.fromJson((e as Map<String, dynamic>)))
          .toList(),
      blockedBy: (jsonSerialization['blockedBy'] as List?)
          ?.map((final e) => _i2.Blocking.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = MemberTable();

  static const db = MemberRepository._();

  @override
  int? id;

  String name;

  List<_i2.Blocking>? blocking;

  List<_i2.Blocking>? blockedBy;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Member]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Member copyWith({
    final int? id,
    final String? name,
    final List<_i2.Blocking>? blocking,
    final List<_i2.Blocking>? blockedBy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (blocking != null)
        'blocking': blocking?.toJson(valueToJson: (final v) => v.toJson()),
      if (blockedBy != null)
        'blockedBy': blockedBy?.toJson(valueToJson: (final v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (blocking != null)
        'blocking': blocking?.toJson(valueToJson: (final v) => v.toJsonForProtocol()),
      if (blockedBy != null)
        'blockedBy': blockedBy?.toJson(
          valueToJson: (final v) => v.toJsonForProtocol(),
        ),
    };
  }

  static MemberInclude include({
    final _i2.BlockingIncludeList? blocking,
    final _i2.BlockingIncludeList? blockedBy,
  }) {
    return MemberInclude._(
      blocking: blocking,
      blockedBy: blockedBy,
    );
  }

  static MemberIncludeList includeList({
    final _i1.WhereExpressionBuilder<MemberTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<MemberTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<MemberTable>? orderByList,
    final MemberInclude? include,
  }) {
    return MemberIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Member.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Member.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MemberImpl extends Member {
  _MemberImpl({
    final int? id,
    required final String name,
    final List<_i2.Blocking>? blocking,
    final List<_i2.Blocking>? blockedBy,
  }) : super._(
         id: id,
         name: name,
         blocking: blocking,
         blockedBy: blockedBy,
       );

  /// Returns a shallow copy of this [Member]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Member copyWith({
    final Object? id = _Undefined,
    final String? name,
    final Object? blocking = _Undefined,
    final Object? blockedBy = _Undefined,
  }) {
    return Member(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      blocking: blocking is List<_i2.Blocking>?
          ? blocking
          : this.blocking?.map((final e0) => e0.copyWith()).toList(),
      blockedBy: blockedBy is List<_i2.Blocking>?
          ? blockedBy
          : this.blockedBy?.map((final e0) => e0.copyWith()).toList(),
    );
  }
}

class MemberUpdateTable extends _i1.UpdateTable<MemberTable> {
  MemberUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(final String value) => _i1.ColumnValue(
    table.name,
    value,
  );
}

class MemberTable extends _i1.Table<int?> {
  MemberTable({super.tableRelation}) : super(tableName: 'member') {
    updateTable = MemberUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
  }

  late final MemberUpdateTable updateTable;

  late final _i1.ColumnString name;

  _i2.BlockingTable? ___blocking;

  _i1.ManyRelation<_i2.BlockingTable>? _blocking;

  _i2.BlockingTable? ___blockedBy;

  _i1.ManyRelation<_i2.BlockingTable>? _blockedBy;

  _i2.BlockingTable get __blocking {
    if (___blocking != null) return ___blocking!;
    ___blocking = _i1.createRelationTable(
      relationFieldName: '__blocking',
      field: Member.t.id,
      foreignField: _i2.Blocking.t.blockedById,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i2.BlockingTable(tableRelation: foreignTableRelation),
    );
    return ___blocking!;
  }

  _i2.BlockingTable get __blockedBy {
    if (___blockedBy != null) return ___blockedBy!;
    ___blockedBy = _i1.createRelationTable(
      relationFieldName: '__blockedBy',
      field: Member.t.id,
      foreignField: _i2.Blocking.t.blockedId,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i2.BlockingTable(tableRelation: foreignTableRelation),
    );
    return ___blockedBy!;
  }

  _i1.ManyRelation<_i2.BlockingTable> get blocking {
    if (_blocking != null) return _blocking!;
    final relationTable = _i1.createRelationTable(
      relationFieldName: 'blocking',
      field: Member.t.id,
      foreignField: _i2.Blocking.t.blockedById,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i2.BlockingTable(tableRelation: foreignTableRelation),
    );
    _blocking = _i1.ManyRelation<_i2.BlockingTable>(
      tableWithRelations: relationTable,
      table: _i2.BlockingTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _blocking!;
  }

  _i1.ManyRelation<_i2.BlockingTable> get blockedBy {
    if (_blockedBy != null) return _blockedBy!;
    final relationTable = _i1.createRelationTable(
      relationFieldName: 'blockedBy',
      field: Member.t.id,
      foreignField: _i2.Blocking.t.blockedId,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i2.BlockingTable(tableRelation: foreignTableRelation),
    );
    _blockedBy = _i1.ManyRelation<_i2.BlockingTable>(
      tableWithRelations: relationTable,
      table: _i2.BlockingTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _blockedBy!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    name,
  ];

  @override
  _i1.Table? getRelationTable(final String relationField) {
    if (relationField == 'blocking') {
      return __blocking;
    }
    if (relationField == 'blockedBy') {
      return __blockedBy;
    }
    return null;
  }
}

class MemberInclude extends _i1.IncludeObject {
  MemberInclude._({
    final _i2.BlockingIncludeList? blocking,
    final _i2.BlockingIncludeList? blockedBy,
  }) {
    _blocking = blocking;
    _blockedBy = blockedBy;
  }

  _i2.BlockingIncludeList? _blocking;

  _i2.BlockingIncludeList? _blockedBy;

  @override
  Map<String, _i1.Include?> get includes => {
    'blocking': _blocking,
    'blockedBy': _blockedBy,
  };

  @override
  _i1.Table<int?> get table => Member.t;
}

class MemberIncludeList extends _i1.IncludeList {
  MemberIncludeList._({
    final _i1.WhereExpressionBuilder<MemberTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Member.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Member.t;
}

class MemberRepository {
  const MemberRepository._();

  final attach = const MemberAttachRepository._();

  final attachRow = const MemberAttachRowRepository._();

  /// Returns a list of [Member]s matching the given query parameters.
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
  Future<List<Member>> find(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<MemberTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<MemberTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<MemberTable>? orderByList,
    final _i1.Transaction? transaction,
    final MemberInclude? include,
  }) async {
    return session.db.find<Member>(
      where: where?.call(Member.t),
      orderBy: orderBy?.call(Member.t),
      orderByList: orderByList?.call(Member.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Member] matching the given query parameters.
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
  Future<Member?> findFirstRow(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<MemberTable>? where,
    final int? offset,
    final _i1.OrderByBuilder<MemberTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<MemberTable>? orderByList,
    final _i1.Transaction? transaction,
    final MemberInclude? include,
  }) async {
    return session.db.findFirstRow<Member>(
      where: where?.call(Member.t),
      orderBy: orderBy?.call(Member.t),
      orderByList: orderByList?.call(Member.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Member] by its [id] or null if no such row exists.
  Future<Member?> findById(
    final _i1.Session session,
    final int id, {
    final _i1.Transaction? transaction,
    final MemberInclude? include,
  }) async {
    return session.db.findById<Member>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Member]s in the list and returns the inserted rows.
  ///
  /// The returned [Member]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Member>> insert(
    final _i1.Session session,
    final List<Member> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Member>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Member] and returns the inserted row.
  ///
  /// The returned [Member] will have its `id` field set.
  Future<Member> insertRow(
    final _i1.Session session,
    final Member row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Member>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Member]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Member>> update(
    final _i1.Session session,
    final List<Member> rows, {
    final _i1.ColumnSelections<MemberTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.update<Member>(
      rows,
      columns: columns?.call(Member.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Member]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Member> updateRow(
    final _i1.Session session,
    final Member row, {
    final _i1.ColumnSelections<MemberTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Member>(
      row,
      columns: columns?.call(Member.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Member] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Member?> updateById(
    final _i1.Session session,
    final int id, {
    required final _i1.ColumnValueListBuilder<MemberUpdateTable> columnValues,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Member>(
      id,
      columnValues: columnValues(Member.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Member]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Member>> updateWhere(
    final _i1.Session session, {
    required final _i1.ColumnValueListBuilder<MemberUpdateTable> columnValues,
    required final _i1.WhereExpressionBuilder<MemberTable> where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<MemberTable>? orderBy,
    final _i1.OrderByListBuilder<MemberTable>? orderByList,
    final bool orderDescending = false,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Member>(
      columnValues: columnValues(Member.t.updateTable),
      where: where(Member.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Member.t),
      orderByList: orderByList?.call(Member.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Member]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Member>> delete(
    final _i1.Session session,
    final List<Member> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Member>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Member].
  Future<Member> deleteRow(
    final _i1.Session session,
    final Member row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Member>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Member>> deleteWhere(
    final _i1.Session session, {
    required final _i1.WhereExpressionBuilder<MemberTable> where,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Member>(
      where: where(Member.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<MemberTable>? where,
    final int? limit,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.count<Member>(
      where: where?.call(Member.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class MemberAttachRepository {
  const MemberAttachRepository._();

  /// Creates a relation between this [Member] and the given [Blocking]s
  /// by setting each [Blocking]'s foreign key `blockedById` to refer to this [Member].
  Future<void> blocking(
    final _i1.Session session,
    final Member member,
    final List<_i2.Blocking> blocking, {
    final _i1.Transaction? transaction,
  }) async {
    if (blocking.any((final e) => e.id == null)) {
      throw ArgumentError.notNull('blocking.id');
    }
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }

    final $blocking = blocking
        .map((final e) => e.copyWith(blockedById: member.id))
        .toList();
    await session.db.update<_i2.Blocking>(
      $blocking,
      columns: [_i2.Blocking.t.blockedById],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Member] and the given [Blocking]s
  /// by setting each [Blocking]'s foreign key `blockedId` to refer to this [Member].
  Future<void> blockedBy(
    final _i1.Session session,
    final Member member,
    final List<_i2.Blocking> blocking, {
    final _i1.Transaction? transaction,
  }) async {
    if (blocking.any((final e) => e.id == null)) {
      throw ArgumentError.notNull('blocking.id');
    }
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }

    final $blocking = blocking
        .map((final e) => e.copyWith(blockedId: member.id))
        .toList();
    await session.db.update<_i2.Blocking>(
      $blocking,
      columns: [_i2.Blocking.t.blockedId],
      transaction: transaction,
    );
  }
}

class MemberAttachRowRepository {
  const MemberAttachRowRepository._();

  /// Creates a relation between this [Member] and the given [Blocking]
  /// by setting the [Blocking]'s foreign key `blockedById` to refer to this [Member].
  Future<void> blocking(
    final _i1.Session session,
    final Member member,
    final _i2.Blocking blocking, {
    final _i1.Transaction? transaction,
  }) async {
    if (blocking.id == null) {
      throw ArgumentError.notNull('blocking.id');
    }
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }

    final $blocking = blocking.copyWith(blockedById: member.id);
    await session.db.updateRow<_i2.Blocking>(
      $blocking,
      columns: [_i2.Blocking.t.blockedById],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Member] and the given [Blocking]
  /// by setting the [Blocking]'s foreign key `blockedId` to refer to this [Member].
  Future<void> blockedBy(
    final _i1.Session session,
    final Member member,
    final _i2.Blocking blocking, {
    final _i1.Transaction? transaction,
  }) async {
    if (blocking.id == null) {
      throw ArgumentError.notNull('blocking.id');
    }
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }

    final $blocking = blocking.copyWith(blockedId: member.id);
    await session.db.updateRow<_i2.Blocking>(
      $blocking,
      columns: [_i2.Blocking.t.blockedId],
      transaction: transaction,
    );
  }
}
