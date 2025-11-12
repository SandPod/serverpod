import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:test/test.dart';

void main() {
  test(
    'Given a class with only nullable fields without any of them defined when calling toJson then an empty map is returned.',
    () {
      final types = Types();

      final jsonMap = types.toJson();

      expect(jsonMap, {});
    },
  );

  test(
    'Given a class with only nullable fields with an int defined when calling toJson then the key and value is set.',
    () {
      final types = Types(anInt: 1);

      final jsonMap = types.toJson();

      expect(jsonMap, {'anInt': 1});
    },
  );

  test(
    'Given a class with only nullable fields with a double defined when calling toJson then the key and value is set.',
    () {
      final types = Types(aDouble: 1.0);

      final jsonMap = types.toJson();

      expect(jsonMap, {'aDouble': 1.0});
    },
  );

  test(
    'Given a class with only nullable fields with a bool defined when calling toJson then the key and value is set.',
    () {
      final types = Types(aBool: true);

      final jsonMap = types.toJson();

      expect(jsonMap, {'aBool': true});
    },
  );

  test(
    'Given a class with only nullable fields with a String defined when calling toJson then the key and value is set.',
    () {
      final types = Types(aString: 'Hello world!');

      final jsonMap = types.toJson();

      expect(jsonMap, {'aString': 'Hello world!'});
    },
  );

  test(
    'Given a class with only nullable fields with an enum serialized by index defined when calling toJson then the key and value is set.',
    () {
      final types = Types(anEnum: TestEnum.one);

      final jsonMap = types.toJson();

      expect(jsonMap, {'anEnum': 0});
    },
  );

  test(
    'Given a class with only nullable fields with an enum serialized by name defined when calling toJson then the key and value is set.',
    () {
      final types = Types(aStringifiedEnum: TestEnumStringified.one);

      final jsonMap = types.toJson();

      expect(jsonMap, {'aStringifiedEnum': 'one'});
    },
  );

  test(
    'Given a class with only nullable fields with a Uuid defined when calling toJson then the key and value is set.',
    () {
      // ignore: deprecated_member_use
      final types = Types(aUuid: UuidValue.nil);

      final jsonMap = types.toJson();

      expect(jsonMap, {'aUuid': '00000000-0000-0000-0000-000000000000'});
    },
  );

  test(
    'Given a class with only nullable fields with a Uuid defined when calling toJson then the key and value is set.',
    () {
      final types = Types(aUri: Uri.parse('https://serverpod.dev/foo#test'));

      final jsonMap = types.toJson();

      expect(jsonMap, {'aUri': 'https://serverpod.dev/foo#test'});
    },
  );

  test(
    'Given a class with only nullable fields with a Duration defined when calling toJson then the key and value is set.',
    () {
      final types = Types(aDuration: const Duration(seconds: 1));

      final jsonMap = types.toJson();

      expect(jsonMap, {'aDuration': 1000});
    },
  );

  test(
    'Given a class with only nullable fields with a DateTime defined when calling toJson then the key and value is set.',
    () {
      final types = Types(aDateTime: DateTime.parse('2024-01-01T00:00:00.000Z'));

      final jsonMap = types.toJson();

      expect(jsonMap, {'aDateTime': '2024-01-01T00:00:00.000Z'});
    },
  );

  test(
    'Given a class with only nullable fields with a ByteData defined when calling toJson then the key and value is set.',
    () {
      final intList = Uint8List(8);
      for (var i = 0; i < intList.length; i++) {
        intList[i] = i;
      }

      final types = Types(aByteData: ByteData.view(intList.buffer));

      final jsonMap = types.toJson();

      expect(jsonMap, {'aByteData': "decode('AAECAwQFBgc=', 'base64')"});
    },
  );

  test(
    'Given a class with a relation to an object when calling toJson the entire nested structure is converted.',
    () {
      final next = Post(content: 'next');
      final post = Post(content: 'post', next: next);

      final jsonMap = post.toJson();

      expect(jsonMap, {
        'content': 'post',
        'next': {'content': 'next'},
      });
    },
  );

  test(
    'Given a class with a nested object when calling toJson the entire nested structure is converted.',
    () {
      final simpleData = SimpleData(num: 123);
      final object = SimpleDataObject(object: simpleData);

      final jsonMap = object.toJson();

      expect(jsonMap, {
        'object': {'num': 123},
      });
    },
  );

  ///----

  test(
    'Given a class with a List with a nested object when calling toJson the entire nested structure is converted.',
    () {
      final type = Types(anInt: 123);
      final object = TypesList(anObject: [type]);

      final jsonMap = object.toJson();

      expect(jsonMap, {
        'anObject': [
          {'anInt': 123},
        ],
      });
    },
  );

  test(
    'Given a class with a List with a nested DateTime when calling toJson the entire nested structure is converted.',
    () {
      final object = TypesList(
        aDateTime: [DateTime.parse('2024-01-01T00:00:00.000Z')],
      );

      final jsonMap = object.toJson();

      expect(jsonMap, {
        'aDateTime': ['2024-01-01T00:00:00.000Z'],
      });
    },
  );

  test(
    'Given a class with a List with a nested ByteData when calling toJson the entire nested structure is converted.',
    () {
      final intList = Uint8List(8);
      for (var i = 0; i < intList.length; i++) {
        intList[i] = i;
      }

      final object = TypesList(
        aByteData: [ByteData.view(intList.buffer)],
      );

      final jsonMap = object.toJson();

      expect(jsonMap, {
        'aByteData': ["decode('AAECAwQFBgc=', 'base64')"],
      });
    },
  );

  test(
    'Given a class with a List with a nested Duration when calling toJson the entire nested structure is converted.',
    () {
      final object = TypesList(
        aDuration: [const Duration(seconds: 1)],
      );

      final jsonMap = object.toJson();

      expect(jsonMap, {
        'aDuration': [1000],
      });
    },
  );

  test(
    'Given a class with a List with a nested Uuid when calling toJson the entire nested structure is converted.',
    () {
      final object = TypesList(
        // ignore: deprecated_member_use
        aUuid: [UuidValue.nil],
      );

      final jsonMap = object.toJson();

      expect(jsonMap, {
        'aUuid': ['00000000-0000-0000-0000-000000000000'],
      });
    },
  );

  test(
    'Given a class with a List<BigInt> when calling toJson the entire nested structure is converted.',
    () {
      final object = TypesList(
        aBigInt: [
          BigInt.parse('-12345678901234567890'),
          BigInt.parse('18446744073709551615'),
        ],
      );

      final jsonMap = object.toJson();

      expect(jsonMap, {
        'aBigInt': [
          '-12345678901234567890',
          '18446744073709551615',
        ],
      });
    },
  );

  test(
    'Given a class with a List with a nested enum serialized by index when calling toJson the entire nested structure is converted.',
    () {
      final object = TypesList(
        anEnum: [TestEnum.one],
      );

      final jsonMap = object.toJson();

      expect(jsonMap, {
        'anEnum': [0],
      });
    },
  );

  test(
    'Given a class with a List with a nested enum serialized by name when calling toJson the entire nested structure is converted.',
    () {
      final object = TypesList(
        aStringifiedEnum: [TestEnumStringified.one],
      );

      final jsonMap = object.toJson();

      expect(jsonMap, {
        'aStringifiedEnum': ['one'],
      });
    },
  );

  test(
    'Given a class with a List with a nested Map serialized by name when calling toJson the entire nested structure is converted.',
    () {
      final type = Types(anInt: 123);
      final object = TypesList(
        aMap: [
          {'key': type},
        ],
      );

      final jsonMap = object.toJson();

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
    'Given a class with a List with a nested List serialized by name when calling toJson the entire nested structure is converted.',
    () {
      final type = Types(anInt: 123);
      final object = TypesList(
        aList: [
          [type],
        ],
      );

      final jsonMap = object.toJson();

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
      'Given a class with a Set with a nested object when calling toJson the entire nested structure is converted.',
      () {
        final type = Types(anInt: 123);
        final object = TypesSet(anObject: {type});

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'anObject': [
            {'anInt': 123},
          ],
        });
      },
    );

    test(
      'Given a class with a Set with a nested DateTime when calling toJson the entire nested structure is converted.',
      () {
        final object = TypesSet(
          aDateTime: {DateTime.parse('2024-01-01T00:00:00.000Z')},
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'aDateTime': ['2024-01-01T00:00:00.000Z'],
        });
      },
    );

    test(
      'Given a class with a Set with a nested ByteData when calling toJson the entire nested structure is converted.',
      () {
        final intList = Uint8List(8);
        for (var i = 0; i < intList.length; i++) {
          intList[i] = i;
        }

        final object = TypesSet(
          aByteData: {ByteData.view(intList.buffer)},
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'aByteData': ["decode('AAECAwQFBgc=', 'base64')"],
        });
      },
    );

    test(
      'Given a class with a Set with a nested Duration when calling toJson the entire nested structure is converted.',
      () {
        final object = TypesSet(
          aDuration: {const Duration(seconds: 1)},
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'aDuration': [1000],
        });
      },
    );

    test(
      'Given a class with a Set with a nested Uuid when calling toJson the entire nested structure is converted.',
      () {
        final object = TypesSet(
          // ignore: deprecated_member_use
          aUuid: {UuidValue.nil},
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'aUuid': ['00000000-0000-0000-0000-000000000000'],
        });
      },
    );

    test(
      'Given a class with a Set<BigInt> when calling toJson the entire nested structure is converted.',
      () {
        final object = TypesSet(
          aBigInt: {
            BigInt.parse('-12345678901234567890'),
            BigInt.parse('18446744073709551615'),
          },
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'aBigInt': [
            '-12345678901234567890',
            '18446744073709551615',
          ],
        });
      },
    );

    test(
      'Given a class with a Set with a nested enum serialized by index when calling toJson the entire nested structure is converted.',
      () {
        final object = TypesSet(
          anEnum: {TestEnum.one},
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'anEnum': [0],
        });
      },
    );

    test(
      'Given a class with a Set with a nested enum serialized by name when calling toJson the entire nested structure is converted.',
      () {
        final object = TypesSet(
          aStringifiedEnum: {TestEnumStringified.one},
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'aStringifiedEnum': ['one'],
        });
      },
    );

    test(
      'Given a class with a Set with a nested Map serialized by name when calling toJson the entire nested structure is converted.',
      () {
        final type = Types(anInt: 123);
        final object = TypesSet(
          aMap: {
            {'key': type},
          },
        );

        final jsonMap = object.toJson();

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
      'Given a class with a Set with a nested List serialized by name when calling toJson the entire nested structure is converted.',
      () {
        final type = Types(anInt: 123);
        final object = TypesSet(
          aList: {
            [type],
          },
        );

        final jsonMap = object.toJson();

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
      'Given a class with a Map with a nested object when calling toJson the entire nested structure is converted.',
      () {
        final type = Types(anInt: 123);
        final object = TypesMap(anObjectValue: {'key': type});

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'anObjectValue': {
            'key': {'anInt': 123},
          },
        });
      },
    );

    test(
      'Given a class with a Map with a nested DateTime when calling toJson the entire nested structure is converted.',
      () {
        final object = TypesMap(
          aDateTimeValue: {'key': DateTime.parse('2024-01-01T00:00:00.000Z')},
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'aDateTimeValue': {'key': '2024-01-01T00:00:00.000Z'},
        });
      },
    );

    test(
      'Given a class with a Map with a nested ByteData when calling toJson the entire nested structure is converted.',
      () {
        final intList = Uint8List(8);
        for (var i = 0; i < intList.length; i++) {
          intList[i] = i;
        }

        final object = TypesMap(
          aByteDataValue: {'key': ByteData.view(intList.buffer)},
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'aByteDataValue': {'key': "decode('AAECAwQFBgc=', 'base64')"},
        });
      },
    );

    test(
      'Given a class with a Map with a nested Duration when calling toJson the entire nested structure is converted.',
      () {
        final object = TypesMap(
          aDurationValue: {'key': const Duration(seconds: 1)},
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'aDurationValue': {'key': 1000},
        });
      },
    );

    test(
      'Given a class with a Map with a nested Uuid when calling toJson the entire nested structure is converted.',
      () {
        final object = TypesMap(
          // ignore: deprecated_member_use
          aUuidValue: {'key': UuidValue.nil},
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'aUuidValue': {'key': '00000000-0000-0000-0000-000000000000'},
        });
      },
    );

    test(
      'Given a class with a Map with a nested enum serialized by index when calling toJson the entire nested structure is converted.',
      () {
        final object = TypesMap(
          anEnumValue: {'key': TestEnum.one},
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'anEnumValue': {'key': 0},
        });
      },
    );

    test(
      'Given a class with a Map with a nested enum serialized by name when calling toJson the entire nested structure is converted.',
      () {
        final object = TypesMap(
          aStringifiedEnumValue: {'key': TestEnumStringified.one},
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'aStringifiedEnumValue': {'key': 'one'},
        });
      },
    );

    test(
      'Given a class with a Map with a nested Map serialized by name when calling toJson the entire nested structure is converted.',
      () {
        final type = Types(anInt: 1);
        final object = TypesMap(
          aMapValue: {
            'key': {'key': type},
          },
        );

        final jsonMap = object.toJson();

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
      'Given a class with a Map with a nested List serialized by name when calling toJson the entire nested structure is converted.',
      () {
        final type = Types(anInt: 1);
        final object = TypesMap(
          aListValue: {
            'key': [type],
          },
        );

        final jsonMap = object.toJson();

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
      'Given a class with a Map with a nested object when calling toJson the entire nested structure is converted.',
      () {
        final type = Types(anInt: 123);
        final object = TypesMap(anObjectKey: {type: 'value'});

        final jsonMap = object.toJson();

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
      'Given a class with a Map with a nested DateTime when calling toJson the entire nested structure is converted.',
      () {
        final object = TypesMap(
          aDateTimeKey: {DateTime.parse('2024-01-01T00:00:00.000Z'): 'value'},
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'aDateTimeKey': [
            {'k': '2024-01-01T00:00:00.000Z', 'v': 'value'},
          ],
        });
      },
    );

    test(
      'Given a class with a Map with a nested ByteData when calling toJson the entire nested structure is converted.',
      () {
        final intList = Uint8List(8);
        for (var i = 0; i < intList.length; i++) {
          intList[i] = i;
        }

        final object = TypesMap(
          aByteDataKey: {ByteData.view(intList.buffer): 'value'},
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'aByteDataKey': [
            {'k': "decode('AAECAwQFBgc=', 'base64')", 'v': 'value'},
          ],
        });
      },
    );

    test(
      'Given a class with a Map with a nested Duration when calling toJson the entire nested structure is converted.',
      () {
        final object = TypesMap(
          aDurationKey: {const Duration(seconds: 1): 'value'},
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'aDurationKey': [
            {'k': 1000, 'v': 'value'},
          ],
        });
      },
    );

    test(
      'Given a class with a Map with a nested Uuid when calling toJson the entire nested structure is converted.',
      () {
        final object = TypesMap(
          // ignore: deprecated_member_use
          aUuidKey: {UuidValue.nil: 'value'},
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'aUuidKey': [
            {'k': '00000000-0000-0000-0000-000000000000', 'v': 'value'},
          ],
        });
      },
    );

    test(
      'Given a class with a Map with a nested enum serialized by index when calling toJson the entire nested structure is converted.',
      () {
        final object = TypesMap(
          anEnumKey: {TestEnum.one: 'value'},
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'anEnumKey': [
            {'k': 0, 'v': 'value'},
          ],
        });
      },
    );

    test(
      'Given a class with a Map with a nested enum serialized by name when calling toJson the entire nested structure is converted.',
      () {
        final object = TypesMap(
          aStringifiedEnumKey: {TestEnumStringified.one: 'value'},
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'aStringifiedEnumKey': [
            {'k': 'one', 'v': 'value'},
          ],
        });
      },
    );

    test(
      'Given a class with a Map with a nested Map serialized by name when calling toJson the entire nested structure is converted.',
      () {
        final type = Types(anInt: 1);
        final object = TypesMap(
          aMapKey: {
            {type: 'value'}: 'value',
          },
        );

        final jsonMap = object.toJson();

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
      'Given a class with a Map with a nested List serialized by name when calling toJson the entire nested structure is converted.',
      () {
        final type = Types(anInt: 1);
        final object = TypesMap(
          aListKey: {
            [type]: 'value',
          },
        );

        final jsonMap = object.toJson();

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
    test('then the serialized json should contain server-only field.', () {
      final object = ScopeServerOnlyField(
        serverOnlyScope: Types(anInt: 2),
      );

      final jsonMap = object.toJson();

      expect(jsonMap, {
        'serverOnlyScope': {'anInt': 2},
      });
    });

    test(
      'then the serialized "nested" json should contain server-only field',
      () {
        final object = ScopeServerOnlyField(
          nested: ScopeServerOnlyField(
            allScope: Types(anInt: 1),
            serverOnlyScope: Types(anInt: 2),
          ),
        );

        final jsonMap = object.toJson();

        expect(jsonMap, {
          'nested': {
            'allScope': {'anInt': 1},
            'serverOnlyScope': {'anInt': 2},
          },
        });
      },
    );
  });
}
