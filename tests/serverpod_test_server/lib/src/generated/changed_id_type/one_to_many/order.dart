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

import '../../changed_id_type/one_to_many/comment.dart' as _i3;
import '../../changed_id_type/one_to_many/customer.dart' as _i2;

abstract class OrderUuid
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  OrderUuid._({
    final _i1.UuidValue? id,
    required this.description,
    required this.customerId,
    this.customer,
    this.comments,
  }) : id = id ?? const _i1.Uuid().v7obj();

  factory OrderUuid({
    final _i1.UuidValue? id,
    required final String description,
    required final int customerId,
    final _i2.CustomerInt? customer,
    final List<_i3.CommentInt>? comments,
  }) = _OrderUuidImpl;

  factory OrderUuid.fromJson(final Map<String, dynamic> jsonSerialization) {
    return OrderUuid(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      description: jsonSerialization['description'] as String,
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i2.CustomerInt.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>),
            ),
      comments: (jsonSerialization['comments'] as List?)
          ?.map((final e) => _i3.CommentInt.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = OrderUuidTable();

  static const db = OrderUuidRepository._();

  @override
  _i1.UuidValue id;

  String description;

  int customerId;

  _i2.CustomerInt? customer;

  List<_i3.CommentInt>? comments;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [OrderUuid]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OrderUuid copyWith({
    final _i1.UuidValue? id,
    final String? description,
    final int? customerId,
    final _i2.CustomerInt? customer,
    final List<_i3.CommentInt>? comments,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'description': description,
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (final v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'description': description,
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (final v) => v.toJsonForProtocol()),
    };
  }

  static OrderUuidInclude include({
    final _i2.CustomerIntInclude? customer,
    final _i3.CommentIntIncludeList? comments,
  }) {
    return OrderUuidInclude._(
      customer: customer,
      comments: comments,
    );
  }

  static OrderUuidIncludeList includeList({
    final _i1.WhereExpressionBuilder<OrderUuidTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<OrderUuidTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<OrderUuidTable>? orderByList,
    final OrderUuidInclude? include,
  }) {
    return OrderUuidIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OrderUuid.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(OrderUuid.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OrderUuidImpl extends OrderUuid {
  _OrderUuidImpl({
    final _i1.UuidValue? id,
    required final String description,
    required final int customerId,
    final _i2.CustomerInt? customer,
    final List<_i3.CommentInt>? comments,
  }) : super._(
         id: id,
         description: description,
         customerId: customerId,
         customer: customer,
         comments: comments,
       );

  /// Returns a shallow copy of this [OrderUuid]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OrderUuid copyWith({
    final _i1.UuidValue? id,
    final String? description,
    final int? customerId,
    final Object? customer = _Undefined,
    final Object? comments = _Undefined,
  }) {
    return OrderUuid(
      id: id ?? this.id,
      description: description ?? this.description,
      customerId: customerId ?? this.customerId,
      customer: customer is _i2.CustomerInt?
          ? customer
          : this.customer?.copyWith(),
      comments: comments is List<_i3.CommentInt>?
          ? comments
          : this.comments?.map((final e0) => e0.copyWith()).toList(),
    );
  }
}

class OrderUuidUpdateTable extends _i1.UpdateTable<OrderUuidTable> {
  OrderUuidUpdateTable(super.table);

  _i1.ColumnValue<String, String> description(final String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<int, int> customerId(final int value) => _i1.ColumnValue(
    table.customerId,
    value,
  );
}

class OrderUuidTable extends _i1.Table<_i1.UuidValue> {
  OrderUuidTable({super.tableRelation}) : super(tableName: 'order_uuid') {
    updateTable = OrderUuidUpdateTable(this);
    description = _i1.ColumnString(
      'description',
      this,
    );
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
  }

  late final OrderUuidUpdateTable updateTable;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt customerId;

  _i2.CustomerIntTable? _customer;

  _i3.CommentIntTable? ___comments;

  _i1.ManyRelation<_i3.CommentIntTable>? _comments;

  _i2.CustomerIntTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: OrderUuid.t.customerId,
      foreignField: _i2.CustomerInt.t.id,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i2.CustomerIntTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i3.CommentIntTable get __comments {
    if (___comments != null) return ___comments!;
    ___comments = _i1.createRelationTable(
      relationFieldName: '__comments',
      field: OrderUuid.t.id,
      foreignField: _i3.CommentInt.t.orderId,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i3.CommentIntTable(tableRelation: foreignTableRelation),
    );
    return ___comments!;
  }

  _i1.ManyRelation<_i3.CommentIntTable> get comments {
    if (_comments != null) return _comments!;
    final relationTable = _i1.createRelationTable(
      relationFieldName: 'comments',
      field: OrderUuid.t.id,
      foreignField: _i3.CommentInt.t.orderId,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i3.CommentIntTable(tableRelation: foreignTableRelation),
    );
    _comments = _i1.ManyRelation<_i3.CommentIntTable>(
      tableWithRelations: relationTable,
      table: _i3.CommentIntTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _comments!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    description,
    customerId,
  ];

  @override
  _i1.Table? getRelationTable(final String relationField) {
    if (relationField == 'customer') {
      return customer;
    }
    if (relationField == 'comments') {
      return __comments;
    }
    return null;
  }
}

class OrderUuidInclude extends _i1.IncludeObject {
  OrderUuidInclude._({
    final _i2.CustomerIntInclude? customer,
    final _i3.CommentIntIncludeList? comments,
  }) {
    _customer = customer;
    _comments = comments;
  }

  _i2.CustomerIntInclude? _customer;

  _i3.CommentIntIncludeList? _comments;

  @override
  Map<String, _i1.Include?> get includes => {
    'customer': _customer,
    'comments': _comments,
  };

  @override
  _i1.Table<_i1.UuidValue> get table => OrderUuid.t;
}

class OrderUuidIncludeList extends _i1.IncludeList {
  OrderUuidIncludeList._({
    final _i1.WhereExpressionBuilder<OrderUuidTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(OrderUuid.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => OrderUuid.t;
}

class OrderUuidRepository {
  const OrderUuidRepository._();

  final attach = const OrderUuidAttachRepository._();

  final attachRow = const OrderUuidAttachRowRepository._();

  /// Returns a list of [OrderUuid]s matching the given query parameters.
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
  Future<List<OrderUuid>> find(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<OrderUuidTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<OrderUuidTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<OrderUuidTable>? orderByList,
    final _i1.Transaction? transaction,
    final OrderUuidInclude? include,
  }) async {
    return session.db.find<OrderUuid>(
      where: where?.call(OrderUuid.t),
      orderBy: orderBy?.call(OrderUuid.t),
      orderByList: orderByList?.call(OrderUuid.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [OrderUuid] matching the given query parameters.
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
  Future<OrderUuid?> findFirstRow(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<OrderUuidTable>? where,
    final int? offset,
    final _i1.OrderByBuilder<OrderUuidTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<OrderUuidTable>? orderByList,
    final _i1.Transaction? transaction,
    final OrderUuidInclude? include,
  }) async {
    return session.db.findFirstRow<OrderUuid>(
      where: where?.call(OrderUuid.t),
      orderBy: orderBy?.call(OrderUuid.t),
      orderByList: orderByList?.call(OrderUuid.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [OrderUuid] by its [id] or null if no such row exists.
  Future<OrderUuid?> findById(
    final _i1.Session session,
    final _i1.UuidValue id, {
    final _i1.Transaction? transaction,
    final OrderUuidInclude? include,
  }) async {
    return session.db.findById<OrderUuid>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [OrderUuid]s in the list and returns the inserted rows.
  ///
  /// The returned [OrderUuid]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<OrderUuid>> insert(
    final _i1.Session session,
    final List<OrderUuid> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insert<OrderUuid>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [OrderUuid] and returns the inserted row.
  ///
  /// The returned [OrderUuid] will have its `id` field set.
  Future<OrderUuid> insertRow(
    final _i1.Session session,
    final OrderUuid row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<OrderUuid>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [OrderUuid]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<OrderUuid>> update(
    final _i1.Session session,
    final List<OrderUuid> rows, {
    final _i1.ColumnSelections<OrderUuidTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.update<OrderUuid>(
      rows,
      columns: columns?.call(OrderUuid.t),
      transaction: transaction,
    );
  }

  /// Updates a single [OrderUuid]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<OrderUuid> updateRow(
    final _i1.Session session,
    final OrderUuid row, {
    final _i1.ColumnSelections<OrderUuidTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<OrderUuid>(
      row,
      columns: columns?.call(OrderUuid.t),
      transaction: transaction,
    );
  }

  /// Updates a single [OrderUuid] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<OrderUuid?> updateById(
    final _i1.Session session,
    final _i1.UuidValue id, {
    required final _i1.ColumnValueListBuilder<OrderUuidUpdateTable> columnValues,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<OrderUuid>(
      id,
      columnValues: columnValues(OrderUuid.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [OrderUuid]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<OrderUuid>> updateWhere(
    final _i1.Session session, {
    required final _i1.ColumnValueListBuilder<OrderUuidUpdateTable> columnValues,
    required final _i1.WhereExpressionBuilder<OrderUuidTable> where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<OrderUuidTable>? orderBy,
    final _i1.OrderByListBuilder<OrderUuidTable>? orderByList,
    final bool orderDescending = false,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<OrderUuid>(
      columnValues: columnValues(OrderUuid.t.updateTable),
      where: where(OrderUuid.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OrderUuid.t),
      orderByList: orderByList?.call(OrderUuid.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [OrderUuid]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<OrderUuid>> delete(
    final _i1.Session session,
    final List<OrderUuid> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.delete<OrderUuid>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [OrderUuid].
  Future<OrderUuid> deleteRow(
    final _i1.Session session,
    final OrderUuid row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<OrderUuid>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<OrderUuid>> deleteWhere(
    final _i1.Session session, {
    required final _i1.WhereExpressionBuilder<OrderUuidTable> where,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<OrderUuid>(
      where: where(OrderUuid.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<OrderUuidTable>? where,
    final int? limit,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.count<OrderUuid>(
      where: where?.call(OrderUuid.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class OrderUuidAttachRepository {
  const OrderUuidAttachRepository._();

  /// Creates a relation between this [OrderUuid] and the given [CommentInt]s
  /// by setting each [CommentInt]'s foreign key `orderId` to refer to this [OrderUuid].
  Future<void> comments(
    final _i1.Session session,
    final OrderUuid orderUuid,
    final List<_i3.CommentInt> commentInt, {
    final _i1.Transaction? transaction,
  }) async {
    if (commentInt.any((final e) => e.id == null)) {
      throw ArgumentError.notNull('commentInt.id');
    }
    if (orderUuid.id == null) {
      throw ArgumentError.notNull('orderUuid.id');
    }

    final $commentInt = commentInt
        .map((final e) => e.copyWith(orderId: orderUuid.id))
        .toList();
    await session.db.update<_i3.CommentInt>(
      $commentInt,
      columns: [_i3.CommentInt.t.orderId],
      transaction: transaction,
    );
  }
}

class OrderUuidAttachRowRepository {
  const OrderUuidAttachRowRepository._();

  /// Creates a relation between the given [OrderUuid] and [CustomerInt]
  /// by setting the [OrderUuid]'s foreign key `customerId` to refer to the [CustomerInt].
  Future<void> customer(
    final _i1.Session session,
    final OrderUuid orderUuid,
    final _i2.CustomerInt customer, {
    final _i1.Transaction? transaction,
  }) async {
    if (orderUuid.id == null) {
      throw ArgumentError.notNull('orderUuid.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    final $orderUuid = orderUuid.copyWith(customerId: customer.id);
    await session.db.updateRow<OrderUuid>(
      $orderUuid,
      columns: [OrderUuid.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [OrderUuid] and the given [CommentInt]
  /// by setting the [CommentInt]'s foreign key `orderId` to refer to this [OrderUuid].
  Future<void> comments(
    final _i1.Session session,
    final OrderUuid orderUuid,
    final _i3.CommentInt commentInt, {
    final _i1.Transaction? transaction,
  }) async {
    if (commentInt.id == null) {
      throw ArgumentError.notNull('commentInt.id');
    }
    if (orderUuid.id == null) {
      throw ArgumentError.notNull('orderUuid.id');
    }

    final $commentInt = commentInt.copyWith(orderId: orderUuid.id);
    await session.db.updateRow<_i3.CommentInt>(
      $commentInt,
      columns: [_i3.CommentInt.t.orderId],
      transaction: transaction,
    );
  }
}
