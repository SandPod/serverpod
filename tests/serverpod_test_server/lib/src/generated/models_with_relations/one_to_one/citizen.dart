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
import '../../models_with_relations/one_to_one/address.dart' as _i2;
import '../../models_with_relations/one_to_one/company.dart' as _i3;

abstract class Citizen
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Citizen._({
    this.id,
    required this.name,
    this.address,
    required this.companyId,
    this.company,
    this.oldCompanyId,
    this.oldCompany,
  });

  factory Citizen({
    final int? id,
    required final String name,
    final _i2.Address? address,
    required final int companyId,
    final _i3.Company? company,
    final int? oldCompanyId,
    final _i3.Company? oldCompany,
  }) = _CitizenImpl;

  factory Citizen.fromJson(final Map<String, dynamic> jsonSerialization) {
    return Citizen(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      address: jsonSerialization['address'] == null
          ? null
          : _i2.Address.fromJson(
              (jsonSerialization['address'] as Map<String, dynamic>),
            ),
      companyId: jsonSerialization['companyId'] as int,
      company: jsonSerialization['company'] == null
          ? null
          : _i3.Company.fromJson(
              (jsonSerialization['company'] as Map<String, dynamic>),
            ),
      oldCompanyId: jsonSerialization['oldCompanyId'] as int?,
      oldCompany: jsonSerialization['oldCompany'] == null
          ? null
          : _i3.Company.fromJson(
              (jsonSerialization['oldCompany'] as Map<String, dynamic>),
            ),
    );
  }

  static final t = CitizenTable();

  static const db = CitizenRepository._();

  @override
  int? id;

  String name;

  _i2.Address? address;

  int companyId;

  _i3.Company? company;

  int? oldCompanyId;

  _i3.Company? oldCompany;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Citizen]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Citizen copyWith({
    final int? id,
    final String? name,
    final _i2.Address? address,
    final int? companyId,
    final _i3.Company? company,
    final int? oldCompanyId,
    final _i3.Company? oldCompany,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (address != null) 'address': address?.toJson(),
      'companyId': companyId,
      if (company != null) 'company': company?.toJson(),
      if (oldCompanyId != null) 'oldCompanyId': oldCompanyId,
      if (oldCompany != null) 'oldCompany': oldCompany?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (address != null) 'address': address?.toJsonForProtocol(),
      'companyId': companyId,
      if (company != null) 'company': company?.toJsonForProtocol(),
      if (oldCompanyId != null) 'oldCompanyId': oldCompanyId,
      if (oldCompany != null) 'oldCompany': oldCompany?.toJsonForProtocol(),
    };
  }

  static CitizenInclude include({
    final _i2.AddressInclude? address,
    final _i3.CompanyInclude? company,
    final _i3.CompanyInclude? oldCompany,
  }) {
    return CitizenInclude._(
      address: address,
      company: company,
      oldCompany: oldCompany,
    );
  }

  static CitizenIncludeList includeList({
    final _i1.WhereExpressionBuilder<CitizenTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<CitizenTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<CitizenTable>? orderByList,
    final CitizenInclude? include,
  }) {
    return CitizenIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Citizen.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Citizen.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CitizenImpl extends Citizen {
  _CitizenImpl({
    final int? id,
    required final String name,
    final _i2.Address? address,
    required final int companyId,
    final _i3.Company? company,
    final int? oldCompanyId,
    final _i3.Company? oldCompany,
  }) : super._(
         id: id,
         name: name,
         address: address,
         companyId: companyId,
         company: company,
         oldCompanyId: oldCompanyId,
         oldCompany: oldCompany,
       );

  /// Returns a shallow copy of this [Citizen]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Citizen copyWith({
    final Object? id = _Undefined,
    final String? name,
    final Object? address = _Undefined,
    final int? companyId,
    final Object? company = _Undefined,
    final Object? oldCompanyId = _Undefined,
    final Object? oldCompany = _Undefined,
  }) {
    return Citizen(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      address: address is _i2.Address? ? address : this.address?.copyWith(),
      companyId: companyId ?? this.companyId,
      company: company is _i3.Company? ? company : this.company?.copyWith(),
      oldCompanyId: oldCompanyId is int? ? oldCompanyId : this.oldCompanyId,
      oldCompany: oldCompany is _i3.Company?
          ? oldCompany
          : this.oldCompany?.copyWith(),
    );
  }
}

class CitizenUpdateTable extends _i1.UpdateTable<CitizenTable> {
  CitizenUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(final String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<int, int> companyId(final int value) => _i1.ColumnValue(
    table.companyId,
    value,
  );

  _i1.ColumnValue<int, int> oldCompanyId(final int? value) => _i1.ColumnValue(
    table.oldCompanyId,
    value,
  );
}

class CitizenTable extends _i1.Table<int?> {
  CitizenTable({super.tableRelation}) : super(tableName: 'citizen') {
    updateTable = CitizenUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    companyId = _i1.ColumnInt(
      'companyId',
      this,
    );
    oldCompanyId = _i1.ColumnInt(
      'oldCompanyId',
      this,
    );
  }

