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

import '../../long_identifiers/deep_includes/organization_with_long_table_name.dart'
    as _i3;
import '../../long_identifiers/deep_includes/person_with_long_table_name.dart'
    as _i2;

abstract class CityWithLongTableName
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CityWithLongTableName._({
    this.id,
    required this.name,
    this.citizens,
    this.organizations,
  });

  factory CityWithLongTableName({
    final int? id,
    required final String name,
    final List<_i2.PersonWithLongTableName>? citizens,
    final List<_i3.OrganizationWithLongTableName>? organizations,
  }) = _CityWithLongTableNameImpl;

  factory CityWithLongTableName.fromJson(
    final Map<String, dynamic> jsonSerialization,
  ) {
    return CityWithLongTableName(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      citizens: (jsonSerialization['citizens'] as List?)
          ?.map(
            (final e) => _i2.PersonWithLongTableName.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      organizations: (jsonSerialization['organizations'] as List?)
          ?.map(
            (final e) => _i3.OrganizationWithLongTableName.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
    );
  }

  static final t = CityWithLongTableNameTable();

  static const db = CityWithLongTableNameRepository._();

  @override
  int? id;

  String name;

  List<_i2.PersonWithLongTableName>? citizens;

  List<_i3.OrganizationWithLongTableName>? organizations;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CityWithLongTableName]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CityWithLongTableName copyWith({
    final int? id,
    final String? name,
    final List<_i2.PersonWithLongTableName>? citizens,
    final List<_i3.OrganizationWithLongTableName>? organizations,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (citizens != null)
        'citizens': citizens?.toJson(valueToJson: (final v) => v.toJson()),
      if (organizations != null)
        'organizations': organizations?.toJson(valueToJson: (final v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (citizens != null)
        'citizens': citizens?.toJson(valueToJson: (final v) => v.toJsonForProtocol()),
      if (organizations != null)
        'organizations': organizations?.toJson(
          valueToJson: (final v) => v.toJsonForProtocol(),
        ),
    };
  }

  static CityWithLongTableNameInclude include({
    final _i2.PersonWithLongTableNameIncludeList? citizens,
    final _i3.OrganizationWithLongTableNameIncludeList? organizations,
  }) {
    return CityWithLongTableNameInclude._(
      citizens: citizens,
      organizations: organizations,
    );
  }

  static CityWithLongTableNameIncludeList includeList({
    final _i1.WhereExpressionBuilder<CityWithLongTableNameTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<CityWithLongTableNameTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<CityWithLongTableNameTable>? orderByList,
    final CityWithLongTableNameInclude? include,
  }) {
    return CityWithLongTableNameIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CityWithLongTableName.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CityWithLongTableName.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CityWithLongTableNameImpl extends CityWithLongTableName {
  _CityWithLongTableNameImpl({
    final int? id,
    required final String name,
    final List<_i2.PersonWithLongTableName>? citizens,
    final List<_i3.OrganizationWithLongTableName>? organizations,
  }) : super._(
         id: id,
         name: name,
         citizens: citizens,
         organizations: organizations,
       );

  /// Returns a shallow copy of this [CityWithLongTableName]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CityWithLongTableName copyWith({
    final Object? id = _Undefined,
    final String? name,
    final Object? citizens = _Undefined,
    final Object? organizations = _Undefined,
  }) {
    return CityWithLongTableName(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      citizens: citizens is List<_i2.PersonWithLongTableName>?
          ? citizens
          : this.citizens?.map((final e0) => e0.copyWith()).toList(),
      organizations: organizations is List<_i3.OrganizationWithLongTableName>?
          ? organizations
          : this.organizations?.map((final e0) => e0.copyWith()).toList(),
    );
  }
}

class CityWithLongTableNameUpdateTable
    extends _i1.UpdateTable<CityWithLongTableNameTable> {
  CityWithLongTableNameUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(final String value) => _i1.ColumnValue(
    table.name,
    value,
  );
}

class CityWithLongTableNameTable extends _i1.Table<int?> {
  CityWithLongTableNameTable({super.tableRelation})
    : super(tableName: 'city_with_long_table_name_that_is_still_valid') {
    updateTable = CityWithLongTableNameUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
  }

  late final CityWithLongTableNameUpdateTable updateTable;

  late final _i1.ColumnString name;

  _i2.PersonWithLongTableNameTable? ___citizens;

  _i1.ManyRelation<_i2.PersonWithLongTableNameTable>? _citizens;

  _i3.OrganizationWithLongTableNameTable? ___organizations;

  _i1.ManyRelation<_i3.OrganizationWithLongTableNameTable>? _organizations;

  _i2.PersonWithLongTableNameTable get __citizens {
    if (___citizens != null) return ___citizens!;
    ___citizens = _i1.createRelationTable(
      relationFieldName: '__citizens',
      field: CityWithLongTableName.t.id,
      foreignField: _i2
          .PersonWithLongTableName
          .t
          .$_cityWithLongTableNameThatIsStillValidCitizensCityWithLon4fe0Id,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i2.PersonWithLongTableNameTable(tableRelation: foreignTableRelation),
    );
    return ___citizens!;
  }

  _i3.OrganizationWithLongTableNameTable get __organizations {
    if (___organizations != null) return ___organizations!;
    ___organizations = _i1.createRelationTable(
      relationFieldName: '__organizations',
      field: CityWithLongTableName.t.id,
      foreignField: _i3.OrganizationWithLongTableName.t.cityId,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i3.OrganizationWithLongTableNameTable(
            tableRelation: foreignTableRelation,
          ),
    );
    return ___organizations!;
  }

  _i1.ManyRelation<_i2.PersonWithLongTableNameTable> get citizens {
    if (_citizens != null) return _citizens!;
    final relationTable = _i1.createRelationTable(
      relationFieldName: 'citizens',
      field: CityWithLongTableName.t.id,
      foreignField: _i2
          .PersonWithLongTableName
          .t
          .$_cityWithLongTableNameThatIsStillValidCitizensCityWithLon4fe0Id,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i2.PersonWithLongTableNameTable(tableRelation: foreignTableRelation),
    );
    _citizens = _i1.ManyRelation<_i2.PersonWithLongTableNameTable>(
      tableWithRelations: relationTable,
      table: _i2.PersonWithLongTableNameTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _citizens!;
  }

  _i1.ManyRelation<_i3.OrganizationWithLongTableNameTable> get organizations {
    if (_organizations != null) return _organizations!;
    final relationTable = _i1.createRelationTable(
      relationFieldName: 'organizations',
      field: CityWithLongTableName.t.id,
      foreignField: _i3.OrganizationWithLongTableName.t.cityId,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i3.OrganizationWithLongTableNameTable(
            tableRelation: foreignTableRelation,
          ),
    );
    _organizations = _i1.ManyRelation<_i3.OrganizationWithLongTableNameTable>(
      tableWithRelations: relationTable,
      table: _i3.OrganizationWithLongTableNameTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _organizations!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    name,
  ];

  @override
  _i1.Table? getRelationTable(final String relationField) {
    if (relationField == 'citizens') {
      return __citizens;
    }
    if (relationField == 'organizations') {
      return __organizations;
    }
    return null;
  }
}

class CityWithLongTableNameInclude extends _i1.IncludeObject {
  CityWithLongTableNameInclude._({
    final _i2.PersonWithLongTableNameIncludeList? citizens,
    final _i3.OrganizationWithLongTableNameIncludeList? organizations,
  }) {
    _citizens = citizens;
    _organizations = organizations;
  }

  _i2.PersonWithLongTableNameIncludeList? _citizens;

  _i3.OrganizationWithLongTableNameIncludeList? _organizations;

  @override
  Map<String, _i1.Include?> get includes => {
    'citizens': _citizens,
    'organizations': _organizations,
  };

  @override
  _i1.Table<int?> get table => CityWithLongTableName.t;
}

class CityWithLongTableNameIncludeList extends _i1.IncludeList {
  CityWithLongTableNameIncludeList._({
    final _i1.WhereExpressionBuilder<CityWithLongTableNameTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CityWithLongTableName.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CityWithLongTableName.t;
}

class CityWithLongTableNameRepository {
  const CityWithLongTableNameRepository._();

  final attach = const CityWithLongTableNameAttachRepository._();

  final attachRow = const CityWithLongTableNameAttachRowRepository._();

  final detach = const CityWithLongTableNameDetachRepository._();

  final detachRow = const CityWithLongTableNameDetachRowRepository._();

  /// Returns a list of [CityWithLongTableName]s matching the given query parameters.
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
  Future<List<CityWithLongTableName>> find(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<CityWithLongTableNameTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<CityWithLongTableNameTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<CityWithLongTableNameTable>? orderByList,
    final _i1.Transaction? transaction,
    final CityWithLongTableNameInclude? include,
  }) async {
    return session.db.find<CityWithLongTableName>(
      where: where?.call(CityWithLongTableName.t),
      orderBy: orderBy?.call(CityWithLongTableName.t),
      orderByList: orderByList?.call(CityWithLongTableName.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [CityWithLongTableName] matching the given query parameters.
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
  Future<CityWithLongTableName?> findFirstRow(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<CityWithLongTableNameTable>? where,
    final int? offset,
    final _i1.OrderByBuilder<CityWithLongTableNameTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<CityWithLongTableNameTable>? orderByList,
    final _i1.Transaction? transaction,
    final CityWithLongTableNameInclude? include,
  }) async {
    return session.db.findFirstRow<CityWithLongTableName>(
      where: where?.call(CityWithLongTableName.t),
      orderBy: orderBy?.call(CityWithLongTableName.t),
      orderByList: orderByList?.call(CityWithLongTableName.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [CityWithLongTableName] by its [id] or null if no such row exists.
  Future<CityWithLongTableName?> findById(
    final _i1.Session session,
    final int id, {
    final _i1.Transaction? transaction,
    final CityWithLongTableNameInclude? include,
  }) async {
    return session.db.findById<CityWithLongTableName>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [CityWithLongTableName]s in the list and returns the inserted rows.
  ///
  /// The returned [CityWithLongTableName]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CityWithLongTableName>> insert(
    final _i1.Session session,
    final List<CityWithLongTableName> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CityWithLongTableName>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CityWithLongTableName] and returns the inserted row.
  ///
  /// The returned [CityWithLongTableName] will have its `id` field set.
  Future<CityWithLongTableName> insertRow(
    final _i1.Session session,
    final CityWithLongTableName row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CityWithLongTableName>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CityWithLongTableName]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CityWithLongTableName>> update(
    final _i1.Session session,
    final List<CityWithLongTableName> rows, {
    final _i1.ColumnSelections<CityWithLongTableNameTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.update<CityWithLongTableName>(
      rows,
      columns: columns?.call(CityWithLongTableName.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CityWithLongTableName]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CityWithLongTableName> updateRow(
    final _i1.Session session,
    final CityWithLongTableName row, {
    final _i1.ColumnSelections<CityWithLongTableNameTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CityWithLongTableName>(
      row,
      columns: columns?.call(CityWithLongTableName.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CityWithLongTableName] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CityWithLongTableName?> updateById(
    final _i1.Session session,
    final int id, {
    required final _i1.ColumnValueListBuilder<CityWithLongTableNameUpdateTable>
    columnValues,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CityWithLongTableName>(
      id,
      columnValues: columnValues(CityWithLongTableName.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CityWithLongTableName]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CityWithLongTableName>> updateWhere(
    final _i1.Session session, {
    required final _i1.ColumnValueListBuilder<CityWithLongTableNameUpdateTable>
    columnValues,
    required final _i1.WhereExpressionBuilder<CityWithLongTableNameTable> where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<CityWithLongTableNameTable>? orderBy,
    final _i1.OrderByListBuilder<CityWithLongTableNameTable>? orderByList,
    final bool orderDescending = false,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CityWithLongTableName>(
      columnValues: columnValues(CityWithLongTableName.t.updateTable),
      where: where(CityWithLongTableName.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CityWithLongTableName.t),
      orderByList: orderByList?.call(CityWithLongTableName.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CityWithLongTableName]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CityWithLongTableName>> delete(
    final _i1.Session session,
    final List<CityWithLongTableName> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CityWithLongTableName>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CityWithLongTableName].
  Future<CityWithLongTableName> deleteRow(
    final _i1.Session session,
    final CityWithLongTableName row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CityWithLongTableName>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CityWithLongTableName>> deleteWhere(
    final _i1.Session session, {
    required final _i1.WhereExpressionBuilder<CityWithLongTableNameTable> where,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CityWithLongTableName>(
      where: where(CityWithLongTableName.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<CityWithLongTableNameTable>? where,
    final int? limit,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.count<CityWithLongTableName>(
      where: where?.call(CityWithLongTableName.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CityWithLongTableNameAttachRepository {
  const CityWithLongTableNameAttachRepository._();

  /// Creates a relation between this [CityWithLongTableName] and the given [PersonWithLongTableName]s
  /// by setting each [PersonWithLongTableName]'s foreign key `_cityWithLongTableNameThatIsStillValidCitizensCityWithLon4fe0Id` to refer to this [CityWithLongTableName].
  Future<void> citizens(
    final _i1.Session session,
    final CityWithLongTableName cityWithLongTableName,
    final List<_i2.PersonWithLongTableName> personWithLongTableName, {
    final _i1.Transaction? transaction,
  }) async {
    if (personWithLongTableName.any((final e) => e.id == null)) {
      throw ArgumentError.notNull('personWithLongTableName.id');
    }
    if (cityWithLongTableName.id == null) {
      throw ArgumentError.notNull('cityWithLongTableName.id');
    }

    final $personWithLongTableName = personWithLongTableName
        .map(
          (final e) => _i2.PersonWithLongTableNameImplicit(
            e,
            $_cityWithLongTableNameThatIsStillValidCitizensCityWithLon4fe0Id:
                cityWithLongTableName.id,
          ),
        )
        .toList();
    await session.db.update<_i2.PersonWithLongTableName>(
      $personWithLongTableName,
      columns: [
        _i2
            .PersonWithLongTableName
            .t
            .$_cityWithLongTableNameThatIsStillValidCitizensCityWithLon4fe0Id,
      ],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [CityWithLongTableName] and the given [OrganizationWithLongTableName]s
  /// by setting each [OrganizationWithLongTableName]'s foreign key `cityId` to refer to this [CityWithLongTableName].
  Future<void> organizations(
    final _i1.Session session,
    final CityWithLongTableName cityWithLongTableName,
    final List<_i3.OrganizationWithLongTableName> organizationWithLongTableName, {
    final _i1.Transaction? transaction,
  }) async {
    if (organizationWithLongTableName.any((final e) => e.id == null)) {
      throw ArgumentError.notNull('organizationWithLongTableName.id');
    }
    if (cityWithLongTableName.id == null) {
      throw ArgumentError.notNull('cityWithLongTableName.id');
    }

    final $organizationWithLongTableName = organizationWithLongTableName
        .map((final e) => e.copyWith(cityId: cityWithLongTableName.id))
        .toList();
    await session.db.update<_i3.OrganizationWithLongTableName>(
      $organizationWithLongTableName,
      columns: [_i3.OrganizationWithLongTableName.t.cityId],
      transaction: transaction,
    );
  }
}

class CityWithLongTableNameAttachRowRepository {
  const CityWithLongTableNameAttachRowRepository._();

  /// Creates a relation between this [CityWithLongTableName] and the given [PersonWithLongTableName]
  /// by setting the [PersonWithLongTableName]'s foreign key `_cityWithLongTableNameThatIsStillValidCitizensCityWithLon4fe0Id` to refer to this [CityWithLongTableName].
  Future<void> citizens(
    final _i1.Session session,
    final CityWithLongTableName cityWithLongTableName,
    final _i2.PersonWithLongTableName personWithLongTableName, {
    final _i1.Transaction? transaction,
  }) async {
    if (personWithLongTableName.id == null) {
      throw ArgumentError.notNull('personWithLongTableName.id');
    }
    if (cityWithLongTableName.id == null) {
      throw ArgumentError.notNull('cityWithLongTableName.id');
    }

    final $personWithLongTableName = _i2.PersonWithLongTableNameImplicit(
      personWithLongTableName,
      $_cityWithLongTableNameThatIsStillValidCitizensCityWithLon4fe0Id:
          cityWithLongTableName.id,
    );
    await session.db.updateRow<_i2.PersonWithLongTableName>(
      $personWithLongTableName,
      columns: [
        _i2
            .PersonWithLongTableName
            .t
            .$_cityWithLongTableNameThatIsStillValidCitizensCityWithLon4fe0Id,
      ],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [CityWithLongTableName] and the given [OrganizationWithLongTableName]
  /// by setting the [OrganizationWithLongTableName]'s foreign key `cityId` to refer to this [CityWithLongTableName].
  Future<void> organizations(
    final _i1.Session session,
    final CityWithLongTableName cityWithLongTableName,
    final _i3.OrganizationWithLongTableName organizationWithLongTableName, {
    final _i1.Transaction? transaction,
  }) async {
    if (organizationWithLongTableName.id == null) {
      throw ArgumentError.notNull('organizationWithLongTableName.id');
    }
    if (cityWithLongTableName.id == null) {
      throw ArgumentError.notNull('cityWithLongTableName.id');
    }

    final $organizationWithLongTableName = organizationWithLongTableName.copyWith(
      cityId: cityWithLongTableName.id,
    );
    await session.db.updateRow<_i3.OrganizationWithLongTableName>(
      $organizationWithLongTableName,
      columns: [_i3.OrganizationWithLongTableName.t.cityId],
      transaction: transaction,
    );
  }
}

class CityWithLongTableNameDetachRepository {
  const CityWithLongTableNameDetachRepository._();

  /// Detaches the relation between this [CityWithLongTableName] and the given [PersonWithLongTableName]
  /// by setting the [PersonWithLongTableName]'s foreign key `_cityWithLongTableNameThatIsStillValidCitizensCityWithLon4fe0Id` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> citizens(
    final _i1.Session session,
    final List<_i2.PersonWithLongTableName> personWithLongTableName, {
    final _i1.Transaction? transaction,
  }) async {
    if (personWithLongTableName.any((final e) => e.id == null)) {
      throw ArgumentError.notNull('personWithLongTableName.id');
    }

    final $personWithLongTableName = personWithLongTableName
        .map(
          (final e) => _i2.PersonWithLongTableNameImplicit(
            e,
            $_cityWithLongTableNameThatIsStillValidCitizensCityWithLon4fe0Id:
                null,
          ),
        )
        .toList();
    await session.db.update<_i2.PersonWithLongTableName>(
      $personWithLongTableName,
      columns: [
        _i2
            .PersonWithLongTableName
            .t
            .$_cityWithLongTableNameThatIsStillValidCitizensCityWithLon4fe0Id,
      ],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [CityWithLongTableName] and the given [OrganizationWithLongTableName]
  /// by setting the [OrganizationWithLongTableName]'s foreign key `cityId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> organizations(
    final _i1.Session session,
    final List<_i3.OrganizationWithLongTableName> organizationWithLongTableName, {
    final _i1.Transaction? transaction,
  }) async {
    if (organizationWithLongTableName.any((final e) => e.id == null)) {
      throw ArgumentError.notNull('organizationWithLongTableName.id');
    }

    final $organizationWithLongTableName = organizationWithLongTableName
        .map((final e) => e.copyWith(cityId: null))
        .toList();
    await session.db.update<_i3.OrganizationWithLongTableName>(
      $organizationWithLongTableName,
      columns: [_i3.OrganizationWithLongTableName.t.cityId],
      transaction: transaction,
    );
  }
}

class CityWithLongTableNameDetachRowRepository {
  const CityWithLongTableNameDetachRowRepository._();

  /// Detaches the relation between this [CityWithLongTableName] and the given [PersonWithLongTableName]
  /// by setting the [PersonWithLongTableName]'s foreign key `_cityWithLongTableNameThatIsStillValidCitizensCityWithLon4fe0Id` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> citizens(
    final _i1.Session session,
    final _i2.PersonWithLongTableName personWithLongTableName, {
    final _i1.Transaction? transaction,
  }) async {
    if (personWithLongTableName.id == null) {
      throw ArgumentError.notNull('personWithLongTableName.id');
    }

    final $personWithLongTableName = _i2.PersonWithLongTableNameImplicit(
      personWithLongTableName,
      $_cityWithLongTableNameThatIsStillValidCitizensCityWithLon4fe0Id: null,
    );
    await session.db.updateRow<_i2.PersonWithLongTableName>(
      $personWithLongTableName,
      columns: [
        _i2
            .PersonWithLongTableName
            .t
            .$_cityWithLongTableNameThatIsStillValidCitizensCityWithLon4fe0Id,
      ],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [CityWithLongTableName] and the given [OrganizationWithLongTableName]
  /// by setting the [OrganizationWithLongTableName]'s foreign key `cityId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> organizations(
    final _i1.Session session,
    final _i3.OrganizationWithLongTableName organizationWithLongTableName, {
    final _i1.Transaction? transaction,
  }) async {
    if (organizationWithLongTableName.id == null) {
      throw ArgumentError.notNull('organizationWithLongTableName.id');
    }

    final $organizationWithLongTableName = organizationWithLongTableName.copyWith(
      cityId: null,
    );
    await session.db.updateRow<_i3.OrganizationWithLongTableName>(
      $organizationWithLongTableName,
      columns: [_i3.OrganizationWithLongTableName.t.cityId],
      transaction: transaction,
    );
  }
}
