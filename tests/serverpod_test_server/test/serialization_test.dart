import 'dart:convert';
import 'dart:typed_data';

import 'package:serverpod/protocol.dart' as serverpod;
import 'package:serverpod_test_client/serverpod_test_client.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart' as server;
import 'package:test/test.dart';

void main() {
  final protocol = Protocol();
  final serverProtocol = server.Protocol();

  test(
    'Given an enum serialized as string with a null value when serializing then the value is null',
    () {
      final types = Types();

      final encoded = SerializationManager.encode(types);
      final unpacked = protocol.decode<Types>(encoded);

      expect(unpacked.aStringifiedEnum, isNull);
    },
  );

  test(
    'Given a server-side enum serialized as string value when serializing then the value is unpacked correctly',
    () {
      final types = server.Types(
        aStringifiedEnum: server.TestEnumStringified.one,
      );

      final encoded = SerializationManager.encode(types);
      final unpacked = serverProtocol.decode<server.Types>(encoded);

      expect(unpacked.aStringifiedEnum, server.TestEnumStringified.one);
    },
  );

  test(
    'Given a server-side enum serialized as string with a null value when serializing then the value is null',
    () {
      final types = server.Types();

      final encoded = SerializationManager.encode(types);
      final unpacked = serverProtocol.decode<server.Types>(encoded);

      expect(unpacked.aStringifiedEnum, isNull);
    },
  );

  test(
    'Given an enum serialized as string value when serializing then the value is unpacked correctly',
    () {
      final types = Types(aStringifiedEnum: TestEnumStringified.one);

      final encoded = SerializationManager.encode(types);
      final unpacked = protocol.decode<Types>(encoded);

      expect(unpacked.aStringifiedEnum, TestEnumStringified.one);
    },
  );

  test(
    'Given a serializable object as a key in a map when serializing and unpacking the original object remains unchanged.',
    () {
      final type = Types(anInt: 123);
      final object = TypesMap(anObjectKey: {type: 'value'});

      final encodedString = SerializationManager.encode(object);
      final typesMap = Protocol().decode<TypesMap>(encodedString);

      expect(typesMap.anObjectKey?.entries.first.key.anInt, 123);
    },
  );

  test(
    'Given a DateTime as a key in a map when serializing and unpacking the original object remains unchanged.',
    () {
      final object = TypesMap(
        aDateTimeKey: {DateTime.parse('2024-01-01T00:00:00.000Z'): 'value'},
      );

      final encodedString = SerializationManager.encode(object);
      final typesMap = Protocol().decode<TypesMap>(encodedString);

      expect(
        typesMap.aDateTimeKey?.entries.first.key,
        DateTime.parse('2024-01-01T00:00:00.000Z'),
      );
    },
  );

  test(
    'Given a UuidValue as a key in a map when serializing and unpacking the original object remains unchanged.',
    () {
      // ignore: deprecated_member_use
      final object = TypesMap(aUuidKey: {UuidValue.nil: 'value'});

      final encodedString = SerializationManager.encode(object);
      final typesMap = Protocol().decode<TypesMap>(encodedString);

      expect(
        typesMap.aUuidKey?.entries.first.key,
        // ignore: deprecated_member_use
        UuidValue.nil,
      );
    },
  );

  test(
    'Given a Uri as a key in a map when serializing and unpacking the original object remains unchanged.',
    () {
      final object = TypesMap(
        aUriKey: {Uri.parse('https://serverpod.dev'): 'value'},
      );

      final encodedString = SerializationManager.encode(object);
      final typesMap = Protocol().decode<TypesMap>(encodedString);

      expect(
        typesMap.aUriKey?.entries.first.key,
        Uri.parse('https://serverpod.dev'),
      );
    },
  );

  test(
    'Given a BigInt as a key in a map when serializing and unpacking the original object remains unchanged.',
    () {
      final object = TypesMap(aBigIntKey: {BigInt.two: 'value'});

      final encodedString = SerializationManager.encode(object);
      final typesMap = Protocol().decode<TypesMap>(encodedString);

      expect(
        typesMap.aBigIntKey?.entries.first.key,
        BigInt.two,
      );
    },
  );

  test(
    'Given a BigInt as a value in a map when serializing and unpacking the original object remains unchanged.',
    () {
      final object = TypesMap(aBigIntValue: {'2': BigInt.two});

      final encodedString = SerializationManager.encode(object);
      final typesMap = Protocol().decode<TypesMap>(encodedString);

      expect(
        typesMap.aBigIntValue?['2'],
        BigInt.two,
      );
    },
  );

  test(
    'Given a ByteData as a key in a map when serializing and unpacking the original object remains unchanged.',
    () {
      final intList = Uint8List(8);
      for (var i = 0; i < intList.length; i++) {
        intList[i] = i;
      }

      final object = TypesMap(
        aByteDataKey: {ByteData.view(intList.buffer): 'value'},
      );

      final encodedString = SerializationManager.encode(object);
      final typesMap = Protocol().decode<TypesMap>(encodedString);

      expect(
        typesMap.aByteDataKey?.entries.first.key.buffer.asUint8List(),
        Uint8List.fromList([0, 1, 2, 3, 4, 5, 6, 7]),
      );
    },
  );

  test(
    'Given a Duration as a key in a map when serializing and unpacking the original object remains unchanged.',
    () {
      final object = TypesMap(
        aDurationKey: {const Duration(seconds: 1): 'value'},
      );

      final encodedString = SerializationManager.encode(object);
      final typesMap = Protocol().decode<TypesMap>(encodedString);

      expect(
        typesMap.aDurationKey?.entries.first.key.inMilliseconds,
        const Duration(seconds: 1).inMilliseconds,
      );
    },
  );

  test(
    'Given a index serialized Enum as a key in a map when serializing and unpacking the original object remains unchanged.',
    () {
      final object = TypesMap(
        anEnumKey: {TestEnum.one: 'value'},
      );

      final encodedString = SerializationManager.encode(object);
      final typesMap = Protocol().decode<TypesMap>(encodedString);

      expect(
        typesMap.anEnumKey?.entries.first.key,
        TestEnum.one,
      );
    },
  );

  test(
    'Given a name serialized Enum as a key in a map when serializing and unpacking the original object remains unchanged.',
    () {
      final object = TypesMap(
        aStringifiedEnumKey: {TestEnumStringified.one: 'value'},
      );

      final encodedString = SerializationManager.encode(object);
      final typesMap = Protocol().decode<TypesMap>(encodedString);

      expect(
        typesMap.aStringifiedEnumKey?.entries.first.key,
        TestEnumStringified.one,
      );
    },
  );

  test(
    'Given a Map as a key in a map when serializing and unpacking the original object remains unchanged.',
    () {
      final object = TypesMap(
        aMapKey: {
          {Types(anInt: 123): 'value'}: 'value',
        },
      );

      final encodedString = SerializationManager.encode(object);
      final typesMap = Protocol().decode<TypesMap>(encodedString);

      expect(
        typesMap.aMapKey?.entries.first.key.entries.first.key.anInt,
        123,
      );
    },
  );

  test(
    'Given a List as a key in a map when serializing and unpacking the original object remains unchanged.',
    () {
      final type = Types(anInt: 1);
      final object = TypesMap(
        aListKey: {
          [type]: 'value',
        },
      );

      final encodedString = SerializationManager.encode(object);
      final typesMap = Protocol().decode<TypesMap>(encodedString);

      expect(
        typesMap.aListKey?.entries.first.key.first.anInt,
        1,
      );
    },
  );

  test(
    'Given an empty map with an int key when serializing and unpacking the empty map is preserved.',
    () {
      final object = TypesMap(anIntKey: {});

      final encodedString = SerializationManager.encode(object);
      final typesMap = Protocol().decode<TypesMap>(encodedString);

      expect(typesMap.anIntKey, {});
    },
  );

  test(
    'Given an empty map with an SerializableModel key when serializing and unpacking the empty map is preserved.',
    () {
      final object = TypesMap(anObjectKey: {});

      final encodedString = SerializationManager.encode(object);
      final typesMap = Protocol().decode<TypesMap>(encodedString);

      expect(typesMap.anObjectKey, {});
    },
  );

  test(
    'Given a Serverpod defined model when encoding it with type then it is encoded',
    () {
      final serverProtocol = server.Protocol();
      final serverpodDefinedModel = serverpod.ClusterServerInfo(
        serverId: 'Hello World',
      );
      final encoded = serverProtocol.encodeWithType(serverpodDefinedModel);

      expect(encoded, isA<String>());
    },
  );

  test(
    'Given a project-defined Record type, when encoding it using `mapRecordToJson` then it is encoded',
    () {
      final recordAsJSON = mapRecordToJson(
        (
          (1, '2'),
          namedSubRecord: (SimpleData(num: 3), 4.5),
        ),
      );

      expect(
        recordAsJSON,
        equals({
          'p': [
            {
              'p': [1, '2'],
            },
          ],
          'n': {
            'namedSubRecord': {
              'p': [isA<SimpleData>().having((final d) => d.num, 'num', 3), 4.5],
            },
          },
        }),
      );
    },
  );

  test(
    'Given a Map with String keys and optional project-defined Record value type, when encoding it using `mapRecordContainingContainerToJson` then it is converted to a JSON map without records',
    () {
      final jsonMap = mapContainerToJson(
        {
          'foo': (1, SimpleData(num: 2)),
          'bar': null,
        },
      );

      expect(
        jsonMap,
        isA<Map<String, dynamic>>()
            .having(
              (final m) => m.length,
              'length',
              2,
            )
            .having((final m) => m['foo'], 'foo entry', {
              'p': [
                1,
                isA<
                  SimpleData
                >(), // will be encoded in the JSON String serialization
              ],
            })
            .having(
              (final m) => m['bar'],
              'bar entry',
              isNull,
            ),
      );

      // ensure this can be encoded as well
      expect(jsonEncode(jsonMap), isNotEmpty);
    },
  );

  test(
    'Given a List with optional project-defined Record value type, when encoding it using `mapRecordContainingContainerToJson` then it is converted to a JSON map without records',
    () {
      final jsonList = mapContainerToJson([
        null,
        (1, SimpleData(num: 2)),
      ]);

      expect(
        jsonList,
        isA<List>()
            .having(
              (final m) => m.length,
              'length',
              2,
            )
            .having(
              (final m) => m.first,
              'first entry',
              isNull,
            )
            .having((final m) => m.last, 'last entry', {
              'p': [
                1,
                isA<
                  SimpleData
                >(), // will be encoded in the JSON String serialization
              ],
            }),
      );

      // ensure this can be encoded as well
      expect(jsonEncode(jsonList), isNotEmpty);
    },
  );

  test(
    'Given a Set with optional project-defined Record value type, when encoding it using `mapRecordContainingContainerToJson` then it is converted to a JSON map without records',
    () {
      final jsonList = mapContainerToJson({
        null,
        (1, SimpleData(num: 2)),
      });

      expect(
        jsonList,
        isA<List>()
            .having(
              (final m) => m.length,
              'length',
              2,
            )
            .having(
              (final m) => m.first,
              'first entry',
              isNull,
            )
            .having((final m) => m.last, 'last entry', {
              'p': [
                1,
                isA<
                  SimpleData
                >(), // will be encoded in the JSON String serialization
              ],
            }),
      );

      // ensure this can be encoded as well
      expect(jsonEncode(jsonList), isNotEmpty);
    },
  );

  test(
    'Given a List containing Sets with optional project-defined Record value type, when encoding it using `mapRecordContainingContainerToJson` then it is converted to a JSON map without records',
    () {
      final jsonList = mapContainerToJson([
        {
          null,
          (1, SimpleData(num: 2)),
        },
      ]);

      expect(
        jsonList,
        [
          [
            isNull,
            {
              'p': [
                1,
                isA<
                  SimpleData
                >(), // will be encoded in the JSON String serialization
              ],
            },
          ],
        ],
      );

      // ensure this can be encoded as well
      expect(jsonEncode(jsonList), isNotEmpty);
    },
  );

  test(
    'Given a leaf class in a hierarchy, when serializing it, then all its values are restored on decode.',
    () {
      final object = server.ParentClass(
        grandParentField: 'grand parent value',
        parentField: 'parent value',
      );

      final encodedString = server.Protocol().encodeWithType(object);
      final decodedObject = server.Protocol().decodeWithType(encodedString);

      expect(
        decodedObject,
        isA<server.ParentClass>()
            .having(
              (final c) => c.grandParentField,
              'grandParentField',
              'grand parent value',
            )
            .having((final c) => c.parentField, 'parentField', 'parent value'),
      );
    },
  );

  test(
    'Given a class with a empty `Map`s, when serializing it, then the empty maps are restored on decode.',
    () {
      final object = server.ObjectWithMaps(
        dataMap: {},
        intMap: {},
        stringMap: {},
        dateTimeMap: {},
        byteDataMap: {},
        nullableDataMap: {},
        nullableIntMap: {},
        nullableStringMap: {},
        nullableDateTimeMap: {},
        nullableByteDataMap: {},
        intIntMap: {},
        durationMap: {},
        nullableDurationMap: {},
        uuidMap: {},
        nullableUuidMap: {},
      );

      final encodedString = server.Protocol().encodeWithType(object);
      final decodedObject = server.Protocol().decodeWithType(encodedString);

      expect(
        decodedObject,
        isA<server.ObjectWithMaps>()
            .having((final o) => o.dataMap, 'dataMap', isEmpty)
            .having((final o) => o.intMap, 'intMap', isEmpty)
            .having((final o) => o.stringMap, 'stringMap', isEmpty)
            .having((final o) => o.dateTimeMap, 'dateTimeMap', isEmpty)
            .having((final o) => o.byteDataMap, 'byteDataMap', isEmpty)
            .having((final o) => o.durationMap, 'durationMap', isEmpty)
            .having((final o) => o.uuidMap, 'uuidMap', isEmpty)
            .having((final o) => o.nullableDataMap, 'nullableDataMap', isEmpty)
            .having((final o) => o.nullableIntMap, 'nullableIntMap', isEmpty)
            .having((final o) => o.nullableStringMap, 'nullableStringMap', isEmpty)
            .having(
              (final o) => o.nullableDateTimeMap,
              'nullableDateTimeMap',
              isEmpty,
            )
            .having(
              (final o) => o.nullableByteDataMap,
              'nullableByteDataMap',
              isEmpty,
            )
            .having(
              (final o) => o.nullableDurationMap,
              'nullableDurationMap',
              isEmpty,
            )
            .having((final o) => o.intIntMap, 'intIntMap', isEmpty),
      );
    },
  );
}
