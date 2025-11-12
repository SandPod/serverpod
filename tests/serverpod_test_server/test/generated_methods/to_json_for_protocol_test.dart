import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:test/test.dart';

void main() {
  test(
    'Given a class with only nullable fields without any of them defined when calling toJsonForProtocol then an empty map is returned.',
    () {
      final types = Types();

      final jsonMap = types.toJsonForProtocol();

      expect(jsonMap, {});
    },
  );

  test(
    'Given a class with only nullable fields with an int defined when calling toJsonForProtocol then the key and value is set.',
    () {
      final types = Types(anInt: 1);

      final jsonMap = types.toJsonForProtocol();

      expect(jsonMap, {'anInt': 1});
    },
  );

  test(
    'Given a class with only nullable fields with a double defined when calling toJsonForProtocol then the key and value is set.',
    () {
      final types = Types(aDouble: 1.0);

      final jsonMap = types.toJsonForProtocol();

      expect(jsonMap, {'aDouble': 1.0});
    },
  );

  test(
    'Given a class with only nullable fields with a bool defined when calling toJsonForProtocol then the key and value is set.',
    () {
      final types = Types(aBool: true);

      final jsonMap = types.toJsonForProtocol();

      expect(jsonMap, {'aBool': true});
    },
  );

  test(
    'Given a class with only nullable fields with a String defined when calling toJsonForProtocol then the key and value is set.',
    () {
      final types = Types(aString: 'Hello world!');

      final jsonMap = types.toJsonForProtocol();

      expect(jsonMap, {'aString': 'Hello world!'});
    },
  );

  test(
    'Given a class with only nullable fields with an enum serialized by index defined when calling toJsonForProtocol then the key and value is set.',
    () {
      final types = Types(anEnum: TestEnum.one);

      final jsonMap = types.toJsonForProtocol();

      expect(jsonMap, {'anEnum': 0});
    },
  );

  test(
    'Given a class with only nullable fields with an enum serialized by name defined when calling toJsonForProtocol then the key and value is set.',
    () {
      final types = Types(aStringifiedEnum: TestEnumStringified.one);

      final jsonMap = types.toJsonForProtocol();

      expect(jsonMap, {'aStringifiedEnum': 'one'});
    },
  );

  test(
    'Given a class with only nullable fields with a Uuid defined when calling toJsonForProtocol then the key and value is set.',
    () {
      // ignore: deprecated_member_use
      final types = Types(aUuid: UuidValue.nil);

      final jsonMap = types.toJsonForProtocol();

      expect(jsonMap, {'aUuid': '00000000-0000-0000-0000-000000000000'});
    },
  );

  test(
    'Given a class with only nullable fields with a Uri defined when calling toJsonForProtocol then the key and value is set.',
    () {
      final uri = Uri.parse('https://serverpod.dev');
      final types = Types(aUri: uri);

      final jsonMap = types.toJsonForProtocol();

      expect(jsonMap, {'aUri': 'https://serverpod.dev'});
    },
  );

  test(
    'Given a class with only nullable fields with a BigInt defined when calling toJsonForProtocol then the key and value is set.',
    () {
      final types = Types(aBigInt: BigInt.one);

      final jsonMap = types.toJsonForProtocol();

      expect(jsonMap, {'aBigInt': '1'});
    },
  );

  test(
    'Given a class with only nullable fields with a Duration defined when calling toJsonForProtocol then the key and value is set.',
    () {
      final types = Types(aDuration: const Duration(seconds: 1));

      final jsonMap = types.toJsonForProtocol();

      expect(jsonMap, {'aDuration': 1000});
    },
  );

  test(
    'Given a class with only nullable fields with a DateTime defined when calling toJsonForProtocol then the key and value is set.',
    () {
      final types = Types(aDateTime: DateTime.parse('2024-01-01T00:00:00.000Z'));

      final jsonMap = types.toJsonForProtocol();

      expect(jsonMap, {'aDateTime': '2024-01-01T00:00:00.000Z'});
    },
  );

  test(
    'Given a class with only nullable fields with a ByteData defined when calling toJsonForProtocol then the key and value is set.',
    () {
      final intList = Uint8List(8);
      for (var i = 0; i < intList.length; i++) {
        intList[i] = i;
      }

      final types = Types(aByteData: ByteData.view(intList.buffer));

      final jsonMap = types.toJsonForProtocol();

      expect(jsonMap, {'aByteData': "decode('AAECAwQFBgc=', 'base64')"});
    },
  );

  test(
    'Given a class with a relation to an object when calling toJsonForProtocol the entire nested structure is converted.',
    () {
      final next = Post(content: 'next');
      final post = Post(content: 'post', next: next);

      final jsonMap = post.toJsonForProtocol();

      expect(jsonMap, {
        'content': 'post',
        'next': {'content': 'next'},
      });
    },
  );

  test(
    'Given a class with a nested object when calling toJsonForProtocol the entire nested structure is converted.',
    () {
      final simpleData = SimpleData(num: 123);
      final object = SimpleDataObject(object: simpleData);

      final jsonMap = object.toJsonForProtocol();

      expect(jsonMap, {
        'object': {'num': 123},
      });
    },
  );

  ///----

  test(
    'Given a class with a List with a nested object when calling toJsonForProtocol the entire nested structure is converted.',
    () {
      final type = Types(anInt: 123);
      final object = TypesList(anObject: [type]);

      final jsonMap = object.toJsonForProtocol();

      expect(jsonMap, {
        'anObject': [
          {'anInt': 123},
        ],
      });
    },
  );

  test(
    'Given a class with a List with a nested DateTime when calling toJsonForProtocol the entire nested structure is converted.',
    () {
      final object = TypesList(
        aDateTime: [DateTime.parse('2024-01-01T00:00:00.000Z')],
      );

      final jsonMap = object.toJsonForProtocol();

      expect(jsonMap, {
        'aDateTime': ['2024-01-01T00:00:00.000Z'],
      });
    },
  );

  test(
    'Given a class with a List with a nested ByteData when calling toJsonForProtocol the entire nested structure is converted.',
    () {
      final intList = Uint8List(8);
      for (var i = 0; i < intList.length; i++) {
        intList[i] = i;
      }

      final object = TypesList(
        aByteData: [ByteData.view(intList.buffer)],
      );

      final jsonMap = object.toJsonForProtocol();

      expect(jsonMap, {
        'aByteData': ["decode('AAECAwQFBgc=', 'base64')"],
      });
    },
  );

  test(
    'Given a class with a List with a nested Duration when calling toJsonForProtocol the entire nested structure is converted.',
    () {
      final object = TypesList(
        aDuration: [const Duration(seconds: 1)],
      );

      final jsonMap = object.toJsonForProtocol();

      expect(jsonMap, {
        'aDuration': [1000],
      });
    },
  );

  test(
    'Given a class with a List with a nested Uuid when calling toJsonForProtocol the entire nested structure is converted.',
    () {
      final object = TypesList(
        // ignore: deprecated_member_use
        aUuid: [UuidValue.nil],
      );

      final jsonMap = object.toJsonForProtocol();

      expect(jsonMap, {
        'aUuid': ['00000000-0000-0000-0000-000000000000'],
      });
    },
  );

  test(
    'Given a class with a List with a nested Uri when calling toJsonForProtocol the entire nested structure is converted.',
    () {
      final object = TypesList(
        aUri: [Uri.parse('https://serverpod.dev')],
      );

      final jsonMap = object.toJsonForProtocol();

      expect(jsonMap, {
        'aUri': ['https://serverpod.dev'],
      });
    },
  );

  test(
    'Given a class with a List with a nested BigInt when calling toJsonForProtocol the entire nested structure is converted.',
    () {
      final object = TypesList(
        aBigInt: [BigInt.one],
      );

      final jsonMap = object.toJsonForProtocol();

      expect(jsonMap, {
        'aBigInt': ['1'],
      });
    },
  );

  test(
    'Given a class with a List with a nested enum serialized by index when calling toJsonForProtocol the entire nested structure is converted.',
    () {
      final object = TypesList(
        anEnum: [TestEnum.one],
      );

      final jsonMap = object.toJsonForProtocol();

      expect(jsonMap, {
        'anEnum': [0],
      });
    },
  );

  test(
    'Given a class with a List with a nested enum serialized by name when calling toJsonForProtocol the entire nested structure is converted.',
    () {
      final object = TypesList(
        aStringifiedEnum: [TestEnumStringified.one],
      );

      final jsonMap = object.toJsonForProtocol();

      expect(jsonMap, {
        'aStringifiedEnum': ['one'],
      });
    },
  );

  test(
    'Given a class with a List with a nested Map serialized by name when calling toJsonForProtocol the entire nested structure is converted.',
    () {
      final type = Types(anInt: 123);
      final object = TypesList(
        aMap: [
          {'key': type},
        ],
      );

      final jsonMap = object.toJsonForProtocol();

      expect(jsonMap, {
        'aMap': [
          {
            'key': {'anInt': 123},
          },
        ],
      });
    },
  );

  test(
    'Given a class with a List with a nested List serialized by name when calling toJsonForProtocol the entire nested structure is converted.',
    () {
      final type = Types(anInt: 123);
      final object = TypesList(
        aList: [
          [type],
        ],
      );

      final jsonMap = object.toJsonForProtocol();

      expect(jsonMap, {
        'aList': [
          [
            {'anInt': 123},
          ],
        ],
      });
    },
  );

  group('Set', () {
    test(
      'Given a class with a Set with a nested object when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final type = Types(anInt: 123);
        final object = TypesSet(anObject: {type});

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'anObject': [
            {'anInt': 123},
          ],
        });
      },
    );

    test(
      'Given a class with a Set with a nested DateTime when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesSet(
          aDateTime: {DateTime.parse('2024-01-01T00:00:00.000Z')},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aDateTime': ['2024-01-01T00:00:00.000Z'],
        });
      },
    );

    test(
      'Given a class with a Set with a nested ByteData when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final intList = Uint8List(8);
        for (var i = 0; i < intList.length; i++) {
          intList[i] = i;
        }

        final object = TypesSet(
          aByteData: {ByteData.view(intList.buffer)},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aByteData': ["decode('AAECAwQFBgc=', 'base64')"],
        });
      },
    );

    test(
      'Given a class with a Set with a nested Duration when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesSet(
          aDuration: {const Duration(seconds: 1)},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aDuration': [1000],
        });
      },
    );

    test(
      'Given a class with a Set with a nested Uuid when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesSet(
          // ignore: deprecated_member_use
          aUuid: {UuidValue.nil},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aUuid': ['00000000-0000-0000-0000-000000000000'],
        });
      },
    );

    test(
      'Given a class with a Set with a nested BigInt when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesSet(
          aBigInt: {BigInt.one},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aBigInt': ['1'],
        });
      },
    );

    test(
      'Given a class with a Set with a nested enum serialized by index when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesSet(
          anEnum: {TestEnum.one},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'anEnum': [0],
        });
      },
    );

    test(
      'Given a class with a Set with a nested enum serialized by name when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesSet(
          aStringifiedEnum: {TestEnumStringified.one},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aStringifiedEnum': ['one'],
        });
      },
    );

    test(
      'Given a class with a Set with a nested Map serialized by name when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final type = Types(anInt: 123);
        final object = TypesSet(
          aMap: {
            {'key': type},
          },
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aMap': [
            {
              'key': {'anInt': 123},
            },
          ],
        });
      },
    );

    test(
      'Given a class with a Set with a nested List serialized by name when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final type = Types(anInt: 123);
        final object = TypesSet(
          aList: {
            [type],
          },
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aList': [
            [
              {'anInt': 123},
            ],
          ],
        });
      },
    );
  });

  group('Map value -', () {
    test(
      'Given a class with a Map with a nested object when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final type = Types(anInt: 123);
        final object = TypesMap(anObjectValue: {'key': type});

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'anObjectValue': {
            'key': {'anInt': 123},
          },
        });
      },
    );

    test(
      'Given a class with a Map with a nested DateTime when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesMap(
          aDateTimeValue: {'key': DateTime.parse('2024-01-01T00:00:00.000Z')},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aDateTimeValue': {'key': '2024-01-01T00:00:00.000Z'},
        });
      },
    );

    test(
      'Given a class with a Map with a nested ByteData when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final intList = Uint8List(8);
        for (var i = 0; i < intList.length; i++) {
          intList[i] = i;
        }

        final object = TypesMap(
          aByteDataValue: {'key': ByteData.view(intList.buffer)},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aByteDataValue': {'key': "decode('AAECAwQFBgc=', 'base64')"},
        });
      },
    );

    test(
      'Given a class with a Map with a nested Duration when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesMap(
          aDurationValue: {'key': const Duration(seconds: 1)},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aDurationValue': {'key': 1000},
        });
      },
    );

    test(
      'Given a class with a Map with a nested Uuid when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesMap(
          // ignore: deprecated_member_use
          aUuidValue: {'key': UuidValue.nil},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aUuidValue': {'key': '00000000-0000-0000-0000-000000000000'},
        });
      },
    );

    test(
      'Given a class with a Map with a nested Uri when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesMap(
          aUriValue: {'key': Uri.parse('https://serverpod.dev')},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aUriValue': {'key': 'https://serverpod.dev'},
        });
      },
    );

    test(
      'Given a class with a Map with a nested BigInt when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesMap(
          aBigIntValue: {'key': BigInt.one},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aBigIntValue': {'key': '1'},
        });
      },
    );

    test(
      'Given a class with a Map with a nested enum serialized by index when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesMap(
          anEnumValue: {'key': TestEnum.one},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'anEnumValue': {'key': 0},
        });
      },
    );

    test(
      'Given a class with a Map with a nested enum serialized by name when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesMap(
          aStringifiedEnumValue: {'key': TestEnumStringified.one},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aStringifiedEnumValue': {'key': 'one'},
        });
      },
    );

    test(
      'Given a class with a Map with a nested Map serialized by name when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final type = Types(anInt: 1);
        final object = TypesMap(
          aMapValue: {
            'key': {'key': type},
          },
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aMapValue': {
            'key': {
              'key': {'anInt': 1},
            },
          },
        });
      },
    );

    test(
      'Given a class with a Map with a nested List serialized by name when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final type = Types(anInt: 1);
        final object = TypesMap(
          aListValue: {
            'key': [type],
          },
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aListValue': {
            'key': [
              {'anInt': 1},
            ],
          },
        });
      },
    );
  });

  group('Map key -', () {
    test(
      'Given a class with a Map with a nested object when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final type = Types(anInt: 123);
        final object = TypesMap(anObjectKey: {type: 'value'});

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'anObjectKey': [
            {
              'k': {'anInt': 123},
              'v': 'value',
            },
          ],
        });
      },
    );

    test(
      'Given a class with a Map with a nested DateTime when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesMap(
          aDateTimeKey: {DateTime.parse('2024-01-01T00:00:00.000Z'): 'value'},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aDateTimeKey': [
            {'k': '2024-01-01T00:00:00.000Z', 'v': 'value'},
          ],
        });
      },
    );

    test(
      'Given a class with a Map with a nested ByteData when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final intList = Uint8List(8);
        for (var i = 0; i < intList.length; i++) {
          intList[i] = i;
        }

        final object = TypesMap(
          aByteDataKey: {ByteData.view(intList.buffer): 'value'},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aByteDataKey': [
            {'k': "decode('AAECAwQFBgc=', 'base64')", 'v': 'value'},
          ],
        });
      },
    );

    test(
      'Given a class with a Map with a nested Duration when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesMap(
          aDurationKey: {const Duration(seconds: 1): 'value'},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aDurationKey': [
            {'k': 1000, 'v': 'value'},
          ],
        });
      },
    );

    test(
      'Given a class with a Map with a nested Uuid when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesMap(
          // ignore: deprecated_member_use
          aUuidKey: {UuidValue.nil: 'value'},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aUuidKey': [
            {'k': '00000000-0000-0000-0000-000000000000', 'v': 'value'},
          ],
        });
      },
    );

    test(
      'Given a class with a Map with a nested Uri when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesMap(
          aUriKey: {Uri.parse('https://serverpod.dev'): 'value'},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aUriKey': [
            {'k': 'https://serverpod.dev', 'v': 'value'},
          ],
        });
      },
    );

    test(
      'Given a class with a Map with a nested BigInt when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesMap(
          aBigIntKey: {BigInt.one: 'value'},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aBigIntKey': [
            {'k': '1', 'v': 'value'},
          ],
        });
      },
    );

    test(
      'Given a class with a Map with a nested enum serialized by index when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesMap(
          anEnumKey: {TestEnum.one: 'value'},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'anEnumKey': [
            {'k': 0, 'v': 'value'},
          ],
        });
      },
    );

    test(
      'Given a class with a Map with a nested enum serialized by name when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final object = TypesMap(
          aStringifiedEnumKey: {TestEnumStringified.one: 'value'},
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aStringifiedEnumKey': [
            {'k': 'one', 'v': 'value'},
          ],
        });
      },
    );

    test(
      'Given a class with a Map with a nested Map serialized by name when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final type = Types(anInt: 1);
        final object = TypesMap(
          aMapKey: {
            {type: 'value'}: 'value',
          },
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aMapKey': [
            {
              'k': [
                {
                  'k': {'anInt': 1},
                  'v': 'value',
                },
              ],
              'v': 'value',
            },
          ],
        });
      },
    );

    test(
      'Given a class with a Map with a nested List serialized by name when calling toJsonForProtocol the entire nested structure is converted.',
      () {
        final type = Types(anInt: 1);
        final object = TypesMap(
          aListKey: {
            [type]: 'value',
          },
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'aListKey': [
            {
              'k': [
                {'anInt': 1},
              ],
              'v': 'value',
            },
          ],
        });
      },
    );
  });

  group('Given an object with server only field, ', () {
    test('then the serialized json should not contain server-only field.', () {
      final object = ScopeServerOnlyField(
        serverOnlyScope: Types(anInt: 2),
      );

      final jsonMap = object.toJsonForProtocol();

      expect(jsonMap, {});
    });

    test(
      'then the serialized "nested" json should not contain server-only field',
      () {
        final object = ScopeServerOnlyField(
          nested: ScopeServerOnlyField(
            allScope: Types(anInt: 1),
            serverOnlyScope: Types(anInt: 2),
          ),
        );

        final jsonMap = object.toJsonForProtocol();

        expect(jsonMap, {
          'nested': {
            'allScope': {'anInt': 1},
          },
        });
      },
    );
  });

  test('Given an object from a server only class with changed id type '
      'when calling toJsonForProtocol '
      'then the serialized json should be an empty map.', () {
    final object = ServerOnlyChangedIdFieldClass(
      id: const Uuid().v4obj(),
    );

    final jsonMap = object.toJsonForProtocol();

    expect(jsonMap, {});
  });

  test(
    'Given an object from a server only class that inherits from a non server only class '
    'when calling toJsonForProtocol '
    'then the serialized json should be an empty map.',
    () {
      final object = ServerOnlyChildClass(
        parentField: 'parentField',
        childField: 'childField',
      );

      final jsonMap = object.toJsonForProtocol();

      expect(jsonMap, {});
    },
  );
}
