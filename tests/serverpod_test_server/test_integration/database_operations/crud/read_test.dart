import 'dart:typed_data';

import 'package:serverpod/database.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid_value.dart';

void main() async {
  final session = await IntegrationTestServer().session();

  tearDown(() async {
    await UniqueData.db.deleteWhere(session, where: (_) => Constant.bool(true));
    await SimpleData.db.deleteWhere(session, where: (_) => Constant.bool(true));
    await Types.db.deleteWhere(session, where: (_) => Constant.bool(true));
    await ModelWithRequiredField.db.deleteWhere(
      session,
      where: (_) => Constant.bool(true),
    );
  });

  test(
    'Given a list of entries when finding the first row by ordering and offsetting the query then the correct row is returned.',
    () async {
      final data = <UniqueData>[
        UniqueData(number: 1, email: 'info@serverpod.dev'),
        UniqueData(number: 2, email: 'dev@serverpod.dev'),
        UniqueData(number: 3, email: 'career@serverpod.dev'),
      ];

      await UniqueData.db.insert(session, data);

      final dev = await UniqueData.db.findFirstRow(
        session,
        orderBy: (final t) => t.number,
        orderDescending: true,
        offset: 1,
      );

      expect(dev?.email, 'dev@serverpod.dev');
    },
  );

  group('Given an empty database', () {
    test(
      'when trying to find an object by id then null is returned.',
      () async {
        final retrieved = await SimpleData.db.findById(
          session,
          1,
        );

        expect(retrieved, isNull);
      },
    );

    test('when trying to find a row then null is returned.', () async {
      final retrieved = await SimpleData.db.findFirstRow(
        session,
        where: (final t) => t.num.equals(1),
      );

      expect(retrieved, isNull);
    });

    test('when trying to find all then an empty list is returned.', () async {
      final retrieved = await SimpleData.db.find(
        session,
        orderBy: (final t) => t.id,
        limit: 10,
        offset: 0,
      );

      expect(retrieved, []);
    });
  });

  test(
    'Given an object that is inserted when retrieving it by id then the same object is returned.',
    () async {
      final simpleData = SimpleData(num: 1);
      final inserted = await SimpleData.db.insertRow(
        session,
        simpleData,
      );

      final retrieved = await SimpleData.db.findById(
        session,
        inserted.id!,
      );

      expect(retrieved, isNotNull);
      expect(inserted.id, retrieved!.id);
      expect(inserted.num, retrieved.num);
    },
  );

  test(
    'Given two inserted objects when finding by row then the filtered row is returned',
    () async {
      final simpleData1 = SimpleData(num: 1);
      final simpleData2 = SimpleData(num: 2);
      await SimpleData.db.insertRow(session, simpleData1);
      final expected = await SimpleData.db.insertRow(session, simpleData2);

      final retrieved = await SimpleData.db.findFirstRow(
        session,
        where: (final t) => t.num.equals(2),
      );

      expect(retrieved, isNotNull);
      expect(retrieved?.id, expected.id);
    },
  );

  test(
    'Given two inserted objects when retrieving all then a list with the two objects is returned.',
    () async {
      final simpleData1 = SimpleData(num: 1);
      final simpleData2 = SimpleData(num: 2);
      final inserted1 = await SimpleData.db.insertRow(session, simpleData1);
      final inserted2 = await SimpleData.db.insertRow(session, simpleData2);

      final retrieved = await SimpleData.db.find(
        session,
        orderBy: (final t) => t.id,
        limit: 10,
        offset: 0,
      );

      expect(retrieved, hasLength(2));
      expect(retrieved.first.id, inserted1.id);
      expect(retrieved.last.id, inserted2.id);
    },
  );

  test(
    'Given an inserted empty model when retrieving it then the model is returned.',
    () async {
      final emptyModel = EmptyModelWithTable();
      final inserted = await EmptyModelWithTable.db.insertRow(
        session,
        emptyModel,
      );

      final retrieved = await EmptyModelWithTable.db.findById(
        session,
        inserted.id!,
      );

      expect(retrieved, isNotNull);
      expect(inserted.id, retrieved!.id);
    },
  );

  test(
    "Given an object with a `bool` field, when it's stored in the database, then it can be read out again",
    () async {
      final object = Types(aBool: true);
      final inserted = await Types.db.insertRow(
        session,
        object,
      );

      final retrieved = await Types.db.findById(
        session,
        inserted.id!,
      );

      expect(retrieved!.aBool, true);
    },
  );

  test(
    "Given an object with an `int` field, when it's stored in the database, then it can be read out again",
    () async {
      final object = Types(
        anInt: 99,
      );
      final inserted = await Types.db.insertRow(
        session,
        object,
      );

      final retrieved = await Types.db.findById(
        session,
        inserted.id!,
      );

      expect(retrieved!.anInt, 99);
    },
  );

  test(
    "Given an object with a `double` field, when it's stored in the database, then it can be read out again",
    () async {
      final object = Types(
        aDouble: 1.23,
      );
      final inserted = await Types.db.insertRow(
        session,
        object,
      );

      final retrieved = await Types.db.findById(
        session,
        inserted.id!,
      );

      expect(retrieved!.aDouble, 1.23);
    },
  );

  test(
    "Given an object with a `DateTime` field, when it's stored in the database, then it can be read out again",
    () async {
      final object = Types(
        aDateTime: DateTime.utc(2024, 12, 24, 23, 30),
      );
      final inserted = await Types.db.insertRow(
        session,
        object,
      );

      final retrieved = await Types.db.findById(
        session,
        inserted.id!,
      );

      expect(retrieved!.aDateTime, DateTime.utc(2024, 12, 24, 23, 30));
    },
  );

  test(
    "Given an object with a `String` field, when it's stored in the database, then it can be read out again",
    () async {
      final object = Types(aString: 'Lorem ipsum');
      final inserted = await Types.db.insertRow(
        session,
        object,
      );

      final retrieved = await Types.db.findById(
        session,
        inserted.id!,
      );

      expect(retrieved!.aString, 'Lorem ipsum');
    },
  );

  test(
    "Given an object with a `ByteData` field, when it's stored in the database, then it can be read out again",
    () async {
      final object = Types(
        aByteData: ByteData.view(Uint8List.fromList([1, 2, 3]).buffer),
      );

      final inserted = await Types.db.insertRow(
        session,
        object,
      );

      final retrieved = await Types.db.findById(
        session,
        inserted.id!,
      );

      expect(
        Uint8List.view(
          retrieved!.aByteData!.buffer,
          retrieved.aByteData!.offsetInBytes,
          retrieved.aByteData!.lengthInBytes,
        ).toList(),
        [1, 2, 3],
      );
    },
  );

  test(
    "Given an object with a `Duration` field, when it's stored in the database, then it can be read out again",
    () async {
      final object = Types(
        aDuration: const Duration(hours: 1, minutes: 2, seconds: 3),
      );
      final inserted = await Types.db.insertRow(
        session,
        object,
      );

      final retrieved = await Types.db.findById(
        session,
        inserted.id!,
      );

      expect(retrieved?.aDuration, const Duration(hours: 1, minutes: 2, seconds: 3));
    },
  );

  test(
    "Given an object with a `UUID` field, when it's stored in the database, then it can be read out again",
    () async {
      final object = Types(
        aUuid: UuidValue.fromString('b1e66000-1cc3-4ead-a4ab-a548e2047d3a'),
      );
      final inserted = await Types.db.insertRow(
        session,
        object,
      );

      final retrieved = await Types.db.findById(
        session,
        inserted.id!,
      );

      expect(
        retrieved?.aUuid,
        UuidValue.fromString('b1e66000-1cc3-4ead-a4ab-a548e2047d3a'),
      );
    },
  );

  test(
    "Given an object with a `Uri` field, when it's stored in the database, then it can be read out again",
    () async {
      final uri = Uri.parse('https://serverpod.dev');

      final object = Types(
        aUri: uri,
      );
      final inserted = await Types.db.insertRow(
        session,
        object,
      );

      final retrieved = await Types.db.findById(
        session,
        inserted.id!,
      );

      expect(
        retrieved?.aUri,
        uri,
      );
    },
  );

  test(
    "Given an object with a `BigInt` field, when it's stored in the database, then it can be read out again",
    () async {
      final object = Types(
        aBigInt: BigInt.two,
      );
      final inserted = await Types.db.insertRow(
        session,
        object,
      );

      final retrieved = await Types.db.findById(
        session,
        inserted.id!,
      );

      expect(
        retrieved?.aBigInt,
        BigInt.two,
      );
    },
  );

  test(
    "Given an object with a Record field, when it's stored in the database, then it can be read out again",
    () async {
      final object = Types(
        aRecord: ('hello', optionalUri: Uri.parse('https://serverpod.dev')),
      );
      final inserted = await Types.db.insertRow(
        session,
        object,
      );

      final retrieved = await Types.db.findById(
        session,
        inserted.id!,
      );

      expect(
        retrieved?.aRecord,
        ('hello', optionalUri: Uri.parse('https://serverpod.dev')),
      );
    },
  );

  test(
    "Given an object with an `enum` field, when it's stored in the database, then it can be read out again",
    () async {
      final object = Types(
        anEnum: TestEnum.two,
      );
      final inserted = await Types.db.insertRow(
        session,
        object,
      );

      final retrieved = await Types.db.findById(
        session,
        inserted.id!,
      );

      expect(
        retrieved?.anEnum,
        TestEnum.two,
      );
    },
  );

  test(
    "Given an object with a stringified `enum` field, when it's stored in the database, then it can be read out again",
    () async {
      final object = Types(
        aStringifiedEnum: TestEnumStringified.three,
      );
      final inserted = await Types.db.insertRow(
        session,
        object,
      );

      final retrieved = await Types.db.findById(
        session,
        inserted.id!,
      );

      expect(retrieved?.aStringifiedEnum, TestEnumStringified.three);
    },
  );

  test(
    'Given model with required field when inserting then it is created',
    () async {
      final model = ModelWithRequiredField(name: 'John', email: null);
      final inserted = await ModelWithRequiredField.db.insertRow(session, model);

      final retrieved = await ModelWithRequiredField.db.findById(
        session,
        inserted.id!,
      );

      expect(retrieved?.name, 'John');
      expect(retrieved?.email, null);
    },
  );
}
