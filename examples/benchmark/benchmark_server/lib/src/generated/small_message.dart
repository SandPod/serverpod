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
import 'small_message.dart' as _i2;

abstract class SmallMessage
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SmallMessage._({
    this.id,
    String? message,
    this.previous,
    this.nextId,
    this.next,
  }) : message = message ?? 'This is the default message value';

  factory SmallMessage({
    int? id,
    String? message,
    _i2.SmallMessage? previous,
    int? nextId,
    _i2.SmallMessage? next,
  }) = _SmallMessageImpl;

  factory SmallMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return SmallMessage(
      id: jsonSerialization['id'] as int?,
      message: jsonSerialization['message'] as String,
      previous: jsonSerialization['previous'] == null
          ? null
          : _i2.SmallMessage.fromJson(
              (jsonSerialization['previous'] as Map<String, dynamic>)),
      nextId: jsonSerialization['nextId'] as int?,
      next: jsonSerialization['next'] == null
          ? null
          : _i2.SmallMessage.fromJson(
              (jsonSerialization['next'] as Map<String, dynamic>)),
    );
  }

  static final t = SmallMessageTable();

  static const db = SmallMessageRepository._();

  @override
  int? id;

  String message;

  _i2.SmallMessage? previous;

  int? nextId;

  _i2.SmallMessage? next;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [SmallMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SmallMessage copyWith({
    int? id,
    String? message,
    _i2.SmallMessage? previous,
    int? nextId,
    _i2.SmallMessage? next,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'message': message,
      if (previous != null) 'previous': previous?.toJson(),
      if (nextId != null) 'nextId': nextId,
      if (next != null) 'next': next?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'message': message,
      if (previous != null) 'previous': previous?.toJsonForProtocol(),
      if (nextId != null) 'nextId': nextId,
      if (next != null) 'next': next?.toJsonForProtocol(),
    };
  }

  static SmallMessageInclude include({
    _i2.SmallMessageInclude? previous,
    _i2.SmallMessageInclude? next,
  }) {
    return SmallMessageInclude._(
      previous: previous,
      next: next,
    );
  }

  static SmallMessageIncludeList includeList({
    _i1.WhereExpressionBuilder<SmallMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SmallMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SmallMessageTable>? orderByList,
    SmallMessageInclude? include,
  }) {
    return SmallMessageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SmallMessage.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SmallMessage.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SmallMessageImpl extends SmallMessage {
  _SmallMessageImpl({
    int? id,
    String? message,
    _i2.SmallMessage? previous,
    int? nextId,
    _i2.SmallMessage? next,
  }) : super._(
          id: id,
          message: message,
          previous: previous,
          nextId: nextId,
          next: next,
        );

  /// Returns a shallow copy of this [SmallMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SmallMessage copyWith({
    Object? id = _Undefined,
    String? message,
    Object? previous = _Undefined,
    Object? nextId = _Undefined,
    Object? next = _Undefined,
  }) {
    return SmallMessage(
      id: id is int? ? id : this.id,
      message: message ?? this.message,
      previous:
          previous is _i2.SmallMessage? ? previous : this.previous?.copyWith(),
      nextId: nextId is int? ? nextId : this.nextId,
      next: next is _i2.SmallMessage? ? next : this.next?.copyWith(),
    );
  }
}

class SmallMessageUpdateTable extends _i1.UpdateTable<SmallMessageTable> {
  SmallMessageUpdateTable(super.table);

  _i1.ColumnValue<String, String> message(String value) => _i1.ColumnValue(
        table.message,
        value,
      );

  _i1.ColumnValue<int, int> nextId(int? value) => _i1.ColumnValue(
        table.nextId,
        value,
      );
}

class SmallMessageTable extends _i1.Table<int?> {
  SmallMessageTable({super.tableRelation}) : super(tableName: 'small_message') {
    updateTable = SmallMessageUpdateTable(this);
    message = _i1.ColumnString(
      'message',
      this,
      hasDefault: true,
    );
    nextId = _i1.ColumnInt(
      'nextId',
      this,
    );
  }

