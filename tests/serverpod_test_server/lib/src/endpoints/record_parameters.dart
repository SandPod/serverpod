import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_module_server/serverpod_test_module_server.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

typedef _MixedRecordTypeDef = (int number, {SimpleData data});

class RecordParametersEndpoint extends Endpoint {
  // #region Records with single positional parameter (required and nullable)
  Future<(int,)> returnRecordOfInt(final Session session, final (int,) record) async {
    return record;
  }

  Future<(int,)?> returnNullableRecordOfInt(
    final Session session,
    final (int,)? record,
  ) async {
    return record;
  }

  Future<(int?,)> returnRecordOfNullableInt(
    final Session session,
    final (int?,) record,
  ) async {
    return record;
  }

  Future<(int?,)?> returnNullableRecordOfNullableInt(
    final Session session,
    final (int?,)? record,
  ) async {
    return record;
  }

  Stream<(int?,)?> streamNullableRecordOfNullableInt(
    final Session session,
    final Stream<(int?,)?> values,
  ) async* {
    await for (final value in values) {
      yield value;
    }
  }
  // #endregion

  // #region Records with multiple positional parameters
  Future<(int, String)> returnIntStringRecord(
    final Session session,
    final (int, String) record,
  ) async {
    return record;
  }

  Future<(int, String)?> returnNullableIntStringRecord(
    final Session session,
    final (int, String)? record,
  ) async {
    return record;
  }

  Future<(int, SimpleData)> returnIntSimpleDataRecord(
    final Session session,
    final (int, SimpleData) record,
  ) async {
    return record;
  }

  Future<(int, SimpleData)?> returnNullableIntSimpleDataRecord(
    final Session session,
    final (int, SimpleData)? record,
  ) async {
    return record;
  }

  Future<(Map<String, int>,)> returnStringKeyedMapRecord(
    final Session session,
    final (Map<String, int>,) record,
  ) async {
    return record;
  }

  Future<(Map<int, int>,)> returnNonStringKeyedMapRecord(
    final Session session,
    final (Map<int, int>,) record,
  ) async {
    return record;
  }

  Future<(Set<(int,)>,)> returnSetWithNestedRecordRecord(
    final Session session,
    final (Set<(int,)>,) record,
  ) async {
    return record;
  }
  // #endregion

  // #region Records with named parameters
  Future<({int number, String text})> returnNamedIntStringRecord(
    final Session session,
    final ({int number, String text}) record,
  ) async {
    return record;
  }

  Future<({int number, String text})?> returnNamedNullableIntStringRecord(
    final Session session,
    final ({int number, String text})? record,
  ) async {
    return record;
  }

  Future<({int number, SimpleData data})> returnRecordOfNamedIntAndObject(
    final Session session,
    final ({int number, SimpleData data}) record,
  ) async {
    return record;
  }

  Future<({int number, SimpleData data})?>
  returnNullableRecordOfNamedIntAndObject(
    final Session session,
    final ({int number, SimpleData data})? record,
  ) async {
    return record;
  }

  Future<({int? number, SimpleData? data})>
  returnRecordOfNamedNullableIntAndNullableObject(
    final Session session,
    final ({int? number, SimpleData? data}) record,
  ) async {
    return record;
  }

  Future<({Map<int, int> intIntMap})> returnNamedNonStringKeyedMapRecord(
    final Session session,
    final ({Map<int, int> intIntMap}) record,
  ) async {
    return record;
  }

  Future<({Set<(bool,)> boolSet})> returnNamedSetWithNestedRecordRecord(
    final Session session,
    final ({Set<(bool,)> boolSet}) record,
  ) async {
    return record;
  }

  Future<(Map<(Map<int, String>, String), String>,)>
  returnNestedNonStringKeyedMapInsideRecordInsideMapInsideRecord(
    final Session session,
    final (Map<(Map<int, String>, String), String>,) map,
  ) async {
    return map;
  }
  // #endregion

  // #region Records using a `typedef`, pointing to positional and named parameters
  Future<_MixedRecordTypeDef> returnRecordTypedef(
    final Session session,
    final _MixedRecordTypeDef record,
  ) async {
    return record;
  }

  Future<_MixedRecordTypeDef?> returnNullableRecordTypedef(
    final Session session,
    final _MixedRecordTypeDef? record,
  ) async {
    return record;
  }
  // #endregion

  // #region Records inside `List`s
  Future<List<(int, SimpleData)>> returnListOfIntSimpleDataRecord(
    final Session session,
    final List<(int, SimpleData)> recordList,
  ) async {
    return recordList;
  }

  Future<List<(int, SimpleData)?>> returnListOfNullableIntSimpleDataRecord(
    final Session session,
    final List<(int, SimpleData)?> record,
  ) async {
    return record;
  }
  // #endregion

  // #region Records inside `Set`s
  Future<Set<(int, SimpleData)>> returnSetOfIntSimpleDataRecord(
    final Session session,
    final Set<(int, SimpleData)> recordSet,
  ) async {
    return recordSet;
  }

