/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: non_constant_identifier_names

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class ObjectWithDuration extends _i1.TableRow {
  ObjectWithDuration._({
    int? id,
    required this.duration,
  }) : super(id);

  factory ObjectWithDuration({
    int? id,
    required Duration duration,
  }) = _ObjectWithDurationImpl;

  factory ObjectWithDuration.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ObjectWithDuration(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      duration: serializationManager
          .deserialize<Duration>(jsonSerialization['duration']),
    );
  }

  static final t = ObjectWithDurationTable();

  Duration duration;

  @override
  _i1.Table get table => t;
  ObjectWithDuration copyWith({
    int? id,
    Duration? duration,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'duration': duration,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'duration': duration,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'duration': duration,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'duration':
        duration = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<ObjectWithDuration>> find(
    _i1.Session session, {
    ObjectWithDurationExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ObjectWithDuration>(
      where: where != null ? where(ObjectWithDuration.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ObjectWithDuration?> findSingleRow(
    _i1.Session session, {
    ObjectWithDurationExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<ObjectWithDuration>(
      where: where != null ? where(ObjectWithDuration.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ObjectWithDuration?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<ObjectWithDuration>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ObjectWithDurationExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ObjectWithDuration>(
      where: where(ObjectWithDuration.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    ObjectWithDuration row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    ObjectWithDuration row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    ObjectWithDuration row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ObjectWithDurationExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ObjectWithDuration>(
      where: where != null ? where(ObjectWithDuration.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static ObjectWithDurationInclude include() {
    return ObjectWithDurationInclude._();
  }
}

class _Undefined {}

class _ObjectWithDurationImpl extends ObjectWithDuration {
  _ObjectWithDurationImpl({
    int? id,
    required Duration duration,
  }) : super._(
          id: id,
          duration: duration,
        );

  @override
  ObjectWithDuration copyWith({
    Object? id = _Undefined,
    Duration? duration,
  }) {
    return ObjectWithDuration(
      id: id is int? ? id : this.id,
      duration: duration ?? this.duration,
    );
  }
}

typedef ObjectWithDurationExpressionBuilder = _i1.Expression Function(
    ObjectWithDurationTable);

class ObjectWithDurationTable extends _i1.Table {
  ObjectWithDurationTable({
    super.queryPrefix,
    super.tableRelations,
  }) : super(tableName: 'object_with_duration') {
    duration = _i1.ColumnDuration(
      'duration',
      queryPrefix: super.queryPrefix,
      tableRelations: super.tableRelations,
    );
  }

  late final _i1.ColumnDuration duration;

  @override
  List<_i1.Column> get columns => [
        id,
        duration,
      ];
}

@Deprecated('Use ObjectWithDurationTable.t instead.')
ObjectWithDurationTable tObjectWithDuration = ObjectWithDurationTable();

class ObjectWithDurationInclude extends _i1.Include {
  ObjectWithDurationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};
  @override
  _i1.Table get table => ObjectWithDuration.t;
}