  late final SmallMessageUpdateTable updateTable;

  late final _i1.ColumnString message;

  _i2.SmallMessageTable? _previous;

  late final _i1.ColumnInt nextId;

  _i2.SmallMessageTable? _next;

  _i2.SmallMessageTable get previous {
    if (_previous != null) return _previous!;
    _previous = _i1.createRelationTable(
      relationFieldName: 'previous',
      field: SmallMessage.t.id,
      foreignField: _i2.SmallMessage.t.nextId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.SmallMessageTable(tableRelation: foreignTableRelation),
    );
    return _previous!;
  }

  _i2.SmallMessageTable get next {
    if (_next != null) return _next!;
    _next = _i1.createRelationTable(
      relationFieldName: 'next',
      field: SmallMessage.t.nextId,
      foreignField: _i2.SmallMessage.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.SmallMessageTable(tableRelation: foreignTableRelation),
    );
    return _next!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        message,
        nextId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'previous') {
      return previous;
    }
    if (relationField == 'next') {
      return next;
    }
    return null;
  }
}

class SmallMessageInclude extends _i1.IncludeObject {
  SmallMessageInclude._({
    _i2.SmallMessageInclude? previous,
    _i2.SmallMessageInclude? next,
  }) {
    _previous = previous;
    _next = next;
  }

  _i2.SmallMessageInclude? _previous;

  _i2.SmallMessageInclude? _next;

  @override
  Map<String, _i1.Include?> get includes => {
        'previous': _previous,
        'next': _next,
      };

  @override
  _i1.Table<int?> get table => SmallMessage.t;
}