  Future<Set<(int, SimpleData)?>> returnSetOfNullableIntSimpleDataRecord(
    final Session session,
    final Set<(int, SimpleData)?> set,
  ) async {
    return set;
  }

  Future<Set<(int, SimpleData)>?> returnNullableSetOfIntSimpleDataRecord(
    final Session session,
    final Set<(int, SimpleData)>? recordSet,
  ) async {
    return recordSet;
  }
  // #endregion

  // #region Records inside `Map`s
  Future<Map<String, (int, SimpleData)>> returnStringMapOfIntSimpleDataRecord(
    final Session session,
    final Map<String, (int, SimpleData)> map,
  ) async {
    return map;
  }

  Future<Map<String, (int, SimpleData)?>>
  returnStringMapOfNullableIntSimpleDataRecord(
    final Session session,
    final Map<String, (int, SimpleData)?> map,
  ) async {
    return map;
  }

  Future<Map<(String, int), (int, SimpleData)>>
  returnRecordMapOfIntSimpleDataRecord(
    final Session session,
    final Map<(String, int), (int, SimpleData)> map,
  ) async {
    return map;
  }
  // #endregion

  // #region Complex nested container structure
  /// Returns the first and only input value mapped into the return structure (basically reversed)
  Future<Map<String, List<Set<(int,)>>>> returnStringMapOfListOfRecord(
    final Session session,
    // This type is only used in a parameter postion, ensuring that we generate those as well
    final Set<List<Map<String, (int,)>>> input,
  ) async {
    final key = input.single.single.keys.single;
    final value = input.single.single.values.single.$1;

    return {
      key: [
        {
          (value,),
        },
      ],
    };
  }
  // #endregion

  // #region Records with nested records
  Future<({(SimpleData, double) namedSubRecord})> returnNestedNamedRecord(
    final Session session,
    final ({(SimpleData, double) namedSubRecord}) record,
  ) async {
    return record;
  }

  Future<({(SimpleData, double)? namedSubRecord})>
  returnNestedNullableNamedRecord(
    final Session session,
    final ({(SimpleData, double)? namedSubRecord}) record,
  ) async {
    return record;
  }

  Future<((int, String), {(SimpleData, double) namedSubRecord})>
  returnNestedPositionalAndNamedRecord(
    final Session session,
    final ((int, String), {(SimpleData, double) namedSubRecord}) record,
  ) async {
    return record;
  }

  Future<List<((int, String), {(SimpleData, double) namedSubRecord})>>
  returnListOfNestedPositionalAndNamedRecord(
    final Session session,
    final List<((int, String), {(SimpleData, double) namedSubRecord})> recordList,
  ) async {
    return recordList;
  }

  Stream<List<((int, String), {(SimpleData, double) namedSubRecord})?>?>
  streamNullableListOfNullableNestedPositionalAndNamedRecord(
    final Session session,
    final List<((int, String), {(SimpleData, double) namedSubRecord})?>? initialValue,
    final Stream<List<((int, String), {(SimpleData, double) namedSubRecord})?>?>
    values,
  ) async* {
    yield initialValue;

    await for (final value in values) {
      yield value;
    }
  }
  // #endregion

  // #region Records inside model class
  Future<TypesRecord> echoModelClassWithRecordField(
    final Session session,
    final TypesRecord value,
  ) async {
    return value;
  }

  Future<TypesRecord?> echoNullableModelClassWithRecordField(
    final Session session,
    final TypesRecord? value,
  ) async {
    return value;
  }

  Future<ModuleClass?> echoNullableModelClassWithRecordFieldFromExternalModule(
    final Session session,
    final ModuleClass? value,
  ) async {
    return value;
  }

  Stream<TypesRecord> streamOfModelClassWithRecordField(
    final Session session,
    final TypesRecord initialValue,
    final Stream<TypesRecord> values,
  ) async* {
    yield initialValue;

    await for (final value in values) {
      yield value;
    }
  }

  Stream<TypesRecord?> streamOfNullableModelClassWithRecordField(
    final Session session,
    final TypesRecord? initialValue,
    final Stream<TypesRecord?> values,
  ) async* {
    yield initialValue;

    await for (final value in values) {
      yield value;
    }
  }

  Stream<ModuleClass?>
  streamOfNullableModelClassWithRecordFieldFromExternalModule(
    final Session session,
    final ModuleClass? initialValue,
    final Stream<ModuleClass?> values,
  ) async* {
    yield initialValue;

    await for (final value in values) {
      yield value;
    }
  }
  // #endregion

  // #region Record parameter with custom name
  Future<int> recordParametersWithCustomNames(
    final Session session,
    final (int,) positionalRecord, {
    required final (int,) namedRecord,
  }) async {
    return positionalRecord.$1 + namedRecord.$1;
  }

  // #endregion
}