  late final CitizenUpdateTable updateTable;

  late final _i1.ColumnString name;

  _i2.AddressTable? _address;

  late final _i1.ColumnInt companyId;

  _i3.CompanyTable? _company;

  late final _i1.ColumnInt oldCompanyId;

  _i3.CompanyTable? _oldCompany;

  _i2.AddressTable get address {
    if (_address != null) return _address!;
    _address = _i1.createRelationTable(
      relationFieldName: 'address',
      field: Citizen.t.id,
      foreignField: _i2.Address.t.inhabitantId,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i2.AddressTable(tableRelation: foreignTableRelation),
    );
    return _address!;
  }

  _i3.CompanyTable get company {
    if (_company != null) return _company!;
    _company = _i1.createRelationTable(
      relationFieldName: 'company',
      field: Citizen.t.companyId,
      foreignField: _i3.Company.t.id,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i3.CompanyTable(tableRelation: foreignTableRelation),
    );
    return _company!;
  }

  _i3.CompanyTable get oldCompany {
    if (_oldCompany != null) return _oldCompany!;
    _oldCompany = _i1.createRelationTable(
      relationFieldName: 'oldCompany',
      field: Citizen.t.oldCompanyId,
      foreignField: _i3.Company.t.id,
      tableRelation: tableRelation,
      createTable: (final foreignTableRelation) =>
          _i3.CompanyTable(tableRelation: foreignTableRelation),
    );
    return _oldCompany!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    companyId,
    oldCompanyId,
  ];

  @override
  _i1.Table? getRelationTable(final String relationField) {
    if (relationField == 'address') {
      return address;
    }
    if (relationField == 'company') {
      return company;
    }
    if (relationField == 'oldCompany') {
      return oldCompany;
    }
    return null;
  }
}

class CitizenInclude extends _i1.IncludeObject {
  CitizenInclude._({
    final _i2.AddressInclude? address,
    final _i3.CompanyInclude? company,
    final _i3.CompanyInclude? oldCompany,
  }) {
    _address = address;
    _company = company;
    _oldCompany = oldCompany;
  }

  _i2.AddressInclude? _address;

  _i3.CompanyInclude? _company;

  _i3.CompanyInclude? _oldCompany;

  @override
  Map<String, _i1.Include?> get includes => {
    'address': _address,
    'company': _company,
    'oldCompany': _oldCompany,
  };