class SmallMessageIncludeList extends _i1.IncludeList {
  SmallMessageIncludeList._({
    _i1.WhereExpressionBuilder<SmallMessageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SmallMessage.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SmallMessage.t;
}

class SmallMessageRepository {
  const SmallMessageRepository._();

  final attachRow = const SmallMessageAttachRowRepository._();

  final detachRow = const SmallMessageDetachRowRepository._();

  /// Returns a list of [SmallMessage]s matching the given query parameters.
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
  Future<List<SmallMessage>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SmallMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SmallMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SmallMessageTable>? orderByList,
    _i1.Transaction? transaction,
    SmallMessageInclude? include,
  }) async {
    return session.db.find<SmallMessage>(
      where: where?.call(SmallMessage.t),
      orderBy: orderBy?.call(SmallMessage.t),
      orderByList: orderByList?.call(SmallMessage.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [SmallMessage] matching the given query parameters.
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
  Future<SmallMessage?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SmallMessageTable>? where,
    int? offset,
    _i1.OrderByBuilder<SmallMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SmallMessageTable>? orderByList,
    _i1.Transaction? transaction,
    SmallMessageInclude? include,
  }) async {
    return session.db.findFirstRow<SmallMessage>(
      where: where?.call(SmallMessage.t),
      orderBy: orderBy?.call(SmallMessage.t),
      orderByList: orderByList?.call(SmallMessage.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [SmallMessage] by its [id] or null if no such row exists.
  Future<SmallMessage?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    SmallMessageInclude? include,
  }) async {
    return session.db.findById<SmallMessage>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [SmallMessage]s in the list and returns the inserted rows.
  ///
  /// The returned [SmallMessage]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SmallMessage>> insert(
    _i1.Session session,
    List<SmallMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SmallMessage>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SmallMessage] and returns the inserted row.
  ///
  /// The returned [SmallMessage] will have its `id` field set.
  Future<SmallMessage> insertRow(
    _i1.Session session,
    SmallMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SmallMessage>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SmallMessage]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SmallMessage>> update(
    _i1.Session session,
    List<SmallMessage> rows, {
    _i1.ColumnSelections<SmallMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SmallMessage>(
      rows,
      columns: columns?.call(SmallMessage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SmallMessage]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SmallMessage> updateRow(
    _i1.Session session,
    SmallMessage row, {
    _i1.ColumnSelections<SmallMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SmallMessage>(
      row,
      columns: columns?.call(SmallMessage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SmallMessage] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SmallMessage?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<SmallMessageUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<SmallMessage>(
      id,
      columnValues: columnValues(SmallMessage.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SmallMessage]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<SmallMessage>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<SmallMessageUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<SmallMessageTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SmallMessageTable>? orderBy,
    _i1.OrderByListBuilder<SmallMessageTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<SmallMessage>(
      columnValues: columnValues(SmallMessage.t.updateTable),
      where: where(SmallMessage.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SmallMessage.t),
      orderByList: orderByList?.call(SmallMessage.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [SmallMessage]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SmallMessage>> delete(
    _i1.Session session,
    List<SmallMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SmallMessage>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SmallMessage].
  Future<SmallMessage> deleteRow(
    _i1.Session session,
    SmallMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SmallMessage>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SmallMessage>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SmallMessageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SmallMessage>(
      where: where(SmallMessage.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SmallMessageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SmallMessage>(
      where: where?.call(SmallMessage.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SmallMessageAttachRowRepository {
  const SmallMessageAttachRowRepository._();

  /// Creates a relation between the given [SmallMessage] and [SmallMessage]
  /// by setting the [SmallMessage]'s foreign key `id` to refer to the [SmallMessage].
  Future<void> previous(
    _i1.Session session,
    SmallMessage smallMessage,
    _i2.SmallMessage previous, {
    _i1.Transaction? transaction,
  }) async {
    if (previous.id == null) {
      throw ArgumentError.notNull('previous.id');
    }
    if (smallMessage.id == null) {
      throw ArgumentError.notNull('smallMessage.id');
    }

    var $previous = previous.copyWith(nextId: smallMessage.id);
    await session.db.updateRow<_i2.SmallMessage>(
      $previous,
      columns: [_i2.SmallMessage.t.nextId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [SmallMessage] and [SmallMessage]
  /// by setting the [SmallMessage]'s foreign key `nextId` to refer to the [SmallMessage].
  Future<void> next(
    _i1.Session session,
    SmallMessage smallMessage,
    _i2.SmallMessage next, {
    _i1.Transaction? transaction,
  }) async {
    if (smallMessage.id == null) {
      throw ArgumentError.notNull('smallMessage.id');
    }
    if (next.id == null) {
      throw ArgumentError.notNull('next.id');
    }

    var $smallMessage = smallMessage.copyWith(nextId: next.id);
    await session.db.updateRow<SmallMessage>(
      $smallMessage,
      columns: [SmallMessage.t.nextId],
      transaction: transaction,
    );
  }
}

class SmallMessageDetachRowRepository {
  const SmallMessageDetachRowRepository._();

  /// Detaches the relation between this [SmallMessage] and the [SmallMessage] set in `previous`
  /// by setting the [SmallMessage]'s foreign key `id` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> previous(
    _i1.Session session,
    SmallMessage smallmessage, {
    _i1.Transaction? transaction,
  }) async {
    var $previous = smallmessage.previous;

    if ($previous == null) {
      throw ArgumentError.notNull('smallmessage.previous');
    }
    if ($previous.id == null) {
      throw ArgumentError.notNull('smallmessage.previous.id');
    }
    if (smallmessage.id == null) {
      throw ArgumentError.notNull('smallmessage.id');
    }

    var $$previous = $previous.copyWith(nextId: null);
    await session.db.updateRow<_i2.SmallMessage>(
      $$previous,
      columns: [_i2.SmallMessage.t.nextId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [SmallMessage] and the [SmallMessage] set in `next`
  /// by setting the [SmallMessage]'s foreign key `nextId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> next(
    _i1.Session session,
    SmallMessage smallmessage, {
    _i1.Transaction? transaction,
  }) async {
    if (smallmessage.id == null) {
      throw ArgumentError.notNull('smallmessage.id');
    }

    var $smallmessage = smallmessage.copyWith(nextId: null);
    await session.db.updateRow<SmallMessage>(
      $smallmessage,
      columns: [SmallMessage.t.nextId],
      transaction: transaction,
    );
  }
}
