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
import '../../long_identifiers/models_with_relations/user_note_with_a_long_name.dart'
    as _i2;

abstract class UserNoteCollectionWithALongName
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  UserNoteCollectionWithALongName._({
    this.id,
    required this.name,
    this.notes,
  });

  factory UserNoteCollectionWithALongName({
    final int? id,
    required final String name,
    final List<_i2.UserNoteWithALongName>? notes,
  }) = _UserNoteCollectionWithALongNameImpl;

  factory UserNoteCollectionWithALongName.fromJson(
    final Map<String, dynamic> jsonSerialization,
  ) {
    return UserNoteCollectionWithALongName(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      notes: (jsonSerialization['notes'] as List?)
          ?.map(
            (final e) =>
                _i2.UserNoteWithALongName.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
    );
  }

  static final t = UserNoteCollectionWithALongNameTable();

  static const db = UserNoteCollectionWithALongNameRepository._();

  @override
  int? id;

  String name;

  List<_i2.UserNoteWithALongName>? notes;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [UserNoteCollectionWithALongName]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserNoteCollectionWithALongName copyWith({
    final int? id,
    final String? name,
    final List<_i2.UserNoteWithALongName>? notes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (notes != null) 'notes': notes?.toJson(valueToJson: (final v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (notes != null)
        'notes': notes?.toJson(valueToJson: (final v) => v.toJsonForProtocol()),
    };
  }

  static UserNoteCollectionWithALongNameInclude include({
    final _i2.UserNoteWithALongNameIncludeList? notes,
  }) {
    return UserNoteCollectionWithALongNameInclude._(notes: notes);
  }

  static UserNoteCollectionWithALongNameIncludeList includeList({
    final _i1.WhereExpressionBuilder<UserNoteCollectionWithALongNameTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<UserNoteCollectionWithALongNameTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<UserNoteCollectionWithALongNameTable>? orderByList,
    final UserNoteCollectionWithALongNameInclude? include,
  }) {
    return UserNoteCollectionWithALongNameIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserNoteCollectionWithALongName.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserNoteCollectionWithALongName.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserNoteCollectionWithALongNameImpl
    extends UserNoteCollectionWithALongName {
  _UserNoteCollectionWithALongNameImpl({
    final int? id,
    required final String name,
    final List<_i2.UserNoteWithALongName>? notes,
  }) : super._(
         id: id,
         name: name,
         notes: notes,
       );

  /// Returns a shallow copy of this [UserNoteCollectionWithALongName]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserNoteCollectionWithALongName copyWith({
    final Object? id = _Undefined,
    final String? name,
    final Object? notes = _Undefined,
  }) {
    return UserNoteCollectionWithALongName(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      notes: notes is List<_i2.UserNoteWithALongName>?
          ? notes
          : this.notes?.map((final e0) => e0.copyWith()).toList(),
    );
  }
}

class UserNoteCollectionWithALongNameUpdateTable
    extends _i1.UpdateTable<UserNoteCollectionWithALongNameTable> {
  UserNoteCollectionWithALongNameUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(final String value) => _i1.ColumnValue(
    table.name,
    value,
  );
}

class UserNoteCollectionWithALongNameTable extends _i1.Table<int?> {
  UserNoteCollectionWithALongNameTable({super.tableRelation})
    : super(tableName: 'user_note_collection_with_a_long_name') {
    updateTable = UserNoteCollectionWithALongNameUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
  }

  late final UserNoteCollectionWithALongNameUpdateTable updateTable;

  late final _i1.ColumnString name;

  _i2.UserNoteWithALongNameTable? ___notes;

  _i1.ManyRelation<_i2.UserNoteWithALongNameTable>? _notes;

  _i2.UserNoteWithALongNameTable get __notes {
    if (___notes != null) return ___notes!;
    ___notes = _i1.createRelationTable(
      relationFieldName: '__notes',
      field: UserNoteCollectionWithALongName.t.id,
      foreignField: _i2
          .UserNoteWithALongName
          .t
          .$_userNoteCollectionWithALongNameNotesUserNoteCollectionWi06adId,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i2.UserNoteWithALongNameTable(tableRelation: foreignTableRelation),
    );
    return ___notes!;
  }

  _i1.ManyRelation<_i2.UserNoteWithALongNameTable> get notes {
    if (_notes != null) return _notes!;
    final relationTable = _i1.createRelationTable(
      relationFieldName: 'notes',
      field: UserNoteCollectionWithALongName.t.id,
      foreignField: _i2
          .UserNoteWithALongName
          .t
          .$_userNoteCollectionWithALongNameNotesUserNoteCollectionWi06adId,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i2.UserNoteWithALongNameTable(tableRelation: foreignTableRelation),
    );
    _notes = _i1.ManyRelation<_i2.UserNoteWithALongNameTable>(
      tableWithRelations: relationTable,
      table: _i2.UserNoteWithALongNameTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _notes!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    name,
  ];

  @override
  _i1.Table? getRelationTable(final String relationField) {
    if (relationField == 'notes') {
      return __notes;
    }
    return null;
  }
}

class UserNoteCollectionWithALongNameInclude extends _i1.IncludeObject {
  UserNoteCollectionWithALongNameInclude._({
    final _i2.UserNoteWithALongNameIncludeList? notes,
  }) {
    _notes = notes;
  }

  _i2.UserNoteWithALongNameIncludeList? _notes;

  @override
  Map<String, _i1.Include?> get includes => {'notes': _notes};

  @override
  _i1.Table<int?> get table => UserNoteCollectionWithALongName.t;
}

class UserNoteCollectionWithALongNameIncludeList extends _i1.IncludeList {
  UserNoteCollectionWithALongNameIncludeList._({
    final _i1.WhereExpressionBuilder<UserNoteCollectionWithALongNameTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserNoteCollectionWithALongName.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => UserNoteCollectionWithALongName.t;
}

class UserNoteCollectionWithALongNameRepository {
  const UserNoteCollectionWithALongNameRepository._();

  final attach = const UserNoteCollectionWithALongNameAttachRepository._();

  final attachRow =
      const UserNoteCollectionWithALongNameAttachRowRepository._();

  final detach = const UserNoteCollectionWithALongNameDetachRepository._();

  final detachRow =
      const UserNoteCollectionWithALongNameDetachRowRepository._();

  /// Returns a list of [UserNoteCollectionWithALongName]s matching the given query parameters.
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
  Future<List<UserNoteCollectionWithALongName>> find(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<UserNoteCollectionWithALongNameTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<UserNoteCollectionWithALongNameTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<UserNoteCollectionWithALongNameTable>? orderByList,
    final _i1.Transaction? transaction,
    final UserNoteCollectionWithALongNameInclude? include,
  }) async {
    return session.db.find<UserNoteCollectionWithALongName>(
      where: where?.call(UserNoteCollectionWithALongName.t),
      orderBy: orderBy?.call(UserNoteCollectionWithALongName.t),
      orderByList: orderByList?.call(UserNoteCollectionWithALongName.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [UserNoteCollectionWithALongName] matching the given query parameters.
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
  Future<UserNoteCollectionWithALongName?> findFirstRow(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<UserNoteCollectionWithALongNameTable>? where,
    final int? offset,
    final _i1.OrderByBuilder<UserNoteCollectionWithALongNameTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<UserNoteCollectionWithALongNameTable>? orderByList,
    final _i1.Transaction? transaction,
    final UserNoteCollectionWithALongNameInclude? include,
  }) async {
    return session.db.findFirstRow<UserNoteCollectionWithALongName>(
      where: where?.call(UserNoteCollectionWithALongName.t),
      orderBy: orderBy?.call(UserNoteCollectionWithALongName.t),
      orderByList: orderByList?.call(UserNoteCollectionWithALongName.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [UserNoteCollectionWithALongName] by its [id] or null if no such row exists.
  Future<UserNoteCollectionWithALongName?> findById(
    final _i1.Session session,
    final int id, {
    final _i1.Transaction? transaction,
    final UserNoteCollectionWithALongNameInclude? include,
  }) async {
    return session.db.findById<UserNoteCollectionWithALongName>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [UserNoteCollectionWithALongName]s in the list and returns the inserted rows.
  ///
  /// The returned [UserNoteCollectionWithALongName]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UserNoteCollectionWithALongName>> insert(
    final _i1.Session session,
    final List<UserNoteCollectionWithALongName> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserNoteCollectionWithALongName>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UserNoteCollectionWithALongName] and returns the inserted row.
  ///
  /// The returned [UserNoteCollectionWithALongName] will have its `id` field set.
  Future<UserNoteCollectionWithALongName> insertRow(
    final _i1.Session session,
    final UserNoteCollectionWithALongName row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserNoteCollectionWithALongName>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UserNoteCollectionWithALongName]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserNoteCollectionWithALongName>> update(
    final _i1.Session session,
    final List<UserNoteCollectionWithALongName> rows, {
    final _i1.ColumnSelections<UserNoteCollectionWithALongNameTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserNoteCollectionWithALongName>(
      rows,
      columns: columns?.call(UserNoteCollectionWithALongName.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserNoteCollectionWithALongName]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserNoteCollectionWithALongName> updateRow(
    final _i1.Session session,
    final UserNoteCollectionWithALongName row, {
    final _i1.ColumnSelections<UserNoteCollectionWithALongNameTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserNoteCollectionWithALongName>(
      row,
      columns: columns?.call(UserNoteCollectionWithALongName.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserNoteCollectionWithALongName] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<UserNoteCollectionWithALongName?> updateById(
    final _i1.Session session,
    final int id, {
    required final _i1.ColumnValueListBuilder<
      UserNoteCollectionWithALongNameUpdateTable
    >
    columnValues,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<UserNoteCollectionWithALongName>(
      id,
      columnValues: columnValues(UserNoteCollectionWithALongName.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [UserNoteCollectionWithALongName]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<UserNoteCollectionWithALongName>> updateWhere(
    final _i1.Session session, {
    required final _i1.ColumnValueListBuilder<
      UserNoteCollectionWithALongNameUpdateTable
    >
    columnValues,
    required final _i1.WhereExpressionBuilder<UserNoteCollectionWithALongNameTable>
    where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<UserNoteCollectionWithALongNameTable>? orderBy,
    final _i1.OrderByListBuilder<UserNoteCollectionWithALongNameTable>? orderByList,
    final bool orderDescending = false,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<UserNoteCollectionWithALongName>(
      columnValues: columnValues(UserNoteCollectionWithALongName.t.updateTable),
      where: where(UserNoteCollectionWithALongName.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserNoteCollectionWithALongName.t),
      orderByList: orderByList?.call(UserNoteCollectionWithALongName.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [UserNoteCollectionWithALongName]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserNoteCollectionWithALongName>> delete(
    final _i1.Session session,
    final List<UserNoteCollectionWithALongName> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserNoteCollectionWithALongName>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserNoteCollectionWithALongName].
  Future<UserNoteCollectionWithALongName> deleteRow(
    final _i1.Session session,
    final UserNoteCollectionWithALongName row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserNoteCollectionWithALongName>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UserNoteCollectionWithALongName>> deleteWhere(
    final _i1.Session session, {
    required final _i1.WhereExpressionBuilder<UserNoteCollectionWithALongNameTable>
    where,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserNoteCollectionWithALongName>(
      where: where(UserNoteCollectionWithALongName.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<UserNoteCollectionWithALongNameTable>? where,
    final int? limit,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserNoteCollectionWithALongName>(
      where: where?.call(UserNoteCollectionWithALongName.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserNoteCollectionWithALongNameAttachRepository {
  const UserNoteCollectionWithALongNameAttachRepository._();

  /// Creates a relation between this [UserNoteCollectionWithALongName] and the given [UserNoteWithALongName]s
  /// by setting each [UserNoteWithALongName]'s foreign key `_userNoteCollectionWithALongNameNotesUserNoteCollectionWi06adId` to refer to this [UserNoteCollectionWithALongName].
  Future<void> notes(
    final _i1.Session session,
    final UserNoteCollectionWithALongName userNoteCollectionWithALongName,
    final List<_i2.UserNoteWithALongName> userNoteWithALongName, {
    final _i1.Transaction? transaction,
  }) async {
    if (userNoteWithALongName.any((final e) => e.id == null)) {
      throw ArgumentError.notNull('userNoteWithALongName.id');
    }
    if (userNoteCollectionWithALongName.id == null) {
      throw ArgumentError.notNull('userNoteCollectionWithALongName.id');
    }

    final $userNoteWithALongName = userNoteWithALongName
        .map(
          (final e) => _i2.UserNoteWithALongNameImplicit(
            e,
            $_userNoteCollectionWithALongNameNotesUserNoteCollectionWi06adId:
                userNoteCollectionWithALongName.id,
          ),
        )
        .toList();
    await session.db.update<_i2.UserNoteWithALongName>(
      $userNoteWithALongName,
      columns: [
        _i2
            .UserNoteWithALongName
            .t
            .$_userNoteCollectionWithALongNameNotesUserNoteCollectionWi06adId,
      ],
      transaction: transaction,
    );
  }
}

class UserNoteCollectionWithALongNameAttachRowRepository {
  const UserNoteCollectionWithALongNameAttachRowRepository._();

  /// Creates a relation between this [UserNoteCollectionWithALongName] and the given [UserNoteWithALongName]
  /// by setting the [UserNoteWithALongName]'s foreign key `_userNoteCollectionWithALongNameNotesUserNoteCollectionWi06adId` to refer to this [UserNoteCollectionWithALongName].
  Future<void> notes(
    final _i1.Session session,
    final UserNoteCollectionWithALongName userNoteCollectionWithALongName,
    final _i2.UserNoteWithALongName userNoteWithALongName, {
    final _i1.Transaction? transaction,
  }) async {
    if (userNoteWithALongName.id == null) {
      throw ArgumentError.notNull('userNoteWithALongName.id');
    }
    if (userNoteCollectionWithALongName.id == null) {
      throw ArgumentError.notNull('userNoteCollectionWithALongName.id');
    }

    final $userNoteWithALongName = _i2.UserNoteWithALongNameImplicit(
      userNoteWithALongName,
      $_userNoteCollectionWithALongNameNotesUserNoteCollectionWi06adId:
          userNoteCollectionWithALongName.id,
    );
    await session.db.updateRow<_i2.UserNoteWithALongName>(
      $userNoteWithALongName,
      columns: [
        _i2
            .UserNoteWithALongName
            .t
            .$_userNoteCollectionWithALongNameNotesUserNoteCollectionWi06adId,
      ],
      transaction: transaction,
    );
  }
}

class UserNoteCollectionWithALongNameDetachRepository {
  const UserNoteCollectionWithALongNameDetachRepository._();

  /// Detaches the relation between this [UserNoteCollectionWithALongName] and the given [UserNoteWithALongName]
  /// by setting the [UserNoteWithALongName]'s foreign key `_userNoteCollectionWithALongNameNotesUserNoteCollectionWi06adId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> notes(
    final _i1.Session session,
    final List<_i2.UserNoteWithALongName> userNoteWithALongName, {
    final _i1.Transaction? transaction,
  }) async {
    if (userNoteWithALongName.any((final e) => e.id == null)) {
      throw ArgumentError.notNull('userNoteWithALongName.id');
    }

    final $userNoteWithALongName = userNoteWithALongName
        .map(
          (final e) => _i2.UserNoteWithALongNameImplicit(
            e,
            $_userNoteCollectionWithALongNameNotesUserNoteCollectionWi06adId:
                null,
          ),
        )
        .toList();
    await session.db.update<_i2.UserNoteWithALongName>(
      $userNoteWithALongName,
      columns: [
        _i2
            .UserNoteWithALongName
            .t
            .$_userNoteCollectionWithALongNameNotesUserNoteCollectionWi06adId,
      ],
      transaction: transaction,
    );
  }
}

class UserNoteCollectionWithALongNameDetachRowRepository {
  const UserNoteCollectionWithALongNameDetachRowRepository._();

  /// Detaches the relation between this [UserNoteCollectionWithALongName] and the given [UserNoteWithALongName]
  /// by setting the [UserNoteWithALongName]'s foreign key `_userNoteCollectionWithALongNameNotesUserNoteCollectionWi06adId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> notes(
    final _i1.Session session,
    final _i2.UserNoteWithALongName userNoteWithALongName, {
    final _i1.Transaction? transaction,
  }) async {
    if (userNoteWithALongName.id == null) {
      throw ArgumentError.notNull('userNoteWithALongName.id');
    }

    final $userNoteWithALongName = _i2.UserNoteWithALongNameImplicit(
      userNoteWithALongName,
      $_userNoteCollectionWithALongNameNotesUserNoteCollectionWi06adId: null,
    );
    await session.db.updateRow<_i2.UserNoteWithALongName>(
      $userNoteWithALongName,
      columns: [
        _i2
            .UserNoteWithALongName
            .t
            .$_userNoteCollectionWithALongNameNotesUserNoteCollectionWi06adId,
      ],
      transaction: transaction,
    );
  }
}