  @override
  _i1.Table<int?> get table => Citizen.t;
}

class CitizenIncludeList extends _i1.IncludeList {
  CitizenIncludeList._({
    final _i1.WhereExpressionBuilder<CitizenTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Citizen.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Citizen.t;
}

class CitizenRepository {
  const CitizenRepository._();

  final attachRow = const CitizenAttachRowRepository._();

  final detachRow = const CitizenDetachRowRepository._();

  /// Returns a list of [Citizen]s matching the given query parameters.
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
  Future<List<Citizen>> find(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<CitizenTable>? where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<CitizenTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<CitizenTable>? orderByList,
    final _i1.Transaction? transaction,
    final CitizenInclude? include,
  }) async {
    return session.db.find<Citizen>(
      where: where?.call(Citizen.t),
      orderBy: orderBy?.call(Citizen.t),
      orderByList: orderByList?.call(Citizen.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Citizen] matching the given query parameters.
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
  Future<Citizen?> findFirstRow(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<CitizenTable>? where,
    final int? offset,
    final _i1.OrderByBuilder<CitizenTable>? orderBy,
    final bool orderDescending = false,
    final _i1.OrderByListBuilder<CitizenTable>? orderByList,
    final _i1.Transaction? transaction,
    final CitizenInclude? include,
  }) async {
    return session.db.findFirstRow<Citizen>(
      where: where?.call(Citizen.t),
      orderBy: orderBy?.call(Citizen.t),
      orderByList: orderByList?.call(Citizen.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Citizen] by its [id] or null if no such row exists.
  Future<Citizen?> findById(
    final _i1.Session session,
    final int id, {
    final _i1.Transaction? transaction,
    final CitizenInclude? include,
  }) async {
    return session.db.findById<Citizen>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Citizen]s in the list and returns the inserted rows.
  ///
  /// The returned [Citizen]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Citizen>> insert(
    final _i1.Session session,
    final List<Citizen> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Citizen>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Citizen] and returns the inserted row.
  ///
  /// The returned [Citizen] will have its `id` field set.
  Future<Citizen> insertRow(
    final _i1.Session session,
    final Citizen row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Citizen>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Citizen]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Citizen>> update(
    final _i1.Session session,
    final List<Citizen> rows, {
    final _i1.ColumnSelections<CitizenTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.update<Citizen>(
      rows,
      columns: columns?.call(Citizen.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Citizen]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Citizen> updateRow(
    final _i1.Session session,
    final Citizen row, {
    final _i1.ColumnSelections<CitizenTable>? columns,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Citizen>(
      row,
      columns: columns?.call(Citizen.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Citizen] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Citizen?> updateById(
    final _i1.Session session,
    final int id, {
    required final _i1.ColumnValueListBuilder<CitizenUpdateTable> columnValues,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Citizen>(
      id,
      columnValues: columnValues(Citizen.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Citizen]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Citizen>> updateWhere(
    final _i1.Session session, {
    required final _i1.ColumnValueListBuilder<CitizenUpdateTable> columnValues,
    required final _i1.WhereExpressionBuilder<CitizenTable> where,
    final int? limit,
    final int? offset,
    final _i1.OrderByBuilder<CitizenTable>? orderBy,
    final _i1.OrderByListBuilder<CitizenTable>? orderByList,
    final bool orderDescending = false,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Citizen>(
      columnValues: columnValues(Citizen.t.updateTable),
      where: where(Citizen.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Citizen.t),
      orderByList: orderByList?.call(Citizen.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Citizen]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Citizen>> delete(
    final _i1.Session session,
    final List<Citizen> rows, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Citizen>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Citizen].
  Future<Citizen> deleteRow(
    final _i1.Session session,
    final Citizen row, {
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Citizen>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Citizen>> deleteWhere(
    final _i1.Session session, {
    required final _i1.WhereExpressionBuilder<CitizenTable> where,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Citizen>(
      where: where(Citizen.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    final _i1.Session session, {
    final _i1.WhereExpressionBuilder<CitizenTable>? where,
    final int? limit,
    final _i1.Transaction? transaction,
  }) async {
    return session.db.count<Citizen>(
      where: where?.call(Citizen.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CitizenAttachRowRepository {
  const CitizenAttachRowRepository._();

  /// Creates a relation between the given [Citizen] and [Address]
  /// by setting the [Citizen]'s foreign key `id` to refer to the [Address].
  Future<void> address(
    final _i1.Session session,
    final Citizen citizen,
    final _i2.Address address, {
    final _i1.Transaction? transaction,
  }) async {
    if (address.id == null) {
      throw ArgumentError.notNull('address.id');
    }
    if (citizen.id == null) {
      throw ArgumentError.notNull('citizen.id');
    }

    final $address = address.copyWith(inhabitantId: citizen.id);
    await session.db.updateRow<_i2.Address>(
      $address,
      columns: [_i2.Address.t.inhabitantId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Citizen] and [Company]
  /// by setting the [Citizen]'s foreign key `companyId` to refer to the [Company].
  Future<void> company(
    final _i1.Session session,
    final Citizen citizen,
    final _i3.Company company, {
    final _i1.Transaction? transaction,
  }) async {
    if (citizen.id == null) {
      throw ArgumentError.notNull('citizen.id');
    }
    if (company.id == null) {
      throw ArgumentError.notNull('company.id');
    }

    final $citizen = citizen.copyWith(companyId: company.id);
    await session.db.updateRow<Citizen>(
      $citizen,
      columns: [Citizen.t.companyId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Citizen] and [Company]
  /// by setting the [Citizen]'s foreign key `oldCompanyId` to refer to the [Company].
  Future<void> oldCompany(
    final _i1.Session session,
    final Citizen citizen,
    final _i3.Company oldCompany, {
    final _i1.Transaction? transaction,
  }) async {
    if (citizen.id == null) {
      throw ArgumentError.notNull('citizen.id');
    }
    if (oldCompany.id == null) {
      throw ArgumentError.notNull('oldCompany.id');
    }

    final $citizen = citizen.copyWith(oldCompanyId: oldCompany.id);
    await session.db.updateRow<Citizen>(
      $citizen,
      columns: [Citizen.t.oldCompanyId],
      transaction: transaction,
    );
  }
}

class CitizenDetachRowRepository {
  const CitizenDetachRowRepository._();

  /// Detaches the relation between this [Citizen] and the [Address] set in `address`
  /// by setting the [Citizen]'s foreign key `id` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> address(
    final _i1.Session session,
    final Citizen citizen, {
    final _i1.Transaction? transaction,
  }) async {
    final $address = citizen.address;

    if ($address == null) {
      throw ArgumentError.notNull('citizen.address');
    }
    if ($address.id == null) {
      throw ArgumentError.notNull('citizen.address.id');
    }
    if (citizen.id == null) {
      throw ArgumentError.notNull('citizen.id');
    }

    final $$address = $address.copyWith(inhabitantId: null);
    await session.db.updateRow<_i2.Address>(
      $$address,
      columns: [_i2.Address.t.inhabitantId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Citizen] and the [Company] set in `oldCompany`
  /// by setting the [Citizen]'s foreign key `oldCompanyId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> oldCompany(
    final _i1.Session session,
    final Citizen citizen, {
    final _i1.Transaction? transaction,
  }) async {
    if (citizen.id == null) {
      throw ArgumentError.notNull('citizen.id');
    }

    final $citizen = citizen.copyWith(oldCompanyId: null);
    await session.db.updateRow<Citizen>(
      $citizen,
      columns: [Citizen.t.oldCompanyId],
      transaction: transaction,
    );
  }
}
