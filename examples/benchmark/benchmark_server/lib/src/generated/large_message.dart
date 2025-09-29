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
import 'large_message.dart' as _i2;

abstract class LargeMessage
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  LargeMessage._({
    this.id,
    this.previous,
    this.nextId,
    this.next,
    _i1.UuidValue? uuidDefaultRandom,
    _i1.UuidValue? uuidDefaultRandomV7,
    _i1.UuidValue? uuidDefaultRandomNull,
    _i1.UuidValue? uuidDefaultStr,
    _i1.UuidValue? uuidDefaultStrNull,
    Uri? uriDefault,
    Uri? uriDefaultNull,
    String? stringDefault,
    String? stringDefaultNull,
    int? intDefault,
    int? intDefaultNull,
    Duration? durationDefault,
    Duration? durationDefaultNull,
    double? doubleDefault,
    double? doubleDefaultNull,
    DateTime? dateTimeDefaultNow,
    DateTime? dateTimeDefaultStr,
    DateTime? dateTimeDefaultStrNull,
    bool? boolDefaultTrue,
    bool? boolDefaultFalse,
    bool? boolDefaultNullFalse,
    BigInt? bigintDefaultStr,
    BigInt? bigintDefaultStrNull,
    _i1.UuidValue? uuidDefaultRandom2,
    _i1.UuidValue? uuidDefaultRandomV72,
    _i1.UuidValue? uuidDefaultRandomNull2,
    _i1.UuidValue? uuidDefaultStr2,
    _i1.UuidValue? uuidDefaultStrNull2,
    Uri? uriDefault2,
    Uri? uriDefaultNull2,
    String? stringDefault2,
    String? stringDefaultNull2,
    int? intDefault2,
    int? intDefaultNull2,
    Duration? durationDefault2,
    Duration? durationDefaultNull2,
    double? doubleDefault2,
    double? doubleDefaultNull2,
    DateTime? dateTimeDefaultNow2,
    DateTime? dateTimeDefaultStr2,
    DateTime? dateTimeDefaultStrNull2,
    bool? boolDefaultTrue2,
    bool? boolDefaultFalse2,
    bool? boolDefaultNullFalse2,
    BigInt? bigintDefaultStr2,
    BigInt? bigintDefaultStrNull2,
    _i1.UuidValue? uuidDefaultRandom3,
    _i1.UuidValue? uuidDefaultRandomV73,
    _i1.UuidValue? uuidDefaultRandomNull3,
    _i1.UuidValue? uuidDefaultStr3,
    _i1.UuidValue? uuidDefaultStrNull3,
    Uri? uriDefault3,
    Uri? uriDefaultNull3,
    String? stringDefault3,
    String? stringDefaultNull3,
    int? intDefault3,
    int? intDefaultNull3,
    Duration? durationDefault3,
    Duration? durationDefaultNull3,
    double? doubleDefault3,
    double? doubleDefaultNull3,
    DateTime? dateTimeDefaultNow3,
    DateTime? dateTimeDefaultStr3,
    DateTime? dateTimeDefaultStrNull3,
    bool? boolDefaultTrue3,
    bool? boolDefaultFalse3,
    bool? boolDefaultNullFalse3,
    BigInt? bigintDefaultStr3,
    BigInt? bigintDefaultStrNull3,
    _i1.UuidValue? uuidDefaultRandom4,
    _i1.UuidValue? uuidDefaultRandomV74,
    _i1.UuidValue? uuidDefaultRandomNull4,
    _i1.UuidValue? uuidDefaultStr4,
    _i1.UuidValue? uuidDefaultStrNull4,
    Uri? uriDefault4,
    Uri? uriDefaultNull4,
    String? stringDefault4,
    String? stringDefaultNull4,
    int? intDefault4,
    int? intDefaultNull4,
    Duration? durationDefault4,
    Duration? durationDefaultNull4,
    double? doubleDefault4,
    double? doubleDefaultNull4,
    DateTime? dateTimeDefaultNow4,
    DateTime? dateTimeDefaultStr4,
    DateTime? dateTimeDefaultStrNull4,
    bool? boolDefaultTrue4,
    bool? boolDefaultFalse4,
    bool? boolDefaultNullFalse4,
    BigInt? bigintDefaultStr4,
    BigInt? bigintDefaultStrNull4,
    _i1.UuidValue? uuidDefaultRandom5,
    _i1.UuidValue? uuidDefaultRandomV75,
    _i1.UuidValue? uuidDefaultRandomNull5,
    _i1.UuidValue? uuidDefaultStr5,
    _i1.UuidValue? uuidDefaultStrNull5,
    Uri? uriDefault5,
    Uri? uriDefaultNull5,
    String? stringDefault5,
    String? stringDefaultNull5,
    int? intDefault5,
    int? intDefaultNull5,
    Duration? durationDefault5,
    Duration? durationDefaultNull5,
    double? doubleDefault5,
    double? doubleDefaultNull5,
    DateTime? dateTimeDefaultNow5,
    DateTime? dateTimeDefaultStr5,
    DateTime? dateTimeDefaultStrNull5,
    bool? boolDefaultTrue5,
    bool? boolDefaultFalse5,
    bool? boolDefaultNullFalse5,
    BigInt? bigintDefaultStr5,
    BigInt? bigintDefaultStrNull5,
    _i1.UuidValue? uuidDefaultRandom6,
    _i1.UuidValue? uuidDefaultRandomV76,
    _i1.UuidValue? uuidDefaultRandomNull6,
    _i1.UuidValue? uuidDefaultStr6,
    _i1.UuidValue? uuidDefaultStrNull6,
    Uri? uriDefault6,
    Uri? uriDefaultNull6,
    String? stringDefault6,
    String? stringDefaultNull6,
    int? intDefault6,
    int? intDefaultNull6,
    Duration? durationDefault6,
    Duration? durationDefaultNull6,
    double? doubleDefault6,
    double? doubleDefaultNull6,
    DateTime? dateTimeDefaultNow6,
    DateTime? dateTimeDefaultStr6,
    DateTime? dateTimeDefaultStrNull6,
    bool? boolDefaultTrue6,
    bool? boolDefaultFalse6,
    bool? boolDefaultNullFalse6,
    BigInt? bigintDefaultStr6,
    BigInt? bigintDefaultStrNull6,
    _i1.UuidValue? uuidDefaultRandom7,
    _i1.UuidValue? uuidDefaultRandomV77,
    _i1.UuidValue? uuidDefaultRandomNull7,
    _i1.UuidValue? uuidDefaultStr7,
    _i1.UuidValue? uuidDefaultStrNull7,
    Uri? uriDefault7,
    Uri? uriDefaultNull7,
    String? stringDefault7,
    String? stringDefaultNull7,
    int? intDefault7,
    int? intDefaultNull7,
    Duration? durationDefault7,
    Duration? durationDefaultNull7,
    double? doubleDefault7,
    double? doubleDefaultNull7,
    DateTime? dateTimeDefaultNow7,
    DateTime? dateTimeDefaultStr7,
    DateTime? dateTimeDefaultStrNull7,
    bool? boolDefaultTrue7,
    bool? boolDefaultFalse7,
    bool? boolDefaultNullFalse7,
    BigInt? bigintDefaultStr7,
    BigInt? bigintDefaultStrNull7,
    _i1.UuidValue? uuidDefaultRandom8,
    _i1.UuidValue? uuidDefaultRandomV78,
    _i1.UuidValue? uuidDefaultRandomNull8,
    _i1.UuidValue? uuidDefaultStr8,
    _i1.UuidValue? uuidDefaultStrNull8,
    Uri? uriDefault8,
    Uri? uriDefaultNull8,
    String? stringDefault8,
    String? stringDefaultNull8,
    int? intDefault8,
    int? intDefaultNull8,
    Duration? durationDefault8,
    Duration? durationDefaultNull8,
    double? doubleDefault8,
    double? doubleDefaultNull8,
    DateTime? dateTimeDefaultNow8,
    DateTime? dateTimeDefaultStr8,
    DateTime? dateTimeDefaultStrNull8,
    bool? boolDefaultTrue8,
    bool? boolDefaultFalse8,
    bool? boolDefaultNullFalse8,
    BigInt? bigintDefaultStr8,
    BigInt? bigintDefaultStrNull8,
    _i1.UuidValue? uuidDefaultRandom9,
    _i1.UuidValue? uuidDefaultRandomV79,
    _i1.UuidValue? uuidDefaultRandomNull9,
    _i1.UuidValue? uuidDefaultStr9,
    _i1.UuidValue? uuidDefaultStrNull9,
    Uri? uriDefault9,
    Uri? uriDefaultNull9,
    String? stringDefault9,
    String? stringDefaultNull9,
    int? intDefault9,
    int? intDefaultNull9,
    Duration? durationDefault9,
    Duration? durationDefaultNull9,
    double? doubleDefault9,
    double? doubleDefaultNull9,
    DateTime? dateTimeDefaultNow9,
    DateTime? dateTimeDefaultStr9,
    DateTime? dateTimeDefaultStrNull9,
    bool? boolDefaultTrue9,
    bool? boolDefaultFalse9,
    bool? boolDefaultNullFalse9,
    BigInt? bigintDefaultStr9,
    BigInt? bigintDefaultStrNull9,
    _i1.UuidValue? uuidDefaultRandom10,
    _i1.UuidValue? uuidDefaultRandomV710,
    _i1.UuidValue? uuidDefaultRandomNull10,
    _i1.UuidValue? uuidDefaultStr10,
    _i1.UuidValue? uuidDefaultStrNull10,
    Uri? uriDefault10,
    Uri? uriDefaultNull10,
    String? stringDefault10,
    String? stringDefaultNull10,
    int? intDefault10,
    int? intDefaultNull10,
    Duration? durationDefault10,
    Duration? durationDefaultNull10,
    double? doubleDefault10,
    double? doubleDefaultNull10,
    DateTime? dateTimeDefaultNow10,
    DateTime? dateTimeDefaultStr10,
    DateTime? dateTimeDefaultStrNull10,
    bool? boolDefaultTrue10,
    bool? boolDefaultFalse10,
    bool? boolDefaultNullFalse10,
    BigInt? bigintDefaultStr10,
    BigInt? bigintDefaultStrNull10,
  })  : uuidDefaultRandom = uuidDefaultRandom ?? _i1.Uuid().v4obj(),
        uuidDefaultRandomV7 = uuidDefaultRandomV7 ?? _i1.Uuid().v7obj(),
        uuidDefaultRandomNull = uuidDefaultRandomNull ?? _i1.Uuid().v4obj(),
        uuidDefaultStr = uuidDefaultStr ??
            _i1.UuidValue.fromString('550e8400-e29b-41d4-a716-446655440000'),
        uuidDefaultStrNull = uuidDefaultStrNull ??
            _i1.UuidValue.fromString('3f2504e0-4f89-11d3-9a0c-0305e82c3301'),
        uriDefault = uriDefault ?? Uri.parse('https://serverpod.dev/default'),
        uriDefaultNull =
            uriDefaultNull ?? Uri.parse('https://serverpod.dev/default'),
        stringDefault = stringDefault ?? 'This is a default value',
        stringDefaultNull = stringDefaultNull ?? 'This is a default null value',
        intDefault = intDefault ?? 10,
        intDefaultNull = intDefaultNull ?? 20,
        durationDefault = durationDefault ??
            Duration(
              days: 1,
              hours: 2,
              minutes: 10,
              seconds: 30,
              milliseconds: 100,
            ),
        durationDefaultNull = durationDefaultNull ??
            Duration(
              days: 2,
              hours: 1,
              minutes: 20,
              seconds: 40,
              milliseconds: 100,
            ),
        doubleDefault = doubleDefault ?? 10.5,
        doubleDefaultNull = doubleDefaultNull ?? 20.5,
        dateTimeDefaultNow = dateTimeDefaultNow ?? DateTime.now(),
        dateTimeDefaultStr =
            dateTimeDefaultStr ?? DateTime.parse('2024-05-24T22:00:00.000Z'),
        dateTimeDefaultStrNull = dateTimeDefaultStrNull ??
            DateTime.parse('2024-05-24T22:00:00.000Z'),
        boolDefaultTrue = boolDefaultTrue ?? true,
        boolDefaultFalse = boolDefaultFalse ?? false,
        boolDefaultNullFalse = boolDefaultNullFalse ?? false,
        bigintDefaultStr =
            bigintDefaultStr ?? BigInt.parse('-1234567890123456789099999999'),
        bigintDefaultStrNull = bigintDefaultStrNull ??
            BigInt.parse('1234567890123456789099999999'),
        uuidDefaultRandom2 = uuidDefaultRandom2 ?? _i1.Uuid().v4obj(),
        uuidDefaultRandomV72 = uuidDefaultRandomV72 ?? _i1.Uuid().v7obj(),
        uuidDefaultRandomNull2 = uuidDefaultRandomNull2 ?? _i1.Uuid().v4obj(),
        uuidDefaultStr2 = uuidDefaultStr2 ??
            _i1.UuidValue.fromString('550e8400-e29b-41d4-a716-446655440000'),
        uuidDefaultStrNull2 = uuidDefaultStrNull2 ??
            _i1.UuidValue.fromString('3f2504e0-4f89-11d3-9a0c-0305e82c3301'),
        uriDefault2 = uriDefault2 ?? Uri.parse('https://serverpod.dev/default'),
        uriDefaultNull2 =
            uriDefaultNull2 ?? Uri.parse('https://serverpod.dev/default'),
        stringDefault2 = stringDefault2 ?? 'This is a default value',
        stringDefaultNull2 =
            stringDefaultNull2 ?? 'This is a default null value',
        intDefault2 = intDefault2 ?? 10,
        intDefaultNull2 = intDefaultNull2 ?? 20,
        durationDefault2 = durationDefault2 ??
            Duration(
              days: 1,
              hours: 2,
              minutes: 10,
              seconds: 30,
              milliseconds: 100,
            ),
        durationDefaultNull2 = durationDefaultNull2 ??
            Duration(
              days: 2,
              hours: 1,
              minutes: 20,
              seconds: 40,
              milliseconds: 100,
            ),
        doubleDefault2 = doubleDefault2 ?? 10.5,
        doubleDefaultNull2 = doubleDefaultNull2 ?? 20.5,
        dateTimeDefaultNow2 = dateTimeDefaultNow2 ?? DateTime.now(),
        dateTimeDefaultStr2 =
            dateTimeDefaultStr2 ?? DateTime.parse('2024-05-24T22:00:00.000Z'),
        dateTimeDefaultStrNull2 = dateTimeDefaultStrNull2 ??
            DateTime.parse('2024-05-24T22:00:00.000Z'),
        boolDefaultTrue2 = boolDefaultTrue2 ?? true,
        boolDefaultFalse2 = boolDefaultFalse2 ?? false,
        boolDefaultNullFalse2 = boolDefaultNullFalse2 ?? false,
        bigintDefaultStr2 =
            bigintDefaultStr2 ?? BigInt.parse('-1234567890123456789099999999'),
        bigintDefaultStrNull2 = bigintDefaultStrNull2 ??
            BigInt.parse('1234567890123456789099999999'),
        uuidDefaultRandom3 = uuidDefaultRandom3 ?? _i1.Uuid().v4obj(),
        uuidDefaultRandomV73 = uuidDefaultRandomV73 ?? _i1.Uuid().v7obj(),
        uuidDefaultRandomNull3 = uuidDefaultRandomNull3 ?? _i1.Uuid().v4obj(),
        uuidDefaultStr3 = uuidDefaultStr3 ??
            _i1.UuidValue.fromString('550e8400-e29b-41d4-a716-446655440000'),
        uuidDefaultStrNull3 = uuidDefaultStrNull3 ??
            _i1.UuidValue.fromString('3f2504e0-4f89-11d3-9a0c-0305e82c3301'),
        uriDefault3 = uriDefault3 ?? Uri.parse('https://serverpod.dev/default'),
        uriDefaultNull3 =
            uriDefaultNull3 ?? Uri.parse('https://serverpod.dev/default'),
        stringDefault3 = stringDefault3 ?? 'This is a default value',
        stringDefaultNull3 =
            stringDefaultNull3 ?? 'This is a default null value',
        intDefault3 = intDefault3 ?? 10,
        intDefaultNull3 = intDefaultNull3 ?? 20,
        durationDefault3 = durationDefault3 ??
            Duration(
              days: 1,
              hours: 2,
              minutes: 10,
              seconds: 30,
              milliseconds: 100,
            ),
        durationDefaultNull3 = durationDefaultNull3 ??
            Duration(
              days: 2,
              hours: 1,
              minutes: 20,
              seconds: 40,
              milliseconds: 100,
            ),
        doubleDefault3 = doubleDefault3 ?? 10.5,
        doubleDefaultNull3 = doubleDefaultNull3 ?? 20.5,
        dateTimeDefaultNow3 = dateTimeDefaultNow3 ?? DateTime.now(),
        dateTimeDefaultStr3 =
            dateTimeDefaultStr3 ?? DateTime.parse('2024-05-24T22:00:00.000Z'),
        dateTimeDefaultStrNull3 = dateTimeDefaultStrNull3 ??
            DateTime.parse('2024-05-24T22:00:00.000Z'),
        boolDefaultTrue3 = boolDefaultTrue3 ?? true,
        boolDefaultFalse3 = boolDefaultFalse3 ?? false,
        boolDefaultNullFalse3 = boolDefaultNullFalse3 ?? false,
        bigintDefaultStr3 =
            bigintDefaultStr3 ?? BigInt.parse('-1234567890123456789099999999'),
        bigintDefaultStrNull3 = bigintDefaultStrNull3 ??
            BigInt.parse('1234567890123456789099999999'),
        uuidDefaultRandom4 = uuidDefaultRandom4 ?? _i1.Uuid().v4obj(),
        uuidDefaultRandomV74 = uuidDefaultRandomV74 ?? _i1.Uuid().v7obj(),
        uuidDefaultRandomNull4 = uuidDefaultRandomNull4 ?? _i1.Uuid().v4obj(),
        uuidDefaultStr4 = uuidDefaultStr4 ??
            _i1.UuidValue.fromString('550e8400-e29b-41d4-a716-446655440000'),
        uuidDefaultStrNull4 = uuidDefaultStrNull4 ??
            _i1.UuidValue.fromString('3f2504e0-4f89-11d3-9a0c-0305e82c3301'),
        uriDefault4 = uriDefault4 ?? Uri.parse('https://serverpod.dev/default'),
        uriDefaultNull4 =
            uriDefaultNull4 ?? Uri.parse('https://serverpod.dev/default'),
        stringDefault4 = stringDefault4 ?? 'This is a default value',
        stringDefaultNull4 =
            stringDefaultNull4 ?? 'This is a default null value',
        intDefault4 = intDefault4 ?? 10,
        intDefaultNull4 = intDefaultNull4 ?? 20,
        durationDefault4 = durationDefault4 ??
            Duration(
              days: 1,
              hours: 2,
              minutes: 10,
              seconds: 30,
              milliseconds: 100,
            ),
        durationDefaultNull4 = durationDefaultNull4 ??
            Duration(
              days: 2,
              hours: 1,
              minutes: 20,
              seconds: 40,
              milliseconds: 100,
            ),
        doubleDefault4 = doubleDefault4 ?? 10.5,
        doubleDefaultNull4 = doubleDefaultNull4 ?? 20.5,
        dateTimeDefaultNow4 = dateTimeDefaultNow4 ?? DateTime.now(),
        dateTimeDefaultStr4 =
            dateTimeDefaultStr4 ?? DateTime.parse('2024-05-24T22:00:00.000Z'),
        dateTimeDefaultStrNull4 = dateTimeDefaultStrNull4 ??
            DateTime.parse('2024-05-24T22:00:00.000Z'),
        boolDefaultTrue4 = boolDefaultTrue4 ?? true,
        boolDefaultFalse4 = boolDefaultFalse4 ?? false,
        boolDefaultNullFalse4 = boolDefaultNullFalse4 ?? false,
        bigintDefaultStr4 =
            bigintDefaultStr4 ?? BigInt.parse('-1234567890123456789099999999'),
        bigintDefaultStrNull4 = bigintDefaultStrNull4 ??
            BigInt.parse('1234567890123456789099999999'),
        uuidDefaultRandom5 = uuidDefaultRandom5 ?? _i1.Uuid().v4obj(),
        uuidDefaultRandomV75 = uuidDefaultRandomV75 ?? _i1.Uuid().v7obj(),
        uuidDefaultRandomNull5 = uuidDefaultRandomNull5 ?? _i1.Uuid().v4obj(),
        uuidDefaultStr5 = uuidDefaultStr5 ??
            _i1.UuidValue.fromString('550e8400-e29b-41d4-a716-446655440000'),
        uuidDefaultStrNull5 = uuidDefaultStrNull5 ??
            _i1.UuidValue.fromString('3f2504e0-4f89-11d3-9a0c-0305e82c3301'),
        uriDefault5 = uriDefault5 ?? Uri.parse('https://serverpod.dev/default'),
        uriDefaultNull5 =
            uriDefaultNull5 ?? Uri.parse('https://serverpod.dev/default'),
        stringDefault5 = stringDefault5 ?? 'This is a default value',
        stringDefaultNull5 =
            stringDefaultNull5 ?? 'This is a default null value',
        intDefault5 = intDefault5 ?? 10,
        intDefaultNull5 = intDefaultNull5 ?? 20,
        durationDefault5 = durationDefault5 ??
            Duration(
              days: 1,
              hours: 2,
              minutes: 10,
              seconds: 30,
              milliseconds: 100,
            ),
        durationDefaultNull5 = durationDefaultNull5 ??
            Duration(
              days: 2,
              hours: 1,
              minutes: 20,
              seconds: 40,
              milliseconds: 100,
            ),
        doubleDefault5 = doubleDefault5 ?? 10.5,
        doubleDefaultNull5 = doubleDefaultNull5 ?? 20.5,
        dateTimeDefaultNow5 = dateTimeDefaultNow5 ?? DateTime.now(),
        dateTimeDefaultStr5 =
            dateTimeDefaultStr5 ?? DateTime.parse('2024-05-24T22:00:00.000Z'),
        dateTimeDefaultStrNull5 = dateTimeDefaultStrNull5 ??
            DateTime.parse('2024-05-24T22:00:00.000Z'),
        boolDefaultTrue5 = boolDefaultTrue5 ?? true,
        boolDefaultFalse5 = boolDefaultFalse5 ?? false,
        boolDefaultNullFalse5 = boolDefaultNullFalse5 ?? false,
        bigintDefaultStr5 =
            bigintDefaultStr5 ?? BigInt.parse('-1234567890123456789099999999'),
        bigintDefaultStrNull5 = bigintDefaultStrNull5 ??
            BigInt.parse('1234567890123456789099999999'),
        uuidDefaultRandom6 = uuidDefaultRandom6 ?? _i1.Uuid().v4obj(),
        uuidDefaultRandomV76 = uuidDefaultRandomV76 ?? _i1.Uuid().v7obj(),
        uuidDefaultRandomNull6 = uuidDefaultRandomNull6 ?? _i1.Uuid().v4obj(),
        uuidDefaultStr6 = uuidDefaultStr6 ??
            _i1.UuidValue.fromString('550e8400-e29b-41d4-a716-446655440000'),
        uuidDefaultStrNull6 = uuidDefaultStrNull6 ??
            _i1.UuidValue.fromString('3f2504e0-4f89-11d3-9a0c-0305e82c3301'),
        uriDefault6 = uriDefault6 ?? Uri.parse('https://serverpod.dev/default'),
        uriDefaultNull6 =
            uriDefaultNull6 ?? Uri.parse('https://serverpod.dev/default'),
        stringDefault6 = stringDefault6 ?? 'This is a default value',
        stringDefaultNull6 =
            stringDefaultNull6 ?? 'This is a default null value',
        intDefault6 = intDefault6 ?? 10,
        intDefaultNull6 = intDefaultNull6 ?? 20,
        durationDefault6 = durationDefault6 ??
            Duration(
              days: 1,
              hours: 2,
              minutes: 10,
              seconds: 30,
              milliseconds: 100,
            ),
        durationDefaultNull6 = durationDefaultNull6 ??
            Duration(
              days: 2,
              hours: 1,
              minutes: 20,
              seconds: 40,
              milliseconds: 100,
            ),
        doubleDefault6 = doubleDefault6 ?? 10.5,
        doubleDefaultNull6 = doubleDefaultNull6 ?? 20.5,
        dateTimeDefaultNow6 = dateTimeDefaultNow6 ?? DateTime.now(),
        dateTimeDefaultStr6 =
            dateTimeDefaultStr6 ?? DateTime.parse('2024-05-24T22:00:00.000Z'),
        dateTimeDefaultStrNull6 = dateTimeDefaultStrNull6 ??
            DateTime.parse('2024-05-24T22:00:00.000Z'),
        boolDefaultTrue6 = boolDefaultTrue6 ?? true,
        boolDefaultFalse6 = boolDefaultFalse6 ?? false,
        boolDefaultNullFalse6 = boolDefaultNullFalse6 ?? false,
        bigintDefaultStr6 =
            bigintDefaultStr6 ?? BigInt.parse('-1234567890123456789099999999'),
        bigintDefaultStrNull6 = bigintDefaultStrNull6 ??
            BigInt.parse('1234567890123456789099999999'),
        uuidDefaultRandom7 = uuidDefaultRandom7 ?? _i1.Uuid().v4obj(),
        uuidDefaultRandomV77 = uuidDefaultRandomV77 ?? _i1.Uuid().v7obj(),
        uuidDefaultRandomNull7 = uuidDefaultRandomNull7 ?? _i1.Uuid().v4obj(),
        uuidDefaultStr7 = uuidDefaultStr7 ??
            _i1.UuidValue.fromString('550e8400-e29b-41d4-a716-446655440000'),
        uuidDefaultStrNull7 = uuidDefaultStrNull7 ??
            _i1.UuidValue.fromString('3f2504e0-4f89-11d3-9a0c-0305e82c3301'),
        uriDefault7 = uriDefault7 ?? Uri.parse('https://serverpod.dev/default'),
        uriDefaultNull7 =
            uriDefaultNull7 ?? Uri.parse('https://serverpod.dev/default'),
        stringDefault7 = stringDefault7 ?? 'This is a default value',
        stringDefaultNull7 =
            stringDefaultNull7 ?? 'This is a default null value',
        intDefault7 = intDefault7 ?? 10,
        intDefaultNull7 = intDefaultNull7 ?? 20,
        durationDefault7 = durationDefault7 ??
            Duration(
              days: 1,
              hours: 2,
              minutes: 10,
              seconds: 30,
              milliseconds: 100,
            ),
        durationDefaultNull7 = durationDefaultNull7 ??
            Duration(
              days: 2,
              hours: 1,
              minutes: 20,
              seconds: 40,
              milliseconds: 100,
            ),
        doubleDefault7 = doubleDefault7 ?? 10.5,
        doubleDefaultNull7 = doubleDefaultNull7 ?? 20.5,
        dateTimeDefaultNow7 = dateTimeDefaultNow7 ?? DateTime.now(),
        dateTimeDefaultStr7 =
            dateTimeDefaultStr7 ?? DateTime.parse('2024-05-24T22:00:00.000Z'),
        dateTimeDefaultStrNull7 = dateTimeDefaultStrNull7 ??
            DateTime.parse('2024-05-24T22:00:00.000Z'),
        boolDefaultTrue7 = boolDefaultTrue7 ?? true,
        boolDefaultFalse7 = boolDefaultFalse7 ?? false,
        boolDefaultNullFalse7 = boolDefaultNullFalse7 ?? false,
        bigintDefaultStr7 =
            bigintDefaultStr7 ?? BigInt.parse('-1234567890123456789099999999'),
        bigintDefaultStrNull7 = bigintDefaultStrNull7 ??
            BigInt.parse('1234567890123456789099999999'),
        uuidDefaultRandom8 = uuidDefaultRandom8 ?? _i1.Uuid().v4obj(),
        uuidDefaultRandomV78 = uuidDefaultRandomV78 ?? _i1.Uuid().v7obj(),
        uuidDefaultRandomNull8 = uuidDefaultRandomNull8 ?? _i1.Uuid().v4obj(),
        uuidDefaultStr8 = uuidDefaultStr8 ??
            _i1.UuidValue.fromString('550e8400-e29b-41d4-a716-446655440000'),
        uuidDefaultStrNull8 = uuidDefaultStrNull8 ??
            _i1.UuidValue.fromString('3f2504e0-4f89-11d3-9a0c-0305e82c3301'),
        uriDefault8 = uriDefault8 ?? Uri.parse('https://serverpod.dev/default'),
        uriDefaultNull8 =
            uriDefaultNull8 ?? Uri.parse('https://serverpod.dev/default'),
        stringDefault8 = stringDefault8 ?? 'This is a default value',
        stringDefaultNull8 =
            stringDefaultNull8 ?? 'This is a default null value',
        intDefault8 = intDefault8 ?? 10,
        intDefaultNull8 = intDefaultNull8 ?? 20,
        durationDefault8 = durationDefault8 ??
            Duration(
              days: 1,
              hours: 2,
              minutes: 10,
              seconds: 30,
              milliseconds: 100,
            ),
        durationDefaultNull8 = durationDefaultNull8 ??
            Duration(
              days: 2,
              hours: 1,
              minutes: 20,
              seconds: 40,
              milliseconds: 100,
            ),
        doubleDefault8 = doubleDefault8 ?? 10.5,
        doubleDefaultNull8 = doubleDefaultNull8 ?? 20.5,
        dateTimeDefaultNow8 = dateTimeDefaultNow8 ?? DateTime.now(),
        dateTimeDefaultStr8 =
            dateTimeDefaultStr8 ?? DateTime.parse('2024-05-24T22:00:00.000Z'),
        dateTimeDefaultStrNull8 = dateTimeDefaultStrNull8 ??
            DateTime.parse('2024-05-24T22:00:00.000Z'),
        boolDefaultTrue8 = boolDefaultTrue8 ?? true,
        boolDefaultFalse8 = boolDefaultFalse8 ?? false,
        boolDefaultNullFalse8 = boolDefaultNullFalse8 ?? false,
        bigintDefaultStr8 =
            bigintDefaultStr8 ?? BigInt.parse('-1234567890123456789099999999'),
        bigintDefaultStrNull8 = bigintDefaultStrNull8 ??
            BigInt.parse('1234567890123456789099999999'),
        uuidDefaultRandom9 = uuidDefaultRandom9 ?? _i1.Uuid().v4obj(),
        uuidDefaultRandomV79 = uuidDefaultRandomV79 ?? _i1.Uuid().v7obj(),
        uuidDefaultRandomNull9 = uuidDefaultRandomNull9 ?? _i1.Uuid().v4obj(),
        uuidDefaultStr9 = uuidDefaultStr9 ??
            _i1.UuidValue.fromString('550e8400-e29b-41d4-a716-446655440000'),
        uuidDefaultStrNull9 = uuidDefaultStrNull9 ??
            _i1.UuidValue.fromString('3f2504e0-4f89-11d3-9a0c-0305e82c3301'),
        uriDefault9 = uriDefault9 ?? Uri.parse('https://serverpod.dev/default'),
        uriDefaultNull9 =
            uriDefaultNull9 ?? Uri.parse('https://serverpod.dev/default'),
        stringDefault9 = stringDefault9 ?? 'This is a default value',
        stringDefaultNull9 =
            stringDefaultNull9 ?? 'This is a default null value',
        intDefault9 = intDefault9 ?? 10,
        intDefaultNull9 = intDefaultNull9 ?? 20,
        durationDefault9 = durationDefault9 ??
            Duration(
              days: 1,
              hours: 2,
              minutes: 10,
              seconds: 30,
              milliseconds: 100,
            ),
        durationDefaultNull9 = durationDefaultNull9 ??
            Duration(
              days: 2,
              hours: 1,
              minutes: 20,
              seconds: 40,
              milliseconds: 100,
            ),
        doubleDefault9 = doubleDefault9 ?? 10.5,
        doubleDefaultNull9 = doubleDefaultNull9 ?? 20.5,
        dateTimeDefaultNow9 = dateTimeDefaultNow9 ?? DateTime.now(),
        dateTimeDefaultStr9 =
            dateTimeDefaultStr9 ?? DateTime.parse('2024-05-24T22:00:00.000Z'),
        dateTimeDefaultStrNull9 = dateTimeDefaultStrNull9 ??
            DateTime.parse('2024-05-24T22:00:00.000Z'),
        boolDefaultTrue9 = boolDefaultTrue9 ?? true,
        boolDefaultFalse9 = boolDefaultFalse9 ?? false,
        boolDefaultNullFalse9 = boolDefaultNullFalse9 ?? false,
        bigintDefaultStr9 =
            bigintDefaultStr9 ?? BigInt.parse('-1234567890123456789099999999'),
        bigintDefaultStrNull9 = bigintDefaultStrNull9 ??
            BigInt.parse('1234567890123456789099999999'),
        uuidDefaultRandom10 = uuidDefaultRandom10 ?? _i1.Uuid().v4obj(),
        uuidDefaultRandomV710 = uuidDefaultRandomV710 ?? _i1.Uuid().v7obj(),
        uuidDefaultRandomNull10 = uuidDefaultRandomNull10 ?? _i1.Uuid().v4obj(),
        uuidDefaultStr10 = uuidDefaultStr10 ??
            _i1.UuidValue.fromString('550e8400-e29b-41d4-a716-446655440000'),
        uuidDefaultStrNull10 = uuidDefaultStrNull10 ??
            _i1.UuidValue.fromString('3f2504e0-4f89-11d3-9a0c-0305e82c3301'),
        uriDefault10 =
            uriDefault10 ?? Uri.parse('https://serverpod.dev/default'),
        uriDefaultNull10 =
            uriDefaultNull10 ?? Uri.parse('https://serverpod.dev/default'),
        stringDefault10 = stringDefault10 ?? 'This is a default value',
        stringDefaultNull10 =
            stringDefaultNull10 ?? 'This is a default null value',
        intDefault10 = intDefault10 ?? 10,
        intDefaultNull10 = intDefaultNull10 ?? 20,
        durationDefault10 = durationDefault10 ??
            Duration(
              days: 1,
              hours: 2,
              minutes: 10,
              seconds: 30,
              milliseconds: 100,
            ),
        durationDefaultNull10 = durationDefaultNull10 ??
            Duration(
              days: 2,
              hours: 1,
              minutes: 20,
              seconds: 40,
              milliseconds: 100,
            ),
        doubleDefault10 = doubleDefault10 ?? 10.5,
        doubleDefaultNull10 = doubleDefaultNull10 ?? 20.5,
        dateTimeDefaultNow10 = dateTimeDefaultNow10 ?? DateTime.now(),
        dateTimeDefaultStr10 =
            dateTimeDefaultStr10 ?? DateTime.parse('2024-05-24T22:00:00.000Z'),
        dateTimeDefaultStrNull10 = dateTimeDefaultStrNull10 ??
            DateTime.parse('2024-05-24T22:00:00.000Z'),
        boolDefaultTrue10 = boolDefaultTrue10 ?? true,
        boolDefaultFalse10 = boolDefaultFalse10 ?? false,
        boolDefaultNullFalse10 = boolDefaultNullFalse10 ?? false,
        bigintDefaultStr10 =
            bigintDefaultStr10 ?? BigInt.parse('-1234567890123456789099999999'),
        bigintDefaultStrNull10 = bigintDefaultStrNull10 ??
            BigInt.parse('1234567890123456789099999999');

  factory LargeMessage({
    int? id,
    _i2.LargeMessage? previous,
    int? nextId,
    _i2.LargeMessage? next,
    _i1.UuidValue? uuidDefaultRandom,
    _i1.UuidValue? uuidDefaultRandomV7,
    _i1.UuidValue? uuidDefaultRandomNull,
    _i1.UuidValue? uuidDefaultStr,
    _i1.UuidValue? uuidDefaultStrNull,
    Uri? uriDefault,
    Uri? uriDefaultNull,
    String? stringDefault,
    String? stringDefaultNull,
    int? intDefault,
    int? intDefaultNull,
    Duration? durationDefault,
    Duration? durationDefaultNull,
    double? doubleDefault,
    double? doubleDefaultNull,
    DateTime? dateTimeDefaultNow,
    DateTime? dateTimeDefaultStr,
    DateTime? dateTimeDefaultStrNull,
    bool? boolDefaultTrue,
    bool? boolDefaultFalse,
    bool? boolDefaultNullFalse,
    BigInt? bigintDefaultStr,
    BigInt? bigintDefaultStrNull,
    _i1.UuidValue? uuidDefaultRandom2,
    _i1.UuidValue? uuidDefaultRandomV72,
    _i1.UuidValue? uuidDefaultRandomNull2,
    _i1.UuidValue? uuidDefaultStr2,
    _i1.UuidValue? uuidDefaultStrNull2,
    Uri? uriDefault2,
    Uri? uriDefaultNull2,
    String? stringDefault2,
    String? stringDefaultNull2,
    int? intDefault2,
    int? intDefaultNull2,
    Duration? durationDefault2,
    Duration? durationDefaultNull2,
    double? doubleDefault2,
    double? doubleDefaultNull2,
    DateTime? dateTimeDefaultNow2,
    DateTime? dateTimeDefaultStr2,
    DateTime? dateTimeDefaultStrNull2,
    bool? boolDefaultTrue2,
    bool? boolDefaultFalse2,
    bool? boolDefaultNullFalse2,
    BigInt? bigintDefaultStr2,
    BigInt? bigintDefaultStrNull2,
    _i1.UuidValue? uuidDefaultRandom3,
    _i1.UuidValue? uuidDefaultRandomV73,
    _i1.UuidValue? uuidDefaultRandomNull3,
    _i1.UuidValue? uuidDefaultStr3,
    _i1.UuidValue? uuidDefaultStrNull3,
    Uri? uriDefault3,
    Uri? uriDefaultNull3,
    String? stringDefault3,
    String? stringDefaultNull3,
    int? intDefault3,
    int? intDefaultNull3,
    Duration? durationDefault3,
    Duration? durationDefaultNull3,
    double? doubleDefault3,
    double? doubleDefaultNull3,
    DateTime? dateTimeDefaultNow3,
    DateTime? dateTimeDefaultStr3,
    DateTime? dateTimeDefaultStrNull3,
    bool? boolDefaultTrue3,
    bool? boolDefaultFalse3,
    bool? boolDefaultNullFalse3,
    BigInt? bigintDefaultStr3,
    BigInt? bigintDefaultStrNull3,
    _i1.UuidValue? uuidDefaultRandom4,
    _i1.UuidValue? uuidDefaultRandomV74,
    _i1.UuidValue? uuidDefaultRandomNull4,
    _i1.UuidValue? uuidDefaultStr4,
    _i1.UuidValue? uuidDefaultStrNull4,
    Uri? uriDefault4,
    Uri? uriDefaultNull4,
    String? stringDefault4,
    String? stringDefaultNull4,
    int? intDefault4,
    int? intDefaultNull4,
    Duration? durationDefault4,
    Duration? durationDefaultNull4,
    double? doubleDefault4,
    double? doubleDefaultNull4,
    DateTime? dateTimeDefaultNow4,
    DateTime? dateTimeDefaultStr4,
    DateTime? dateTimeDefaultStrNull4,
    bool? boolDefaultTrue4,
    bool? boolDefaultFalse4,
    bool? boolDefaultNullFalse4,
    BigInt? bigintDefaultStr4,
    BigInt? bigintDefaultStrNull4,
    _i1.UuidValue? uuidDefaultRandom5,
    _i1.UuidValue? uuidDefaultRandomV75,
    _i1.UuidValue? uuidDefaultRandomNull5,
    _i1.UuidValue? uuidDefaultStr5,
    _i1.UuidValue? uuidDefaultStrNull5,
    Uri? uriDefault5,
    Uri? uriDefaultNull5,
    String? stringDefault5,
    String? stringDefaultNull5,
    int? intDefault5,
    int? intDefaultNull5,
    Duration? durationDefault5,
    Duration? durationDefaultNull5,
    double? doubleDefault5,
    double? doubleDefaultNull5,
    DateTime? dateTimeDefaultNow5,
    DateTime? dateTimeDefaultStr5,
    DateTime? dateTimeDefaultStrNull5,
    bool? boolDefaultTrue5,
    bool? boolDefaultFalse5,
    bool? boolDefaultNullFalse5,
    BigInt? bigintDefaultStr5,
    BigInt? bigintDefaultStrNull5,
    _i1.UuidValue? uuidDefaultRandom6,
    _i1.UuidValue? uuidDefaultRandomV76,
    _i1.UuidValue? uuidDefaultRandomNull6,
    _i1.UuidValue? uuidDefaultStr6,
    _i1.UuidValue? uuidDefaultStrNull6,
    Uri? uriDefault6,
    Uri? uriDefaultNull6,
    String? stringDefault6,
    String? stringDefaultNull6,
    int? intDefault6,
    int? intDefaultNull6,
    Duration? durationDefault6,
    Duration? durationDefaultNull6,
    double? doubleDefault6,
    double? doubleDefaultNull6,
    DateTime? dateTimeDefaultNow6,
    DateTime? dateTimeDefaultStr6,
    DateTime? dateTimeDefaultStrNull6,
    bool? boolDefaultTrue6,
    bool? boolDefaultFalse6,
    bool? boolDefaultNullFalse6,
    BigInt? bigintDefaultStr6,
    BigInt? bigintDefaultStrNull6,
    _i1.UuidValue? uuidDefaultRandom7,
    _i1.UuidValue? uuidDefaultRandomV77,
    _i1.UuidValue? uuidDefaultRandomNull7,
    _i1.UuidValue? uuidDefaultStr7,
    _i1.UuidValue? uuidDefaultStrNull7,
    Uri? uriDefault7,
    Uri? uriDefaultNull7,
    String? stringDefault7,
    String? stringDefaultNull7,
    int? intDefault7,
    int? intDefaultNull7,
    Duration? durationDefault7,
    Duration? durationDefaultNull7,
    double? doubleDefault7,
    double? doubleDefaultNull7,
    DateTime? dateTimeDefaultNow7,
    DateTime? dateTimeDefaultStr7,
    DateTime? dateTimeDefaultStrNull7,
    bool? boolDefaultTrue7,
    bool? boolDefaultFalse7,
    bool? boolDefaultNullFalse7,
    BigInt? bigintDefaultStr7,
    BigInt? bigintDefaultStrNull7,
    _i1.UuidValue? uuidDefaultRandom8,
    _i1.UuidValue? uuidDefaultRandomV78,
    _i1.UuidValue? uuidDefaultRandomNull8,
    _i1.UuidValue? uuidDefaultStr8,
    _i1.UuidValue? uuidDefaultStrNull8,
    Uri? uriDefault8,
    Uri? uriDefaultNull8,
    String? stringDefault8,
    String? stringDefaultNull8,
    int? intDefault8,
    int? intDefaultNull8,
    Duration? durationDefault8,
    Duration? durationDefaultNull8,
    double? doubleDefault8,
    double? doubleDefaultNull8,
    DateTime? dateTimeDefaultNow8,
    DateTime? dateTimeDefaultStr8,
    DateTime? dateTimeDefaultStrNull8,
    bool? boolDefaultTrue8,
    bool? boolDefaultFalse8,
    bool? boolDefaultNullFalse8,
    BigInt? bigintDefaultStr8,
    BigInt? bigintDefaultStrNull8,
    _i1.UuidValue? uuidDefaultRandom9,
    _i1.UuidValue? uuidDefaultRandomV79,
    _i1.UuidValue? uuidDefaultRandomNull9,
    _i1.UuidValue? uuidDefaultStr9,
    _i1.UuidValue? uuidDefaultStrNull9,
    Uri? uriDefault9,
    Uri? uriDefaultNull9,
    String? stringDefault9,
    String? stringDefaultNull9,
    int? intDefault9,
    int? intDefaultNull9,
    Duration? durationDefault9,
    Duration? durationDefaultNull9,
    double? doubleDefault9,
    double? doubleDefaultNull9,
    DateTime? dateTimeDefaultNow9,
    DateTime? dateTimeDefaultStr9,
    DateTime? dateTimeDefaultStrNull9,
    bool? boolDefaultTrue9,
    bool? boolDefaultFalse9,
    bool? boolDefaultNullFalse9,
    BigInt? bigintDefaultStr9,
    BigInt? bigintDefaultStrNull9,
    _i1.UuidValue? uuidDefaultRandom10,
    _i1.UuidValue? uuidDefaultRandomV710,
    _i1.UuidValue? uuidDefaultRandomNull10,
    _i1.UuidValue? uuidDefaultStr10,
    _i1.UuidValue? uuidDefaultStrNull10,
    Uri? uriDefault10,
    Uri? uriDefaultNull10,
    String? stringDefault10,
    String? stringDefaultNull10,
    int? intDefault10,
    int? intDefaultNull10,
    Duration? durationDefault10,
    Duration? durationDefaultNull10,
    double? doubleDefault10,
    double? doubleDefaultNull10,
    DateTime? dateTimeDefaultNow10,
    DateTime? dateTimeDefaultStr10,
    DateTime? dateTimeDefaultStrNull10,
    bool? boolDefaultTrue10,
    bool? boolDefaultFalse10,
    bool? boolDefaultNullFalse10,
    BigInt? bigintDefaultStr10,
    BigInt? bigintDefaultStrNull10,
  }) = _LargeMessageImpl;

  factory LargeMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return LargeMessage(
      id: jsonSerialization['id'] as int?,
      previous: jsonSerialization['previous'] == null
          ? null
          : _i2.LargeMessage.fromJson(
              (jsonSerialization['previous'] as Map<String, dynamic>)),
      nextId: jsonSerialization['nextId'] as int?,
      next: jsonSerialization['next'] == null
          ? null
          : _i2.LargeMessage.fromJson(
              (jsonSerialization['next'] as Map<String, dynamic>)),
      uuidDefaultRandom: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandom']),
      uuidDefaultRandomV7: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandomV7']),
      uuidDefaultRandomNull: jsonSerialization['uuidDefaultRandomNull'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['uuidDefaultRandomNull']),
      uuidDefaultStr: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultStr']),
      uuidDefaultStrNull: jsonSerialization['uuidDefaultStrNull'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['uuidDefaultStrNull']),
      uriDefault:
          _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefault']),
      uriDefaultNull: jsonSerialization['uriDefaultNull'] == null
          ? null
          : _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefaultNull']),
      stringDefault: jsonSerialization['stringDefault'] as String,
      stringDefaultNull: jsonSerialization['stringDefaultNull'] as String?,
      intDefault: jsonSerialization['intDefault'] as int,
      intDefaultNull: jsonSerialization['intDefaultNull'] as int?,
      durationDefault: _i1.DurationJsonExtension.fromJson(
          jsonSerialization['durationDefault']),
      durationDefaultNull: jsonSerialization['durationDefaultNull'] == null
          ? null
          : _i1.DurationJsonExtension.fromJson(
              jsonSerialization['durationDefaultNull']),
      doubleDefault: (jsonSerialization['doubleDefault'] as num).toDouble(),
      doubleDefaultNull:
          (jsonSerialization['doubleDefaultNull'] as num?)?.toDouble(),
      dateTimeDefaultNow: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultNow']),
      dateTimeDefaultStr: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultStr']),
      dateTimeDefaultStrNull:
          jsonSerialization['dateTimeDefaultStrNull'] == null
              ? null
              : _i1.DateTimeJsonExtension.fromJson(
                  jsonSerialization['dateTimeDefaultStrNull']),
      boolDefaultTrue: jsonSerialization['boolDefaultTrue'] as bool,
      boolDefaultFalse: jsonSerialization['boolDefaultFalse'] as bool,
      boolDefaultNullFalse: jsonSerialization['boolDefaultNullFalse'] as bool?,
      bigintDefaultStr: _i1.BigIntJsonExtension.fromJson(
          jsonSerialization['bigintDefaultStr']),
      bigintDefaultStrNull: jsonSerialization['bigintDefaultStrNull'] == null
          ? null
          : _i1.BigIntJsonExtension.fromJson(
              jsonSerialization['bigintDefaultStrNull']),
      uuidDefaultRandom2: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandom2']),
      uuidDefaultRandomV72: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandomV72']),
      uuidDefaultRandomNull2:
          jsonSerialization['uuidDefaultRandomNull2'] == null
              ? null
              : _i1.UuidValueJsonExtension.fromJson(
                  jsonSerialization['uuidDefaultRandomNull2']),
      uuidDefaultStr2: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultStr2']),
      uuidDefaultStrNull2: jsonSerialization['uuidDefaultStrNull2'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['uuidDefaultStrNull2']),
      uriDefault2:
          _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefault2']),
      uriDefaultNull2: jsonSerialization['uriDefaultNull2'] == null
          ? null
          : _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefaultNull2']),
      stringDefault2: jsonSerialization['stringDefault2'] as String,
      stringDefaultNull2: jsonSerialization['stringDefaultNull2'] as String?,
      intDefault2: jsonSerialization['intDefault2'] as int,
      intDefaultNull2: jsonSerialization['intDefaultNull2'] as int?,
      durationDefault2: _i1.DurationJsonExtension.fromJson(
          jsonSerialization['durationDefault2']),
      durationDefaultNull2: jsonSerialization['durationDefaultNull2'] == null
          ? null
          : _i1.DurationJsonExtension.fromJson(
              jsonSerialization['durationDefaultNull2']),
      doubleDefault2: (jsonSerialization['doubleDefault2'] as num).toDouble(),
      doubleDefaultNull2:
          (jsonSerialization['doubleDefaultNull2'] as num?)?.toDouble(),
      dateTimeDefaultNow2: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultNow2']),
      dateTimeDefaultStr2: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultStr2']),
      dateTimeDefaultStrNull2:
          jsonSerialization['dateTimeDefaultStrNull2'] == null
              ? null
              : _i1.DateTimeJsonExtension.fromJson(
                  jsonSerialization['dateTimeDefaultStrNull2']),
      boolDefaultTrue2: jsonSerialization['boolDefaultTrue2'] as bool,
      boolDefaultFalse2: jsonSerialization['boolDefaultFalse2'] as bool,
      boolDefaultNullFalse2:
          jsonSerialization['boolDefaultNullFalse2'] as bool?,
      bigintDefaultStr2: _i1.BigIntJsonExtension.fromJson(
          jsonSerialization['bigintDefaultStr2']),
      bigintDefaultStrNull2: jsonSerialization['bigintDefaultStrNull2'] == null
          ? null
          : _i1.BigIntJsonExtension.fromJson(
              jsonSerialization['bigintDefaultStrNull2']),
      uuidDefaultRandom3: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandom3']),
      uuidDefaultRandomV73: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandomV73']),
      uuidDefaultRandomNull3:
          jsonSerialization['uuidDefaultRandomNull3'] == null
              ? null
              : _i1.UuidValueJsonExtension.fromJson(
                  jsonSerialization['uuidDefaultRandomNull3']),
      uuidDefaultStr3: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultStr3']),
      uuidDefaultStrNull3: jsonSerialization['uuidDefaultStrNull3'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['uuidDefaultStrNull3']),
      uriDefault3:
          _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefault3']),
      uriDefaultNull3: jsonSerialization['uriDefaultNull3'] == null
          ? null
          : _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefaultNull3']),
      stringDefault3: jsonSerialization['stringDefault3'] as String,
      stringDefaultNull3: jsonSerialization['stringDefaultNull3'] as String?,
      intDefault3: jsonSerialization['intDefault3'] as int,
      intDefaultNull3: jsonSerialization['intDefaultNull3'] as int?,
      durationDefault3: _i1.DurationJsonExtension.fromJson(
          jsonSerialization['durationDefault3']),
      durationDefaultNull3: jsonSerialization['durationDefaultNull3'] == null
          ? null
          : _i1.DurationJsonExtension.fromJson(
              jsonSerialization['durationDefaultNull3']),
      doubleDefault3: (jsonSerialization['doubleDefault3'] as num).toDouble(),
      doubleDefaultNull3:
          (jsonSerialization['doubleDefaultNull3'] as num?)?.toDouble(),
      dateTimeDefaultNow3: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultNow3']),
      dateTimeDefaultStr3: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultStr3']),
      dateTimeDefaultStrNull3:
          jsonSerialization['dateTimeDefaultStrNull3'] == null
              ? null
              : _i1.DateTimeJsonExtension.fromJson(
                  jsonSerialization['dateTimeDefaultStrNull3']),
      boolDefaultTrue3: jsonSerialization['boolDefaultTrue3'] as bool,
      boolDefaultFalse3: jsonSerialization['boolDefaultFalse3'] as bool,
      boolDefaultNullFalse3:
          jsonSerialization['boolDefaultNullFalse3'] as bool?,
      bigintDefaultStr3: _i1.BigIntJsonExtension.fromJson(
          jsonSerialization['bigintDefaultStr3']),
      bigintDefaultStrNull3: jsonSerialization['bigintDefaultStrNull3'] == null
          ? null
          : _i1.BigIntJsonExtension.fromJson(
              jsonSerialization['bigintDefaultStrNull3']),
      uuidDefaultRandom4: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandom4']),
      uuidDefaultRandomV74: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandomV74']),
      uuidDefaultRandomNull4:
          jsonSerialization['uuidDefaultRandomNull4'] == null
              ? null
              : _i1.UuidValueJsonExtension.fromJson(
                  jsonSerialization['uuidDefaultRandomNull4']),
      uuidDefaultStr4: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultStr4']),
      uuidDefaultStrNull4: jsonSerialization['uuidDefaultStrNull4'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['uuidDefaultStrNull4']),
      uriDefault4:
          _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefault4']),
      uriDefaultNull4: jsonSerialization['uriDefaultNull4'] == null
          ? null
          : _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefaultNull4']),
      stringDefault4: jsonSerialization['stringDefault4'] as String,
      stringDefaultNull4: jsonSerialization['stringDefaultNull4'] as String?,
      intDefault4: jsonSerialization['intDefault4'] as int,
      intDefaultNull4: jsonSerialization['intDefaultNull4'] as int?,
      durationDefault4: _i1.DurationJsonExtension.fromJson(
          jsonSerialization['durationDefault4']),
      durationDefaultNull4: jsonSerialization['durationDefaultNull4'] == null
          ? null
          : _i1.DurationJsonExtension.fromJson(
              jsonSerialization['durationDefaultNull4']),
      doubleDefault4: (jsonSerialization['doubleDefault4'] as num).toDouble(),
      doubleDefaultNull4:
          (jsonSerialization['doubleDefaultNull4'] as num?)?.toDouble(),
      dateTimeDefaultNow4: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultNow4']),
      dateTimeDefaultStr4: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultStr4']),
      dateTimeDefaultStrNull4:
          jsonSerialization['dateTimeDefaultStrNull4'] == null
              ? null
              : _i1.DateTimeJsonExtension.fromJson(
                  jsonSerialization['dateTimeDefaultStrNull4']),
      boolDefaultTrue4: jsonSerialization['boolDefaultTrue4'] as bool,
      boolDefaultFalse4: jsonSerialization['boolDefaultFalse4'] as bool,
      boolDefaultNullFalse4:
          jsonSerialization['boolDefaultNullFalse4'] as bool?,
      bigintDefaultStr4: _i1.BigIntJsonExtension.fromJson(
          jsonSerialization['bigintDefaultStr4']),
      bigintDefaultStrNull4: jsonSerialization['bigintDefaultStrNull4'] == null
          ? null
          : _i1.BigIntJsonExtension.fromJson(
              jsonSerialization['bigintDefaultStrNull4']),
      uuidDefaultRandom5: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandom5']),
      uuidDefaultRandomV75: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandomV75']),
      uuidDefaultRandomNull5:
          jsonSerialization['uuidDefaultRandomNull5'] == null
              ? null
              : _i1.UuidValueJsonExtension.fromJson(
                  jsonSerialization['uuidDefaultRandomNull5']),
      uuidDefaultStr5: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultStr5']),
      uuidDefaultStrNull5: jsonSerialization['uuidDefaultStrNull5'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['uuidDefaultStrNull5']),
      uriDefault5:
          _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefault5']),
      uriDefaultNull5: jsonSerialization['uriDefaultNull5'] == null
          ? null
          : _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefaultNull5']),
      stringDefault5: jsonSerialization['stringDefault5'] as String,
      stringDefaultNull5: jsonSerialization['stringDefaultNull5'] as String?,
      intDefault5: jsonSerialization['intDefault5'] as int,
      intDefaultNull5: jsonSerialization['intDefaultNull5'] as int?,
      durationDefault5: _i1.DurationJsonExtension.fromJson(
          jsonSerialization['durationDefault5']),
      durationDefaultNull5: jsonSerialization['durationDefaultNull5'] == null
          ? null
          : _i1.DurationJsonExtension.fromJson(
              jsonSerialization['durationDefaultNull5']),
      doubleDefault5: (jsonSerialization['doubleDefault5'] as num).toDouble(),
      doubleDefaultNull5:
          (jsonSerialization['doubleDefaultNull5'] as num?)?.toDouble(),
      dateTimeDefaultNow5: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultNow5']),
      dateTimeDefaultStr5: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultStr5']),
      dateTimeDefaultStrNull5:
          jsonSerialization['dateTimeDefaultStrNull5'] == null
              ? null
              : _i1.DateTimeJsonExtension.fromJson(
                  jsonSerialization['dateTimeDefaultStrNull5']),
      boolDefaultTrue5: jsonSerialization['boolDefaultTrue5'] as bool,
      boolDefaultFalse5: jsonSerialization['boolDefaultFalse5'] as bool,
      boolDefaultNullFalse5:
          jsonSerialization['boolDefaultNullFalse5'] as bool?,
      bigintDefaultStr5: _i1.BigIntJsonExtension.fromJson(
          jsonSerialization['bigintDefaultStr5']),
      bigintDefaultStrNull5: jsonSerialization['bigintDefaultStrNull5'] == null
          ? null
          : _i1.BigIntJsonExtension.fromJson(
              jsonSerialization['bigintDefaultStrNull5']),
      uuidDefaultRandom6: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandom6']),
      uuidDefaultRandomV76: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandomV76']),
      uuidDefaultRandomNull6:
          jsonSerialization['uuidDefaultRandomNull6'] == null
              ? null
              : _i1.UuidValueJsonExtension.fromJson(
                  jsonSerialization['uuidDefaultRandomNull6']),
      uuidDefaultStr6: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultStr6']),
      uuidDefaultStrNull6: jsonSerialization['uuidDefaultStrNull6'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['uuidDefaultStrNull6']),
      uriDefault6:
          _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefault6']),
      uriDefaultNull6: jsonSerialization['uriDefaultNull6'] == null
          ? null
          : _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefaultNull6']),
      stringDefault6: jsonSerialization['stringDefault6'] as String,
      stringDefaultNull6: jsonSerialization['stringDefaultNull6'] as String?,
      intDefault6: jsonSerialization['intDefault6'] as int,
      intDefaultNull6: jsonSerialization['intDefaultNull6'] as int?,
      durationDefault6: _i1.DurationJsonExtension.fromJson(
          jsonSerialization['durationDefault6']),
      durationDefaultNull6: jsonSerialization['durationDefaultNull6'] == null
          ? null
          : _i1.DurationJsonExtension.fromJson(
              jsonSerialization['durationDefaultNull6']),
      doubleDefault6: (jsonSerialization['doubleDefault6'] as num).toDouble(),
      doubleDefaultNull6:
          (jsonSerialization['doubleDefaultNull6'] as num?)?.toDouble(),
      dateTimeDefaultNow6: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultNow6']),
      dateTimeDefaultStr6: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultStr6']),
      dateTimeDefaultStrNull6:
          jsonSerialization['dateTimeDefaultStrNull6'] == null
              ? null
              : _i1.DateTimeJsonExtension.fromJson(
                  jsonSerialization['dateTimeDefaultStrNull6']),
      boolDefaultTrue6: jsonSerialization['boolDefaultTrue6'] as bool,
      boolDefaultFalse6: jsonSerialization['boolDefaultFalse6'] as bool,
      boolDefaultNullFalse6:
          jsonSerialization['boolDefaultNullFalse6'] as bool?,
      bigintDefaultStr6: _i1.BigIntJsonExtension.fromJson(
          jsonSerialization['bigintDefaultStr6']),
      bigintDefaultStrNull6: jsonSerialization['bigintDefaultStrNull6'] == null
          ? null
          : _i1.BigIntJsonExtension.fromJson(
              jsonSerialization['bigintDefaultStrNull6']),
      uuidDefaultRandom7: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandom7']),
      uuidDefaultRandomV77: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandomV77']),
      uuidDefaultRandomNull7:
          jsonSerialization['uuidDefaultRandomNull7'] == null
              ? null
              : _i1.UuidValueJsonExtension.fromJson(
                  jsonSerialization['uuidDefaultRandomNull7']),
      uuidDefaultStr7: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultStr7']),
      uuidDefaultStrNull7: jsonSerialization['uuidDefaultStrNull7'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['uuidDefaultStrNull7']),
      uriDefault7:
          _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefault7']),
      uriDefaultNull7: jsonSerialization['uriDefaultNull7'] == null
          ? null
          : _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefaultNull7']),
      stringDefault7: jsonSerialization['stringDefault7'] as String,
      stringDefaultNull7: jsonSerialization['stringDefaultNull7'] as String?,
      intDefault7: jsonSerialization['intDefault7'] as int,
      intDefaultNull7: jsonSerialization['intDefaultNull7'] as int?,
      durationDefault7: _i1.DurationJsonExtension.fromJson(
          jsonSerialization['durationDefault7']),
      durationDefaultNull7: jsonSerialization['durationDefaultNull7'] == null
          ? null
          : _i1.DurationJsonExtension.fromJson(
              jsonSerialization['durationDefaultNull7']),
      doubleDefault7: (jsonSerialization['doubleDefault7'] as num).toDouble(),
      doubleDefaultNull7:
          (jsonSerialization['doubleDefaultNull7'] as num?)?.toDouble(),
      dateTimeDefaultNow7: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultNow7']),
      dateTimeDefaultStr7: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultStr7']),
      dateTimeDefaultStrNull7:
          jsonSerialization['dateTimeDefaultStrNull7'] == null
              ? null
              : _i1.DateTimeJsonExtension.fromJson(
                  jsonSerialization['dateTimeDefaultStrNull7']),
      boolDefaultTrue7: jsonSerialization['boolDefaultTrue7'] as bool,
      boolDefaultFalse7: jsonSerialization['boolDefaultFalse7'] as bool,
      boolDefaultNullFalse7:
          jsonSerialization['boolDefaultNullFalse7'] as bool?,
      bigintDefaultStr7: _i1.BigIntJsonExtension.fromJson(
          jsonSerialization['bigintDefaultStr7']),
      bigintDefaultStrNull7: jsonSerialization['bigintDefaultStrNull7'] == null
          ? null
          : _i1.BigIntJsonExtension.fromJson(
              jsonSerialization['bigintDefaultStrNull7']),
      uuidDefaultRandom8: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandom8']),
      uuidDefaultRandomV78: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandomV78']),
      uuidDefaultRandomNull8:
          jsonSerialization['uuidDefaultRandomNull8'] == null
              ? null
              : _i1.UuidValueJsonExtension.fromJson(
                  jsonSerialization['uuidDefaultRandomNull8']),
      uuidDefaultStr8: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultStr8']),
      uuidDefaultStrNull8: jsonSerialization['uuidDefaultStrNull8'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['uuidDefaultStrNull8']),
      uriDefault8:
          _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefault8']),
      uriDefaultNull8: jsonSerialization['uriDefaultNull8'] == null
          ? null
          : _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefaultNull8']),
      stringDefault8: jsonSerialization['stringDefault8'] as String,
      stringDefaultNull8: jsonSerialization['stringDefaultNull8'] as String?,
      intDefault8: jsonSerialization['intDefault8'] as int,
      intDefaultNull8: jsonSerialization['intDefaultNull8'] as int?,
      durationDefault8: _i1.DurationJsonExtension.fromJson(
          jsonSerialization['durationDefault8']),
      durationDefaultNull8: jsonSerialization['durationDefaultNull8'] == null
          ? null
          : _i1.DurationJsonExtension.fromJson(
              jsonSerialization['durationDefaultNull8']),
      doubleDefault8: (jsonSerialization['doubleDefault8'] as num).toDouble(),
      doubleDefaultNull8:
          (jsonSerialization['doubleDefaultNull8'] as num?)?.toDouble(),
      dateTimeDefaultNow8: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultNow8']),
      dateTimeDefaultStr8: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultStr8']),
      dateTimeDefaultStrNull8:
          jsonSerialization['dateTimeDefaultStrNull8'] == null
              ? null
              : _i1.DateTimeJsonExtension.fromJson(
                  jsonSerialization['dateTimeDefaultStrNull8']),
      boolDefaultTrue8: jsonSerialization['boolDefaultTrue8'] as bool,
      boolDefaultFalse8: jsonSerialization['boolDefaultFalse8'] as bool,
      boolDefaultNullFalse8:
          jsonSerialization['boolDefaultNullFalse8'] as bool?,
      bigintDefaultStr8: _i1.BigIntJsonExtension.fromJson(
          jsonSerialization['bigintDefaultStr8']),
      bigintDefaultStrNull8: jsonSerialization['bigintDefaultStrNull8'] == null
          ? null
          : _i1.BigIntJsonExtension.fromJson(
              jsonSerialization['bigintDefaultStrNull8']),
      uuidDefaultRandom9: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandom9']),
      uuidDefaultRandomV79: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandomV79']),
      uuidDefaultRandomNull9:
          jsonSerialization['uuidDefaultRandomNull9'] == null
              ? null
              : _i1.UuidValueJsonExtension.fromJson(
                  jsonSerialization['uuidDefaultRandomNull9']),
      uuidDefaultStr9: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultStr9']),
      uuidDefaultStrNull9: jsonSerialization['uuidDefaultStrNull9'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['uuidDefaultStrNull9']),
      uriDefault9:
          _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefault9']),
      uriDefaultNull9: jsonSerialization['uriDefaultNull9'] == null
          ? null
          : _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefaultNull9']),
      stringDefault9: jsonSerialization['stringDefault9'] as String,
      stringDefaultNull9: jsonSerialization['stringDefaultNull9'] as String?,
      intDefault9: jsonSerialization['intDefault9'] as int,
      intDefaultNull9: jsonSerialization['intDefaultNull9'] as int?,
      durationDefault9: _i1.DurationJsonExtension.fromJson(
          jsonSerialization['durationDefault9']),
      durationDefaultNull9: jsonSerialization['durationDefaultNull9'] == null
          ? null
          : _i1.DurationJsonExtension.fromJson(
              jsonSerialization['durationDefaultNull9']),
      doubleDefault9: (jsonSerialization['doubleDefault9'] as num).toDouble(),
      doubleDefaultNull9:
          (jsonSerialization['doubleDefaultNull9'] as num?)?.toDouble(),
      dateTimeDefaultNow9: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultNow9']),
      dateTimeDefaultStr9: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultStr9']),
      dateTimeDefaultStrNull9:
          jsonSerialization['dateTimeDefaultStrNull9'] == null
              ? null
              : _i1.DateTimeJsonExtension.fromJson(
                  jsonSerialization['dateTimeDefaultStrNull9']),
      boolDefaultTrue9: jsonSerialization['boolDefaultTrue9'] as bool,
      boolDefaultFalse9: jsonSerialization['boolDefaultFalse9'] as bool,
      boolDefaultNullFalse9:
          jsonSerialization['boolDefaultNullFalse9'] as bool?,
      bigintDefaultStr9: _i1.BigIntJsonExtension.fromJson(
          jsonSerialization['bigintDefaultStr9']),
      bigintDefaultStrNull9: jsonSerialization['bigintDefaultStrNull9'] == null
          ? null
          : _i1.BigIntJsonExtension.fromJson(
              jsonSerialization['bigintDefaultStrNull9']),
      uuidDefaultRandom10: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandom10']),
      uuidDefaultRandomV710: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultRandomV710']),
      uuidDefaultRandomNull10:
          jsonSerialization['uuidDefaultRandomNull10'] == null
              ? null
              : _i1.UuidValueJsonExtension.fromJson(
                  jsonSerialization['uuidDefaultRandomNull10']),
      uuidDefaultStr10: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['uuidDefaultStr10']),
      uuidDefaultStrNull10: jsonSerialization['uuidDefaultStrNull10'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['uuidDefaultStrNull10']),
      uriDefault10:
          _i1.UriJsonExtension.fromJson(jsonSerialization['uriDefault10']),
      uriDefaultNull10: jsonSerialization['uriDefaultNull10'] == null
          ? null
          : _i1.UriJsonExtension.fromJson(
              jsonSerialization['uriDefaultNull10']),
      stringDefault10: jsonSerialization['stringDefault10'] as String,
      stringDefaultNull10: jsonSerialization['stringDefaultNull10'] as String?,
      intDefault10: jsonSerialization['intDefault10'] as int,
      intDefaultNull10: jsonSerialization['intDefaultNull10'] as int?,
      durationDefault10: _i1.DurationJsonExtension.fromJson(
          jsonSerialization['durationDefault10']),
      durationDefaultNull10: jsonSerialization['durationDefaultNull10'] == null
          ? null
          : _i1.DurationJsonExtension.fromJson(
              jsonSerialization['durationDefaultNull10']),
      doubleDefault10: (jsonSerialization['doubleDefault10'] as num).toDouble(),
      doubleDefaultNull10:
          (jsonSerialization['doubleDefaultNull10'] as num?)?.toDouble(),
      dateTimeDefaultNow10: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultNow10']),
      dateTimeDefaultStr10: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['dateTimeDefaultStr10']),
      dateTimeDefaultStrNull10:
          jsonSerialization['dateTimeDefaultStrNull10'] == null
              ? null
              : _i1.DateTimeJsonExtension.fromJson(
                  jsonSerialization['dateTimeDefaultStrNull10']),
      boolDefaultTrue10: jsonSerialization['boolDefaultTrue10'] as bool,
      boolDefaultFalse10: jsonSerialization['boolDefaultFalse10'] as bool,
      boolDefaultNullFalse10:
          jsonSerialization['boolDefaultNullFalse10'] as bool?,
      bigintDefaultStr10: _i1.BigIntJsonExtension.fromJson(
          jsonSerialization['bigintDefaultStr10']),
      bigintDefaultStrNull10:
          jsonSerialization['bigintDefaultStrNull10'] == null
              ? null
              : _i1.BigIntJsonExtension.fromJson(
                  jsonSerialization['bigintDefaultStrNull10']),
    );
  }

  static final t = LargeMessageTable();

  static const db = LargeMessageRepository._();

  @override
  int? id;

  _i2.LargeMessage? previous;

  int? nextId;

  _i2.LargeMessage? next;

  _i1.UuidValue uuidDefaultRandom;

  _i1.UuidValue uuidDefaultRandomV7;

  _i1.UuidValue? uuidDefaultRandomNull;

  _i1.UuidValue uuidDefaultStr;

  _i1.UuidValue? uuidDefaultStrNull;

  Uri uriDefault;

  Uri? uriDefaultNull;

  String stringDefault;

  String? stringDefaultNull;

  int intDefault;

  int? intDefaultNull;

  Duration durationDefault;

  Duration? durationDefaultNull;

  double doubleDefault;

  double? doubleDefaultNull;

  DateTime dateTimeDefaultNow;

  DateTime dateTimeDefaultStr;

  DateTime? dateTimeDefaultStrNull;

  bool boolDefaultTrue;

  bool boolDefaultFalse;

  bool? boolDefaultNullFalse;

  BigInt bigintDefaultStr;

  BigInt? bigintDefaultStrNull;

  _i1.UuidValue uuidDefaultRandom2;

  _i1.UuidValue uuidDefaultRandomV72;

  _i1.UuidValue? uuidDefaultRandomNull2;

  _i1.UuidValue uuidDefaultStr2;

  _i1.UuidValue? uuidDefaultStrNull2;

  Uri uriDefault2;

  Uri? uriDefaultNull2;

  String stringDefault2;

  String? stringDefaultNull2;

  int intDefault2;

  int? intDefaultNull2;

  Duration durationDefault2;

  Duration? durationDefaultNull2;

  double doubleDefault2;

  double? doubleDefaultNull2;

  DateTime dateTimeDefaultNow2;

  DateTime dateTimeDefaultStr2;

  DateTime? dateTimeDefaultStrNull2;

  bool boolDefaultTrue2;

  bool boolDefaultFalse2;

  bool? boolDefaultNullFalse2;

  BigInt bigintDefaultStr2;

  BigInt? bigintDefaultStrNull2;

  _i1.UuidValue uuidDefaultRandom3;

  _i1.UuidValue uuidDefaultRandomV73;

  _i1.UuidValue? uuidDefaultRandomNull3;

  _i1.UuidValue uuidDefaultStr3;

  _i1.UuidValue? uuidDefaultStrNull3;

  Uri uriDefault3;

  Uri? uriDefaultNull3;

  String stringDefault3;

  String? stringDefaultNull3;

  int intDefault3;

  int? intDefaultNull3;

  Duration durationDefault3;

  Duration? durationDefaultNull3;

  double doubleDefault3;

  double? doubleDefaultNull3;

  DateTime dateTimeDefaultNow3;

  DateTime dateTimeDefaultStr3;

  DateTime? dateTimeDefaultStrNull3;

  bool boolDefaultTrue3;

  bool boolDefaultFalse3;

  bool? boolDefaultNullFalse3;

  BigInt bigintDefaultStr3;

  BigInt? bigintDefaultStrNull3;

  _i1.UuidValue uuidDefaultRandom4;

  _i1.UuidValue uuidDefaultRandomV74;

  _i1.UuidValue? uuidDefaultRandomNull4;

  _i1.UuidValue uuidDefaultStr4;

  _i1.UuidValue? uuidDefaultStrNull4;

  Uri uriDefault4;

  Uri? uriDefaultNull4;

  String stringDefault4;

  String? stringDefaultNull4;

  int intDefault4;

  int? intDefaultNull4;

  Duration durationDefault4;

  Duration? durationDefaultNull4;

  double doubleDefault4;

  double? doubleDefaultNull4;

  DateTime dateTimeDefaultNow4;

  DateTime dateTimeDefaultStr4;

  DateTime? dateTimeDefaultStrNull4;

  bool boolDefaultTrue4;

  bool boolDefaultFalse4;

  bool? boolDefaultNullFalse4;

  BigInt bigintDefaultStr4;

  BigInt? bigintDefaultStrNull4;

  _i1.UuidValue uuidDefaultRandom5;

  _i1.UuidValue uuidDefaultRandomV75;

  _i1.UuidValue? uuidDefaultRandomNull5;

  _i1.UuidValue uuidDefaultStr5;

  _i1.UuidValue? uuidDefaultStrNull5;

  Uri uriDefault5;

  Uri? uriDefaultNull5;

  String stringDefault5;

  String? stringDefaultNull5;

  int intDefault5;

  int? intDefaultNull5;

  Duration durationDefault5;

  Duration? durationDefaultNull5;

  double doubleDefault5;

  double? doubleDefaultNull5;

  DateTime dateTimeDefaultNow5;

  DateTime dateTimeDefaultStr5;

  DateTime? dateTimeDefaultStrNull5;

  bool boolDefaultTrue5;

  bool boolDefaultFalse5;

  bool? boolDefaultNullFalse5;

  BigInt bigintDefaultStr5;

  BigInt? bigintDefaultStrNull5;

  _i1.UuidValue uuidDefaultRandom6;

  _i1.UuidValue uuidDefaultRandomV76;

  _i1.UuidValue? uuidDefaultRandomNull6;

  _i1.UuidValue uuidDefaultStr6;

  _i1.UuidValue? uuidDefaultStrNull6;

  Uri uriDefault6;

  Uri? uriDefaultNull6;

  String stringDefault6;

  String? stringDefaultNull6;

  int intDefault6;

  int? intDefaultNull6;

  Duration durationDefault6;

  Duration? durationDefaultNull6;

  double doubleDefault6;

  double? doubleDefaultNull6;

  DateTime dateTimeDefaultNow6;

  DateTime dateTimeDefaultStr6;

  DateTime? dateTimeDefaultStrNull6;

  bool boolDefaultTrue6;

  bool boolDefaultFalse6;

  bool? boolDefaultNullFalse6;

  BigInt bigintDefaultStr6;

  BigInt? bigintDefaultStrNull6;

  _i1.UuidValue uuidDefaultRandom7;

  _i1.UuidValue uuidDefaultRandomV77;

  _i1.UuidValue? uuidDefaultRandomNull7;

  _i1.UuidValue uuidDefaultStr7;

  _i1.UuidValue? uuidDefaultStrNull7;

  Uri uriDefault7;

  Uri? uriDefaultNull7;

  String stringDefault7;

  String? stringDefaultNull7;

  int intDefault7;

  int? intDefaultNull7;

  Duration durationDefault7;

  Duration? durationDefaultNull7;

  double doubleDefault7;

  double? doubleDefaultNull7;

  DateTime dateTimeDefaultNow7;

  DateTime dateTimeDefaultStr7;

  DateTime? dateTimeDefaultStrNull7;

  bool boolDefaultTrue7;

  bool boolDefaultFalse7;

  bool? boolDefaultNullFalse7;

  BigInt bigintDefaultStr7;

  BigInt? bigintDefaultStrNull7;

  _i1.UuidValue uuidDefaultRandom8;

  _i1.UuidValue uuidDefaultRandomV78;

  _i1.UuidValue? uuidDefaultRandomNull8;

  _i1.UuidValue uuidDefaultStr8;

  _i1.UuidValue? uuidDefaultStrNull8;

  Uri uriDefault8;

  Uri? uriDefaultNull8;

  String stringDefault8;

  String? stringDefaultNull8;

  int intDefault8;

  int? intDefaultNull8;

  Duration durationDefault8;

  Duration? durationDefaultNull8;

  double doubleDefault8;

  double? doubleDefaultNull8;

  DateTime dateTimeDefaultNow8;

  DateTime dateTimeDefaultStr8;

  DateTime? dateTimeDefaultStrNull8;

  bool boolDefaultTrue8;

  bool boolDefaultFalse8;

  bool? boolDefaultNullFalse8;

  BigInt bigintDefaultStr8;

  BigInt? bigintDefaultStrNull8;

  _i1.UuidValue uuidDefaultRandom9;

  _i1.UuidValue uuidDefaultRandomV79;

  _i1.UuidValue? uuidDefaultRandomNull9;

  _i1.UuidValue uuidDefaultStr9;

  _i1.UuidValue? uuidDefaultStrNull9;

  Uri uriDefault9;

  Uri? uriDefaultNull9;

  String stringDefault9;

  String? stringDefaultNull9;

  int intDefault9;

  int? intDefaultNull9;

  Duration durationDefault9;

  Duration? durationDefaultNull9;

  double doubleDefault9;

  double? doubleDefaultNull9;

  DateTime dateTimeDefaultNow9;

  DateTime dateTimeDefaultStr9;

  DateTime? dateTimeDefaultStrNull9;

  bool boolDefaultTrue9;

  bool boolDefaultFalse9;

  bool? boolDefaultNullFalse9;

  BigInt bigintDefaultStr9;

  BigInt? bigintDefaultStrNull9;

  _i1.UuidValue uuidDefaultRandom10;

  _i1.UuidValue uuidDefaultRandomV710;

  _i1.UuidValue? uuidDefaultRandomNull10;

  _i1.UuidValue uuidDefaultStr10;

  _i1.UuidValue? uuidDefaultStrNull10;

  Uri uriDefault10;

  Uri? uriDefaultNull10;

  String stringDefault10;

  String? stringDefaultNull10;

  int intDefault10;

  int? intDefaultNull10;

  Duration durationDefault10;

  Duration? durationDefaultNull10;

  double doubleDefault10;

  double? doubleDefaultNull10;

  DateTime dateTimeDefaultNow10;

  DateTime dateTimeDefaultStr10;

  DateTime? dateTimeDefaultStrNull10;

  bool boolDefaultTrue10;

  bool boolDefaultFalse10;

  bool? boolDefaultNullFalse10;

  BigInt bigintDefaultStr10;

  BigInt? bigintDefaultStrNull10;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [LargeMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LargeMessage copyWith({
    int? id,
    _i2.LargeMessage? previous,
    int? nextId,
    _i2.LargeMessage? next,
    _i1.UuidValue? uuidDefaultRandom,
    _i1.UuidValue? uuidDefaultRandomV7,
    _i1.UuidValue? uuidDefaultRandomNull,
    _i1.UuidValue? uuidDefaultStr,
    _i1.UuidValue? uuidDefaultStrNull,
    Uri? uriDefault,
    Uri? uriDefaultNull,
    String? stringDefault,
    String? stringDefaultNull,
    int? intDefault,
    int? intDefaultNull,
    Duration? durationDefault,
    Duration? durationDefaultNull,
    double? doubleDefault,
    double? doubleDefaultNull,
    DateTime? dateTimeDefaultNow,
    DateTime? dateTimeDefaultStr,
    DateTime? dateTimeDefaultStrNull,
    bool? boolDefaultTrue,
    bool? boolDefaultFalse,
    bool? boolDefaultNullFalse,
    BigInt? bigintDefaultStr,
    BigInt? bigintDefaultStrNull,
    _i1.UuidValue? uuidDefaultRandom2,
    _i1.UuidValue? uuidDefaultRandomV72,
    _i1.UuidValue? uuidDefaultRandomNull2,
    _i1.UuidValue? uuidDefaultStr2,
    _i1.UuidValue? uuidDefaultStrNull2,
    Uri? uriDefault2,
    Uri? uriDefaultNull2,
    String? stringDefault2,
    String? stringDefaultNull2,
    int? intDefault2,
    int? intDefaultNull2,
    Duration? durationDefault2,
    Duration? durationDefaultNull2,
    double? doubleDefault2,
    double? doubleDefaultNull2,
    DateTime? dateTimeDefaultNow2,
    DateTime? dateTimeDefaultStr2,
    DateTime? dateTimeDefaultStrNull2,
    bool? boolDefaultTrue2,
    bool? boolDefaultFalse2,
    bool? boolDefaultNullFalse2,
    BigInt? bigintDefaultStr2,
    BigInt? bigintDefaultStrNull2,
    _i1.UuidValue? uuidDefaultRandom3,
    _i1.UuidValue? uuidDefaultRandomV73,
    _i1.UuidValue? uuidDefaultRandomNull3,
    _i1.UuidValue? uuidDefaultStr3,
    _i1.UuidValue? uuidDefaultStrNull3,
    Uri? uriDefault3,
    Uri? uriDefaultNull3,
    String? stringDefault3,
    String? stringDefaultNull3,
    int? intDefault3,
    int? intDefaultNull3,
    Duration? durationDefault3,
    Duration? durationDefaultNull3,
    double? doubleDefault3,
    double? doubleDefaultNull3,
    DateTime? dateTimeDefaultNow3,
    DateTime? dateTimeDefaultStr3,
    DateTime? dateTimeDefaultStrNull3,
    bool? boolDefaultTrue3,
    bool? boolDefaultFalse3,
    bool? boolDefaultNullFalse3,
    BigInt? bigintDefaultStr3,
    BigInt? bigintDefaultStrNull3,
    _i1.UuidValue? uuidDefaultRandom4,
    _i1.UuidValue? uuidDefaultRandomV74,
    _i1.UuidValue? uuidDefaultRandomNull4,
    _i1.UuidValue? uuidDefaultStr4,
    _i1.UuidValue? uuidDefaultStrNull4,
    Uri? uriDefault4,
    Uri? uriDefaultNull4,
    String? stringDefault4,
    String? stringDefaultNull4,
    int? intDefault4,
    int? intDefaultNull4,
    Duration? durationDefault4,
    Duration? durationDefaultNull4,
    double? doubleDefault4,
    double? doubleDefaultNull4,
    DateTime? dateTimeDefaultNow4,
    DateTime? dateTimeDefaultStr4,
    DateTime? dateTimeDefaultStrNull4,
    bool? boolDefaultTrue4,
    bool? boolDefaultFalse4,
    bool? boolDefaultNullFalse4,
    BigInt? bigintDefaultStr4,
    BigInt? bigintDefaultStrNull4,
    _i1.UuidValue? uuidDefaultRandom5,
    _i1.UuidValue? uuidDefaultRandomV75,
    _i1.UuidValue? uuidDefaultRandomNull5,
    _i1.UuidValue? uuidDefaultStr5,
    _i1.UuidValue? uuidDefaultStrNull5,
    Uri? uriDefault5,
    Uri? uriDefaultNull5,
    String? stringDefault5,
    String? stringDefaultNull5,
    int? intDefault5,
    int? intDefaultNull5,
    Duration? durationDefault5,
    Duration? durationDefaultNull5,
    double? doubleDefault5,
    double? doubleDefaultNull5,
    DateTime? dateTimeDefaultNow5,
    DateTime? dateTimeDefaultStr5,
    DateTime? dateTimeDefaultStrNull5,
    bool? boolDefaultTrue5,
    bool? boolDefaultFalse5,
    bool? boolDefaultNullFalse5,
    BigInt? bigintDefaultStr5,
    BigInt? bigintDefaultStrNull5,
    _i1.UuidValue? uuidDefaultRandom6,
    _i1.UuidValue? uuidDefaultRandomV76,
    _i1.UuidValue? uuidDefaultRandomNull6,
    _i1.UuidValue? uuidDefaultStr6,
    _i1.UuidValue? uuidDefaultStrNull6,
    Uri? uriDefault6,
    Uri? uriDefaultNull6,
    String? stringDefault6,
    String? stringDefaultNull6,
    int? intDefault6,
    int? intDefaultNull6,
    Duration? durationDefault6,
    Duration? durationDefaultNull6,
    double? doubleDefault6,
    double? doubleDefaultNull6,
    DateTime? dateTimeDefaultNow6,
    DateTime? dateTimeDefaultStr6,
    DateTime? dateTimeDefaultStrNull6,
    bool? boolDefaultTrue6,
    bool? boolDefaultFalse6,
    bool? boolDefaultNullFalse6,
    BigInt? bigintDefaultStr6,
    BigInt? bigintDefaultStrNull6,
    _i1.UuidValue? uuidDefaultRandom7,
    _i1.UuidValue? uuidDefaultRandomV77,
    _i1.UuidValue? uuidDefaultRandomNull7,
    _i1.UuidValue? uuidDefaultStr7,
    _i1.UuidValue? uuidDefaultStrNull7,
    Uri? uriDefault7,
    Uri? uriDefaultNull7,
    String? stringDefault7,
    String? stringDefaultNull7,
    int? intDefault7,
    int? intDefaultNull7,
    Duration? durationDefault7,
    Duration? durationDefaultNull7,
    double? doubleDefault7,
    double? doubleDefaultNull7,
    DateTime? dateTimeDefaultNow7,
    DateTime? dateTimeDefaultStr7,
    DateTime? dateTimeDefaultStrNull7,
    bool? boolDefaultTrue7,
    bool? boolDefaultFalse7,
    bool? boolDefaultNullFalse7,
    BigInt? bigintDefaultStr7,
    BigInt? bigintDefaultStrNull7,
    _i1.UuidValue? uuidDefaultRandom8,
    _i1.UuidValue? uuidDefaultRandomV78,
    _i1.UuidValue? uuidDefaultRandomNull8,
    _i1.UuidValue? uuidDefaultStr8,
    _i1.UuidValue? uuidDefaultStrNull8,
    Uri? uriDefault8,
    Uri? uriDefaultNull8,
    String? stringDefault8,
    String? stringDefaultNull8,
    int? intDefault8,
    int? intDefaultNull8,
    Duration? durationDefault8,
    Duration? durationDefaultNull8,
    double? doubleDefault8,
    double? doubleDefaultNull8,
    DateTime? dateTimeDefaultNow8,
    DateTime? dateTimeDefaultStr8,
    DateTime? dateTimeDefaultStrNull8,
    bool? boolDefaultTrue8,
    bool? boolDefaultFalse8,
    bool? boolDefaultNullFalse8,
    BigInt? bigintDefaultStr8,
    BigInt? bigintDefaultStrNull8,
    _i1.UuidValue? uuidDefaultRandom9,
    _i1.UuidValue? uuidDefaultRandomV79,
    _i1.UuidValue? uuidDefaultRandomNull9,
    _i1.UuidValue? uuidDefaultStr9,
    _i1.UuidValue? uuidDefaultStrNull9,
    Uri? uriDefault9,
    Uri? uriDefaultNull9,
    String? stringDefault9,
    String? stringDefaultNull9,
    int? intDefault9,
    int? intDefaultNull9,
    Duration? durationDefault9,
    Duration? durationDefaultNull9,
    double? doubleDefault9,
    double? doubleDefaultNull9,
    DateTime? dateTimeDefaultNow9,
    DateTime? dateTimeDefaultStr9,
    DateTime? dateTimeDefaultStrNull9,
    bool? boolDefaultTrue9,
    bool? boolDefaultFalse9,
    bool? boolDefaultNullFalse9,
    BigInt? bigintDefaultStr9,
    BigInt? bigintDefaultStrNull9,
    _i1.UuidValue? uuidDefaultRandom10,
    _i1.UuidValue? uuidDefaultRandomV710,
    _i1.UuidValue? uuidDefaultRandomNull10,
    _i1.UuidValue? uuidDefaultStr10,
    _i1.UuidValue? uuidDefaultStrNull10,
    Uri? uriDefault10,
    Uri? uriDefaultNull10,
    String? stringDefault10,
    String? stringDefaultNull10,
    int? intDefault10,
    int? intDefaultNull10,
    Duration? durationDefault10,
    Duration? durationDefaultNull10,
    double? doubleDefault10,
    double? doubleDefaultNull10,
    DateTime? dateTimeDefaultNow10,
    DateTime? dateTimeDefaultStr10,
    DateTime? dateTimeDefaultStrNull10,
    bool? boolDefaultTrue10,
    bool? boolDefaultFalse10,
    bool? boolDefaultNullFalse10,
    BigInt? bigintDefaultStr10,
    BigInt? bigintDefaultStrNull10,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (previous != null) 'previous': previous?.toJson(),
      if (nextId != null) 'nextId': nextId,
      if (next != null) 'next': next?.toJson(),
      'uuidDefaultRandom': uuidDefaultRandom.toJson(),
      'uuidDefaultRandomV7': uuidDefaultRandomV7.toJson(),
      if (uuidDefaultRandomNull != null)
        'uuidDefaultRandomNull': uuidDefaultRandomNull?.toJson(),
      'uuidDefaultStr': uuidDefaultStr.toJson(),
      if (uuidDefaultStrNull != null)
        'uuidDefaultStrNull': uuidDefaultStrNull?.toJson(),
      'uriDefault': uriDefault.toJson(),
      if (uriDefaultNull != null) 'uriDefaultNull': uriDefaultNull?.toJson(),
      'stringDefault': stringDefault,
      if (stringDefaultNull != null) 'stringDefaultNull': stringDefaultNull,
      'intDefault': intDefault,
      if (intDefaultNull != null) 'intDefaultNull': intDefaultNull,
      'durationDefault': durationDefault.toJson(),
      if (durationDefaultNull != null)
        'durationDefaultNull': durationDefaultNull?.toJson(),
      'doubleDefault': doubleDefault,
      if (doubleDefaultNull != null) 'doubleDefaultNull': doubleDefaultNull,
      'dateTimeDefaultNow': dateTimeDefaultNow.toJson(),
      'dateTimeDefaultStr': dateTimeDefaultStr.toJson(),
      if (dateTimeDefaultStrNull != null)
        'dateTimeDefaultStrNull': dateTimeDefaultStrNull?.toJson(),
      'boolDefaultTrue': boolDefaultTrue,
      'boolDefaultFalse': boolDefaultFalse,
      if (boolDefaultNullFalse != null)
        'boolDefaultNullFalse': boolDefaultNullFalse,
      'bigintDefaultStr': bigintDefaultStr.toJson(),
      if (bigintDefaultStrNull != null)
        'bigintDefaultStrNull': bigintDefaultStrNull?.toJson(),
      'uuidDefaultRandom2': uuidDefaultRandom2.toJson(),
      'uuidDefaultRandomV72': uuidDefaultRandomV72.toJson(),
      if (uuidDefaultRandomNull2 != null)
        'uuidDefaultRandomNull2': uuidDefaultRandomNull2?.toJson(),
      'uuidDefaultStr2': uuidDefaultStr2.toJson(),
      if (uuidDefaultStrNull2 != null)
        'uuidDefaultStrNull2': uuidDefaultStrNull2?.toJson(),
      'uriDefault2': uriDefault2.toJson(),
      if (uriDefaultNull2 != null) 'uriDefaultNull2': uriDefaultNull2?.toJson(),
      'stringDefault2': stringDefault2,
      if (stringDefaultNull2 != null) 'stringDefaultNull2': stringDefaultNull2,
      'intDefault2': intDefault2,
      if (intDefaultNull2 != null) 'intDefaultNull2': intDefaultNull2,
      'durationDefault2': durationDefault2.toJson(),
      if (durationDefaultNull2 != null)
        'durationDefaultNull2': durationDefaultNull2?.toJson(),
      'doubleDefault2': doubleDefault2,
      if (doubleDefaultNull2 != null) 'doubleDefaultNull2': doubleDefaultNull2,
      'dateTimeDefaultNow2': dateTimeDefaultNow2.toJson(),
      'dateTimeDefaultStr2': dateTimeDefaultStr2.toJson(),
      if (dateTimeDefaultStrNull2 != null)
        'dateTimeDefaultStrNull2': dateTimeDefaultStrNull2?.toJson(),
      'boolDefaultTrue2': boolDefaultTrue2,
      'boolDefaultFalse2': boolDefaultFalse2,
      if (boolDefaultNullFalse2 != null)
        'boolDefaultNullFalse2': boolDefaultNullFalse2,
      'bigintDefaultStr2': bigintDefaultStr2.toJson(),
      if (bigintDefaultStrNull2 != null)
        'bigintDefaultStrNull2': bigintDefaultStrNull2?.toJson(),
      'uuidDefaultRandom3': uuidDefaultRandom3.toJson(),
      'uuidDefaultRandomV73': uuidDefaultRandomV73.toJson(),
      if (uuidDefaultRandomNull3 != null)
        'uuidDefaultRandomNull3': uuidDefaultRandomNull3?.toJson(),
      'uuidDefaultStr3': uuidDefaultStr3.toJson(),
      if (uuidDefaultStrNull3 != null)
        'uuidDefaultStrNull3': uuidDefaultStrNull3?.toJson(),
      'uriDefault3': uriDefault3.toJson(),
      if (uriDefaultNull3 != null) 'uriDefaultNull3': uriDefaultNull3?.toJson(),
      'stringDefault3': stringDefault3,
      if (stringDefaultNull3 != null) 'stringDefaultNull3': stringDefaultNull3,
      'intDefault3': intDefault3,
      if (intDefaultNull3 != null) 'intDefaultNull3': intDefaultNull3,
      'durationDefault3': durationDefault3.toJson(),
      if (durationDefaultNull3 != null)
        'durationDefaultNull3': durationDefaultNull3?.toJson(),
      'doubleDefault3': doubleDefault3,
      if (doubleDefaultNull3 != null) 'doubleDefaultNull3': doubleDefaultNull3,
      'dateTimeDefaultNow3': dateTimeDefaultNow3.toJson(),
      'dateTimeDefaultStr3': dateTimeDefaultStr3.toJson(),
      if (dateTimeDefaultStrNull3 != null)
        'dateTimeDefaultStrNull3': dateTimeDefaultStrNull3?.toJson(),
      'boolDefaultTrue3': boolDefaultTrue3,
      'boolDefaultFalse3': boolDefaultFalse3,
      if (boolDefaultNullFalse3 != null)
        'boolDefaultNullFalse3': boolDefaultNullFalse3,
      'bigintDefaultStr3': bigintDefaultStr3.toJson(),
      if (bigintDefaultStrNull3 != null)
        'bigintDefaultStrNull3': bigintDefaultStrNull3?.toJson(),
      'uuidDefaultRandom4': uuidDefaultRandom4.toJson(),
      'uuidDefaultRandomV74': uuidDefaultRandomV74.toJson(),
      if (uuidDefaultRandomNull4 != null)
        'uuidDefaultRandomNull4': uuidDefaultRandomNull4?.toJson(),
      'uuidDefaultStr4': uuidDefaultStr4.toJson(),
      if (uuidDefaultStrNull4 != null)
        'uuidDefaultStrNull4': uuidDefaultStrNull4?.toJson(),
      'uriDefault4': uriDefault4.toJson(),
      if (uriDefaultNull4 != null) 'uriDefaultNull4': uriDefaultNull4?.toJson(),
      'stringDefault4': stringDefault4,
      if (stringDefaultNull4 != null) 'stringDefaultNull4': stringDefaultNull4,
      'intDefault4': intDefault4,
      if (intDefaultNull4 != null) 'intDefaultNull4': intDefaultNull4,
      'durationDefault4': durationDefault4.toJson(),
      if (durationDefaultNull4 != null)
        'durationDefaultNull4': durationDefaultNull4?.toJson(),
      'doubleDefault4': doubleDefault4,
      if (doubleDefaultNull4 != null) 'doubleDefaultNull4': doubleDefaultNull4,
      'dateTimeDefaultNow4': dateTimeDefaultNow4.toJson(),
      'dateTimeDefaultStr4': dateTimeDefaultStr4.toJson(),
      if (dateTimeDefaultStrNull4 != null)
        'dateTimeDefaultStrNull4': dateTimeDefaultStrNull4?.toJson(),
      'boolDefaultTrue4': boolDefaultTrue4,
      'boolDefaultFalse4': boolDefaultFalse4,
      if (boolDefaultNullFalse4 != null)
        'boolDefaultNullFalse4': boolDefaultNullFalse4,
      'bigintDefaultStr4': bigintDefaultStr4.toJson(),
      if (bigintDefaultStrNull4 != null)
        'bigintDefaultStrNull4': bigintDefaultStrNull4?.toJson(),
      'uuidDefaultRandom5': uuidDefaultRandom5.toJson(),
      'uuidDefaultRandomV75': uuidDefaultRandomV75.toJson(),
      if (uuidDefaultRandomNull5 != null)
        'uuidDefaultRandomNull5': uuidDefaultRandomNull5?.toJson(),
      'uuidDefaultStr5': uuidDefaultStr5.toJson(),
      if (uuidDefaultStrNull5 != null)
        'uuidDefaultStrNull5': uuidDefaultStrNull5?.toJson(),
      'uriDefault5': uriDefault5.toJson(),
      if (uriDefaultNull5 != null) 'uriDefaultNull5': uriDefaultNull5?.toJson(),
      'stringDefault5': stringDefault5,
      if (stringDefaultNull5 != null) 'stringDefaultNull5': stringDefaultNull5,
      'intDefault5': intDefault5,
      if (intDefaultNull5 != null) 'intDefaultNull5': intDefaultNull5,
      'durationDefault5': durationDefault5.toJson(),
      if (durationDefaultNull5 != null)
        'durationDefaultNull5': durationDefaultNull5?.toJson(),
      'doubleDefault5': doubleDefault5,
      if (doubleDefaultNull5 != null) 'doubleDefaultNull5': doubleDefaultNull5,
      'dateTimeDefaultNow5': dateTimeDefaultNow5.toJson(),
      'dateTimeDefaultStr5': dateTimeDefaultStr5.toJson(),
      if (dateTimeDefaultStrNull5 != null)
        'dateTimeDefaultStrNull5': dateTimeDefaultStrNull5?.toJson(),
      'boolDefaultTrue5': boolDefaultTrue5,
      'boolDefaultFalse5': boolDefaultFalse5,
      if (boolDefaultNullFalse5 != null)
        'boolDefaultNullFalse5': boolDefaultNullFalse5,
      'bigintDefaultStr5': bigintDefaultStr5.toJson(),
      if (bigintDefaultStrNull5 != null)
        'bigintDefaultStrNull5': bigintDefaultStrNull5?.toJson(),
      'uuidDefaultRandom6': uuidDefaultRandom6.toJson(),
      'uuidDefaultRandomV76': uuidDefaultRandomV76.toJson(),
      if (uuidDefaultRandomNull6 != null)
        'uuidDefaultRandomNull6': uuidDefaultRandomNull6?.toJson(),
      'uuidDefaultStr6': uuidDefaultStr6.toJson(),
      if (uuidDefaultStrNull6 != null)
        'uuidDefaultStrNull6': uuidDefaultStrNull6?.toJson(),
      'uriDefault6': uriDefault6.toJson(),
      if (uriDefaultNull6 != null) 'uriDefaultNull6': uriDefaultNull6?.toJson(),
      'stringDefault6': stringDefault6,
      if (stringDefaultNull6 != null) 'stringDefaultNull6': stringDefaultNull6,
      'intDefault6': intDefault6,
      if (intDefaultNull6 != null) 'intDefaultNull6': intDefaultNull6,
      'durationDefault6': durationDefault6.toJson(),
      if (durationDefaultNull6 != null)
        'durationDefaultNull6': durationDefaultNull6?.toJson(),
      'doubleDefault6': doubleDefault6,
      if (doubleDefaultNull6 != null) 'doubleDefaultNull6': doubleDefaultNull6,
      'dateTimeDefaultNow6': dateTimeDefaultNow6.toJson(),
      'dateTimeDefaultStr6': dateTimeDefaultStr6.toJson(),
      if (dateTimeDefaultStrNull6 != null)
        'dateTimeDefaultStrNull6': dateTimeDefaultStrNull6?.toJson(),
      'boolDefaultTrue6': boolDefaultTrue6,
      'boolDefaultFalse6': boolDefaultFalse6,
      if (boolDefaultNullFalse6 != null)
        'boolDefaultNullFalse6': boolDefaultNullFalse6,
      'bigintDefaultStr6': bigintDefaultStr6.toJson(),
      if (bigintDefaultStrNull6 != null)
        'bigintDefaultStrNull6': bigintDefaultStrNull6?.toJson(),
      'uuidDefaultRandom7': uuidDefaultRandom7.toJson(),
      'uuidDefaultRandomV77': uuidDefaultRandomV77.toJson(),
      if (uuidDefaultRandomNull7 != null)
        'uuidDefaultRandomNull7': uuidDefaultRandomNull7?.toJson(),
      'uuidDefaultStr7': uuidDefaultStr7.toJson(),
      if (uuidDefaultStrNull7 != null)
        'uuidDefaultStrNull7': uuidDefaultStrNull7?.toJson(),
      'uriDefault7': uriDefault7.toJson(),
      if (uriDefaultNull7 != null) 'uriDefaultNull7': uriDefaultNull7?.toJson(),
      'stringDefault7': stringDefault7,
      if (stringDefaultNull7 != null) 'stringDefaultNull7': stringDefaultNull7,
      'intDefault7': intDefault7,
      if (intDefaultNull7 != null) 'intDefaultNull7': intDefaultNull7,
      'durationDefault7': durationDefault7.toJson(),
      if (durationDefaultNull7 != null)
        'durationDefaultNull7': durationDefaultNull7?.toJson(),
      'doubleDefault7': doubleDefault7,
      if (doubleDefaultNull7 != null) 'doubleDefaultNull7': doubleDefaultNull7,
      'dateTimeDefaultNow7': dateTimeDefaultNow7.toJson(),
      'dateTimeDefaultStr7': dateTimeDefaultStr7.toJson(),
      if (dateTimeDefaultStrNull7 != null)
        'dateTimeDefaultStrNull7': dateTimeDefaultStrNull7?.toJson(),
      'boolDefaultTrue7': boolDefaultTrue7,
      'boolDefaultFalse7': boolDefaultFalse7,
      if (boolDefaultNullFalse7 != null)
        'boolDefaultNullFalse7': boolDefaultNullFalse7,
      'bigintDefaultStr7': bigintDefaultStr7.toJson(),
      if (bigintDefaultStrNull7 != null)
        'bigintDefaultStrNull7': bigintDefaultStrNull7?.toJson(),
      'uuidDefaultRandom8': uuidDefaultRandom8.toJson(),
      'uuidDefaultRandomV78': uuidDefaultRandomV78.toJson(),
      if (uuidDefaultRandomNull8 != null)
        'uuidDefaultRandomNull8': uuidDefaultRandomNull8?.toJson(),
      'uuidDefaultStr8': uuidDefaultStr8.toJson(),
      if (uuidDefaultStrNull8 != null)
        'uuidDefaultStrNull8': uuidDefaultStrNull8?.toJson(),
      'uriDefault8': uriDefault8.toJson(),
      if (uriDefaultNull8 != null) 'uriDefaultNull8': uriDefaultNull8?.toJson(),
      'stringDefault8': stringDefault8,
      if (stringDefaultNull8 != null) 'stringDefaultNull8': stringDefaultNull8,
      'intDefault8': intDefault8,
      if (intDefaultNull8 != null) 'intDefaultNull8': intDefaultNull8,
      'durationDefault8': durationDefault8.toJson(),
      if (durationDefaultNull8 != null)
        'durationDefaultNull8': durationDefaultNull8?.toJson(),
      'doubleDefault8': doubleDefault8,
      if (doubleDefaultNull8 != null) 'doubleDefaultNull8': doubleDefaultNull8,
      'dateTimeDefaultNow8': dateTimeDefaultNow8.toJson(),
      'dateTimeDefaultStr8': dateTimeDefaultStr8.toJson(),
      if (dateTimeDefaultStrNull8 != null)
        'dateTimeDefaultStrNull8': dateTimeDefaultStrNull8?.toJson(),
      'boolDefaultTrue8': boolDefaultTrue8,
      'boolDefaultFalse8': boolDefaultFalse8,
      if (boolDefaultNullFalse8 != null)
        'boolDefaultNullFalse8': boolDefaultNullFalse8,
      'bigintDefaultStr8': bigintDefaultStr8.toJson(),
      if (bigintDefaultStrNull8 != null)
        'bigintDefaultStrNull8': bigintDefaultStrNull8?.toJson(),
      'uuidDefaultRandom9': uuidDefaultRandom9.toJson(),
      'uuidDefaultRandomV79': uuidDefaultRandomV79.toJson(),
      if (uuidDefaultRandomNull9 != null)
        'uuidDefaultRandomNull9': uuidDefaultRandomNull9?.toJson(),
      'uuidDefaultStr9': uuidDefaultStr9.toJson(),
      if (uuidDefaultStrNull9 != null)
        'uuidDefaultStrNull9': uuidDefaultStrNull9?.toJson(),
      'uriDefault9': uriDefault9.toJson(),
      if (uriDefaultNull9 != null) 'uriDefaultNull9': uriDefaultNull9?.toJson(),
      'stringDefault9': stringDefault9,
      if (stringDefaultNull9 != null) 'stringDefaultNull9': stringDefaultNull9,
      'intDefault9': intDefault9,
      if (intDefaultNull9 != null) 'intDefaultNull9': intDefaultNull9,
      'durationDefault9': durationDefault9.toJson(),
      if (durationDefaultNull9 != null)
        'durationDefaultNull9': durationDefaultNull9?.toJson(),
      'doubleDefault9': doubleDefault9,
      if (doubleDefaultNull9 != null) 'doubleDefaultNull9': doubleDefaultNull9,
      'dateTimeDefaultNow9': dateTimeDefaultNow9.toJson(),
      'dateTimeDefaultStr9': dateTimeDefaultStr9.toJson(),
      if (dateTimeDefaultStrNull9 != null)
        'dateTimeDefaultStrNull9': dateTimeDefaultStrNull9?.toJson(),
      'boolDefaultTrue9': boolDefaultTrue9,
      'boolDefaultFalse9': boolDefaultFalse9,
      if (boolDefaultNullFalse9 != null)
        'boolDefaultNullFalse9': boolDefaultNullFalse9,
      'bigintDefaultStr9': bigintDefaultStr9.toJson(),
      if (bigintDefaultStrNull9 != null)
        'bigintDefaultStrNull9': bigintDefaultStrNull9?.toJson(),
      'uuidDefaultRandom10': uuidDefaultRandom10.toJson(),
      'uuidDefaultRandomV710': uuidDefaultRandomV710.toJson(),
      if (uuidDefaultRandomNull10 != null)
        'uuidDefaultRandomNull10': uuidDefaultRandomNull10?.toJson(),
      'uuidDefaultStr10': uuidDefaultStr10.toJson(),
      if (uuidDefaultStrNull10 != null)
        'uuidDefaultStrNull10': uuidDefaultStrNull10?.toJson(),
      'uriDefault10': uriDefault10.toJson(),
      if (uriDefaultNull10 != null)
        'uriDefaultNull10': uriDefaultNull10?.toJson(),
      'stringDefault10': stringDefault10,
      if (stringDefaultNull10 != null)
        'stringDefaultNull10': stringDefaultNull10,
      'intDefault10': intDefault10,
      if (intDefaultNull10 != null) 'intDefaultNull10': intDefaultNull10,
      'durationDefault10': durationDefault10.toJson(),
      if (durationDefaultNull10 != null)
        'durationDefaultNull10': durationDefaultNull10?.toJson(),
      'doubleDefault10': doubleDefault10,
      if (doubleDefaultNull10 != null)
        'doubleDefaultNull10': doubleDefaultNull10,
      'dateTimeDefaultNow10': dateTimeDefaultNow10.toJson(),
      'dateTimeDefaultStr10': dateTimeDefaultStr10.toJson(),
      if (dateTimeDefaultStrNull10 != null)
        'dateTimeDefaultStrNull10': dateTimeDefaultStrNull10?.toJson(),
      'boolDefaultTrue10': boolDefaultTrue10,
      'boolDefaultFalse10': boolDefaultFalse10,
      if (boolDefaultNullFalse10 != null)
        'boolDefaultNullFalse10': boolDefaultNullFalse10,
      'bigintDefaultStr10': bigintDefaultStr10.toJson(),
      if (bigintDefaultStrNull10 != null)
        'bigintDefaultStrNull10': bigintDefaultStrNull10?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (previous != null) 'previous': previous?.toJsonForProtocol(),
      if (nextId != null) 'nextId': nextId,
      if (next != null) 'next': next?.toJsonForProtocol(),
      'uuidDefaultRandom': uuidDefaultRandom.toJson(),
      'uuidDefaultRandomV7': uuidDefaultRandomV7.toJson(),
      if (uuidDefaultRandomNull != null)
        'uuidDefaultRandomNull': uuidDefaultRandomNull?.toJson(),
      'uuidDefaultStr': uuidDefaultStr.toJson(),
      if (uuidDefaultStrNull != null)
        'uuidDefaultStrNull': uuidDefaultStrNull?.toJson(),
      'uriDefault': uriDefault.toJson(),
      if (uriDefaultNull != null) 'uriDefaultNull': uriDefaultNull?.toJson(),
      'stringDefault': stringDefault,
      if (stringDefaultNull != null) 'stringDefaultNull': stringDefaultNull,
      'intDefault': intDefault,
      if (intDefaultNull != null) 'intDefaultNull': intDefaultNull,
      'durationDefault': durationDefault.toJson(),
      if (durationDefaultNull != null)
        'durationDefaultNull': durationDefaultNull?.toJson(),
      'doubleDefault': doubleDefault,
      if (doubleDefaultNull != null) 'doubleDefaultNull': doubleDefaultNull,
      'dateTimeDefaultNow': dateTimeDefaultNow.toJson(),
      'dateTimeDefaultStr': dateTimeDefaultStr.toJson(),
      if (dateTimeDefaultStrNull != null)
        'dateTimeDefaultStrNull': dateTimeDefaultStrNull?.toJson(),
      'boolDefaultTrue': boolDefaultTrue,
      'boolDefaultFalse': boolDefaultFalse,
      if (boolDefaultNullFalse != null)
        'boolDefaultNullFalse': boolDefaultNullFalse,
      'bigintDefaultStr': bigintDefaultStr.toJson(),
      if (bigintDefaultStrNull != null)
        'bigintDefaultStrNull': bigintDefaultStrNull?.toJson(),
      'uuidDefaultRandom2': uuidDefaultRandom2.toJson(),
      'uuidDefaultRandomV72': uuidDefaultRandomV72.toJson(),
      if (uuidDefaultRandomNull2 != null)
        'uuidDefaultRandomNull2': uuidDefaultRandomNull2?.toJson(),
      'uuidDefaultStr2': uuidDefaultStr2.toJson(),
      if (uuidDefaultStrNull2 != null)
        'uuidDefaultStrNull2': uuidDefaultStrNull2?.toJson(),
      'uriDefault2': uriDefault2.toJson(),
      if (uriDefaultNull2 != null) 'uriDefaultNull2': uriDefaultNull2?.toJson(),
      'stringDefault2': stringDefault2,
      if (stringDefaultNull2 != null) 'stringDefaultNull2': stringDefaultNull2,
      'intDefault2': intDefault2,
      if (intDefaultNull2 != null) 'intDefaultNull2': intDefaultNull2,
      'durationDefault2': durationDefault2.toJson(),
      if (durationDefaultNull2 != null)
        'durationDefaultNull2': durationDefaultNull2?.toJson(),
      'doubleDefault2': doubleDefault2,
      if (doubleDefaultNull2 != null) 'doubleDefaultNull2': doubleDefaultNull2,
      'dateTimeDefaultNow2': dateTimeDefaultNow2.toJson(),
      'dateTimeDefaultStr2': dateTimeDefaultStr2.toJson(),
      if (dateTimeDefaultStrNull2 != null)
        'dateTimeDefaultStrNull2': dateTimeDefaultStrNull2?.toJson(),
      'boolDefaultTrue2': boolDefaultTrue2,
      'boolDefaultFalse2': boolDefaultFalse2,
      if (boolDefaultNullFalse2 != null)
        'boolDefaultNullFalse2': boolDefaultNullFalse2,
      'bigintDefaultStr2': bigintDefaultStr2.toJson(),
      if (bigintDefaultStrNull2 != null)
        'bigintDefaultStrNull2': bigintDefaultStrNull2?.toJson(),
      'uuidDefaultRandom3': uuidDefaultRandom3.toJson(),
      'uuidDefaultRandomV73': uuidDefaultRandomV73.toJson(),
      if (uuidDefaultRandomNull3 != null)
        'uuidDefaultRandomNull3': uuidDefaultRandomNull3?.toJson(),
      'uuidDefaultStr3': uuidDefaultStr3.toJson(),
      if (uuidDefaultStrNull3 != null)
        'uuidDefaultStrNull3': uuidDefaultStrNull3?.toJson(),
      'uriDefault3': uriDefault3.toJson(),
      if (uriDefaultNull3 != null) 'uriDefaultNull3': uriDefaultNull3?.toJson(),
      'stringDefault3': stringDefault3,
      if (stringDefaultNull3 != null) 'stringDefaultNull3': stringDefaultNull3,
      'intDefault3': intDefault3,
      if (intDefaultNull3 != null) 'intDefaultNull3': intDefaultNull3,
      'durationDefault3': durationDefault3.toJson(),
      if (durationDefaultNull3 != null)
        'durationDefaultNull3': durationDefaultNull3?.toJson(),
      'doubleDefault3': doubleDefault3,
      if (doubleDefaultNull3 != null) 'doubleDefaultNull3': doubleDefaultNull3,
      'dateTimeDefaultNow3': dateTimeDefaultNow3.toJson(),
      'dateTimeDefaultStr3': dateTimeDefaultStr3.toJson(),
      if (dateTimeDefaultStrNull3 != null)
        'dateTimeDefaultStrNull3': dateTimeDefaultStrNull3?.toJson(),
      'boolDefaultTrue3': boolDefaultTrue3,
      'boolDefaultFalse3': boolDefaultFalse3,
      if (boolDefaultNullFalse3 != null)
        'boolDefaultNullFalse3': boolDefaultNullFalse3,
      'bigintDefaultStr3': bigintDefaultStr3.toJson(),
      if (bigintDefaultStrNull3 != null)
        'bigintDefaultStrNull3': bigintDefaultStrNull3?.toJson(),
      'uuidDefaultRandom4': uuidDefaultRandom4.toJson(),
      'uuidDefaultRandomV74': uuidDefaultRandomV74.toJson(),
      if (uuidDefaultRandomNull4 != null)
        'uuidDefaultRandomNull4': uuidDefaultRandomNull4?.toJson(),
      'uuidDefaultStr4': uuidDefaultStr4.toJson(),
      if (uuidDefaultStrNull4 != null)
        'uuidDefaultStrNull4': uuidDefaultStrNull4?.toJson(),
      'uriDefault4': uriDefault4.toJson(),
      if (uriDefaultNull4 != null) 'uriDefaultNull4': uriDefaultNull4?.toJson(),
      'stringDefault4': stringDefault4,
      if (stringDefaultNull4 != null) 'stringDefaultNull4': stringDefaultNull4,
      'intDefault4': intDefault4,
      if (intDefaultNull4 != null) 'intDefaultNull4': intDefaultNull4,
      'durationDefault4': durationDefault4.toJson(),
      if (durationDefaultNull4 != null)
        'durationDefaultNull4': durationDefaultNull4?.toJson(),
      'doubleDefault4': doubleDefault4,
      if (doubleDefaultNull4 != null) 'doubleDefaultNull4': doubleDefaultNull4,
      'dateTimeDefaultNow4': dateTimeDefaultNow4.toJson(),
      'dateTimeDefaultStr4': dateTimeDefaultStr4.toJson(),
      if (dateTimeDefaultStrNull4 != null)
        'dateTimeDefaultStrNull4': dateTimeDefaultStrNull4?.toJson(),
      'boolDefaultTrue4': boolDefaultTrue4,
      'boolDefaultFalse4': boolDefaultFalse4,
      if (boolDefaultNullFalse4 != null)
        'boolDefaultNullFalse4': boolDefaultNullFalse4,
      'bigintDefaultStr4': bigintDefaultStr4.toJson(),
      if (bigintDefaultStrNull4 != null)
        'bigintDefaultStrNull4': bigintDefaultStrNull4?.toJson(),
      'uuidDefaultRandom5': uuidDefaultRandom5.toJson(),
      'uuidDefaultRandomV75': uuidDefaultRandomV75.toJson(),
      if (uuidDefaultRandomNull5 != null)
        'uuidDefaultRandomNull5': uuidDefaultRandomNull5?.toJson(),
      'uuidDefaultStr5': uuidDefaultStr5.toJson(),
      if (uuidDefaultStrNull5 != null)
        'uuidDefaultStrNull5': uuidDefaultStrNull5?.toJson(),
      'uriDefault5': uriDefault5.toJson(),
      if (uriDefaultNull5 != null) 'uriDefaultNull5': uriDefaultNull5?.toJson(),
      'stringDefault5': stringDefault5,
      if (stringDefaultNull5 != null) 'stringDefaultNull5': stringDefaultNull5,
      'intDefault5': intDefault5,
      if (intDefaultNull5 != null) 'intDefaultNull5': intDefaultNull5,
      'durationDefault5': durationDefault5.toJson(),
      if (durationDefaultNull5 != null)
        'durationDefaultNull5': durationDefaultNull5?.toJson(),
      'doubleDefault5': doubleDefault5,
      if (doubleDefaultNull5 != null) 'doubleDefaultNull5': doubleDefaultNull5,
      'dateTimeDefaultNow5': dateTimeDefaultNow5.toJson(),
      'dateTimeDefaultStr5': dateTimeDefaultStr5.toJson(),
      if (dateTimeDefaultStrNull5 != null)
        'dateTimeDefaultStrNull5': dateTimeDefaultStrNull5?.toJson(),
      'boolDefaultTrue5': boolDefaultTrue5,
      'boolDefaultFalse5': boolDefaultFalse5,
      if (boolDefaultNullFalse5 != null)
        'boolDefaultNullFalse5': boolDefaultNullFalse5,
      'bigintDefaultStr5': bigintDefaultStr5.toJson(),
      if (bigintDefaultStrNull5 != null)
        'bigintDefaultStrNull5': bigintDefaultStrNull5?.toJson(),
      'uuidDefaultRandom6': uuidDefaultRandom6.toJson(),
      'uuidDefaultRandomV76': uuidDefaultRandomV76.toJson(),
      if (uuidDefaultRandomNull6 != null)
        'uuidDefaultRandomNull6': uuidDefaultRandomNull6?.toJson(),
      'uuidDefaultStr6': uuidDefaultStr6.toJson(),
      if (uuidDefaultStrNull6 != null)
        'uuidDefaultStrNull6': uuidDefaultStrNull6?.toJson(),
      'uriDefault6': uriDefault6.toJson(),
      if (uriDefaultNull6 != null) 'uriDefaultNull6': uriDefaultNull6?.toJson(),
      'stringDefault6': stringDefault6,
      if (stringDefaultNull6 != null) 'stringDefaultNull6': stringDefaultNull6,
      'intDefault6': intDefault6,
      if (intDefaultNull6 != null) 'intDefaultNull6': intDefaultNull6,
      'durationDefault6': durationDefault6.toJson(),
      if (durationDefaultNull6 != null)
        'durationDefaultNull6': durationDefaultNull6?.toJson(),
      'doubleDefault6': doubleDefault6,
      if (doubleDefaultNull6 != null) 'doubleDefaultNull6': doubleDefaultNull6,
      'dateTimeDefaultNow6': dateTimeDefaultNow6.toJson(),
      'dateTimeDefaultStr6': dateTimeDefaultStr6.toJson(),
      if (dateTimeDefaultStrNull6 != null)
        'dateTimeDefaultStrNull6': dateTimeDefaultStrNull6?.toJson(),
      'boolDefaultTrue6': boolDefaultTrue6,
      'boolDefaultFalse6': boolDefaultFalse6,
      if (boolDefaultNullFalse6 != null)
        'boolDefaultNullFalse6': boolDefaultNullFalse6,
      'bigintDefaultStr6': bigintDefaultStr6.toJson(),
      if (bigintDefaultStrNull6 != null)
        'bigintDefaultStrNull6': bigintDefaultStrNull6?.toJson(),
      'uuidDefaultRandom7': uuidDefaultRandom7.toJson(),
      'uuidDefaultRandomV77': uuidDefaultRandomV77.toJson(),
      if (uuidDefaultRandomNull7 != null)
        'uuidDefaultRandomNull7': uuidDefaultRandomNull7?.toJson(),
      'uuidDefaultStr7': uuidDefaultStr7.toJson(),
      if (uuidDefaultStrNull7 != null)
        'uuidDefaultStrNull7': uuidDefaultStrNull7?.toJson(),
      'uriDefault7': uriDefault7.toJson(),
      if (uriDefaultNull7 != null) 'uriDefaultNull7': uriDefaultNull7?.toJson(),
      'stringDefault7': stringDefault7,
      if (stringDefaultNull7 != null) 'stringDefaultNull7': stringDefaultNull7,
      'intDefault7': intDefault7,
      if (intDefaultNull7 != null) 'intDefaultNull7': intDefaultNull7,
      'durationDefault7': durationDefault7.toJson(),
      if (durationDefaultNull7 != null)
        'durationDefaultNull7': durationDefaultNull7?.toJson(),
      'doubleDefault7': doubleDefault7,
      if (doubleDefaultNull7 != null) 'doubleDefaultNull7': doubleDefaultNull7,
      'dateTimeDefaultNow7': dateTimeDefaultNow7.toJson(),
      'dateTimeDefaultStr7': dateTimeDefaultStr7.toJson(),
      if (dateTimeDefaultStrNull7 != null)
        'dateTimeDefaultStrNull7': dateTimeDefaultStrNull7?.toJson(),
      'boolDefaultTrue7': boolDefaultTrue7,
      'boolDefaultFalse7': boolDefaultFalse7,
      if (boolDefaultNullFalse7 != null)
        'boolDefaultNullFalse7': boolDefaultNullFalse7,
      'bigintDefaultStr7': bigintDefaultStr7.toJson(),
      if (bigintDefaultStrNull7 != null)
        'bigintDefaultStrNull7': bigintDefaultStrNull7?.toJson(),
      'uuidDefaultRandom8': uuidDefaultRandom8.toJson(),
      'uuidDefaultRandomV78': uuidDefaultRandomV78.toJson(),
      if (uuidDefaultRandomNull8 != null)
        'uuidDefaultRandomNull8': uuidDefaultRandomNull8?.toJson(),
      'uuidDefaultStr8': uuidDefaultStr8.toJson(),
      if (uuidDefaultStrNull8 != null)
        'uuidDefaultStrNull8': uuidDefaultStrNull8?.toJson(),
      'uriDefault8': uriDefault8.toJson(),
      if (uriDefaultNull8 != null) 'uriDefaultNull8': uriDefaultNull8?.toJson(),
      'stringDefault8': stringDefault8,
      if (stringDefaultNull8 != null) 'stringDefaultNull8': stringDefaultNull8,
      'intDefault8': intDefault8,
      if (intDefaultNull8 != null) 'intDefaultNull8': intDefaultNull8,
      'durationDefault8': durationDefault8.toJson(),
      if (durationDefaultNull8 != null)
        'durationDefaultNull8': durationDefaultNull8?.toJson(),
      'doubleDefault8': doubleDefault8,
      if (doubleDefaultNull8 != null) 'doubleDefaultNull8': doubleDefaultNull8,
      'dateTimeDefaultNow8': dateTimeDefaultNow8.toJson(),
      'dateTimeDefaultStr8': dateTimeDefaultStr8.toJson(),
      if (dateTimeDefaultStrNull8 != null)
        'dateTimeDefaultStrNull8': dateTimeDefaultStrNull8?.toJson(),
      'boolDefaultTrue8': boolDefaultTrue8,
      'boolDefaultFalse8': boolDefaultFalse8,
      if (boolDefaultNullFalse8 != null)
        'boolDefaultNullFalse8': boolDefaultNullFalse8,
      'bigintDefaultStr8': bigintDefaultStr8.toJson(),
      if (bigintDefaultStrNull8 != null)
        'bigintDefaultStrNull8': bigintDefaultStrNull8?.toJson(),
      'uuidDefaultRandom9': uuidDefaultRandom9.toJson(),
      'uuidDefaultRandomV79': uuidDefaultRandomV79.toJson(),
      if (uuidDefaultRandomNull9 != null)
        'uuidDefaultRandomNull9': uuidDefaultRandomNull9?.toJson(),
      'uuidDefaultStr9': uuidDefaultStr9.toJson(),
      if (uuidDefaultStrNull9 != null)
        'uuidDefaultStrNull9': uuidDefaultStrNull9?.toJson(),
      'uriDefault9': uriDefault9.toJson(),
      if (uriDefaultNull9 != null) 'uriDefaultNull9': uriDefaultNull9?.toJson(),
      'stringDefault9': stringDefault9,
      if (stringDefaultNull9 != null) 'stringDefaultNull9': stringDefaultNull9,
      'intDefault9': intDefault9,
      if (intDefaultNull9 != null) 'intDefaultNull9': intDefaultNull9,
      'durationDefault9': durationDefault9.toJson(),
      if (durationDefaultNull9 != null)
        'durationDefaultNull9': durationDefaultNull9?.toJson(),
      'doubleDefault9': doubleDefault9,
      if (doubleDefaultNull9 != null) 'doubleDefaultNull9': doubleDefaultNull9,
      'dateTimeDefaultNow9': dateTimeDefaultNow9.toJson(),
      'dateTimeDefaultStr9': dateTimeDefaultStr9.toJson(),
      if (dateTimeDefaultStrNull9 != null)
        'dateTimeDefaultStrNull9': dateTimeDefaultStrNull9?.toJson(),
      'boolDefaultTrue9': boolDefaultTrue9,
      'boolDefaultFalse9': boolDefaultFalse9,
      if (boolDefaultNullFalse9 != null)
        'boolDefaultNullFalse9': boolDefaultNullFalse9,
      'bigintDefaultStr9': bigintDefaultStr9.toJson(),
      if (bigintDefaultStrNull9 != null)
        'bigintDefaultStrNull9': bigintDefaultStrNull9?.toJson(),
      'uuidDefaultRandom10': uuidDefaultRandom10.toJson(),
      'uuidDefaultRandomV710': uuidDefaultRandomV710.toJson(),
      if (uuidDefaultRandomNull10 != null)
        'uuidDefaultRandomNull10': uuidDefaultRandomNull10?.toJson(),
      'uuidDefaultStr10': uuidDefaultStr10.toJson(),
      if (uuidDefaultStrNull10 != null)
        'uuidDefaultStrNull10': uuidDefaultStrNull10?.toJson(),
      'uriDefault10': uriDefault10.toJson(),
      if (uriDefaultNull10 != null)
        'uriDefaultNull10': uriDefaultNull10?.toJson(),
      'stringDefault10': stringDefault10,
      if (stringDefaultNull10 != null)
        'stringDefaultNull10': stringDefaultNull10,
      'intDefault10': intDefault10,
      if (intDefaultNull10 != null) 'intDefaultNull10': intDefaultNull10,
      'durationDefault10': durationDefault10.toJson(),
      if (durationDefaultNull10 != null)
        'durationDefaultNull10': durationDefaultNull10?.toJson(),
      'doubleDefault10': doubleDefault10,
      if (doubleDefaultNull10 != null)
        'doubleDefaultNull10': doubleDefaultNull10,
      'dateTimeDefaultNow10': dateTimeDefaultNow10.toJson(),
      'dateTimeDefaultStr10': dateTimeDefaultStr10.toJson(),
      if (dateTimeDefaultStrNull10 != null)
        'dateTimeDefaultStrNull10': dateTimeDefaultStrNull10?.toJson(),
      'boolDefaultTrue10': boolDefaultTrue10,
      'boolDefaultFalse10': boolDefaultFalse10,
      if (boolDefaultNullFalse10 != null)
        'boolDefaultNullFalse10': boolDefaultNullFalse10,
      'bigintDefaultStr10': bigintDefaultStr10.toJson(),
      if (bigintDefaultStrNull10 != null)
        'bigintDefaultStrNull10': bigintDefaultStrNull10?.toJson(),
    };
  }

  static LargeMessageInclude include({
    _i2.LargeMessageInclude? previous,
    _i2.LargeMessageInclude? next,
  }) {
    return LargeMessageInclude._(
      previous: previous,
      next: next,
    );
  }

  static LargeMessageIncludeList includeList({
    _i1.WhereExpressionBuilder<LargeMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LargeMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LargeMessageTable>? orderByList,
    LargeMessageInclude? include,
  }) {
    return LargeMessageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LargeMessage.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(LargeMessage.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LargeMessageImpl extends LargeMessage {
  _LargeMessageImpl({
    int? id,
    _i2.LargeMessage? previous,
    int? nextId,
    _i2.LargeMessage? next,
    _i1.UuidValue? uuidDefaultRandom,
    _i1.UuidValue? uuidDefaultRandomV7,
    _i1.UuidValue? uuidDefaultRandomNull,
    _i1.UuidValue? uuidDefaultStr,
    _i1.UuidValue? uuidDefaultStrNull,
    Uri? uriDefault,
    Uri? uriDefaultNull,
    String? stringDefault,
    String? stringDefaultNull,
    int? intDefault,
    int? intDefaultNull,
    Duration? durationDefault,
    Duration? durationDefaultNull,
    double? doubleDefault,
    double? doubleDefaultNull,
    DateTime? dateTimeDefaultNow,
    DateTime? dateTimeDefaultStr,
    DateTime? dateTimeDefaultStrNull,
    bool? boolDefaultTrue,
    bool? boolDefaultFalse,
    bool? boolDefaultNullFalse,
    BigInt? bigintDefaultStr,
    BigInt? bigintDefaultStrNull,
    _i1.UuidValue? uuidDefaultRandom2,
    _i1.UuidValue? uuidDefaultRandomV72,
    _i1.UuidValue? uuidDefaultRandomNull2,
    _i1.UuidValue? uuidDefaultStr2,
    _i1.UuidValue? uuidDefaultStrNull2,
    Uri? uriDefault2,
    Uri? uriDefaultNull2,
    String? stringDefault2,
    String? stringDefaultNull2,
    int? intDefault2,
    int? intDefaultNull2,
    Duration? durationDefault2,
    Duration? durationDefaultNull2,
    double? doubleDefault2,
    double? doubleDefaultNull2,
    DateTime? dateTimeDefaultNow2,
    DateTime? dateTimeDefaultStr2,
    DateTime? dateTimeDefaultStrNull2,
    bool? boolDefaultTrue2,
    bool? boolDefaultFalse2,
    bool? boolDefaultNullFalse2,
    BigInt? bigintDefaultStr2,
    BigInt? bigintDefaultStrNull2,
    _i1.UuidValue? uuidDefaultRandom3,
    _i1.UuidValue? uuidDefaultRandomV73,
    _i1.UuidValue? uuidDefaultRandomNull3,
    _i1.UuidValue? uuidDefaultStr3,
    _i1.UuidValue? uuidDefaultStrNull3,
    Uri? uriDefault3,
    Uri? uriDefaultNull3,
    String? stringDefault3,
    String? stringDefaultNull3,
    int? intDefault3,
    int? intDefaultNull3,
    Duration? durationDefault3,
    Duration? durationDefaultNull3,
    double? doubleDefault3,
    double? doubleDefaultNull3,
    DateTime? dateTimeDefaultNow3,
    DateTime? dateTimeDefaultStr3,
    DateTime? dateTimeDefaultStrNull3,
    bool? boolDefaultTrue3,
    bool? boolDefaultFalse3,
    bool? boolDefaultNullFalse3,
    BigInt? bigintDefaultStr3,
    BigInt? bigintDefaultStrNull3,
    _i1.UuidValue? uuidDefaultRandom4,
    _i1.UuidValue? uuidDefaultRandomV74,
    _i1.UuidValue? uuidDefaultRandomNull4,
    _i1.UuidValue? uuidDefaultStr4,
    _i1.UuidValue? uuidDefaultStrNull4,
    Uri? uriDefault4,
    Uri? uriDefaultNull4,
    String? stringDefault4,
    String? stringDefaultNull4,
    int? intDefault4,
    int? intDefaultNull4,
    Duration? durationDefault4,
    Duration? durationDefaultNull4,
    double? doubleDefault4,
    double? doubleDefaultNull4,
    DateTime? dateTimeDefaultNow4,
    DateTime? dateTimeDefaultStr4,
    DateTime? dateTimeDefaultStrNull4,
    bool? boolDefaultTrue4,
    bool? boolDefaultFalse4,
    bool? boolDefaultNullFalse4,
    BigInt? bigintDefaultStr4,
    BigInt? bigintDefaultStrNull4,
    _i1.UuidValue? uuidDefaultRandom5,
    _i1.UuidValue? uuidDefaultRandomV75,
    _i1.UuidValue? uuidDefaultRandomNull5,
    _i1.UuidValue? uuidDefaultStr5,
    _i1.UuidValue? uuidDefaultStrNull5,
    Uri? uriDefault5,
    Uri? uriDefaultNull5,
    String? stringDefault5,
    String? stringDefaultNull5,
    int? intDefault5,
    int? intDefaultNull5,
    Duration? durationDefault5,
    Duration? durationDefaultNull5,
    double? doubleDefault5,
    double? doubleDefaultNull5,
    DateTime? dateTimeDefaultNow5,
    DateTime? dateTimeDefaultStr5,
    DateTime? dateTimeDefaultStrNull5,
    bool? boolDefaultTrue5,
    bool? boolDefaultFalse5,
    bool? boolDefaultNullFalse5,
    BigInt? bigintDefaultStr5,
    BigInt? bigintDefaultStrNull5,
    _i1.UuidValue? uuidDefaultRandom6,
    _i1.UuidValue? uuidDefaultRandomV76,
    _i1.UuidValue? uuidDefaultRandomNull6,
    _i1.UuidValue? uuidDefaultStr6,
    _i1.UuidValue? uuidDefaultStrNull6,
    Uri? uriDefault6,
    Uri? uriDefaultNull6,
    String? stringDefault6,
    String? stringDefaultNull6,
    int? intDefault6,
    int? intDefaultNull6,
    Duration? durationDefault6,
    Duration? durationDefaultNull6,
    double? doubleDefault6,
    double? doubleDefaultNull6,
    DateTime? dateTimeDefaultNow6,
    DateTime? dateTimeDefaultStr6,
    DateTime? dateTimeDefaultStrNull6,
    bool? boolDefaultTrue6,
    bool? boolDefaultFalse6,
    bool? boolDefaultNullFalse6,
    BigInt? bigintDefaultStr6,
    BigInt? bigintDefaultStrNull6,
    _i1.UuidValue? uuidDefaultRandom7,
    _i1.UuidValue? uuidDefaultRandomV77,
    _i1.UuidValue? uuidDefaultRandomNull7,
    _i1.UuidValue? uuidDefaultStr7,
    _i1.UuidValue? uuidDefaultStrNull7,
    Uri? uriDefault7,
    Uri? uriDefaultNull7,
    String? stringDefault7,
    String? stringDefaultNull7,
    int? intDefault7,
    int? intDefaultNull7,
    Duration? durationDefault7,
    Duration? durationDefaultNull7,
    double? doubleDefault7,
    double? doubleDefaultNull7,
    DateTime? dateTimeDefaultNow7,
    DateTime? dateTimeDefaultStr7,
    DateTime? dateTimeDefaultStrNull7,
    bool? boolDefaultTrue7,
    bool? boolDefaultFalse7,
    bool? boolDefaultNullFalse7,
    BigInt? bigintDefaultStr7,
    BigInt? bigintDefaultStrNull7,
    _i1.UuidValue? uuidDefaultRandom8,
    _i1.UuidValue? uuidDefaultRandomV78,
    _i1.UuidValue? uuidDefaultRandomNull8,
    _i1.UuidValue? uuidDefaultStr8,
    _i1.UuidValue? uuidDefaultStrNull8,
    Uri? uriDefault8,
    Uri? uriDefaultNull8,
    String? stringDefault8,
    String? stringDefaultNull8,
    int? intDefault8,
    int? intDefaultNull8,
    Duration? durationDefault8,
    Duration? durationDefaultNull8,
    double? doubleDefault8,
    double? doubleDefaultNull8,
    DateTime? dateTimeDefaultNow8,
    DateTime? dateTimeDefaultStr8,
    DateTime? dateTimeDefaultStrNull8,
    bool? boolDefaultTrue8,
    bool? boolDefaultFalse8,
    bool? boolDefaultNullFalse8,
    BigInt? bigintDefaultStr8,
    BigInt? bigintDefaultStrNull8,
    _i1.UuidValue? uuidDefaultRandom9,
    _i1.UuidValue? uuidDefaultRandomV79,
    _i1.UuidValue? uuidDefaultRandomNull9,
    _i1.UuidValue? uuidDefaultStr9,
    _i1.UuidValue? uuidDefaultStrNull9,
    Uri? uriDefault9,
    Uri? uriDefaultNull9,
    String? stringDefault9,
    String? stringDefaultNull9,
    int? intDefault9,
    int? intDefaultNull9,
    Duration? durationDefault9,
    Duration? durationDefaultNull9,
    double? doubleDefault9,
    double? doubleDefaultNull9,
    DateTime? dateTimeDefaultNow9,
    DateTime? dateTimeDefaultStr9,
    DateTime? dateTimeDefaultStrNull9,
    bool? boolDefaultTrue9,
    bool? boolDefaultFalse9,
    bool? boolDefaultNullFalse9,
    BigInt? bigintDefaultStr9,
    BigInt? bigintDefaultStrNull9,
    _i1.UuidValue? uuidDefaultRandom10,
    _i1.UuidValue? uuidDefaultRandomV710,
    _i1.UuidValue? uuidDefaultRandomNull10,
    _i1.UuidValue? uuidDefaultStr10,
    _i1.UuidValue? uuidDefaultStrNull10,
    Uri? uriDefault10,
    Uri? uriDefaultNull10,
    String? stringDefault10,
    String? stringDefaultNull10,
    int? intDefault10,
    int? intDefaultNull10,
    Duration? durationDefault10,
    Duration? durationDefaultNull10,
    double? doubleDefault10,
    double? doubleDefaultNull10,
    DateTime? dateTimeDefaultNow10,
    DateTime? dateTimeDefaultStr10,
    DateTime? dateTimeDefaultStrNull10,
    bool? boolDefaultTrue10,
    bool? boolDefaultFalse10,
    bool? boolDefaultNullFalse10,
    BigInt? bigintDefaultStr10,
    BigInt? bigintDefaultStrNull10,
  }) : super._(
          id: id,
          previous: previous,
          nextId: nextId,
          next: next,
          uuidDefaultRandom: uuidDefaultRandom,
          uuidDefaultRandomV7: uuidDefaultRandomV7,
          uuidDefaultRandomNull: uuidDefaultRandomNull,
          uuidDefaultStr: uuidDefaultStr,
          uuidDefaultStrNull: uuidDefaultStrNull,
          uriDefault: uriDefault,
          uriDefaultNull: uriDefaultNull,
          stringDefault: stringDefault,
          stringDefaultNull: stringDefaultNull,
          intDefault: intDefault,
          intDefaultNull: intDefaultNull,
          durationDefault: durationDefault,
          durationDefaultNull: durationDefaultNull,
          doubleDefault: doubleDefault,
          doubleDefaultNull: doubleDefaultNull,
          dateTimeDefaultNow: dateTimeDefaultNow,
          dateTimeDefaultStr: dateTimeDefaultStr,
          dateTimeDefaultStrNull: dateTimeDefaultStrNull,
          boolDefaultTrue: boolDefaultTrue,
          boolDefaultFalse: boolDefaultFalse,
          boolDefaultNullFalse: boolDefaultNullFalse,
          bigintDefaultStr: bigintDefaultStr,
          bigintDefaultStrNull: bigintDefaultStrNull,
          uuidDefaultRandom2: uuidDefaultRandom2,
          uuidDefaultRandomV72: uuidDefaultRandomV72,
          uuidDefaultRandomNull2: uuidDefaultRandomNull2,
          uuidDefaultStr2: uuidDefaultStr2,
          uuidDefaultStrNull2: uuidDefaultStrNull2,
          uriDefault2: uriDefault2,
          uriDefaultNull2: uriDefaultNull2,
          stringDefault2: stringDefault2,
          stringDefaultNull2: stringDefaultNull2,
          intDefault2: intDefault2,
          intDefaultNull2: intDefaultNull2,
          durationDefault2: durationDefault2,
          durationDefaultNull2: durationDefaultNull2,
          doubleDefault2: doubleDefault2,
          doubleDefaultNull2: doubleDefaultNull2,
          dateTimeDefaultNow2: dateTimeDefaultNow2,
          dateTimeDefaultStr2: dateTimeDefaultStr2,
          dateTimeDefaultStrNull2: dateTimeDefaultStrNull2,
          boolDefaultTrue2: boolDefaultTrue2,
          boolDefaultFalse2: boolDefaultFalse2,
          boolDefaultNullFalse2: boolDefaultNullFalse2,
          bigintDefaultStr2: bigintDefaultStr2,
          bigintDefaultStrNull2: bigintDefaultStrNull2,
          uuidDefaultRandom3: uuidDefaultRandom3,
          uuidDefaultRandomV73: uuidDefaultRandomV73,
          uuidDefaultRandomNull3: uuidDefaultRandomNull3,
          uuidDefaultStr3: uuidDefaultStr3,
          uuidDefaultStrNull3: uuidDefaultStrNull3,
          uriDefault3: uriDefault3,
          uriDefaultNull3: uriDefaultNull3,
          stringDefault3: stringDefault3,
          stringDefaultNull3: stringDefaultNull3,
          intDefault3: intDefault3,
          intDefaultNull3: intDefaultNull3,
          durationDefault3: durationDefault3,
          durationDefaultNull3: durationDefaultNull3,
          doubleDefault3: doubleDefault3,
          doubleDefaultNull3: doubleDefaultNull3,
          dateTimeDefaultNow3: dateTimeDefaultNow3,
          dateTimeDefaultStr3: dateTimeDefaultStr3,
          dateTimeDefaultStrNull3: dateTimeDefaultStrNull3,
          boolDefaultTrue3: boolDefaultTrue3,
          boolDefaultFalse3: boolDefaultFalse3,
          boolDefaultNullFalse3: boolDefaultNullFalse3,
          bigintDefaultStr3: bigintDefaultStr3,
          bigintDefaultStrNull3: bigintDefaultStrNull3,
          uuidDefaultRandom4: uuidDefaultRandom4,
          uuidDefaultRandomV74: uuidDefaultRandomV74,
          uuidDefaultRandomNull4: uuidDefaultRandomNull4,
          uuidDefaultStr4: uuidDefaultStr4,
          uuidDefaultStrNull4: uuidDefaultStrNull4,
          uriDefault4: uriDefault4,
          uriDefaultNull4: uriDefaultNull4,
          stringDefault4: stringDefault4,
          stringDefaultNull4: stringDefaultNull4,
          intDefault4: intDefault4,
          intDefaultNull4: intDefaultNull4,
          durationDefault4: durationDefault4,
          durationDefaultNull4: durationDefaultNull4,
          doubleDefault4: doubleDefault4,
          doubleDefaultNull4: doubleDefaultNull4,
          dateTimeDefaultNow4: dateTimeDefaultNow4,
          dateTimeDefaultStr4: dateTimeDefaultStr4,
          dateTimeDefaultStrNull4: dateTimeDefaultStrNull4,
          boolDefaultTrue4: boolDefaultTrue4,
          boolDefaultFalse4: boolDefaultFalse4,
          boolDefaultNullFalse4: boolDefaultNullFalse4,
          bigintDefaultStr4: bigintDefaultStr4,
          bigintDefaultStrNull4: bigintDefaultStrNull4,
          uuidDefaultRandom5: uuidDefaultRandom5,
          uuidDefaultRandomV75: uuidDefaultRandomV75,
          uuidDefaultRandomNull5: uuidDefaultRandomNull5,
          uuidDefaultStr5: uuidDefaultStr5,
          uuidDefaultStrNull5: uuidDefaultStrNull5,
          uriDefault5: uriDefault5,
          uriDefaultNull5: uriDefaultNull5,
          stringDefault5: stringDefault5,
          stringDefaultNull5: stringDefaultNull5,
          intDefault5: intDefault5,
          intDefaultNull5: intDefaultNull5,
          durationDefault5: durationDefault5,
          durationDefaultNull5: durationDefaultNull5,
          doubleDefault5: doubleDefault5,
          doubleDefaultNull5: doubleDefaultNull5,
          dateTimeDefaultNow5: dateTimeDefaultNow5,
          dateTimeDefaultStr5: dateTimeDefaultStr5,
          dateTimeDefaultStrNull5: dateTimeDefaultStrNull5,
          boolDefaultTrue5: boolDefaultTrue5,
          boolDefaultFalse5: boolDefaultFalse5,
          boolDefaultNullFalse5: boolDefaultNullFalse5,
          bigintDefaultStr5: bigintDefaultStr5,
          bigintDefaultStrNull5: bigintDefaultStrNull5,
          uuidDefaultRandom6: uuidDefaultRandom6,
          uuidDefaultRandomV76: uuidDefaultRandomV76,
          uuidDefaultRandomNull6: uuidDefaultRandomNull6,
          uuidDefaultStr6: uuidDefaultStr6,
          uuidDefaultStrNull6: uuidDefaultStrNull6,
          uriDefault6: uriDefault6,
          uriDefaultNull6: uriDefaultNull6,
          stringDefault6: stringDefault6,
          stringDefaultNull6: stringDefaultNull6,
          intDefault6: intDefault6,
          intDefaultNull6: intDefaultNull6,
          durationDefault6: durationDefault6,
          durationDefaultNull6: durationDefaultNull6,
          doubleDefault6: doubleDefault6,
          doubleDefaultNull6: doubleDefaultNull6,
          dateTimeDefaultNow6: dateTimeDefaultNow6,
          dateTimeDefaultStr6: dateTimeDefaultStr6,
          dateTimeDefaultStrNull6: dateTimeDefaultStrNull6,
          boolDefaultTrue6: boolDefaultTrue6,
          boolDefaultFalse6: boolDefaultFalse6,
          boolDefaultNullFalse6: boolDefaultNullFalse6,
          bigintDefaultStr6: bigintDefaultStr6,
          bigintDefaultStrNull6: bigintDefaultStrNull6,
          uuidDefaultRandom7: uuidDefaultRandom7,
          uuidDefaultRandomV77: uuidDefaultRandomV77,
          uuidDefaultRandomNull7: uuidDefaultRandomNull7,
          uuidDefaultStr7: uuidDefaultStr7,
          uuidDefaultStrNull7: uuidDefaultStrNull7,
          uriDefault7: uriDefault7,
          uriDefaultNull7: uriDefaultNull7,
          stringDefault7: stringDefault7,
          stringDefaultNull7: stringDefaultNull7,
          intDefault7: intDefault7,
          intDefaultNull7: intDefaultNull7,
          durationDefault7: durationDefault7,
          durationDefaultNull7: durationDefaultNull7,
          doubleDefault7: doubleDefault7,
          doubleDefaultNull7: doubleDefaultNull7,
          dateTimeDefaultNow7: dateTimeDefaultNow7,
          dateTimeDefaultStr7: dateTimeDefaultStr7,
          dateTimeDefaultStrNull7: dateTimeDefaultStrNull7,
          boolDefaultTrue7: boolDefaultTrue7,
          boolDefaultFalse7: boolDefaultFalse7,
          boolDefaultNullFalse7: boolDefaultNullFalse7,
          bigintDefaultStr7: bigintDefaultStr7,
          bigintDefaultStrNull7: bigintDefaultStrNull7,
          uuidDefaultRandom8: uuidDefaultRandom8,
          uuidDefaultRandomV78: uuidDefaultRandomV78,
          uuidDefaultRandomNull8: uuidDefaultRandomNull8,
          uuidDefaultStr8: uuidDefaultStr8,
          uuidDefaultStrNull8: uuidDefaultStrNull8,
          uriDefault8: uriDefault8,
          uriDefaultNull8: uriDefaultNull8,
          stringDefault8: stringDefault8,
          stringDefaultNull8: stringDefaultNull8,
          intDefault8: intDefault8,
          intDefaultNull8: intDefaultNull8,
          durationDefault8: durationDefault8,
          durationDefaultNull8: durationDefaultNull8,
          doubleDefault8: doubleDefault8,
          doubleDefaultNull8: doubleDefaultNull8,
          dateTimeDefaultNow8: dateTimeDefaultNow8,
          dateTimeDefaultStr8: dateTimeDefaultStr8,
          dateTimeDefaultStrNull8: dateTimeDefaultStrNull8,
          boolDefaultTrue8: boolDefaultTrue8,
          boolDefaultFalse8: boolDefaultFalse8,
          boolDefaultNullFalse8: boolDefaultNullFalse8,
          bigintDefaultStr8: bigintDefaultStr8,
          bigintDefaultStrNull8: bigintDefaultStrNull8,
          uuidDefaultRandom9: uuidDefaultRandom9,
          uuidDefaultRandomV79: uuidDefaultRandomV79,
          uuidDefaultRandomNull9: uuidDefaultRandomNull9,
          uuidDefaultStr9: uuidDefaultStr9,
          uuidDefaultStrNull9: uuidDefaultStrNull9,
          uriDefault9: uriDefault9,
          uriDefaultNull9: uriDefaultNull9,
          stringDefault9: stringDefault9,
          stringDefaultNull9: stringDefaultNull9,
          intDefault9: intDefault9,
          intDefaultNull9: intDefaultNull9,
          durationDefault9: durationDefault9,
          durationDefaultNull9: durationDefaultNull9,
          doubleDefault9: doubleDefault9,
          doubleDefaultNull9: doubleDefaultNull9,
          dateTimeDefaultNow9: dateTimeDefaultNow9,
          dateTimeDefaultStr9: dateTimeDefaultStr9,
          dateTimeDefaultStrNull9: dateTimeDefaultStrNull9,
          boolDefaultTrue9: boolDefaultTrue9,
          boolDefaultFalse9: boolDefaultFalse9,
          boolDefaultNullFalse9: boolDefaultNullFalse9,
          bigintDefaultStr9: bigintDefaultStr9,
          bigintDefaultStrNull9: bigintDefaultStrNull9,
          uuidDefaultRandom10: uuidDefaultRandom10,
          uuidDefaultRandomV710: uuidDefaultRandomV710,
          uuidDefaultRandomNull10: uuidDefaultRandomNull10,
          uuidDefaultStr10: uuidDefaultStr10,
          uuidDefaultStrNull10: uuidDefaultStrNull10,
          uriDefault10: uriDefault10,
          uriDefaultNull10: uriDefaultNull10,
          stringDefault10: stringDefault10,
          stringDefaultNull10: stringDefaultNull10,
          intDefault10: intDefault10,
          intDefaultNull10: intDefaultNull10,
          durationDefault10: durationDefault10,
          durationDefaultNull10: durationDefaultNull10,
          doubleDefault10: doubleDefault10,
          doubleDefaultNull10: doubleDefaultNull10,
          dateTimeDefaultNow10: dateTimeDefaultNow10,
          dateTimeDefaultStr10: dateTimeDefaultStr10,
          dateTimeDefaultStrNull10: dateTimeDefaultStrNull10,
          boolDefaultTrue10: boolDefaultTrue10,
          boolDefaultFalse10: boolDefaultFalse10,
          boolDefaultNullFalse10: boolDefaultNullFalse10,
          bigintDefaultStr10: bigintDefaultStr10,
          bigintDefaultStrNull10: bigintDefaultStrNull10,
        );

  /// Returns a shallow copy of this [LargeMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LargeMessage copyWith({
    Object? id = _Undefined,
    Object? previous = _Undefined,
    Object? nextId = _Undefined,
    Object? next = _Undefined,
    _i1.UuidValue? uuidDefaultRandom,
    _i1.UuidValue? uuidDefaultRandomV7,
    Object? uuidDefaultRandomNull = _Undefined,
    _i1.UuidValue? uuidDefaultStr,
    Object? uuidDefaultStrNull = _Undefined,
    Uri? uriDefault,
    Object? uriDefaultNull = _Undefined,
    String? stringDefault,
    Object? stringDefaultNull = _Undefined,
    int? intDefault,
    Object? intDefaultNull = _Undefined,
    Duration? durationDefault,
    Object? durationDefaultNull = _Undefined,
    double? doubleDefault,
    Object? doubleDefaultNull = _Undefined,
    DateTime? dateTimeDefaultNow,
    DateTime? dateTimeDefaultStr,
    Object? dateTimeDefaultStrNull = _Undefined,
    bool? boolDefaultTrue,
    bool? boolDefaultFalse,
    Object? boolDefaultNullFalse = _Undefined,
    BigInt? bigintDefaultStr,
    Object? bigintDefaultStrNull = _Undefined,
    _i1.UuidValue? uuidDefaultRandom2,
    _i1.UuidValue? uuidDefaultRandomV72,
    Object? uuidDefaultRandomNull2 = _Undefined,
    _i1.UuidValue? uuidDefaultStr2,
    Object? uuidDefaultStrNull2 = _Undefined,
    Uri? uriDefault2,
    Object? uriDefaultNull2 = _Undefined,
    String? stringDefault2,
    Object? stringDefaultNull2 = _Undefined,
    int? intDefault2,
    Object? intDefaultNull2 = _Undefined,
    Duration? durationDefault2,
    Object? durationDefaultNull2 = _Undefined,
    double? doubleDefault2,
    Object? doubleDefaultNull2 = _Undefined,
    DateTime? dateTimeDefaultNow2,
    DateTime? dateTimeDefaultStr2,
    Object? dateTimeDefaultStrNull2 = _Undefined,
    bool? boolDefaultTrue2,
    bool? boolDefaultFalse2,
    Object? boolDefaultNullFalse2 = _Undefined,
    BigInt? bigintDefaultStr2,
    Object? bigintDefaultStrNull2 = _Undefined,
    _i1.UuidValue? uuidDefaultRandom3,
    _i1.UuidValue? uuidDefaultRandomV73,
    Object? uuidDefaultRandomNull3 = _Undefined,
    _i1.UuidValue? uuidDefaultStr3,
    Object? uuidDefaultStrNull3 = _Undefined,
    Uri? uriDefault3,
    Object? uriDefaultNull3 = _Undefined,
    String? stringDefault3,
    Object? stringDefaultNull3 = _Undefined,
    int? intDefault3,
    Object? intDefaultNull3 = _Undefined,
    Duration? durationDefault3,
    Object? durationDefaultNull3 = _Undefined,
    double? doubleDefault3,
    Object? doubleDefaultNull3 = _Undefined,
    DateTime? dateTimeDefaultNow3,
    DateTime? dateTimeDefaultStr3,
    Object? dateTimeDefaultStrNull3 = _Undefined,
    bool? boolDefaultTrue3,
    bool? boolDefaultFalse3,
    Object? boolDefaultNullFalse3 = _Undefined,
    BigInt? bigintDefaultStr3,
    Object? bigintDefaultStrNull3 = _Undefined,
    _i1.UuidValue? uuidDefaultRandom4,
    _i1.UuidValue? uuidDefaultRandomV74,
    Object? uuidDefaultRandomNull4 = _Undefined,
    _i1.UuidValue? uuidDefaultStr4,
    Object? uuidDefaultStrNull4 = _Undefined,
    Uri? uriDefault4,
    Object? uriDefaultNull4 = _Undefined,
    String? stringDefault4,
    Object? stringDefaultNull4 = _Undefined,
    int? intDefault4,
    Object? intDefaultNull4 = _Undefined,
    Duration? durationDefault4,
    Object? durationDefaultNull4 = _Undefined,
    double? doubleDefault4,
    Object? doubleDefaultNull4 = _Undefined,
    DateTime? dateTimeDefaultNow4,
    DateTime? dateTimeDefaultStr4,
    Object? dateTimeDefaultStrNull4 = _Undefined,
    bool? boolDefaultTrue4,
    bool? boolDefaultFalse4,
    Object? boolDefaultNullFalse4 = _Undefined,
    BigInt? bigintDefaultStr4,
    Object? bigintDefaultStrNull4 = _Undefined,
    _i1.UuidValue? uuidDefaultRandom5,
    _i1.UuidValue? uuidDefaultRandomV75,
    Object? uuidDefaultRandomNull5 = _Undefined,
    _i1.UuidValue? uuidDefaultStr5,
    Object? uuidDefaultStrNull5 = _Undefined,
    Uri? uriDefault5,
    Object? uriDefaultNull5 = _Undefined,
    String? stringDefault5,
    Object? stringDefaultNull5 = _Undefined,
    int? intDefault5,
    Object? intDefaultNull5 = _Undefined,
    Duration? durationDefault5,
    Object? durationDefaultNull5 = _Undefined,
    double? doubleDefault5,
    Object? doubleDefaultNull5 = _Undefined,
    DateTime? dateTimeDefaultNow5,
    DateTime? dateTimeDefaultStr5,
    Object? dateTimeDefaultStrNull5 = _Undefined,
    bool? boolDefaultTrue5,
    bool? boolDefaultFalse5,
    Object? boolDefaultNullFalse5 = _Undefined,
    BigInt? bigintDefaultStr5,
    Object? bigintDefaultStrNull5 = _Undefined,
    _i1.UuidValue? uuidDefaultRandom6,
    _i1.UuidValue? uuidDefaultRandomV76,
    Object? uuidDefaultRandomNull6 = _Undefined,
    _i1.UuidValue? uuidDefaultStr6,
    Object? uuidDefaultStrNull6 = _Undefined,
    Uri? uriDefault6,
    Object? uriDefaultNull6 = _Undefined,
    String? stringDefault6,
    Object? stringDefaultNull6 = _Undefined,
    int? intDefault6,
    Object? intDefaultNull6 = _Undefined,
    Duration? durationDefault6,
    Object? durationDefaultNull6 = _Undefined,
    double? doubleDefault6,
    Object? doubleDefaultNull6 = _Undefined,
    DateTime? dateTimeDefaultNow6,
    DateTime? dateTimeDefaultStr6,
    Object? dateTimeDefaultStrNull6 = _Undefined,
    bool? boolDefaultTrue6,
    bool? boolDefaultFalse6,
    Object? boolDefaultNullFalse6 = _Undefined,
    BigInt? bigintDefaultStr6,
    Object? bigintDefaultStrNull6 = _Undefined,
    _i1.UuidValue? uuidDefaultRandom7,
    _i1.UuidValue? uuidDefaultRandomV77,
    Object? uuidDefaultRandomNull7 = _Undefined,
    _i1.UuidValue? uuidDefaultStr7,
    Object? uuidDefaultStrNull7 = _Undefined,
    Uri? uriDefault7,
    Object? uriDefaultNull7 = _Undefined,
    String? stringDefault7,
    Object? stringDefaultNull7 = _Undefined,
    int? intDefault7,
    Object? intDefaultNull7 = _Undefined,
    Duration? durationDefault7,
    Object? durationDefaultNull7 = _Undefined,
    double? doubleDefault7,
    Object? doubleDefaultNull7 = _Undefined,
    DateTime? dateTimeDefaultNow7,
    DateTime? dateTimeDefaultStr7,
    Object? dateTimeDefaultStrNull7 = _Undefined,
    bool? boolDefaultTrue7,
    bool? boolDefaultFalse7,
    Object? boolDefaultNullFalse7 = _Undefined,
    BigInt? bigintDefaultStr7,
    Object? bigintDefaultStrNull7 = _Undefined,
    _i1.UuidValue? uuidDefaultRandom8,
    _i1.UuidValue? uuidDefaultRandomV78,
    Object? uuidDefaultRandomNull8 = _Undefined,
    _i1.UuidValue? uuidDefaultStr8,
    Object? uuidDefaultStrNull8 = _Undefined,
    Uri? uriDefault8,
    Object? uriDefaultNull8 = _Undefined,
    String? stringDefault8,
    Object? stringDefaultNull8 = _Undefined,
    int? intDefault8,
    Object? intDefaultNull8 = _Undefined,
    Duration? durationDefault8,
    Object? durationDefaultNull8 = _Undefined,
    double? doubleDefault8,
    Object? doubleDefaultNull8 = _Undefined,
    DateTime? dateTimeDefaultNow8,
    DateTime? dateTimeDefaultStr8,
    Object? dateTimeDefaultStrNull8 = _Undefined,
    bool? boolDefaultTrue8,
    bool? boolDefaultFalse8,
    Object? boolDefaultNullFalse8 = _Undefined,
    BigInt? bigintDefaultStr8,
    Object? bigintDefaultStrNull8 = _Undefined,
    _i1.UuidValue? uuidDefaultRandom9,
    _i1.UuidValue? uuidDefaultRandomV79,
    Object? uuidDefaultRandomNull9 = _Undefined,
    _i1.UuidValue? uuidDefaultStr9,
    Object? uuidDefaultStrNull9 = _Undefined,
    Uri? uriDefault9,
    Object? uriDefaultNull9 = _Undefined,
    String? stringDefault9,
    Object? stringDefaultNull9 = _Undefined,
    int? intDefault9,
    Object? intDefaultNull9 = _Undefined,
    Duration? durationDefault9,
    Object? durationDefaultNull9 = _Undefined,
    double? doubleDefault9,
    Object? doubleDefaultNull9 = _Undefined,
    DateTime? dateTimeDefaultNow9,
    DateTime? dateTimeDefaultStr9,
    Object? dateTimeDefaultStrNull9 = _Undefined,
    bool? boolDefaultTrue9,
    bool? boolDefaultFalse9,
    Object? boolDefaultNullFalse9 = _Undefined,
    BigInt? bigintDefaultStr9,
    Object? bigintDefaultStrNull9 = _Undefined,
    _i1.UuidValue? uuidDefaultRandom10,
    _i1.UuidValue? uuidDefaultRandomV710,
    Object? uuidDefaultRandomNull10 = _Undefined,
    _i1.UuidValue? uuidDefaultStr10,
    Object? uuidDefaultStrNull10 = _Undefined,
    Uri? uriDefault10,
    Object? uriDefaultNull10 = _Undefined,
    String? stringDefault10,
    Object? stringDefaultNull10 = _Undefined,
    int? intDefault10,
    Object? intDefaultNull10 = _Undefined,
    Duration? durationDefault10,
    Object? durationDefaultNull10 = _Undefined,
    double? doubleDefault10,
    Object? doubleDefaultNull10 = _Undefined,
    DateTime? dateTimeDefaultNow10,
    DateTime? dateTimeDefaultStr10,
    Object? dateTimeDefaultStrNull10 = _Undefined,
    bool? boolDefaultTrue10,
    bool? boolDefaultFalse10,
    Object? boolDefaultNullFalse10 = _Undefined,
    BigInt? bigintDefaultStr10,
    Object? bigintDefaultStrNull10 = _Undefined,
  }) {
    return LargeMessage(
      id: id is int? ? id : this.id,
      previous:
          previous is _i2.LargeMessage? ? previous : this.previous?.copyWith(),
      nextId: nextId is int? ? nextId : this.nextId,
      next: next is _i2.LargeMessage? ? next : this.next?.copyWith(),
      uuidDefaultRandom: uuidDefaultRandom ?? this.uuidDefaultRandom,
      uuidDefaultRandomV7: uuidDefaultRandomV7 ?? this.uuidDefaultRandomV7,
      uuidDefaultRandomNull: uuidDefaultRandomNull is _i1.UuidValue?
          ? uuidDefaultRandomNull
          : this.uuidDefaultRandomNull,
      uuidDefaultStr: uuidDefaultStr ?? this.uuidDefaultStr,
      uuidDefaultStrNull: uuidDefaultStrNull is _i1.UuidValue?
          ? uuidDefaultStrNull
          : this.uuidDefaultStrNull,
      uriDefault: uriDefault ?? this.uriDefault,
      uriDefaultNull:
          uriDefaultNull is Uri? ? uriDefaultNull : this.uriDefaultNull,
      stringDefault: stringDefault ?? this.stringDefault,
      stringDefaultNull: stringDefaultNull is String?
          ? stringDefaultNull
          : this.stringDefaultNull,
      intDefault: intDefault ?? this.intDefault,
      intDefaultNull:
          intDefaultNull is int? ? intDefaultNull : this.intDefaultNull,
      durationDefault: durationDefault ?? this.durationDefault,
      durationDefaultNull: durationDefaultNull is Duration?
          ? durationDefaultNull
          : this.durationDefaultNull,
      doubleDefault: doubleDefault ?? this.doubleDefault,
      doubleDefaultNull: doubleDefaultNull is double?
          ? doubleDefaultNull
          : this.doubleDefaultNull,
      dateTimeDefaultNow: dateTimeDefaultNow ?? this.dateTimeDefaultNow,
      dateTimeDefaultStr: dateTimeDefaultStr ?? this.dateTimeDefaultStr,
      dateTimeDefaultStrNull: dateTimeDefaultStrNull is DateTime?
          ? dateTimeDefaultStrNull
          : this.dateTimeDefaultStrNull,
      boolDefaultTrue: boolDefaultTrue ?? this.boolDefaultTrue,
      boolDefaultFalse: boolDefaultFalse ?? this.boolDefaultFalse,
      boolDefaultNullFalse: boolDefaultNullFalse is bool?
          ? boolDefaultNullFalse
          : this.boolDefaultNullFalse,
      bigintDefaultStr: bigintDefaultStr ?? this.bigintDefaultStr,
      bigintDefaultStrNull: bigintDefaultStrNull is BigInt?
          ? bigintDefaultStrNull
          : this.bigintDefaultStrNull,
      uuidDefaultRandom2: uuidDefaultRandom2 ?? this.uuidDefaultRandom2,
      uuidDefaultRandomV72: uuidDefaultRandomV72 ?? this.uuidDefaultRandomV72,
      uuidDefaultRandomNull2: uuidDefaultRandomNull2 is _i1.UuidValue?
          ? uuidDefaultRandomNull2
          : this.uuidDefaultRandomNull2,
      uuidDefaultStr2: uuidDefaultStr2 ?? this.uuidDefaultStr2,
      uuidDefaultStrNull2: uuidDefaultStrNull2 is _i1.UuidValue?
          ? uuidDefaultStrNull2
          : this.uuidDefaultStrNull2,
      uriDefault2: uriDefault2 ?? this.uriDefault2,
      uriDefaultNull2:
          uriDefaultNull2 is Uri? ? uriDefaultNull2 : this.uriDefaultNull2,
      stringDefault2: stringDefault2 ?? this.stringDefault2,
      stringDefaultNull2: stringDefaultNull2 is String?
          ? stringDefaultNull2
          : this.stringDefaultNull2,
      intDefault2: intDefault2 ?? this.intDefault2,
      intDefaultNull2:
          intDefaultNull2 is int? ? intDefaultNull2 : this.intDefaultNull2,
      durationDefault2: durationDefault2 ?? this.durationDefault2,
      durationDefaultNull2: durationDefaultNull2 is Duration?
          ? durationDefaultNull2
          : this.durationDefaultNull2,
      doubleDefault2: doubleDefault2 ?? this.doubleDefault2,
      doubleDefaultNull2: doubleDefaultNull2 is double?
          ? doubleDefaultNull2
          : this.doubleDefaultNull2,
      dateTimeDefaultNow2: dateTimeDefaultNow2 ?? this.dateTimeDefaultNow2,
      dateTimeDefaultStr2: dateTimeDefaultStr2 ?? this.dateTimeDefaultStr2,
      dateTimeDefaultStrNull2: dateTimeDefaultStrNull2 is DateTime?
          ? dateTimeDefaultStrNull2
          : this.dateTimeDefaultStrNull2,
      boolDefaultTrue2: boolDefaultTrue2 ?? this.boolDefaultTrue2,
      boolDefaultFalse2: boolDefaultFalse2 ?? this.boolDefaultFalse2,
      boolDefaultNullFalse2: boolDefaultNullFalse2 is bool?
          ? boolDefaultNullFalse2
          : this.boolDefaultNullFalse2,
      bigintDefaultStr2: bigintDefaultStr2 ?? this.bigintDefaultStr2,
      bigintDefaultStrNull2: bigintDefaultStrNull2 is BigInt?
          ? bigintDefaultStrNull2
          : this.bigintDefaultStrNull2,
      uuidDefaultRandom3: uuidDefaultRandom3 ?? this.uuidDefaultRandom3,
      uuidDefaultRandomV73: uuidDefaultRandomV73 ?? this.uuidDefaultRandomV73,
      uuidDefaultRandomNull3: uuidDefaultRandomNull3 is _i1.UuidValue?
          ? uuidDefaultRandomNull3
          : this.uuidDefaultRandomNull3,
      uuidDefaultStr3: uuidDefaultStr3 ?? this.uuidDefaultStr3,
      uuidDefaultStrNull3: uuidDefaultStrNull3 is _i1.UuidValue?
          ? uuidDefaultStrNull3
          : this.uuidDefaultStrNull3,
      uriDefault3: uriDefault3 ?? this.uriDefault3,
      uriDefaultNull3:
          uriDefaultNull3 is Uri? ? uriDefaultNull3 : this.uriDefaultNull3,
      stringDefault3: stringDefault3 ?? this.stringDefault3,
      stringDefaultNull3: stringDefaultNull3 is String?
          ? stringDefaultNull3
          : this.stringDefaultNull3,
      intDefault3: intDefault3 ?? this.intDefault3,
      intDefaultNull3:
          intDefaultNull3 is int? ? intDefaultNull3 : this.intDefaultNull3,
      durationDefault3: durationDefault3 ?? this.durationDefault3,
      durationDefaultNull3: durationDefaultNull3 is Duration?
          ? durationDefaultNull3
          : this.durationDefaultNull3,
      doubleDefault3: doubleDefault3 ?? this.doubleDefault3,
      doubleDefaultNull3: doubleDefaultNull3 is double?
          ? doubleDefaultNull3
          : this.doubleDefaultNull3,
      dateTimeDefaultNow3: dateTimeDefaultNow3 ?? this.dateTimeDefaultNow3,
      dateTimeDefaultStr3: dateTimeDefaultStr3 ?? this.dateTimeDefaultStr3,
      dateTimeDefaultStrNull3: dateTimeDefaultStrNull3 is DateTime?
          ? dateTimeDefaultStrNull3
          : this.dateTimeDefaultStrNull3,
      boolDefaultTrue3: boolDefaultTrue3 ?? this.boolDefaultTrue3,
      boolDefaultFalse3: boolDefaultFalse3 ?? this.boolDefaultFalse3,
      boolDefaultNullFalse3: boolDefaultNullFalse3 is bool?
          ? boolDefaultNullFalse3
          : this.boolDefaultNullFalse3,
      bigintDefaultStr3: bigintDefaultStr3 ?? this.bigintDefaultStr3,
      bigintDefaultStrNull3: bigintDefaultStrNull3 is BigInt?
          ? bigintDefaultStrNull3
          : this.bigintDefaultStrNull3,
      uuidDefaultRandom4: uuidDefaultRandom4 ?? this.uuidDefaultRandom4,
      uuidDefaultRandomV74: uuidDefaultRandomV74 ?? this.uuidDefaultRandomV74,
      uuidDefaultRandomNull4: uuidDefaultRandomNull4 is _i1.UuidValue?
          ? uuidDefaultRandomNull4
          : this.uuidDefaultRandomNull4,
      uuidDefaultStr4: uuidDefaultStr4 ?? this.uuidDefaultStr4,
      uuidDefaultStrNull4: uuidDefaultStrNull4 is _i1.UuidValue?
          ? uuidDefaultStrNull4
          : this.uuidDefaultStrNull4,
      uriDefault4: uriDefault4 ?? this.uriDefault4,
      uriDefaultNull4:
          uriDefaultNull4 is Uri? ? uriDefaultNull4 : this.uriDefaultNull4,
      stringDefault4: stringDefault4 ?? this.stringDefault4,
      stringDefaultNull4: stringDefaultNull4 is String?
          ? stringDefaultNull4
          : this.stringDefaultNull4,
      intDefault4: intDefault4 ?? this.intDefault4,
      intDefaultNull4:
          intDefaultNull4 is int? ? intDefaultNull4 : this.intDefaultNull4,
      durationDefault4: durationDefault4 ?? this.durationDefault4,
      durationDefaultNull4: durationDefaultNull4 is Duration?
          ? durationDefaultNull4
          : this.durationDefaultNull4,
      doubleDefault4: doubleDefault4 ?? this.doubleDefault4,
      doubleDefaultNull4: doubleDefaultNull4 is double?
          ? doubleDefaultNull4
          : this.doubleDefaultNull4,
      dateTimeDefaultNow4: dateTimeDefaultNow4 ?? this.dateTimeDefaultNow4,
      dateTimeDefaultStr4: dateTimeDefaultStr4 ?? this.dateTimeDefaultStr4,
      dateTimeDefaultStrNull4: dateTimeDefaultStrNull4 is DateTime?
          ? dateTimeDefaultStrNull4
          : this.dateTimeDefaultStrNull4,
      boolDefaultTrue4: boolDefaultTrue4 ?? this.boolDefaultTrue4,
      boolDefaultFalse4: boolDefaultFalse4 ?? this.boolDefaultFalse4,
      boolDefaultNullFalse4: boolDefaultNullFalse4 is bool?
          ? boolDefaultNullFalse4
          : this.boolDefaultNullFalse4,
      bigintDefaultStr4: bigintDefaultStr4 ?? this.bigintDefaultStr4,
      bigintDefaultStrNull4: bigintDefaultStrNull4 is BigInt?
          ? bigintDefaultStrNull4
          : this.bigintDefaultStrNull4,
      uuidDefaultRandom5: uuidDefaultRandom5 ?? this.uuidDefaultRandom5,
      uuidDefaultRandomV75: uuidDefaultRandomV75 ?? this.uuidDefaultRandomV75,
      uuidDefaultRandomNull5: uuidDefaultRandomNull5 is _i1.UuidValue?
          ? uuidDefaultRandomNull5
          : this.uuidDefaultRandomNull5,
      uuidDefaultStr5: uuidDefaultStr5 ?? this.uuidDefaultStr5,
      uuidDefaultStrNull5: uuidDefaultStrNull5 is _i1.UuidValue?
          ? uuidDefaultStrNull5
          : this.uuidDefaultStrNull5,
      uriDefault5: uriDefault5 ?? this.uriDefault5,
      uriDefaultNull5:
          uriDefaultNull5 is Uri? ? uriDefaultNull5 : this.uriDefaultNull5,
      stringDefault5: stringDefault5 ?? this.stringDefault5,
      stringDefaultNull5: stringDefaultNull5 is String?
          ? stringDefaultNull5
          : this.stringDefaultNull5,
      intDefault5: intDefault5 ?? this.intDefault5,
      intDefaultNull5:
          intDefaultNull5 is int? ? intDefaultNull5 : this.intDefaultNull5,
      durationDefault5: durationDefault5 ?? this.durationDefault5,
      durationDefaultNull5: durationDefaultNull5 is Duration?
          ? durationDefaultNull5
          : this.durationDefaultNull5,
      doubleDefault5: doubleDefault5 ?? this.doubleDefault5,
      doubleDefaultNull5: doubleDefaultNull5 is double?
          ? doubleDefaultNull5
          : this.doubleDefaultNull5,
      dateTimeDefaultNow5: dateTimeDefaultNow5 ?? this.dateTimeDefaultNow5,
      dateTimeDefaultStr5: dateTimeDefaultStr5 ?? this.dateTimeDefaultStr5,
      dateTimeDefaultStrNull5: dateTimeDefaultStrNull5 is DateTime?
          ? dateTimeDefaultStrNull5
          : this.dateTimeDefaultStrNull5,
      boolDefaultTrue5: boolDefaultTrue5 ?? this.boolDefaultTrue5,
      boolDefaultFalse5: boolDefaultFalse5 ?? this.boolDefaultFalse5,
      boolDefaultNullFalse5: boolDefaultNullFalse5 is bool?
          ? boolDefaultNullFalse5
          : this.boolDefaultNullFalse5,
      bigintDefaultStr5: bigintDefaultStr5 ?? this.bigintDefaultStr5,
      bigintDefaultStrNull5: bigintDefaultStrNull5 is BigInt?
          ? bigintDefaultStrNull5
          : this.bigintDefaultStrNull5,
      uuidDefaultRandom6: uuidDefaultRandom6 ?? this.uuidDefaultRandom6,
      uuidDefaultRandomV76: uuidDefaultRandomV76 ?? this.uuidDefaultRandomV76,
      uuidDefaultRandomNull6: uuidDefaultRandomNull6 is _i1.UuidValue?
          ? uuidDefaultRandomNull6
          : this.uuidDefaultRandomNull6,
      uuidDefaultStr6: uuidDefaultStr6 ?? this.uuidDefaultStr6,
      uuidDefaultStrNull6: uuidDefaultStrNull6 is _i1.UuidValue?
          ? uuidDefaultStrNull6
          : this.uuidDefaultStrNull6,
      uriDefault6: uriDefault6 ?? this.uriDefault6,
      uriDefaultNull6:
          uriDefaultNull6 is Uri? ? uriDefaultNull6 : this.uriDefaultNull6,
      stringDefault6: stringDefault6 ?? this.stringDefault6,
      stringDefaultNull6: stringDefaultNull6 is String?
          ? stringDefaultNull6
          : this.stringDefaultNull6,
      intDefault6: intDefault6 ?? this.intDefault6,
      intDefaultNull6:
          intDefaultNull6 is int? ? intDefaultNull6 : this.intDefaultNull6,
      durationDefault6: durationDefault6 ?? this.durationDefault6,
      durationDefaultNull6: durationDefaultNull6 is Duration?
          ? durationDefaultNull6
          : this.durationDefaultNull6,
      doubleDefault6: doubleDefault6 ?? this.doubleDefault6,
      doubleDefaultNull6: doubleDefaultNull6 is double?
          ? doubleDefaultNull6
          : this.doubleDefaultNull6,
      dateTimeDefaultNow6: dateTimeDefaultNow6 ?? this.dateTimeDefaultNow6,
      dateTimeDefaultStr6: dateTimeDefaultStr6 ?? this.dateTimeDefaultStr6,
      dateTimeDefaultStrNull6: dateTimeDefaultStrNull6 is DateTime?
          ? dateTimeDefaultStrNull6
          : this.dateTimeDefaultStrNull6,
      boolDefaultTrue6: boolDefaultTrue6 ?? this.boolDefaultTrue6,
      boolDefaultFalse6: boolDefaultFalse6 ?? this.boolDefaultFalse6,
      boolDefaultNullFalse6: boolDefaultNullFalse6 is bool?
          ? boolDefaultNullFalse6
          : this.boolDefaultNullFalse6,
      bigintDefaultStr6: bigintDefaultStr6 ?? this.bigintDefaultStr6,
      bigintDefaultStrNull6: bigintDefaultStrNull6 is BigInt?
          ? bigintDefaultStrNull6
          : this.bigintDefaultStrNull6,
      uuidDefaultRandom7: uuidDefaultRandom7 ?? this.uuidDefaultRandom7,
      uuidDefaultRandomV77: uuidDefaultRandomV77 ?? this.uuidDefaultRandomV77,
      uuidDefaultRandomNull7: uuidDefaultRandomNull7 is _i1.UuidValue?
          ? uuidDefaultRandomNull7
          : this.uuidDefaultRandomNull7,
      uuidDefaultStr7: uuidDefaultStr7 ?? this.uuidDefaultStr7,
      uuidDefaultStrNull7: uuidDefaultStrNull7 is _i1.UuidValue?
          ? uuidDefaultStrNull7
          : this.uuidDefaultStrNull7,
      uriDefault7: uriDefault7 ?? this.uriDefault7,
      uriDefaultNull7:
          uriDefaultNull7 is Uri? ? uriDefaultNull7 : this.uriDefaultNull7,
      stringDefault7: stringDefault7 ?? this.stringDefault7,
      stringDefaultNull7: stringDefaultNull7 is String?
          ? stringDefaultNull7
          : this.stringDefaultNull7,
      intDefault7: intDefault7 ?? this.intDefault7,
      intDefaultNull7:
          intDefaultNull7 is int? ? intDefaultNull7 : this.intDefaultNull7,
      durationDefault7: durationDefault7 ?? this.durationDefault7,
      durationDefaultNull7: durationDefaultNull7 is Duration?
          ? durationDefaultNull7
          : this.durationDefaultNull7,
      doubleDefault7: doubleDefault7 ?? this.doubleDefault7,
      doubleDefaultNull7: doubleDefaultNull7 is double?
          ? doubleDefaultNull7
          : this.doubleDefaultNull7,
      dateTimeDefaultNow7: dateTimeDefaultNow7 ?? this.dateTimeDefaultNow7,
      dateTimeDefaultStr7: dateTimeDefaultStr7 ?? this.dateTimeDefaultStr7,
      dateTimeDefaultStrNull7: dateTimeDefaultStrNull7 is DateTime?
          ? dateTimeDefaultStrNull7
          : this.dateTimeDefaultStrNull7,
      boolDefaultTrue7: boolDefaultTrue7 ?? this.boolDefaultTrue7,
      boolDefaultFalse7: boolDefaultFalse7 ?? this.boolDefaultFalse7,
      boolDefaultNullFalse7: boolDefaultNullFalse7 is bool?
          ? boolDefaultNullFalse7
          : this.boolDefaultNullFalse7,
      bigintDefaultStr7: bigintDefaultStr7 ?? this.bigintDefaultStr7,
      bigintDefaultStrNull7: bigintDefaultStrNull7 is BigInt?
          ? bigintDefaultStrNull7
          : this.bigintDefaultStrNull7,
      uuidDefaultRandom8: uuidDefaultRandom8 ?? this.uuidDefaultRandom8,
      uuidDefaultRandomV78: uuidDefaultRandomV78 ?? this.uuidDefaultRandomV78,
      uuidDefaultRandomNull8: uuidDefaultRandomNull8 is _i1.UuidValue?
          ? uuidDefaultRandomNull8
          : this.uuidDefaultRandomNull8,
      uuidDefaultStr8: uuidDefaultStr8 ?? this.uuidDefaultStr8,
      uuidDefaultStrNull8: uuidDefaultStrNull8 is _i1.UuidValue?
          ? uuidDefaultStrNull8
          : this.uuidDefaultStrNull8,
      uriDefault8: uriDefault8 ?? this.uriDefault8,
      uriDefaultNull8:
          uriDefaultNull8 is Uri? ? uriDefaultNull8 : this.uriDefaultNull8,
      stringDefault8: stringDefault8 ?? this.stringDefault8,
      stringDefaultNull8: stringDefaultNull8 is String?
          ? stringDefaultNull8
          : this.stringDefaultNull8,
      intDefault8: intDefault8 ?? this.intDefault8,
      intDefaultNull8:
          intDefaultNull8 is int? ? intDefaultNull8 : this.intDefaultNull8,
      durationDefault8: durationDefault8 ?? this.durationDefault8,
      durationDefaultNull8: durationDefaultNull8 is Duration?
          ? durationDefaultNull8
          : this.durationDefaultNull8,
      doubleDefault8: doubleDefault8 ?? this.doubleDefault8,
      doubleDefaultNull8: doubleDefaultNull8 is double?
          ? doubleDefaultNull8
          : this.doubleDefaultNull8,
      dateTimeDefaultNow8: dateTimeDefaultNow8 ?? this.dateTimeDefaultNow8,
      dateTimeDefaultStr8: dateTimeDefaultStr8 ?? this.dateTimeDefaultStr8,
      dateTimeDefaultStrNull8: dateTimeDefaultStrNull8 is DateTime?
          ? dateTimeDefaultStrNull8
          : this.dateTimeDefaultStrNull8,
      boolDefaultTrue8: boolDefaultTrue8 ?? this.boolDefaultTrue8,
      boolDefaultFalse8: boolDefaultFalse8 ?? this.boolDefaultFalse8,
      boolDefaultNullFalse8: boolDefaultNullFalse8 is bool?
          ? boolDefaultNullFalse8
          : this.boolDefaultNullFalse8,
      bigintDefaultStr8: bigintDefaultStr8 ?? this.bigintDefaultStr8,
      bigintDefaultStrNull8: bigintDefaultStrNull8 is BigInt?
          ? bigintDefaultStrNull8
          : this.bigintDefaultStrNull8,
      uuidDefaultRandom9: uuidDefaultRandom9 ?? this.uuidDefaultRandom9,
      uuidDefaultRandomV79: uuidDefaultRandomV79 ?? this.uuidDefaultRandomV79,
      uuidDefaultRandomNull9: uuidDefaultRandomNull9 is _i1.UuidValue?
          ? uuidDefaultRandomNull9
          : this.uuidDefaultRandomNull9,
      uuidDefaultStr9: uuidDefaultStr9 ?? this.uuidDefaultStr9,
      uuidDefaultStrNull9: uuidDefaultStrNull9 is _i1.UuidValue?
          ? uuidDefaultStrNull9
          : this.uuidDefaultStrNull9,
      uriDefault9: uriDefault9 ?? this.uriDefault9,
      uriDefaultNull9:
          uriDefaultNull9 is Uri? ? uriDefaultNull9 : this.uriDefaultNull9,
      stringDefault9: stringDefault9 ?? this.stringDefault9,
      stringDefaultNull9: stringDefaultNull9 is String?
          ? stringDefaultNull9
          : this.stringDefaultNull9,
      intDefault9: intDefault9 ?? this.intDefault9,
      intDefaultNull9:
          intDefaultNull9 is int? ? intDefaultNull9 : this.intDefaultNull9,
      durationDefault9: durationDefault9 ?? this.durationDefault9,
      durationDefaultNull9: durationDefaultNull9 is Duration?
          ? durationDefaultNull9
          : this.durationDefaultNull9,
      doubleDefault9: doubleDefault9 ?? this.doubleDefault9,
      doubleDefaultNull9: doubleDefaultNull9 is double?
          ? doubleDefaultNull9
          : this.doubleDefaultNull9,
      dateTimeDefaultNow9: dateTimeDefaultNow9 ?? this.dateTimeDefaultNow9,
      dateTimeDefaultStr9: dateTimeDefaultStr9 ?? this.dateTimeDefaultStr9,
      dateTimeDefaultStrNull9: dateTimeDefaultStrNull9 is DateTime?
          ? dateTimeDefaultStrNull9
          : this.dateTimeDefaultStrNull9,
      boolDefaultTrue9: boolDefaultTrue9 ?? this.boolDefaultTrue9,
      boolDefaultFalse9: boolDefaultFalse9 ?? this.boolDefaultFalse9,
      boolDefaultNullFalse9: boolDefaultNullFalse9 is bool?
          ? boolDefaultNullFalse9
          : this.boolDefaultNullFalse9,
      bigintDefaultStr9: bigintDefaultStr9 ?? this.bigintDefaultStr9,
      bigintDefaultStrNull9: bigintDefaultStrNull9 is BigInt?
          ? bigintDefaultStrNull9
          : this.bigintDefaultStrNull9,
      uuidDefaultRandom10: uuidDefaultRandom10 ?? this.uuidDefaultRandom10,
      uuidDefaultRandomV710:
          uuidDefaultRandomV710 ?? this.uuidDefaultRandomV710,
      uuidDefaultRandomNull10: uuidDefaultRandomNull10 is _i1.UuidValue?
          ? uuidDefaultRandomNull10
          : this.uuidDefaultRandomNull10,
      uuidDefaultStr10: uuidDefaultStr10 ?? this.uuidDefaultStr10,
      uuidDefaultStrNull10: uuidDefaultStrNull10 is _i1.UuidValue?
          ? uuidDefaultStrNull10
          : this.uuidDefaultStrNull10,
      uriDefault10: uriDefault10 ?? this.uriDefault10,
      uriDefaultNull10:
          uriDefaultNull10 is Uri? ? uriDefaultNull10 : this.uriDefaultNull10,
      stringDefault10: stringDefault10 ?? this.stringDefault10,
      stringDefaultNull10: stringDefaultNull10 is String?
          ? stringDefaultNull10
          : this.stringDefaultNull10,
      intDefault10: intDefault10 ?? this.intDefault10,
      intDefaultNull10:
          intDefaultNull10 is int? ? intDefaultNull10 : this.intDefaultNull10,
      durationDefault10: durationDefault10 ?? this.durationDefault10,
      durationDefaultNull10: durationDefaultNull10 is Duration?
          ? durationDefaultNull10
          : this.durationDefaultNull10,
      doubleDefault10: doubleDefault10 ?? this.doubleDefault10,
      doubleDefaultNull10: doubleDefaultNull10 is double?
          ? doubleDefaultNull10
          : this.doubleDefaultNull10,
      dateTimeDefaultNow10: dateTimeDefaultNow10 ?? this.dateTimeDefaultNow10,
      dateTimeDefaultStr10: dateTimeDefaultStr10 ?? this.dateTimeDefaultStr10,
      dateTimeDefaultStrNull10: dateTimeDefaultStrNull10 is DateTime?
          ? dateTimeDefaultStrNull10
          : this.dateTimeDefaultStrNull10,
      boolDefaultTrue10: boolDefaultTrue10 ?? this.boolDefaultTrue10,
      boolDefaultFalse10: boolDefaultFalse10 ?? this.boolDefaultFalse10,
      boolDefaultNullFalse10: boolDefaultNullFalse10 is bool?
          ? boolDefaultNullFalse10
          : this.boolDefaultNullFalse10,
      bigintDefaultStr10: bigintDefaultStr10 ?? this.bigintDefaultStr10,
      bigintDefaultStrNull10: bigintDefaultStrNull10 is BigInt?
          ? bigintDefaultStrNull10
          : this.bigintDefaultStrNull10,
    );
  }
}

class LargeMessageUpdateTable extends _i1.UpdateTable<LargeMessageTable> {
  LargeMessageUpdateTable(super.table);

  _i1.ColumnValue<int, int> nextId(int? value) => _i1.ColumnValue(
        table.nextId,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandom(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandom,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomV7(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomV7,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomNull(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomNull,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStr(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultStr,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStrNull(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultStrNull,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefault(Uri value) => _i1.ColumnValue(
        table.uriDefault,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefaultNull(Uri? value) => _i1.ColumnValue(
        table.uriDefaultNull,
        value,
      );

  _i1.ColumnValue<String, String> stringDefault(String value) =>
      _i1.ColumnValue(
        table.stringDefault,
        value,
      );

  _i1.ColumnValue<String, String> stringDefaultNull(String? value) =>
      _i1.ColumnValue(
        table.stringDefaultNull,
        value,
      );

  _i1.ColumnValue<int, int> intDefault(int value) => _i1.ColumnValue(
        table.intDefault,
        value,
      );

  _i1.ColumnValue<int, int> intDefaultNull(int? value) => _i1.ColumnValue(
        table.intDefaultNull,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefault(Duration value) =>
      _i1.ColumnValue(
        table.durationDefault,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefaultNull(Duration? value) =>
      _i1.ColumnValue(
        table.durationDefaultNull,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefault(double value) =>
      _i1.ColumnValue(
        table.doubleDefault,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefaultNull(double? value) =>
      _i1.ColumnValue(
        table.doubleDefaultNull,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultNow(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultNow,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStr(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStr,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStrNull(DateTime? value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStrNull,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultTrue(bool value) => _i1.ColumnValue(
        table.boolDefaultTrue,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultFalse(bool value) => _i1.ColumnValue(
        table.boolDefaultFalse,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultNullFalse(bool? value) =>
      _i1.ColumnValue(
        table.boolDefaultNullFalse,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStr(BigInt value) =>
      _i1.ColumnValue(
        table.bigintDefaultStr,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStrNull(BigInt? value) =>
      _i1.ColumnValue(
        table.bigintDefaultStrNull,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandom2(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandom2,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomV72(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomV72,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomNull2(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomNull2,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStr2(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultStr2,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStrNull2(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultStrNull2,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefault2(Uri value) => _i1.ColumnValue(
        table.uriDefault2,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefaultNull2(Uri? value) => _i1.ColumnValue(
        table.uriDefaultNull2,
        value,
      );

  _i1.ColumnValue<String, String> stringDefault2(String value) =>
      _i1.ColumnValue(
        table.stringDefault2,
        value,
      );

  _i1.ColumnValue<String, String> stringDefaultNull2(String? value) =>
      _i1.ColumnValue(
        table.stringDefaultNull2,
        value,
      );

  _i1.ColumnValue<int, int> intDefault2(int value) => _i1.ColumnValue(
        table.intDefault2,
        value,
      );

  _i1.ColumnValue<int, int> intDefaultNull2(int? value) => _i1.ColumnValue(
        table.intDefaultNull2,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefault2(Duration value) =>
      _i1.ColumnValue(
        table.durationDefault2,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefaultNull2(Duration? value) =>
      _i1.ColumnValue(
        table.durationDefaultNull2,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefault2(double value) =>
      _i1.ColumnValue(
        table.doubleDefault2,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefaultNull2(double? value) =>
      _i1.ColumnValue(
        table.doubleDefaultNull2,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultNow2(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultNow2,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStr2(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStr2,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStrNull2(
          DateTime? value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStrNull2,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultTrue2(bool value) => _i1.ColumnValue(
        table.boolDefaultTrue2,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultFalse2(bool value) => _i1.ColumnValue(
        table.boolDefaultFalse2,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultNullFalse2(bool? value) =>
      _i1.ColumnValue(
        table.boolDefaultNullFalse2,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStr2(BigInt value) =>
      _i1.ColumnValue(
        table.bigintDefaultStr2,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStrNull2(BigInt? value) =>
      _i1.ColumnValue(
        table.bigintDefaultStrNull2,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandom3(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandom3,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomV73(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomV73,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomNull3(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomNull3,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStr3(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultStr3,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStrNull3(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultStrNull3,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefault3(Uri value) => _i1.ColumnValue(
        table.uriDefault3,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefaultNull3(Uri? value) => _i1.ColumnValue(
        table.uriDefaultNull3,
        value,
      );

  _i1.ColumnValue<String, String> stringDefault3(String value) =>
      _i1.ColumnValue(
        table.stringDefault3,
        value,
      );

  _i1.ColumnValue<String, String> stringDefaultNull3(String? value) =>
      _i1.ColumnValue(
        table.stringDefaultNull3,
        value,
      );

  _i1.ColumnValue<int, int> intDefault3(int value) => _i1.ColumnValue(
        table.intDefault3,
        value,
      );

  _i1.ColumnValue<int, int> intDefaultNull3(int? value) => _i1.ColumnValue(
        table.intDefaultNull3,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefault3(Duration value) =>
      _i1.ColumnValue(
        table.durationDefault3,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefaultNull3(Duration? value) =>
      _i1.ColumnValue(
        table.durationDefaultNull3,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefault3(double value) =>
      _i1.ColumnValue(
        table.doubleDefault3,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefaultNull3(double? value) =>
      _i1.ColumnValue(
        table.doubleDefaultNull3,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultNow3(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultNow3,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStr3(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStr3,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStrNull3(
          DateTime? value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStrNull3,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultTrue3(bool value) => _i1.ColumnValue(
        table.boolDefaultTrue3,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultFalse3(bool value) => _i1.ColumnValue(
        table.boolDefaultFalse3,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultNullFalse3(bool? value) =>
      _i1.ColumnValue(
        table.boolDefaultNullFalse3,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStr3(BigInt value) =>
      _i1.ColumnValue(
        table.bigintDefaultStr3,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStrNull3(BigInt? value) =>
      _i1.ColumnValue(
        table.bigintDefaultStrNull3,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandom4(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandom4,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomV74(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomV74,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomNull4(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomNull4,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStr4(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultStr4,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStrNull4(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultStrNull4,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefault4(Uri value) => _i1.ColumnValue(
        table.uriDefault4,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefaultNull4(Uri? value) => _i1.ColumnValue(
        table.uriDefaultNull4,
        value,
      );

  _i1.ColumnValue<String, String> stringDefault4(String value) =>
      _i1.ColumnValue(
        table.stringDefault4,
        value,
      );

  _i1.ColumnValue<String, String> stringDefaultNull4(String? value) =>
      _i1.ColumnValue(
        table.stringDefaultNull4,
        value,
      );

  _i1.ColumnValue<int, int> intDefault4(int value) => _i1.ColumnValue(
        table.intDefault4,
        value,
      );

  _i1.ColumnValue<int, int> intDefaultNull4(int? value) => _i1.ColumnValue(
        table.intDefaultNull4,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefault4(Duration value) =>
      _i1.ColumnValue(
        table.durationDefault4,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefaultNull4(Duration? value) =>
      _i1.ColumnValue(
        table.durationDefaultNull4,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefault4(double value) =>
      _i1.ColumnValue(
        table.doubleDefault4,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefaultNull4(double? value) =>
      _i1.ColumnValue(
        table.doubleDefaultNull4,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultNow4(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultNow4,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStr4(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStr4,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStrNull4(
          DateTime? value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStrNull4,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultTrue4(bool value) => _i1.ColumnValue(
        table.boolDefaultTrue4,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultFalse4(bool value) => _i1.ColumnValue(
        table.boolDefaultFalse4,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultNullFalse4(bool? value) =>
      _i1.ColumnValue(
        table.boolDefaultNullFalse4,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStr4(BigInt value) =>
      _i1.ColumnValue(
        table.bigintDefaultStr4,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStrNull4(BigInt? value) =>
      _i1.ColumnValue(
        table.bigintDefaultStrNull4,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandom5(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandom5,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomV75(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomV75,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomNull5(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomNull5,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStr5(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultStr5,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStrNull5(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultStrNull5,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefault5(Uri value) => _i1.ColumnValue(
        table.uriDefault5,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefaultNull5(Uri? value) => _i1.ColumnValue(
        table.uriDefaultNull5,
        value,
      );

  _i1.ColumnValue<String, String> stringDefault5(String value) =>
      _i1.ColumnValue(
        table.stringDefault5,
        value,
      );

  _i1.ColumnValue<String, String> stringDefaultNull5(String? value) =>
      _i1.ColumnValue(
        table.stringDefaultNull5,
        value,
      );

  _i1.ColumnValue<int, int> intDefault5(int value) => _i1.ColumnValue(
        table.intDefault5,
        value,
      );

  _i1.ColumnValue<int, int> intDefaultNull5(int? value) => _i1.ColumnValue(
        table.intDefaultNull5,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefault5(Duration value) =>
      _i1.ColumnValue(
        table.durationDefault5,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefaultNull5(Duration? value) =>
      _i1.ColumnValue(
        table.durationDefaultNull5,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefault5(double value) =>
      _i1.ColumnValue(
        table.doubleDefault5,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefaultNull5(double? value) =>
      _i1.ColumnValue(
        table.doubleDefaultNull5,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultNow5(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultNow5,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStr5(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStr5,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStrNull5(
          DateTime? value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStrNull5,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultTrue5(bool value) => _i1.ColumnValue(
        table.boolDefaultTrue5,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultFalse5(bool value) => _i1.ColumnValue(
        table.boolDefaultFalse5,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultNullFalse5(bool? value) =>
      _i1.ColumnValue(
        table.boolDefaultNullFalse5,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStr5(BigInt value) =>
      _i1.ColumnValue(
        table.bigintDefaultStr5,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStrNull5(BigInt? value) =>
      _i1.ColumnValue(
        table.bigintDefaultStrNull5,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandom6(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandom6,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomV76(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomV76,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomNull6(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomNull6,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStr6(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultStr6,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStrNull6(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultStrNull6,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefault6(Uri value) => _i1.ColumnValue(
        table.uriDefault6,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefaultNull6(Uri? value) => _i1.ColumnValue(
        table.uriDefaultNull6,
        value,
      );

  _i1.ColumnValue<String, String> stringDefault6(String value) =>
      _i1.ColumnValue(
        table.stringDefault6,
        value,
      );

  _i1.ColumnValue<String, String> stringDefaultNull6(String? value) =>
      _i1.ColumnValue(
        table.stringDefaultNull6,
        value,
      );

  _i1.ColumnValue<int, int> intDefault6(int value) => _i1.ColumnValue(
        table.intDefault6,
        value,
      );

  _i1.ColumnValue<int, int> intDefaultNull6(int? value) => _i1.ColumnValue(
        table.intDefaultNull6,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefault6(Duration value) =>
      _i1.ColumnValue(
        table.durationDefault6,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefaultNull6(Duration? value) =>
      _i1.ColumnValue(
        table.durationDefaultNull6,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefault6(double value) =>
      _i1.ColumnValue(
        table.doubleDefault6,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefaultNull6(double? value) =>
      _i1.ColumnValue(
        table.doubleDefaultNull6,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultNow6(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultNow6,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStr6(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStr6,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStrNull6(
          DateTime? value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStrNull6,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultTrue6(bool value) => _i1.ColumnValue(
        table.boolDefaultTrue6,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultFalse6(bool value) => _i1.ColumnValue(
        table.boolDefaultFalse6,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultNullFalse6(bool? value) =>
      _i1.ColumnValue(
        table.boolDefaultNullFalse6,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStr6(BigInt value) =>
      _i1.ColumnValue(
        table.bigintDefaultStr6,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStrNull6(BigInt? value) =>
      _i1.ColumnValue(
        table.bigintDefaultStrNull6,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandom7(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandom7,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomV77(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomV77,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomNull7(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomNull7,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStr7(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultStr7,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStrNull7(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultStrNull7,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefault7(Uri value) => _i1.ColumnValue(
        table.uriDefault7,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefaultNull7(Uri? value) => _i1.ColumnValue(
        table.uriDefaultNull7,
        value,
      );

  _i1.ColumnValue<String, String> stringDefault7(String value) =>
      _i1.ColumnValue(
        table.stringDefault7,
        value,
      );

  _i1.ColumnValue<String, String> stringDefaultNull7(String? value) =>
      _i1.ColumnValue(
        table.stringDefaultNull7,
        value,
      );

  _i1.ColumnValue<int, int> intDefault7(int value) => _i1.ColumnValue(
        table.intDefault7,
        value,
      );

  _i1.ColumnValue<int, int> intDefaultNull7(int? value) => _i1.ColumnValue(
        table.intDefaultNull7,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefault7(Duration value) =>
      _i1.ColumnValue(
        table.durationDefault7,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefaultNull7(Duration? value) =>
      _i1.ColumnValue(
        table.durationDefaultNull7,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefault7(double value) =>
      _i1.ColumnValue(
        table.doubleDefault7,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefaultNull7(double? value) =>
      _i1.ColumnValue(
        table.doubleDefaultNull7,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultNow7(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultNow7,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStr7(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStr7,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStrNull7(
          DateTime? value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStrNull7,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultTrue7(bool value) => _i1.ColumnValue(
        table.boolDefaultTrue7,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultFalse7(bool value) => _i1.ColumnValue(
        table.boolDefaultFalse7,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultNullFalse7(bool? value) =>
      _i1.ColumnValue(
        table.boolDefaultNullFalse7,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStr7(BigInt value) =>
      _i1.ColumnValue(
        table.bigintDefaultStr7,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStrNull7(BigInt? value) =>
      _i1.ColumnValue(
        table.bigintDefaultStrNull7,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandom8(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandom8,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomV78(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomV78,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomNull8(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomNull8,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStr8(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultStr8,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStrNull8(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultStrNull8,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefault8(Uri value) => _i1.ColumnValue(
        table.uriDefault8,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefaultNull8(Uri? value) => _i1.ColumnValue(
        table.uriDefaultNull8,
        value,
      );

  _i1.ColumnValue<String, String> stringDefault8(String value) =>
      _i1.ColumnValue(
        table.stringDefault8,
        value,
      );

  _i1.ColumnValue<String, String> stringDefaultNull8(String? value) =>
      _i1.ColumnValue(
        table.stringDefaultNull8,
        value,
      );

  _i1.ColumnValue<int, int> intDefault8(int value) => _i1.ColumnValue(
        table.intDefault8,
        value,
      );

  _i1.ColumnValue<int, int> intDefaultNull8(int? value) => _i1.ColumnValue(
        table.intDefaultNull8,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefault8(Duration value) =>
      _i1.ColumnValue(
        table.durationDefault8,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefaultNull8(Duration? value) =>
      _i1.ColumnValue(
        table.durationDefaultNull8,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefault8(double value) =>
      _i1.ColumnValue(
        table.doubleDefault8,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefaultNull8(double? value) =>
      _i1.ColumnValue(
        table.doubleDefaultNull8,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultNow8(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultNow8,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStr8(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStr8,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStrNull8(
          DateTime? value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStrNull8,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultTrue8(bool value) => _i1.ColumnValue(
        table.boolDefaultTrue8,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultFalse8(bool value) => _i1.ColumnValue(
        table.boolDefaultFalse8,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultNullFalse8(bool? value) =>
      _i1.ColumnValue(
        table.boolDefaultNullFalse8,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStr8(BigInt value) =>
      _i1.ColumnValue(
        table.bigintDefaultStr8,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStrNull8(BigInt? value) =>
      _i1.ColumnValue(
        table.bigintDefaultStrNull8,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandom9(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandom9,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomV79(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomV79,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomNull9(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomNull9,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStr9(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultStr9,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStrNull9(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultStrNull9,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefault9(Uri value) => _i1.ColumnValue(
        table.uriDefault9,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefaultNull9(Uri? value) => _i1.ColumnValue(
        table.uriDefaultNull9,
        value,
      );

  _i1.ColumnValue<String, String> stringDefault9(String value) =>
      _i1.ColumnValue(
        table.stringDefault9,
        value,
      );

  _i1.ColumnValue<String, String> stringDefaultNull9(String? value) =>
      _i1.ColumnValue(
        table.stringDefaultNull9,
        value,
      );

  _i1.ColumnValue<int, int> intDefault9(int value) => _i1.ColumnValue(
        table.intDefault9,
        value,
      );

  _i1.ColumnValue<int, int> intDefaultNull9(int? value) => _i1.ColumnValue(
        table.intDefaultNull9,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefault9(Duration value) =>
      _i1.ColumnValue(
        table.durationDefault9,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefaultNull9(Duration? value) =>
      _i1.ColumnValue(
        table.durationDefaultNull9,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefault9(double value) =>
      _i1.ColumnValue(
        table.doubleDefault9,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefaultNull9(double? value) =>
      _i1.ColumnValue(
        table.doubleDefaultNull9,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultNow9(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultNow9,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStr9(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStr9,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStrNull9(
          DateTime? value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStrNull9,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultTrue9(bool value) => _i1.ColumnValue(
        table.boolDefaultTrue9,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultFalse9(bool value) => _i1.ColumnValue(
        table.boolDefaultFalse9,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultNullFalse9(bool? value) =>
      _i1.ColumnValue(
        table.boolDefaultNullFalse9,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStr9(BigInt value) =>
      _i1.ColumnValue(
        table.bigintDefaultStr9,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStrNull9(BigInt? value) =>
      _i1.ColumnValue(
        table.bigintDefaultStrNull9,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandom10(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandom10,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomV710(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomV710,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultRandomNull10(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultRandomNull10,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStr10(
          _i1.UuidValue value) =>
      _i1.ColumnValue(
        table.uuidDefaultStr10,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> uuidDefaultStrNull10(
          _i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.uuidDefaultStrNull10,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefault10(Uri value) => _i1.ColumnValue(
        table.uriDefault10,
        value,
      );

  _i1.ColumnValue<Uri, Uri> uriDefaultNull10(Uri? value) => _i1.ColumnValue(
        table.uriDefaultNull10,
        value,
      );

  _i1.ColumnValue<String, String> stringDefault10(String value) =>
      _i1.ColumnValue(
        table.stringDefault10,
        value,
      );

  _i1.ColumnValue<String, String> stringDefaultNull10(String? value) =>
      _i1.ColumnValue(
        table.stringDefaultNull10,
        value,
      );

  _i1.ColumnValue<int, int> intDefault10(int value) => _i1.ColumnValue(
        table.intDefault10,
        value,
      );

  _i1.ColumnValue<int, int> intDefaultNull10(int? value) => _i1.ColumnValue(
        table.intDefaultNull10,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefault10(Duration value) =>
      _i1.ColumnValue(
        table.durationDefault10,
        value,
      );

  _i1.ColumnValue<Duration, Duration> durationDefaultNull10(Duration? value) =>
      _i1.ColumnValue(
        table.durationDefaultNull10,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefault10(double value) =>
      _i1.ColumnValue(
        table.doubleDefault10,
        value,
      );

  _i1.ColumnValue<double, double> doubleDefaultNull10(double? value) =>
      _i1.ColumnValue(
        table.doubleDefaultNull10,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultNow10(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultNow10,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStr10(DateTime value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStr10,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> dateTimeDefaultStrNull10(
          DateTime? value) =>
      _i1.ColumnValue(
        table.dateTimeDefaultStrNull10,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultTrue10(bool value) => _i1.ColumnValue(
        table.boolDefaultTrue10,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultFalse10(bool value) => _i1.ColumnValue(
        table.boolDefaultFalse10,
        value,
      );

  _i1.ColumnValue<bool, bool> boolDefaultNullFalse10(bool? value) =>
      _i1.ColumnValue(
        table.boolDefaultNullFalse10,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStr10(BigInt value) =>
      _i1.ColumnValue(
        table.bigintDefaultStr10,
        value,
      );

  _i1.ColumnValue<BigInt, BigInt> bigintDefaultStrNull10(BigInt? value) =>
      _i1.ColumnValue(
        table.bigintDefaultStrNull10,
        value,
      );
}

class LargeMessageTable extends _i1.Table<int?> {
  LargeMessageTable({super.tableRelation}) : super(tableName: 'large_message') {
    updateTable = LargeMessageUpdateTable(this);
    nextId = _i1.ColumnInt(
      'nextId',
      this,
    );
    uuidDefaultRandom = _i1.ColumnUuid(
      'uuidDefaultRandom',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomV7 = _i1.ColumnUuid(
      'uuidDefaultRandomV7',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomNull = _i1.ColumnUuid(
      'uuidDefaultRandomNull',
      this,
      hasDefault: true,
    );
    uuidDefaultStr = _i1.ColumnUuid(
      'uuidDefaultStr',
      this,
      hasDefault: true,
    );
    uuidDefaultStrNull = _i1.ColumnUuid(
      'uuidDefaultStrNull',
      this,
      hasDefault: true,
    );
    uriDefault = _i1.ColumnUri(
      'uriDefault',
      this,
      hasDefault: true,
    );
    uriDefaultNull = _i1.ColumnUri(
      'uriDefaultNull',
      this,
      hasDefault: true,
    );
    stringDefault = _i1.ColumnString(
      'stringDefault',
      this,
      hasDefault: true,
    );
    stringDefaultNull = _i1.ColumnString(
      'stringDefaultNull',
      this,
      hasDefault: true,
    );
    intDefault = _i1.ColumnInt(
      'intDefault',
      this,
      hasDefault: true,
    );
    intDefaultNull = _i1.ColumnInt(
      'intDefaultNull',
      this,
      hasDefault: true,
    );
    durationDefault = _i1.ColumnDuration(
      'durationDefault',
      this,
      hasDefault: true,
    );
    durationDefaultNull = _i1.ColumnDuration(
      'durationDefaultNull',
      this,
      hasDefault: true,
    );
    doubleDefault = _i1.ColumnDouble(
      'doubleDefault',
      this,
      hasDefault: true,
    );
    doubleDefaultNull = _i1.ColumnDouble(
      'doubleDefaultNull',
      this,
      hasDefault: true,
    );
    dateTimeDefaultNow = _i1.ColumnDateTime(
      'dateTimeDefaultNow',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStr = _i1.ColumnDateTime(
      'dateTimeDefaultStr',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStrNull = _i1.ColumnDateTime(
      'dateTimeDefaultStrNull',
      this,
      hasDefault: true,
    );
    boolDefaultTrue = _i1.ColumnBool(
      'boolDefaultTrue',
      this,
      hasDefault: true,
    );
    boolDefaultFalse = _i1.ColumnBool(
      'boolDefaultFalse',
      this,
      hasDefault: true,
    );
    boolDefaultNullFalse = _i1.ColumnBool(
      'boolDefaultNullFalse',
      this,
      hasDefault: true,
    );
    bigintDefaultStr = _i1.ColumnBigInt(
      'bigintDefaultStr',
      this,
      hasDefault: true,
    );
    bigintDefaultStrNull = _i1.ColumnBigInt(
      'bigintDefaultStrNull',
      this,
      hasDefault: true,
    );
    uuidDefaultRandom2 = _i1.ColumnUuid(
      'uuidDefaultRandom2',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomV72 = _i1.ColumnUuid(
      'uuidDefaultRandomV72',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomNull2 = _i1.ColumnUuid(
      'uuidDefaultRandomNull2',
      this,
      hasDefault: true,
    );
    uuidDefaultStr2 = _i1.ColumnUuid(
      'uuidDefaultStr2',
      this,
      hasDefault: true,
    );
    uuidDefaultStrNull2 = _i1.ColumnUuid(
      'uuidDefaultStrNull2',
      this,
      hasDefault: true,
    );
    uriDefault2 = _i1.ColumnUri(
      'uriDefault2',
      this,
      hasDefault: true,
    );
    uriDefaultNull2 = _i1.ColumnUri(
      'uriDefaultNull2',
      this,
      hasDefault: true,
    );
    stringDefault2 = _i1.ColumnString(
      'stringDefault2',
      this,
      hasDefault: true,
    );
    stringDefaultNull2 = _i1.ColumnString(
      'stringDefaultNull2',
      this,
      hasDefault: true,
    );
    intDefault2 = _i1.ColumnInt(
      'intDefault2',
      this,
      hasDefault: true,
    );
    intDefaultNull2 = _i1.ColumnInt(
      'intDefaultNull2',
      this,
      hasDefault: true,
    );
    durationDefault2 = _i1.ColumnDuration(
      'durationDefault2',
      this,
      hasDefault: true,
    );
    durationDefaultNull2 = _i1.ColumnDuration(
      'durationDefaultNull2',
      this,
      hasDefault: true,
    );
    doubleDefault2 = _i1.ColumnDouble(
      'doubleDefault2',
      this,
      hasDefault: true,
    );
    doubleDefaultNull2 = _i1.ColumnDouble(
      'doubleDefaultNull2',
      this,
      hasDefault: true,
    );
    dateTimeDefaultNow2 = _i1.ColumnDateTime(
      'dateTimeDefaultNow2',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStr2 = _i1.ColumnDateTime(
      'dateTimeDefaultStr2',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStrNull2 = _i1.ColumnDateTime(
      'dateTimeDefaultStrNull2',
      this,
      hasDefault: true,
    );
    boolDefaultTrue2 = _i1.ColumnBool(
      'boolDefaultTrue2',
      this,
      hasDefault: true,
    );
    boolDefaultFalse2 = _i1.ColumnBool(
      'boolDefaultFalse2',
      this,
      hasDefault: true,
    );
    boolDefaultNullFalse2 = _i1.ColumnBool(
      'boolDefaultNullFalse2',
      this,
      hasDefault: true,
    );
    bigintDefaultStr2 = _i1.ColumnBigInt(
      'bigintDefaultStr2',
      this,
      hasDefault: true,
    );
    bigintDefaultStrNull2 = _i1.ColumnBigInt(
      'bigintDefaultStrNull2',
      this,
      hasDefault: true,
    );
    uuidDefaultRandom3 = _i1.ColumnUuid(
      'uuidDefaultRandom3',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomV73 = _i1.ColumnUuid(
      'uuidDefaultRandomV73',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomNull3 = _i1.ColumnUuid(
      'uuidDefaultRandomNull3',
      this,
      hasDefault: true,
    );
    uuidDefaultStr3 = _i1.ColumnUuid(
      'uuidDefaultStr3',
      this,
      hasDefault: true,
    );
    uuidDefaultStrNull3 = _i1.ColumnUuid(
      'uuidDefaultStrNull3',
      this,
      hasDefault: true,
    );
    uriDefault3 = _i1.ColumnUri(
      'uriDefault3',
      this,
      hasDefault: true,
    );
    uriDefaultNull3 = _i1.ColumnUri(
      'uriDefaultNull3',
      this,
      hasDefault: true,
    );
    stringDefault3 = _i1.ColumnString(
      'stringDefault3',
      this,
      hasDefault: true,
    );
    stringDefaultNull3 = _i1.ColumnString(
      'stringDefaultNull3',
      this,
      hasDefault: true,
    );
    intDefault3 = _i1.ColumnInt(
      'intDefault3',
      this,
      hasDefault: true,
    );
    intDefaultNull3 = _i1.ColumnInt(
      'intDefaultNull3',
      this,
      hasDefault: true,
    );
    durationDefault3 = _i1.ColumnDuration(
      'durationDefault3',
      this,
      hasDefault: true,
    );
    durationDefaultNull3 = _i1.ColumnDuration(
      'durationDefaultNull3',
      this,
      hasDefault: true,
    );
    doubleDefault3 = _i1.ColumnDouble(
      'doubleDefault3',
      this,
      hasDefault: true,
    );
    doubleDefaultNull3 = _i1.ColumnDouble(
      'doubleDefaultNull3',
      this,
      hasDefault: true,
    );
    dateTimeDefaultNow3 = _i1.ColumnDateTime(
      'dateTimeDefaultNow3',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStr3 = _i1.ColumnDateTime(
      'dateTimeDefaultStr3',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStrNull3 = _i1.ColumnDateTime(
      'dateTimeDefaultStrNull3',
      this,
      hasDefault: true,
    );
    boolDefaultTrue3 = _i1.ColumnBool(
      'boolDefaultTrue3',
      this,
      hasDefault: true,
    );
    boolDefaultFalse3 = _i1.ColumnBool(
      'boolDefaultFalse3',
      this,
      hasDefault: true,
    );
    boolDefaultNullFalse3 = _i1.ColumnBool(
      'boolDefaultNullFalse3',
      this,
      hasDefault: true,
    );
    bigintDefaultStr3 = _i1.ColumnBigInt(
      'bigintDefaultStr3',
      this,
      hasDefault: true,
    );
    bigintDefaultStrNull3 = _i1.ColumnBigInt(
      'bigintDefaultStrNull3',
      this,
      hasDefault: true,
    );
    uuidDefaultRandom4 = _i1.ColumnUuid(
      'uuidDefaultRandom4',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomV74 = _i1.ColumnUuid(
      'uuidDefaultRandomV74',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomNull4 = _i1.ColumnUuid(
      'uuidDefaultRandomNull4',
      this,
      hasDefault: true,
    );
    uuidDefaultStr4 = _i1.ColumnUuid(
      'uuidDefaultStr4',
      this,
      hasDefault: true,
    );
    uuidDefaultStrNull4 = _i1.ColumnUuid(
      'uuidDefaultStrNull4',
      this,
      hasDefault: true,
    );
    uriDefault4 = _i1.ColumnUri(
      'uriDefault4',
      this,
      hasDefault: true,
    );
    uriDefaultNull4 = _i1.ColumnUri(
      'uriDefaultNull4',
      this,
      hasDefault: true,
    );
    stringDefault4 = _i1.ColumnString(
      'stringDefault4',
      this,
      hasDefault: true,
    );
    stringDefaultNull4 = _i1.ColumnString(
      'stringDefaultNull4',
      this,
      hasDefault: true,
    );
    intDefault4 = _i1.ColumnInt(
      'intDefault4',
      this,
      hasDefault: true,
    );
    intDefaultNull4 = _i1.ColumnInt(
      'intDefaultNull4',
      this,
      hasDefault: true,
    );
    durationDefault4 = _i1.ColumnDuration(
      'durationDefault4',
      this,
      hasDefault: true,
    );
    durationDefaultNull4 = _i1.ColumnDuration(
      'durationDefaultNull4',
      this,
      hasDefault: true,
    );
    doubleDefault4 = _i1.ColumnDouble(
      'doubleDefault4',
      this,
      hasDefault: true,
    );
    doubleDefaultNull4 = _i1.ColumnDouble(
      'doubleDefaultNull4',
      this,
      hasDefault: true,
    );
    dateTimeDefaultNow4 = _i1.ColumnDateTime(
      'dateTimeDefaultNow4',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStr4 = _i1.ColumnDateTime(
      'dateTimeDefaultStr4',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStrNull4 = _i1.ColumnDateTime(
      'dateTimeDefaultStrNull4',
      this,
      hasDefault: true,
    );
    boolDefaultTrue4 = _i1.ColumnBool(
      'boolDefaultTrue4',
      this,
      hasDefault: true,
    );
    boolDefaultFalse4 = _i1.ColumnBool(
      'boolDefaultFalse4',
      this,
      hasDefault: true,
    );
    boolDefaultNullFalse4 = _i1.ColumnBool(
      'boolDefaultNullFalse4',
      this,
      hasDefault: true,
    );
    bigintDefaultStr4 = _i1.ColumnBigInt(
      'bigintDefaultStr4',
      this,
      hasDefault: true,
    );
    bigintDefaultStrNull4 = _i1.ColumnBigInt(
      'bigintDefaultStrNull4',
      this,
      hasDefault: true,
    );
    uuidDefaultRandom5 = _i1.ColumnUuid(
      'uuidDefaultRandom5',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomV75 = _i1.ColumnUuid(
      'uuidDefaultRandomV75',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomNull5 = _i1.ColumnUuid(
      'uuidDefaultRandomNull5',
      this,
      hasDefault: true,
    );
    uuidDefaultStr5 = _i1.ColumnUuid(
      'uuidDefaultStr5',
      this,
      hasDefault: true,
    );
    uuidDefaultStrNull5 = _i1.ColumnUuid(
      'uuidDefaultStrNull5',
      this,
      hasDefault: true,
    );
    uriDefault5 = _i1.ColumnUri(
      'uriDefault5',
      this,
      hasDefault: true,
    );
    uriDefaultNull5 = _i1.ColumnUri(
      'uriDefaultNull5',
      this,
      hasDefault: true,
    );
    stringDefault5 = _i1.ColumnString(
      'stringDefault5',
      this,
      hasDefault: true,
    );
    stringDefaultNull5 = _i1.ColumnString(
      'stringDefaultNull5',
      this,
      hasDefault: true,
    );
    intDefault5 = _i1.ColumnInt(
      'intDefault5',
      this,
      hasDefault: true,
    );
    intDefaultNull5 = _i1.ColumnInt(
      'intDefaultNull5',
      this,
      hasDefault: true,
    );
    durationDefault5 = _i1.ColumnDuration(
      'durationDefault5',
      this,
      hasDefault: true,
    );
    durationDefaultNull5 = _i1.ColumnDuration(
      'durationDefaultNull5',
      this,
      hasDefault: true,
    );
    doubleDefault5 = _i1.ColumnDouble(
      'doubleDefault5',
      this,
      hasDefault: true,
    );
    doubleDefaultNull5 = _i1.ColumnDouble(
      'doubleDefaultNull5',
      this,
      hasDefault: true,
    );
    dateTimeDefaultNow5 = _i1.ColumnDateTime(
      'dateTimeDefaultNow5',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStr5 = _i1.ColumnDateTime(
      'dateTimeDefaultStr5',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStrNull5 = _i1.ColumnDateTime(
      'dateTimeDefaultStrNull5',
      this,
      hasDefault: true,
    );
    boolDefaultTrue5 = _i1.ColumnBool(
      'boolDefaultTrue5',
      this,
      hasDefault: true,
    );
    boolDefaultFalse5 = _i1.ColumnBool(
      'boolDefaultFalse5',
      this,
      hasDefault: true,
    );
    boolDefaultNullFalse5 = _i1.ColumnBool(
      'boolDefaultNullFalse5',
      this,
      hasDefault: true,
    );
    bigintDefaultStr5 = _i1.ColumnBigInt(
      'bigintDefaultStr5',
      this,
      hasDefault: true,
    );
    bigintDefaultStrNull5 = _i1.ColumnBigInt(
      'bigintDefaultStrNull5',
      this,
      hasDefault: true,
    );
    uuidDefaultRandom6 = _i1.ColumnUuid(
      'uuidDefaultRandom6',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomV76 = _i1.ColumnUuid(
      'uuidDefaultRandomV76',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomNull6 = _i1.ColumnUuid(
      'uuidDefaultRandomNull6',
      this,
      hasDefault: true,
    );
    uuidDefaultStr6 = _i1.ColumnUuid(
      'uuidDefaultStr6',
      this,
      hasDefault: true,
    );
    uuidDefaultStrNull6 = _i1.ColumnUuid(
      'uuidDefaultStrNull6',
      this,
      hasDefault: true,
    );
    uriDefault6 = _i1.ColumnUri(
      'uriDefault6',
      this,
      hasDefault: true,
    );
    uriDefaultNull6 = _i1.ColumnUri(
      'uriDefaultNull6',
      this,
      hasDefault: true,
    );
    stringDefault6 = _i1.ColumnString(
      'stringDefault6',
      this,
      hasDefault: true,
    );
    stringDefaultNull6 = _i1.ColumnString(
      'stringDefaultNull6',
      this,
      hasDefault: true,
    );
    intDefault6 = _i1.ColumnInt(
      'intDefault6',
      this,
      hasDefault: true,
    );
    intDefaultNull6 = _i1.ColumnInt(
      'intDefaultNull6',
      this,
      hasDefault: true,
    );
    durationDefault6 = _i1.ColumnDuration(
      'durationDefault6',
      this,
      hasDefault: true,
    );
    durationDefaultNull6 = _i1.ColumnDuration(
      'durationDefaultNull6',
      this,
      hasDefault: true,
    );
    doubleDefault6 = _i1.ColumnDouble(
      'doubleDefault6',
      this,
      hasDefault: true,
    );
    doubleDefaultNull6 = _i1.ColumnDouble(
      'doubleDefaultNull6',
      this,
      hasDefault: true,
    );
    dateTimeDefaultNow6 = _i1.ColumnDateTime(
      'dateTimeDefaultNow6',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStr6 = _i1.ColumnDateTime(
      'dateTimeDefaultStr6',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStrNull6 = _i1.ColumnDateTime(
      'dateTimeDefaultStrNull6',
      this,
      hasDefault: true,
    );
    boolDefaultTrue6 = _i1.ColumnBool(
      'boolDefaultTrue6',
      this,
      hasDefault: true,
    );
    boolDefaultFalse6 = _i1.ColumnBool(
      'boolDefaultFalse6',
      this,
      hasDefault: true,
    );
    boolDefaultNullFalse6 = _i1.ColumnBool(
      'boolDefaultNullFalse6',
      this,
      hasDefault: true,
    );
    bigintDefaultStr6 = _i1.ColumnBigInt(
      'bigintDefaultStr6',
      this,
      hasDefault: true,
    );
    bigintDefaultStrNull6 = _i1.ColumnBigInt(
      'bigintDefaultStrNull6',
      this,
      hasDefault: true,
    );
    uuidDefaultRandom7 = _i1.ColumnUuid(
      'uuidDefaultRandom7',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomV77 = _i1.ColumnUuid(
      'uuidDefaultRandomV77',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomNull7 = _i1.ColumnUuid(
      'uuidDefaultRandomNull7',
      this,
      hasDefault: true,
    );
    uuidDefaultStr7 = _i1.ColumnUuid(
      'uuidDefaultStr7',
      this,
      hasDefault: true,
    );
    uuidDefaultStrNull7 = _i1.ColumnUuid(
      'uuidDefaultStrNull7',
      this,
      hasDefault: true,
    );
    uriDefault7 = _i1.ColumnUri(
      'uriDefault7',
      this,
      hasDefault: true,
    );
    uriDefaultNull7 = _i1.ColumnUri(
      'uriDefaultNull7',
      this,
      hasDefault: true,
    );
    stringDefault7 = _i1.ColumnString(
      'stringDefault7',
      this,
      hasDefault: true,
    );
    stringDefaultNull7 = _i1.ColumnString(
      'stringDefaultNull7',
      this,
      hasDefault: true,
    );
    intDefault7 = _i1.ColumnInt(
      'intDefault7',
      this,
      hasDefault: true,
    );
    intDefaultNull7 = _i1.ColumnInt(
      'intDefaultNull7',
      this,
      hasDefault: true,
    );
    durationDefault7 = _i1.ColumnDuration(
      'durationDefault7',
      this,
      hasDefault: true,
    );
    durationDefaultNull7 = _i1.ColumnDuration(
      'durationDefaultNull7',
      this,
      hasDefault: true,
    );
    doubleDefault7 = _i1.ColumnDouble(
      'doubleDefault7',
      this,
      hasDefault: true,
    );
    doubleDefaultNull7 = _i1.ColumnDouble(
      'doubleDefaultNull7',
      this,
      hasDefault: true,
    );
    dateTimeDefaultNow7 = _i1.ColumnDateTime(
      'dateTimeDefaultNow7',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStr7 = _i1.ColumnDateTime(
      'dateTimeDefaultStr7',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStrNull7 = _i1.ColumnDateTime(
      'dateTimeDefaultStrNull7',
      this,
      hasDefault: true,
    );
    boolDefaultTrue7 = _i1.ColumnBool(
      'boolDefaultTrue7',
      this,
      hasDefault: true,
    );
    boolDefaultFalse7 = _i1.ColumnBool(
      'boolDefaultFalse7',
      this,
      hasDefault: true,
    );
    boolDefaultNullFalse7 = _i1.ColumnBool(
      'boolDefaultNullFalse7',
      this,
      hasDefault: true,
    );
    bigintDefaultStr7 = _i1.ColumnBigInt(
      'bigintDefaultStr7',
      this,
      hasDefault: true,
    );
    bigintDefaultStrNull7 = _i1.ColumnBigInt(
      'bigintDefaultStrNull7',
      this,
      hasDefault: true,
    );
    uuidDefaultRandom8 = _i1.ColumnUuid(
      'uuidDefaultRandom8',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomV78 = _i1.ColumnUuid(
      'uuidDefaultRandomV78',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomNull8 = _i1.ColumnUuid(
      'uuidDefaultRandomNull8',
      this,
      hasDefault: true,
    );
    uuidDefaultStr8 = _i1.ColumnUuid(
      'uuidDefaultStr8',
      this,
      hasDefault: true,
    );
    uuidDefaultStrNull8 = _i1.ColumnUuid(
      'uuidDefaultStrNull8',
      this,
      hasDefault: true,
    );
    uriDefault8 = _i1.ColumnUri(
      'uriDefault8',
      this,
      hasDefault: true,
    );
    uriDefaultNull8 = _i1.ColumnUri(
      'uriDefaultNull8',
      this,
      hasDefault: true,
    );
    stringDefault8 = _i1.ColumnString(
      'stringDefault8',
      this,
      hasDefault: true,
    );
    stringDefaultNull8 = _i1.ColumnString(
      'stringDefaultNull8',
      this,
      hasDefault: true,
    );
    intDefault8 = _i1.ColumnInt(
      'intDefault8',
      this,
      hasDefault: true,
    );
    intDefaultNull8 = _i1.ColumnInt(
      'intDefaultNull8',
      this,
      hasDefault: true,
    );
    durationDefault8 = _i1.ColumnDuration(
      'durationDefault8',
      this,
      hasDefault: true,
    );
    durationDefaultNull8 = _i1.ColumnDuration(
      'durationDefaultNull8',
      this,
      hasDefault: true,
    );
    doubleDefault8 = _i1.ColumnDouble(
      'doubleDefault8',
      this,
      hasDefault: true,
    );
    doubleDefaultNull8 = _i1.ColumnDouble(
      'doubleDefaultNull8',
      this,
      hasDefault: true,
    );
    dateTimeDefaultNow8 = _i1.ColumnDateTime(
      'dateTimeDefaultNow8',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStr8 = _i1.ColumnDateTime(
      'dateTimeDefaultStr8',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStrNull8 = _i1.ColumnDateTime(
      'dateTimeDefaultStrNull8',
      this,
      hasDefault: true,
    );
    boolDefaultTrue8 = _i1.ColumnBool(
      'boolDefaultTrue8',
      this,
      hasDefault: true,
    );
    boolDefaultFalse8 = _i1.ColumnBool(
      'boolDefaultFalse8',
      this,
      hasDefault: true,
    );
    boolDefaultNullFalse8 = _i1.ColumnBool(
      'boolDefaultNullFalse8',
      this,
      hasDefault: true,
    );
    bigintDefaultStr8 = _i1.ColumnBigInt(
      'bigintDefaultStr8',
      this,
      hasDefault: true,
    );
    bigintDefaultStrNull8 = _i1.ColumnBigInt(
      'bigintDefaultStrNull8',
      this,
      hasDefault: true,
    );
    uuidDefaultRandom9 = _i1.ColumnUuid(
      'uuidDefaultRandom9',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomV79 = _i1.ColumnUuid(
      'uuidDefaultRandomV79',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomNull9 = _i1.ColumnUuid(
      'uuidDefaultRandomNull9',
      this,
      hasDefault: true,
    );
    uuidDefaultStr9 = _i1.ColumnUuid(
      'uuidDefaultStr9',
      this,
      hasDefault: true,
    );
    uuidDefaultStrNull9 = _i1.ColumnUuid(
      'uuidDefaultStrNull9',
      this,
      hasDefault: true,
    );
    uriDefault9 = _i1.ColumnUri(
      'uriDefault9',
      this,
      hasDefault: true,
    );
    uriDefaultNull9 = _i1.ColumnUri(
      'uriDefaultNull9',
      this,
      hasDefault: true,
    );
    stringDefault9 = _i1.ColumnString(
      'stringDefault9',
      this,
      hasDefault: true,
    );
    stringDefaultNull9 = _i1.ColumnString(
      'stringDefaultNull9',
      this,
      hasDefault: true,
    );
    intDefault9 = _i1.ColumnInt(
      'intDefault9',
      this,
      hasDefault: true,
    );
    intDefaultNull9 = _i1.ColumnInt(
      'intDefaultNull9',
      this,
      hasDefault: true,
    );
    durationDefault9 = _i1.ColumnDuration(
      'durationDefault9',
      this,
      hasDefault: true,
    );
    durationDefaultNull9 = _i1.ColumnDuration(
      'durationDefaultNull9',
      this,
      hasDefault: true,
    );
    doubleDefault9 = _i1.ColumnDouble(
      'doubleDefault9',
      this,
      hasDefault: true,
    );
    doubleDefaultNull9 = _i1.ColumnDouble(
      'doubleDefaultNull9',
      this,
      hasDefault: true,
    );
    dateTimeDefaultNow9 = _i1.ColumnDateTime(
      'dateTimeDefaultNow9',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStr9 = _i1.ColumnDateTime(
      'dateTimeDefaultStr9',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStrNull9 = _i1.ColumnDateTime(
      'dateTimeDefaultStrNull9',
      this,
      hasDefault: true,
    );
    boolDefaultTrue9 = _i1.ColumnBool(
      'boolDefaultTrue9',
      this,
      hasDefault: true,
    );
    boolDefaultFalse9 = _i1.ColumnBool(
      'boolDefaultFalse9',
      this,
      hasDefault: true,
    );
    boolDefaultNullFalse9 = _i1.ColumnBool(
      'boolDefaultNullFalse9',
      this,
      hasDefault: true,
    );
    bigintDefaultStr9 = _i1.ColumnBigInt(
      'bigintDefaultStr9',
      this,
      hasDefault: true,
    );
    bigintDefaultStrNull9 = _i1.ColumnBigInt(
      'bigintDefaultStrNull9',
      this,
      hasDefault: true,
    );
    uuidDefaultRandom10 = _i1.ColumnUuid(
      'uuidDefaultRandom10',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomV710 = _i1.ColumnUuid(
      'uuidDefaultRandomV710',
      this,
      hasDefault: true,
    );
    uuidDefaultRandomNull10 = _i1.ColumnUuid(
      'uuidDefaultRandomNull10',
      this,
      hasDefault: true,
    );
    uuidDefaultStr10 = _i1.ColumnUuid(
      'uuidDefaultStr10',
      this,
      hasDefault: true,
    );
    uuidDefaultStrNull10 = _i1.ColumnUuid(
      'uuidDefaultStrNull10',
      this,
      hasDefault: true,
    );
    uriDefault10 = _i1.ColumnUri(
      'uriDefault10',
      this,
      hasDefault: true,
    );
    uriDefaultNull10 = _i1.ColumnUri(
      'uriDefaultNull10',
      this,
      hasDefault: true,
    );
    stringDefault10 = _i1.ColumnString(
      'stringDefault10',
      this,
      hasDefault: true,
    );
    stringDefaultNull10 = _i1.ColumnString(
      'stringDefaultNull10',
      this,
      hasDefault: true,
    );
    intDefault10 = _i1.ColumnInt(
      'intDefault10',
      this,
      hasDefault: true,
    );
    intDefaultNull10 = _i1.ColumnInt(
      'intDefaultNull10',
      this,
      hasDefault: true,
    );
    durationDefault10 = _i1.ColumnDuration(
      'durationDefault10',
      this,
      hasDefault: true,
    );
    durationDefaultNull10 = _i1.ColumnDuration(
      'durationDefaultNull10',
      this,
      hasDefault: true,
    );
    doubleDefault10 = _i1.ColumnDouble(
      'doubleDefault10',
      this,
      hasDefault: true,
    );
    doubleDefaultNull10 = _i1.ColumnDouble(
      'doubleDefaultNull10',
      this,
      hasDefault: true,
    );
    dateTimeDefaultNow10 = _i1.ColumnDateTime(
      'dateTimeDefaultNow10',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStr10 = _i1.ColumnDateTime(
      'dateTimeDefaultStr10',
      this,
      hasDefault: true,
    );
    dateTimeDefaultStrNull10 = _i1.ColumnDateTime(
      'dateTimeDefaultStrNull10',
      this,
      hasDefault: true,
    );
    boolDefaultTrue10 = _i1.ColumnBool(
      'boolDefaultTrue10',
      this,
      hasDefault: true,
    );
    boolDefaultFalse10 = _i1.ColumnBool(
      'boolDefaultFalse10',
      this,
      hasDefault: true,
    );
    boolDefaultNullFalse10 = _i1.ColumnBool(
      'boolDefaultNullFalse10',
      this,
      hasDefault: true,
    );
    bigintDefaultStr10 = _i1.ColumnBigInt(
      'bigintDefaultStr10',
      this,
      hasDefault: true,
    );
    bigintDefaultStrNull10 = _i1.ColumnBigInt(
      'bigintDefaultStrNull10',
      this,
      hasDefault: true,
    );
  }

  late final LargeMessageUpdateTable updateTable;

  _i2.LargeMessageTable? _previous;

  late final _i1.ColumnInt nextId;

  _i2.LargeMessageTable? _next;

  late final _i1.ColumnUuid uuidDefaultRandom;

  late final _i1.ColumnUuid uuidDefaultRandomV7;

  late final _i1.ColumnUuid uuidDefaultRandomNull;

  late final _i1.ColumnUuid uuidDefaultStr;

  late final _i1.ColumnUuid uuidDefaultStrNull;

  late final _i1.ColumnUri uriDefault;

  late final _i1.ColumnUri uriDefaultNull;

  late final _i1.ColumnString stringDefault;

  late final _i1.ColumnString stringDefaultNull;

  late final _i1.ColumnInt intDefault;

  late final _i1.ColumnInt intDefaultNull;

  late final _i1.ColumnDuration durationDefault;

  late final _i1.ColumnDuration durationDefaultNull;

  late final _i1.ColumnDouble doubleDefault;

  late final _i1.ColumnDouble doubleDefaultNull;

  late final _i1.ColumnDateTime dateTimeDefaultNow;

  late final _i1.ColumnDateTime dateTimeDefaultStr;

  late final _i1.ColumnDateTime dateTimeDefaultStrNull;

  late final _i1.ColumnBool boolDefaultTrue;

  late final _i1.ColumnBool boolDefaultFalse;

  late final _i1.ColumnBool boolDefaultNullFalse;

  late final _i1.ColumnBigInt bigintDefaultStr;

  late final _i1.ColumnBigInt bigintDefaultStrNull;

  late final _i1.ColumnUuid uuidDefaultRandom2;

  late final _i1.ColumnUuid uuidDefaultRandomV72;

  late final _i1.ColumnUuid uuidDefaultRandomNull2;

  late final _i1.ColumnUuid uuidDefaultStr2;

  late final _i1.ColumnUuid uuidDefaultStrNull2;

  late final _i1.ColumnUri uriDefault2;

  late final _i1.ColumnUri uriDefaultNull2;

  late final _i1.ColumnString stringDefault2;

  late final _i1.ColumnString stringDefaultNull2;

  late final _i1.ColumnInt intDefault2;

  late final _i1.ColumnInt intDefaultNull2;

  late final _i1.ColumnDuration durationDefault2;

  late final _i1.ColumnDuration durationDefaultNull2;

  late final _i1.ColumnDouble doubleDefault2;

  late final _i1.ColumnDouble doubleDefaultNull2;

  late final _i1.ColumnDateTime dateTimeDefaultNow2;

  late final _i1.ColumnDateTime dateTimeDefaultStr2;

  late final _i1.ColumnDateTime dateTimeDefaultStrNull2;

  late final _i1.ColumnBool boolDefaultTrue2;

  late final _i1.ColumnBool boolDefaultFalse2;

  late final _i1.ColumnBool boolDefaultNullFalse2;

  late final _i1.ColumnBigInt bigintDefaultStr2;

  late final _i1.ColumnBigInt bigintDefaultStrNull2;

  late final _i1.ColumnUuid uuidDefaultRandom3;

  late final _i1.ColumnUuid uuidDefaultRandomV73;

  late final _i1.ColumnUuid uuidDefaultRandomNull3;

  late final _i1.ColumnUuid uuidDefaultStr3;

  late final _i1.ColumnUuid uuidDefaultStrNull3;

  late final _i1.ColumnUri uriDefault3;

  late final _i1.ColumnUri uriDefaultNull3;

  late final _i1.ColumnString stringDefault3;

  late final _i1.ColumnString stringDefaultNull3;

  late final _i1.ColumnInt intDefault3;

  late final _i1.ColumnInt intDefaultNull3;

  late final _i1.ColumnDuration durationDefault3;

  late final _i1.ColumnDuration durationDefaultNull3;

  late final _i1.ColumnDouble doubleDefault3;

  late final _i1.ColumnDouble doubleDefaultNull3;

  late final _i1.ColumnDateTime dateTimeDefaultNow3;

  late final _i1.ColumnDateTime dateTimeDefaultStr3;

  late final _i1.ColumnDateTime dateTimeDefaultStrNull3;

  late final _i1.ColumnBool boolDefaultTrue3;

  late final _i1.ColumnBool boolDefaultFalse3;

  late final _i1.ColumnBool boolDefaultNullFalse3;

  late final _i1.ColumnBigInt bigintDefaultStr3;

  late final _i1.ColumnBigInt bigintDefaultStrNull3;

  late final _i1.ColumnUuid uuidDefaultRandom4;

  late final _i1.ColumnUuid uuidDefaultRandomV74;

  late final _i1.ColumnUuid uuidDefaultRandomNull4;

  late final _i1.ColumnUuid uuidDefaultStr4;

  late final _i1.ColumnUuid uuidDefaultStrNull4;

  late final _i1.ColumnUri uriDefault4;

  late final _i1.ColumnUri uriDefaultNull4;

  late final _i1.ColumnString stringDefault4;

  late final _i1.ColumnString stringDefaultNull4;

  late final _i1.ColumnInt intDefault4;

  late final _i1.ColumnInt intDefaultNull4;

  late final _i1.ColumnDuration durationDefault4;

  late final _i1.ColumnDuration durationDefaultNull4;

  late final _i1.ColumnDouble doubleDefault4;

  late final _i1.ColumnDouble doubleDefaultNull4;

  late final _i1.ColumnDateTime dateTimeDefaultNow4;

  late final _i1.ColumnDateTime dateTimeDefaultStr4;

  late final _i1.ColumnDateTime dateTimeDefaultStrNull4;

  late final _i1.ColumnBool boolDefaultTrue4;

  late final _i1.ColumnBool boolDefaultFalse4;

  late final _i1.ColumnBool boolDefaultNullFalse4;

  late final _i1.ColumnBigInt bigintDefaultStr4;

  late final _i1.ColumnBigInt bigintDefaultStrNull4;

  late final _i1.ColumnUuid uuidDefaultRandom5;

  late final _i1.ColumnUuid uuidDefaultRandomV75;

  late final _i1.ColumnUuid uuidDefaultRandomNull5;

  late final _i1.ColumnUuid uuidDefaultStr5;

  late final _i1.ColumnUuid uuidDefaultStrNull5;

  late final _i1.ColumnUri uriDefault5;

  late final _i1.ColumnUri uriDefaultNull5;

  late final _i1.ColumnString stringDefault5;

  late final _i1.ColumnString stringDefaultNull5;

  late final _i1.ColumnInt intDefault5;

  late final _i1.ColumnInt intDefaultNull5;

  late final _i1.ColumnDuration durationDefault5;

  late final _i1.ColumnDuration durationDefaultNull5;

  late final _i1.ColumnDouble doubleDefault5;

  late final _i1.ColumnDouble doubleDefaultNull5;

  late final _i1.ColumnDateTime dateTimeDefaultNow5;

  late final _i1.ColumnDateTime dateTimeDefaultStr5;

  late final _i1.ColumnDateTime dateTimeDefaultStrNull5;

  late final _i1.ColumnBool boolDefaultTrue5;

  late final _i1.ColumnBool boolDefaultFalse5;

  late final _i1.ColumnBool boolDefaultNullFalse5;

  late final _i1.ColumnBigInt bigintDefaultStr5;

  late final _i1.ColumnBigInt bigintDefaultStrNull5;

  late final _i1.ColumnUuid uuidDefaultRandom6;

  late final _i1.ColumnUuid uuidDefaultRandomV76;

  late final _i1.ColumnUuid uuidDefaultRandomNull6;

  late final _i1.ColumnUuid uuidDefaultStr6;

  late final _i1.ColumnUuid uuidDefaultStrNull6;

  late final _i1.ColumnUri uriDefault6;

  late final _i1.ColumnUri uriDefaultNull6;

  late final _i1.ColumnString stringDefault6;

  late final _i1.ColumnString stringDefaultNull6;

  late final _i1.ColumnInt intDefault6;

  late final _i1.ColumnInt intDefaultNull6;

  late final _i1.ColumnDuration durationDefault6;

  late final _i1.ColumnDuration durationDefaultNull6;

  late final _i1.ColumnDouble doubleDefault6;

  late final _i1.ColumnDouble doubleDefaultNull6;

  late final _i1.ColumnDateTime dateTimeDefaultNow6;

  late final _i1.ColumnDateTime dateTimeDefaultStr6;

  late final _i1.ColumnDateTime dateTimeDefaultStrNull6;

  late final _i1.ColumnBool boolDefaultTrue6;

  late final _i1.ColumnBool boolDefaultFalse6;

  late final _i1.ColumnBool boolDefaultNullFalse6;

  late final _i1.ColumnBigInt bigintDefaultStr6;

  late final _i1.ColumnBigInt bigintDefaultStrNull6;

  late final _i1.ColumnUuid uuidDefaultRandom7;

  late final _i1.ColumnUuid uuidDefaultRandomV77;

  late final _i1.ColumnUuid uuidDefaultRandomNull7;

  late final _i1.ColumnUuid uuidDefaultStr7;

  late final _i1.ColumnUuid uuidDefaultStrNull7;

  late final _i1.ColumnUri uriDefault7;

  late final _i1.ColumnUri uriDefaultNull7;

  late final _i1.ColumnString stringDefault7;

  late final _i1.ColumnString stringDefaultNull7;

  late final _i1.ColumnInt intDefault7;

  late final _i1.ColumnInt intDefaultNull7;

  late final _i1.ColumnDuration durationDefault7;

  late final _i1.ColumnDuration durationDefaultNull7;

  late final _i1.ColumnDouble doubleDefault7;

  late final _i1.ColumnDouble doubleDefaultNull7;

  late final _i1.ColumnDateTime dateTimeDefaultNow7;

  late final _i1.ColumnDateTime dateTimeDefaultStr7;

  late final _i1.ColumnDateTime dateTimeDefaultStrNull7;

  late final _i1.ColumnBool boolDefaultTrue7;

  late final _i1.ColumnBool boolDefaultFalse7;

  late final _i1.ColumnBool boolDefaultNullFalse7;

  late final _i1.ColumnBigInt bigintDefaultStr7;

  late final _i1.ColumnBigInt bigintDefaultStrNull7;

  late final _i1.ColumnUuid uuidDefaultRandom8;

  late final _i1.ColumnUuid uuidDefaultRandomV78;

  late final _i1.ColumnUuid uuidDefaultRandomNull8;

  late final _i1.ColumnUuid uuidDefaultStr8;

  late final _i1.ColumnUuid uuidDefaultStrNull8;

  late final _i1.ColumnUri uriDefault8;

  late final _i1.ColumnUri uriDefaultNull8;

  late final _i1.ColumnString stringDefault8;

  late final _i1.ColumnString stringDefaultNull8;

  late final _i1.ColumnInt intDefault8;

  late final _i1.ColumnInt intDefaultNull8;

  late final _i1.ColumnDuration durationDefault8;

  late final _i1.ColumnDuration durationDefaultNull8;

  late final _i1.ColumnDouble doubleDefault8;

  late final _i1.ColumnDouble doubleDefaultNull8;

  late final _i1.ColumnDateTime dateTimeDefaultNow8;

  late final _i1.ColumnDateTime dateTimeDefaultStr8;

  late final _i1.ColumnDateTime dateTimeDefaultStrNull8;

  late final _i1.ColumnBool boolDefaultTrue8;

  late final _i1.ColumnBool boolDefaultFalse8;

  late final _i1.ColumnBool boolDefaultNullFalse8;

  late final _i1.ColumnBigInt bigintDefaultStr8;

  late final _i1.ColumnBigInt bigintDefaultStrNull8;

  late final _i1.ColumnUuid uuidDefaultRandom9;

  late final _i1.ColumnUuid uuidDefaultRandomV79;

  late final _i1.ColumnUuid uuidDefaultRandomNull9;

  late final _i1.ColumnUuid uuidDefaultStr9;

  late final _i1.ColumnUuid uuidDefaultStrNull9;

  late final _i1.ColumnUri uriDefault9;

  late final _i1.ColumnUri uriDefaultNull9;

  late final _i1.ColumnString stringDefault9;

  late final _i1.ColumnString stringDefaultNull9;

  late final _i1.ColumnInt intDefault9;

  late final _i1.ColumnInt intDefaultNull9;

  late final _i1.ColumnDuration durationDefault9;

  late final _i1.ColumnDuration durationDefaultNull9;

  late final _i1.ColumnDouble doubleDefault9;

  late final _i1.ColumnDouble doubleDefaultNull9;

  late final _i1.ColumnDateTime dateTimeDefaultNow9;

  late final _i1.ColumnDateTime dateTimeDefaultStr9;

  late final _i1.ColumnDateTime dateTimeDefaultStrNull9;

  late final _i1.ColumnBool boolDefaultTrue9;

  late final _i1.ColumnBool boolDefaultFalse9;

  late final _i1.ColumnBool boolDefaultNullFalse9;

  late final _i1.ColumnBigInt bigintDefaultStr9;

  late final _i1.ColumnBigInt bigintDefaultStrNull9;

  late final _i1.ColumnUuid uuidDefaultRandom10;

  late final _i1.ColumnUuid uuidDefaultRandomV710;

  late final _i1.ColumnUuid uuidDefaultRandomNull10;

  late final _i1.ColumnUuid uuidDefaultStr10;

  late final _i1.ColumnUuid uuidDefaultStrNull10;

  late final _i1.ColumnUri uriDefault10;

  late final _i1.ColumnUri uriDefaultNull10;

  late final _i1.ColumnString stringDefault10;

  late final _i1.ColumnString stringDefaultNull10;

  late final _i1.ColumnInt intDefault10;

  late final _i1.ColumnInt intDefaultNull10;

  late final _i1.ColumnDuration durationDefault10;

  late final _i1.ColumnDuration durationDefaultNull10;

  late final _i1.ColumnDouble doubleDefault10;

  late final _i1.ColumnDouble doubleDefaultNull10;

  late final _i1.ColumnDateTime dateTimeDefaultNow10;

  late final _i1.ColumnDateTime dateTimeDefaultStr10;

  late final _i1.ColumnDateTime dateTimeDefaultStrNull10;

  late final _i1.ColumnBool boolDefaultTrue10;

  late final _i1.ColumnBool boolDefaultFalse10;

  late final _i1.ColumnBool boolDefaultNullFalse10;

  late final _i1.ColumnBigInt bigintDefaultStr10;

  late final _i1.ColumnBigInt bigintDefaultStrNull10;

  _i2.LargeMessageTable get previous {
    if (_previous != null) return _previous!;
    _previous = _i1.createRelationTable(
      relationFieldName: 'previous',
      field: LargeMessage.t.id,
      foreignField: _i2.LargeMessage.t.nextId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.LargeMessageTable(tableRelation: foreignTableRelation),
    );
    return _previous!;
  }

  _i2.LargeMessageTable get next {
    if (_next != null) return _next!;
    _next = _i1.createRelationTable(
      relationFieldName: 'next',
      field: LargeMessage.t.nextId,
      foreignField: _i2.LargeMessage.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.LargeMessageTable(tableRelation: foreignTableRelation),
    );
    return _next!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        nextId,
        uuidDefaultRandom,
        uuidDefaultRandomV7,
        uuidDefaultRandomNull,
        uuidDefaultStr,
        uuidDefaultStrNull,
        uriDefault,
        uriDefaultNull,
        stringDefault,
        stringDefaultNull,
        intDefault,
        intDefaultNull,
        durationDefault,
        durationDefaultNull,
        doubleDefault,
        doubleDefaultNull,
        dateTimeDefaultNow,
        dateTimeDefaultStr,
        dateTimeDefaultStrNull,
        boolDefaultTrue,
        boolDefaultFalse,
        boolDefaultNullFalse,
        bigintDefaultStr,
        bigintDefaultStrNull,
        uuidDefaultRandom2,
        uuidDefaultRandomV72,
        uuidDefaultRandomNull2,
        uuidDefaultStr2,
        uuidDefaultStrNull2,
        uriDefault2,
        uriDefaultNull2,
        stringDefault2,
        stringDefaultNull2,
        intDefault2,
        intDefaultNull2,
        durationDefault2,
        durationDefaultNull2,
        doubleDefault2,
        doubleDefaultNull2,
        dateTimeDefaultNow2,
        dateTimeDefaultStr2,
        dateTimeDefaultStrNull2,
        boolDefaultTrue2,
        boolDefaultFalse2,
        boolDefaultNullFalse2,
        bigintDefaultStr2,
        bigintDefaultStrNull2,
        uuidDefaultRandom3,
        uuidDefaultRandomV73,
        uuidDefaultRandomNull3,
        uuidDefaultStr3,
        uuidDefaultStrNull3,
        uriDefault3,
        uriDefaultNull3,
        stringDefault3,
        stringDefaultNull3,
        intDefault3,
        intDefaultNull3,
        durationDefault3,
        durationDefaultNull3,
        doubleDefault3,
        doubleDefaultNull3,
        dateTimeDefaultNow3,
        dateTimeDefaultStr3,
        dateTimeDefaultStrNull3,
        boolDefaultTrue3,
        boolDefaultFalse3,
        boolDefaultNullFalse3,
        bigintDefaultStr3,
        bigintDefaultStrNull3,
        uuidDefaultRandom4,
        uuidDefaultRandomV74,
        uuidDefaultRandomNull4,
        uuidDefaultStr4,
        uuidDefaultStrNull4,
        uriDefault4,
        uriDefaultNull4,
        stringDefault4,
        stringDefaultNull4,
        intDefault4,
        intDefaultNull4,
        durationDefault4,
        durationDefaultNull4,
        doubleDefault4,
        doubleDefaultNull4,
        dateTimeDefaultNow4,
        dateTimeDefaultStr4,
        dateTimeDefaultStrNull4,
        boolDefaultTrue4,
        boolDefaultFalse4,
        boolDefaultNullFalse4,
        bigintDefaultStr4,
        bigintDefaultStrNull4,
        uuidDefaultRandom5,
        uuidDefaultRandomV75,
        uuidDefaultRandomNull5,
        uuidDefaultStr5,
        uuidDefaultStrNull5,
        uriDefault5,
        uriDefaultNull5,
        stringDefault5,
        stringDefaultNull5,
        intDefault5,
        intDefaultNull5,
        durationDefault5,
        durationDefaultNull5,
        doubleDefault5,
        doubleDefaultNull5,
        dateTimeDefaultNow5,
        dateTimeDefaultStr5,
        dateTimeDefaultStrNull5,
        boolDefaultTrue5,
        boolDefaultFalse5,
        boolDefaultNullFalse5,
        bigintDefaultStr5,
        bigintDefaultStrNull5,
        uuidDefaultRandom6,
        uuidDefaultRandomV76,
        uuidDefaultRandomNull6,
        uuidDefaultStr6,
        uuidDefaultStrNull6,
        uriDefault6,
        uriDefaultNull6,
        stringDefault6,
        stringDefaultNull6,
        intDefault6,
        intDefaultNull6,
        durationDefault6,
        durationDefaultNull6,
        doubleDefault6,
        doubleDefaultNull6,
        dateTimeDefaultNow6,
        dateTimeDefaultStr6,
        dateTimeDefaultStrNull6,
        boolDefaultTrue6,
        boolDefaultFalse6,
        boolDefaultNullFalse6,
        bigintDefaultStr6,
        bigintDefaultStrNull6,
        uuidDefaultRandom7,
        uuidDefaultRandomV77,
        uuidDefaultRandomNull7,
        uuidDefaultStr7,
        uuidDefaultStrNull7,
        uriDefault7,
        uriDefaultNull7,
        stringDefault7,
        stringDefaultNull7,
        intDefault7,
        intDefaultNull7,
        durationDefault7,
        durationDefaultNull7,
        doubleDefault7,
        doubleDefaultNull7,
        dateTimeDefaultNow7,
        dateTimeDefaultStr7,
        dateTimeDefaultStrNull7,
        boolDefaultTrue7,
        boolDefaultFalse7,
        boolDefaultNullFalse7,
        bigintDefaultStr7,
        bigintDefaultStrNull7,
        uuidDefaultRandom8,
        uuidDefaultRandomV78,
        uuidDefaultRandomNull8,
        uuidDefaultStr8,
        uuidDefaultStrNull8,
        uriDefault8,
        uriDefaultNull8,
        stringDefault8,
        stringDefaultNull8,
        intDefault8,
        intDefaultNull8,
        durationDefault8,
        durationDefaultNull8,
        doubleDefault8,
        doubleDefaultNull8,
        dateTimeDefaultNow8,
        dateTimeDefaultStr8,
        dateTimeDefaultStrNull8,
        boolDefaultTrue8,
        boolDefaultFalse8,
        boolDefaultNullFalse8,
        bigintDefaultStr8,
        bigintDefaultStrNull8,
        uuidDefaultRandom9,
        uuidDefaultRandomV79,
        uuidDefaultRandomNull9,
        uuidDefaultStr9,
        uuidDefaultStrNull9,
        uriDefault9,
        uriDefaultNull9,
        stringDefault9,
        stringDefaultNull9,
        intDefault9,
        intDefaultNull9,
        durationDefault9,
        durationDefaultNull9,
        doubleDefault9,
        doubleDefaultNull9,
        dateTimeDefaultNow9,
        dateTimeDefaultStr9,
        dateTimeDefaultStrNull9,
        boolDefaultTrue9,
        boolDefaultFalse9,
        boolDefaultNullFalse9,
        bigintDefaultStr9,
        bigintDefaultStrNull9,
        uuidDefaultRandom10,
        uuidDefaultRandomV710,
        uuidDefaultRandomNull10,
        uuidDefaultStr10,
        uuidDefaultStrNull10,
        uriDefault10,
        uriDefaultNull10,
        stringDefault10,
        stringDefaultNull10,
        intDefault10,
        intDefaultNull10,
        durationDefault10,
        durationDefaultNull10,
        doubleDefault10,
        doubleDefaultNull10,
        dateTimeDefaultNow10,
        dateTimeDefaultStr10,
        dateTimeDefaultStrNull10,
        boolDefaultTrue10,
        boolDefaultFalse10,
        boolDefaultNullFalse10,
        bigintDefaultStr10,
        bigintDefaultStrNull10,
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

class LargeMessageInclude extends _i1.IncludeObject {
  LargeMessageInclude._({
    _i2.LargeMessageInclude? previous,
    _i2.LargeMessageInclude? next,
  }) {
    _previous = previous;
    _next = next;
  }

  _i2.LargeMessageInclude? _previous;

  _i2.LargeMessageInclude? _next;

  @override
  Map<String, _i1.Include?> get includes => {
        'previous': _previous,
        'next': _next,
      };

  @override
  _i1.Table<int?> get table => LargeMessage.t;
}

class LargeMessageIncludeList extends _i1.IncludeList {
  LargeMessageIncludeList._({
    _i1.WhereExpressionBuilder<LargeMessageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(LargeMessage.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => LargeMessage.t;
}

class LargeMessageRepository {
  const LargeMessageRepository._();

  final attachRow = const LargeMessageAttachRowRepository._();

  final detachRow = const LargeMessageDetachRowRepository._();

  /// Returns a list of [LargeMessage]s matching the given query parameters.
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
  Future<List<LargeMessage>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LargeMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LargeMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LargeMessageTable>? orderByList,
    _i1.Transaction? transaction,
    LargeMessageInclude? include,
  }) async {
    return session.db.find<LargeMessage>(
      where: where?.call(LargeMessage.t),
      orderBy: orderBy?.call(LargeMessage.t),
      orderByList: orderByList?.call(LargeMessage.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [LargeMessage] matching the given query parameters.
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
  Future<LargeMessage?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LargeMessageTable>? where,
    int? offset,
    _i1.OrderByBuilder<LargeMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LargeMessageTable>? orderByList,
    _i1.Transaction? transaction,
    LargeMessageInclude? include,
  }) async {
    return session.db.findFirstRow<LargeMessage>(
      where: where?.call(LargeMessage.t),
      orderBy: orderBy?.call(LargeMessage.t),
      orderByList: orderByList?.call(LargeMessage.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [LargeMessage] by its [id] or null if no such row exists.
  Future<LargeMessage?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    LargeMessageInclude? include,
  }) async {
    return session.db.findById<LargeMessage>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [LargeMessage]s in the list and returns the inserted rows.
  ///
  /// The returned [LargeMessage]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<LargeMessage>> insert(
    _i1.Session session,
    List<LargeMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<LargeMessage>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [LargeMessage] and returns the inserted row.
  ///
  /// The returned [LargeMessage] will have its `id` field set.
  Future<LargeMessage> insertRow(
    _i1.Session session,
    LargeMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<LargeMessage>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [LargeMessage]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<LargeMessage>> update(
    _i1.Session session,
    List<LargeMessage> rows, {
    _i1.ColumnSelections<LargeMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<LargeMessage>(
      rows,
      columns: columns?.call(LargeMessage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LargeMessage]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<LargeMessage> updateRow(
    _i1.Session session,
    LargeMessage row, {
    _i1.ColumnSelections<LargeMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<LargeMessage>(
      row,
      columns: columns?.call(LargeMessage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LargeMessage] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<LargeMessage?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<LargeMessageUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<LargeMessage>(
      id,
      columnValues: columnValues(LargeMessage.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [LargeMessage]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<LargeMessage>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<LargeMessageUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<LargeMessageTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LargeMessageTable>? orderBy,
    _i1.OrderByListBuilder<LargeMessageTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<LargeMessage>(
      columnValues: columnValues(LargeMessage.t.updateTable),
      where: where(LargeMessage.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LargeMessage.t),
      orderByList: orderByList?.call(LargeMessage.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [LargeMessage]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<LargeMessage>> delete(
    _i1.Session session,
    List<LargeMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<LargeMessage>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [LargeMessage].
  Future<LargeMessage> deleteRow(
    _i1.Session session,
    LargeMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LargeMessage>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<LargeMessage>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LargeMessageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<LargeMessage>(
      where: where(LargeMessage.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LargeMessageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<LargeMessage>(
      where: where?.call(LargeMessage.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class LargeMessageAttachRowRepository {
  const LargeMessageAttachRowRepository._();

  /// Creates a relation between the given [LargeMessage] and [LargeMessage]
  /// by setting the [LargeMessage]'s foreign key `id` to refer to the [LargeMessage].
  Future<void> previous(
    _i1.Session session,
    LargeMessage largeMessage,
    _i2.LargeMessage previous, {
    _i1.Transaction? transaction,
  }) async {
    if (previous.id == null) {
      throw ArgumentError.notNull('previous.id');
    }
    if (largeMessage.id == null) {
      throw ArgumentError.notNull('largeMessage.id');
    }

    var $previous = previous.copyWith(nextId: largeMessage.id);
    await session.db.updateRow<_i2.LargeMessage>(
      $previous,
      columns: [_i2.LargeMessage.t.nextId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [LargeMessage] and [LargeMessage]
  /// by setting the [LargeMessage]'s foreign key `nextId` to refer to the [LargeMessage].
  Future<void> next(
    _i1.Session session,
    LargeMessage largeMessage,
    _i2.LargeMessage next, {
    _i1.Transaction? transaction,
  }) async {
    if (largeMessage.id == null) {
      throw ArgumentError.notNull('largeMessage.id');
    }
    if (next.id == null) {
      throw ArgumentError.notNull('next.id');
    }

    var $largeMessage = largeMessage.copyWith(nextId: next.id);
    await session.db.updateRow<LargeMessage>(
      $largeMessage,
      columns: [LargeMessage.t.nextId],
      transaction: transaction,
    );
  }
}

class LargeMessageDetachRowRepository {
  const LargeMessageDetachRowRepository._();

  /// Detaches the relation between this [LargeMessage] and the [LargeMessage] set in `previous`
  /// by setting the [LargeMessage]'s foreign key `id` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> previous(
    _i1.Session session,
    LargeMessage largemessage, {
    _i1.Transaction? transaction,
  }) async {
    var $previous = largemessage.previous;

    if ($previous == null) {
      throw ArgumentError.notNull('largemessage.previous');
    }
    if ($previous.id == null) {
      throw ArgumentError.notNull('largemessage.previous.id');
    }
    if (largemessage.id == null) {
      throw ArgumentError.notNull('largemessage.id');
    }

    var $$previous = $previous.copyWith(nextId: null);
    await session.db.updateRow<_i2.LargeMessage>(
      $$previous,
      columns: [_i2.LargeMessage.t.nextId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [LargeMessage] and the [LargeMessage] set in `next`
  /// by setting the [LargeMessage]'s foreign key `nextId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> next(
    _i1.Session session,
    LargeMessage largemessage, {
    _i1.Transaction? transaction,
  }) async {
    if (largemessage.id == null) {
      throw ArgumentError.notNull('largemessage.id');
    }

    var $largemessage = largemessage.copyWith(nextId: null);
    await session.db.updateRow<LargeMessage>(
      $largemessage,
      columns: [LargeMessage.t.nextId],
      transaction: transaction,
    );
  }
}
