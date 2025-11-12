import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  final session = await IntegrationTestServer().session();

  tearDown(() async {
    await UniqueData.db.deleteWhere(session, where: (_) => Constant.bool(true));
  });

  test(
    'Given a list of entries when batch updating only a single column then no other data is updated.',
    () async {
      const expectedFirstEmail = 'info@serverpod.dev';
      const expectedLastEmail = 'dev@serverpod.dev';
      const expectedFirstNumber = 5;
      const expectedLastNumber = 6;

      final data = <UniqueData>[
        UniqueData(number: 1, email: expectedFirstEmail),
        UniqueData(number: 2, email: expectedLastEmail),
      ];

      final inserted = await UniqueData.db.insert(session, data);

      final toUpdate = <UniqueData>[
        UniqueData(
          id: inserted.first.id,
          number: expectedFirstNumber,
          email: 'new@serverpod.dev',
        ),
        UniqueData(
          id: inserted.last.id,
          number: expectedLastNumber,
          email: 'email@serverpod.dev',
        ),
      ];

      final updated = await UniqueData.db.update(
        session,
        toUpdate,
        columns: (final t) => [t.number],
      );

      expect(updated.first.number, expectedFirstNumber);
      expect(updated.last.number, expectedLastNumber);

      expect(updated.first.email, expectedFirstEmail);
      expect(updated.last.email, expectedLastEmail);
    },
  );

  test(
    'Given a list of entries to update where one does not have an id then an error is thrown.',
    () async {
      final data = <UniqueData>[
        UniqueData(number: 1, email: 'info@serverpod.dev'),
        UniqueData(number: 2, email: 'dev@serverpod.dev'),
      ];

      final inserted = await UniqueData.db.insert(session, data);

      final toUpdate = [
        ...inserted,
        UniqueData(number: 3, email: 'extra@serverpod.dev'),
      ];

      expect(
        UniqueData.db.update(
          session,
          toUpdate,
        ),
        throwsA(isA<ArgumentError>()),
      );
    },
  );

  test(
    'Given a list of entries trying to update a column that does not exist then an error is thrown.',
    () async {
      final data = <UniqueData>[
        UniqueData(number: 1, email: 'info@serverpod.dev'),
        UniqueData(number: 2, email: 'dev@serverpod.dev'),
      ];

      final inserted = await UniqueData.db.insert(session, data);

      expect(
        UniqueData.db.update(
          session,
          inserted,
          columns: (_) => [SimpleData.t.num],
        ),
        throwsA(isA<ArgumentError>()),
      );
    },
  );

  test(
    'Given an model when batch updatingRow with a specific column only that column and no other data is updated.',
    () async {
      const expectedEmail = 'info@serverpod.dev';
      const expectedNumber = 5;

      final inserted = await UniqueData.db.insertRow(
        session,
        UniqueData(number: 1, email: expectedEmail),
      );

      final toUpdate = UniqueData(
        id: inserted.id,
        number: expectedNumber,
        email: 'new@serverpod.dev',
      );

      final updated = await UniqueData.db.updateRow(
        session,
        toUpdate,
        columns: (final t) => [t.number],
      );

      expect(updated.number, expectedNumber);

      expect(updated.email, expectedEmail);
    },
  );

  test(
    'Given an model without an id when batch updatingRow then an error is thrown.',
    () async {
      expect(
        UniqueData.db.updateRow(
          session,
          UniqueData(number: 1, email: 'info@serverpod.dev'),
          columns: (final t) => [t.number],
        ),
        throwsA(isA<ArgumentError>()),
      );
    },
  );

  test(
    'Given an model trying to updateRow with a column that does not exist then an error is thrown.',
    () async {
      final inserted = await UniqueData.db.insertRow(
        session,
        UniqueData(number: 1, email: 'info@serverpod.dev'),
      );

      expect(
        UniqueData.db.updateRow(
          session,
          inserted,
          columns: (_) => [SimpleData.t.num],
        ),
        throwsA(isA<ArgumentError>()),
      );
    },
  );

  group('Given a typed entry in the database', () {
    final data = Types(
      anInt: 1,
      aBool: true,
      aDouble: 1.0,
      aString: 'string',
      aDateTime: DateTime.now(),
      aByteData: ByteData.view(Uint8List(8).buffer),
      aDuration: const Duration(milliseconds: 1000),
      aUuid: UuidValue.fromString(const Uuid().v4()),
      aUri: Uri.parse('https://example.com'),
      aBigInt: BigInt.from(123456789),
      aVector: const Vector([1.0, 2.0, 3.0]),
      aHalfVector: const HalfVector([1.0, 2.0, 3.0]),
      aSparseVector: SparseVector([1.0, 0.0, 2.0]),
      aBit: Bit([true, false, true]),
      anEnum: TestEnum.one,
      aStringifiedEnum: TestEnumStringified.one,
      aList: [1, 2, 3],
      aMap: {1: 10, 2: 20},
      aSet: {1, 2, 3},
      aRecord: ('test', optionalUri: Uri.parse('https://serverpod.dev')),
    );

    late Types type;

    setUp(() async {
      type = await Types.db.insertRow(session, data);
    });

    tearDown(() async {
      await Types.db.deleteWhere(session, where: (final t) => Constant.bool(true));
    });

    test(
      'when updating anInt to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          anInt: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.anInt, isNull);
      },
    );

    test(
      'when updating aBool to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          aBool: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aBool, isNull);
      },
    );

    test(
      'when updating aDouble to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          aDouble: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aDouble, isNull);
      },
    );

    test(
      'when updating aString to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          aString: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aString, isNull);
      },
    );

    test(
      'when updating aDateTime to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          aDateTime: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aDateTime, isNull);
      },
    );

    test(
      'when updating aByteData to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          aByteData: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aByteData, isNull);
      },
    );

    test(
      'when updating aDuration to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          aDuration: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aDuration, isNull);
      },
    );

    test(
      'when updating aUuid to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          aUuid: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aUuid, isNull);
      },
    );

    test(
      'when updating aUri to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          aUri: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aUri, isNull);
      },
    );

    test(
      'when updating aBigInt to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          aBigInt: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aBigInt, isNull);
      },
    );

    test(
      'when updating aVector to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          aVector: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aVector, isNull);
      },
    );

    test(
      'when updating aHalfVector to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          aHalfVector: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aHalfVector, isNull);
      },
    );

    test(
      'when updating aSparseVector to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          aSparseVector: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aSparseVector, isNull);
      },
    );

    test(
      'when updating aBit to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          aBit: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aBit, isNull);
      },
    );

    test(
      'when updating anEnum to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          anEnum: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.anEnum, isNull);
      },
    );

    test(
      'when updating aStringifiedEnum to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          aStringifiedEnum: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aStringifiedEnum, isNull);
      },
    );

    test(
      'when updating aList to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          aList: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aList, isNull);
      },
    );

    test(
      'when updating aMap to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          aMap: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aMap, isNull);
      },
    );

    test(
      'when updating aSet to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          aSet: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aSet, isNull);
      },
    );

    test(
      'when updating aRecord to null then the database is updated with null value.',
      () async {
        final value = Types(
          id: type.id,
          aRecord: null,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aRecord, isNull);
      },
    );
  });

  group('Given a typed entry in the database', () {
    final data = Types(
      anInt: null,
      aBool: null,
      aDouble: null,
      aString: null,
      aDateTime: null,
      aByteData: null,
      aDuration: null,
      aUuid: null,
      aUri: null,
      aBigInt: null,
      aVector: null,
      aHalfVector: null,
      aSparseVector: null,
      aBit: null,
      anEnum: null,
      aStringifiedEnum: null,
      aList: null,
      aMap: null,
      aSet: null,
      aRecord: null,
    );

    late Types type;

    setUp(() async {
      type = await Types.db.insertRow(session, data);
    });

    tearDown(() async {
      await Types.db.deleteWhere(session, where: (final t) => Constant.bool(true));
    });

    test(
      'when updating anInt to 1 then the database is updated with value 1.',
      () async {
        final value = Types(
          id: type.id,
          anInt: 1,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.anInt, equals(1));
      },
    );

    test(
      'when updating aBool to true then the database is updated with value true.',
      () async {
        final value = Types(
          id: type.id,
          aBool: true,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aBool, equals(true));
      },
    );

    test(
      'when updating aDouble to 1.0 then the database is updated with value 1.0.',
      () async {
        final value = Types(
          id: type.id,
          aDouble: 1.0,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aDouble, equals(1.0));
      },
    );

    test(
      'when updating aString to "string" then the database is updated with value "string".',
      () async {
        final value = Types(
          id: type.id,
          aString: 'string',
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aString, equals('string'));
      },
    );

    test(
      'when updating aDateTime to a real value then the database is updated with the real value.',
      () async {
        final now = DateTime.now().toUtc();
        final value = Types(
          id: type.id,
          aDateTime: now,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aDateTime, equals(now));
      },
    );

    test(
      'when updating aByteData to a real value then the database is updated with the real value.',
      () async {
        final byteData = ByteData.view(Uint8List(8).buffer);
        final value = Types(
          id: type.id,
          aByteData: byteData,
        );

        final updated = await Types.db.updateRow(session, value);

        final byteDataResult = updated.aByteData;

        expect(
          byteDataResult?.buffer.asUint8List(
            byteDataResult.offsetInBytes,
            byteDataResult.lengthInBytes,
          ),
          equals(byteData.buffer.asUint8List()),
        );
      },
    );

    test(
      'when updating aDuration to a real value then the database is updated with the real value.',
      () async {
        const duration = Duration(milliseconds: 1000);
        final value = Types(
          id: type.id,
          aDuration: duration,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aDuration, equals(duration));
      },
    );

    test(
      'when updating aUuid to a real value then the database is updated with the real value.',
      () async {
        final uuidValue = UuidValue.fromString(const Uuid().v4());
        final value = Types(
          id: type.id,
          aUuid: uuidValue,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aUuid, equals(uuidValue));
      },
    );

    test(
      'when updating aUri to a real value then the database is updated with the real value.',
      () async {
        final uri = Uri.parse('https://example.com');
        final value = Types(
          id: type.id,
          aUri: uri,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aUri, equals(uri));
      },
    );

    test(
      'when updating aBigInt to a real value then the database is updated with the real value.',
      () async {
        final bigInt = BigInt.from(987654321);
        final value = Types(
          id: type.id,
          aBigInt: bigInt,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aBigInt, equals(bigInt));
      },
    );

    test(
      'when updating aVector to a real value then the database is updated with the real value.',
      () async {
        const vector = Vector([4.0, 5.0, 6.0]);
        final value = Types(
          id: type.id,
          aVector: vector,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aVector, equals(vector));
      },
    );

    test(
      'when updating aHalfVector to a real value then the database is updated with the real value.',
      () async {
        const halfVector = HalfVector([4.0, 5.0, 6.0]);
        final value = Types(
          id: type.id,
          aHalfVector: halfVector,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aHalfVector, equals(halfVector));
      },
    );

    test(
      'when updating aSparseVector to a real value then the database is updated with the real value.',
      () async {
        final sparseVector = SparseVector([0.0, 4.0, 5.0]);
        final value = Types(
          id: type.id,
          aSparseVector: sparseVector,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aSparseVector, equals(sparseVector));
      },
    );

    test(
      'when updating aBit to a real value then the database is updated with the real value.',
      () async {
        final value = Types(
          id: type.id,
          aBit: Bit([true, false, true]),
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aBit, equals(Bit([true, false, true])));
      },
    );

    test(
      'when updating anEnum to TestEnum.one then the database is updated with value TestEnum.one.',
      () async {
        final value = Types(
          id: type.id,
          anEnum: TestEnum.one,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.anEnum, equals(TestEnum.one));
      },
    );

    test(
      'when updating aStringifiedEnum to TestEnumStringified.two then the database is updated with value TestEnumStringified.two.',
      () async {
        final value = Types(
          id: type.id,
          aStringifiedEnum: TestEnumStringified.two,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aStringifiedEnum, equals(TestEnumStringified.two));
      },
    );

    test(
      'when updating aList to a real value then the database is updated with the real value.',
      () async {
        final list = [4, 5, 6];
        final value = Types(
          id: type.id,
          aList: list,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aList, equals(list));
      },
    );

    test(
      'when updating aMap to a real value then the database is updated with the real value.',
      () async {
        final map = {3: 30, 4: 40};
        final value = Types(
          id: type.id,
          aMap: map,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aMap, equals(map));
      },
    );

    test(
      'when updating aSet to a real value then the database is updated with the real value.',
      () async {
        final set = {4, 5, 6};
        final value = Types(
          id: type.id,
          aSet: set,
        );

        final updated = await Types.db.updateRow(session, value);

        expect(updated.aSet, equals(set));
      },
    );

    test(
      'when updating aRecord to a new value then the database is updated with the value.',
      () async {
        final value = Types(
          id: type.id,
          aRecord: ('test', optionalUri: Uri.parse('https://serverpod.dev')),
        );

        final updated = await Types.db.updateRow(session, value);

        expect(
          updated.aRecord,
          equals(('test', optionalUri: Uri.parse('https://serverpod.dev'))),
        );
      },
    );
  });

  group('Given a typed entry in the database', () {
    final data = <Types>[
      Types(
        anInt: 1,
        aBool: true,
        aDouble: 1.0,
        aString: 'string',
        aDateTime: DateTime.now(),
        aByteData: ByteData.view(Uint8List(8).buffer),
        aDuration: const Duration(milliseconds: 1000),
        aUuid: UuidValue.fromString(const Uuid().v4()),
        aUri: Uri.parse('https://example.com'),
        aBigInt: BigInt.from(123456789),
        aVector: const Vector([1.0, 2.0, 3.0]),
        aHalfVector: const HalfVector([1.0, 2.0, 3.0]),
        aSparseVector: SparseVector([0.0, 4.0, 5.0]),
        aBit: Bit([true, false, true]),
        anEnum: TestEnum.one,
        aStringifiedEnum: TestEnumStringified.one,
        aList: [1, 2, 3],
        aMap: {1: 10, 2: 20},
        aSet: {1, 2, 3},
        aRecord: ('test', optionalUri: Uri.parse('https://serverpod.dev')),
      ),
    ];

    late Types type;

    setUp(() async {
      final inserted = await Types.db.insert(session, data);
      type = inserted.first;
    });

    tearDown(() async {
      await Types.db.deleteWhere(session, where: (final t) => Constant.bool(true));
    });

    test(
      'when batch updating anInt to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            anInt: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.anInt, isNull);
      },
    );

    test(
      'when batch updating aBool to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aBool: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aBool, isNull);
      },
    );

    test(
      'when batch updating aDouble to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aDouble: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aDouble, isNull);
      },
    );

    test(
      'when batch updating aString to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aString: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aString, isNull);
      },
    );

    test(
      'when batch updating aDateTime to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aDateTime: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aDateTime, isNull);
      },
    );

    test(
      'when batch updating aByteData to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aByteData: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aByteData, isNull);
      },
    );

    test(
      'when batch updating aDuration to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aDuration: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aDuration, isNull);
      },
    );

    test(
      'when batch updating aUuid to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aUuid: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aUuid, isNull);
      },
    );

    test(
      'when batch updating aUri to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aUri: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aUri, isNull);
      },
    );

    test(
      'when batch updating aBigInt to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aBigInt: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aBigInt, isNull);
      },
    );

    test(
      'when batch updating aVector to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aVector: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aVector, isNull);
      },
    );

    test(
      'when batch updating aHalfVector to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aHalfVector: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aHalfVector, isNull);
      },
    );

    test(
      'when batch updating aSparseVector to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aSparseVector: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aSparseVector, isNull);
      },
    );

    test(
      'when batch updating aBit to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aBit: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aBit, isNull);
      },
    );

    test(
      'when batch updating anEnum to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            anEnum: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.anEnum, isNull);
      },
    );

    test(
      'when batch updating aStringifiedEnum to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aStringifiedEnum: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aStringifiedEnum, isNull);
      },
    );

    test(
      'when batch updating aList to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aList: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aList, isNull);
      },
    );

    test(
      'when batch updating aMap to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aMap: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aMap, isNull);
      },
    );

    test(
      'when batch updating aSet to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aSet: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aSet, isNull);
      },
    );

    test(
      'when batch updating aRecord to null then the database is updated with null value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aRecord: null,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aRecord, isNull);
      },
    );
  });

  group('Given a typed entry in the database', () {
    final data = <Types>[
      Types(
        anInt: null,
        aBool: null,
        aDouble: null,
        aString: null,
        aDateTime: null,
        aByteData: null,
        aDuration: null,
        aUuid: null,
        aUri: null,
        aBigInt: null,
        aVector: null,
        aHalfVector: null,
        aSparseVector: null,
        aBit: null,
        anEnum: null,
        aStringifiedEnum: null,
        aList: null,
        aMap: null,
        aSet: null,
        aRecord: null,
      ),
    ];

    late Types type;

    setUp(() async {
      final inserted = await Types.db.insert(session, data);
      type = inserted.first;
    });

    tearDown(() async {
      await Types.db.deleteWhere(session, where: (final t) => Constant.bool(true));
    });

    test(
      'when batch updating anInt to 1 then the database is updated with value 1.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            anInt: 1,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.anInt, equals(1));
      },
    );

    test(
      'when batch updating aBool to true then the database is updated with value true.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aBool: true,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aBool, equals(true));
      },
    );

    test(
      'when batch updating aDouble to 1.0 then the database is updated with value 1.0.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aDouble: 1.0,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aDouble, equals(1.0));
      },
    );

    test(
      'when batch updating aString to "string" then the database is updated with value "string".',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aString: 'string',
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aString, equals('string'));
      },
    );

    test(
      'when batch updating aDateTime to a real value then the database is updated with the real value.',
      () async {
        final now = DateTime.now().toUtc();
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aDateTime: now,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aDateTime, equals(now));
      },
    );

    test(
      'when batch updating aByteData to a real value then the database is updated with the real value.',
      () async {
        final byteData = ByteData.view(Uint8List(8).buffer);
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aByteData: byteData,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        final byteDataResult = updated.first.aByteData;

        expect(
          byteDataResult?.buffer.asUint8List(
            byteDataResult.offsetInBytes,
            byteDataResult.lengthInBytes,
          ),
          equals(byteData.buffer.asUint8List()),
        );
      },
    );

    test(
      'when batch updating aDuration to a real value then the database is updated with the real value.',
      () async {
        const duration = Duration(milliseconds: 1000);
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aDuration: duration,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aDuration, equals(duration));
      },
    );

    test(
      'when batch updating aUuid to a real value then the database is updated with the real value.',
      () async {
        final uuidValue = UuidValue.fromString(const Uuid().v4());
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aUuid: uuidValue,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aUuid, equals(uuidValue));
      },
    );

    test(
      'when batch updating aUri to a real value then the database is updated with the real value.',
      () async {
        final uri = Uri.parse('https://example.com');
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aUri: uri,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aUri, equals(uri));
      },
    );

    test(
      'when batch updating aBigInt to a real value then the database is updated with the real value.',
      () async {
        final bigInt = BigInt.from(987654321);
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aBigInt: bigInt,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aBigInt, equals(bigInt));
      },
    );

    test(
      'when batch updating aVector to a real value then the database is updated with the real value.',
      () async {
        const vector = Vector([4.0, 5.0, 6.0]);
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aVector: vector,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aVector, equals(vector));
      },
    );

    test(
      'when batch updating aHalfVector to a real value then the database is updated with the real value.',
      () async {
        const halfVector = HalfVector([4.0, 5.0, 6.0]);
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aHalfVector: halfVector,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aHalfVector, equals(halfVector));
      },
    );

    test(
      'when batch updating aSparseVector to a real value then the database is updated with the real value.',
      () async {
        final sparseVector = SparseVector([0.0, 4.0, 5.0]);
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aSparseVector: sparseVector,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aSparseVector, equals(sparseVector));
      },
    );

    test(
      'when batch updating aBit to a real value then the database is updated with the real value.',
      () async {
        final bit = Bit([true, false, true]);
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aBit: bit,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aBit, equals(bit));
      },
    );

    test(
      'when batch updating anEnum to TestEnum.one then the database is updated with value TestEnum.one.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            anEnum: TestEnum.one,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.anEnum, equals(TestEnum.one));
      },
    );

    test(
      'when batch updating aStringifiedEnum to TestEnumStringified.two then the database is updated with value TestEnumStringified.two.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aStringifiedEnum: TestEnumStringified.two,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aStringifiedEnum, equals(TestEnumStringified.two));
      },
    );

    test(
      'when batch updating aList to a real value then the database is updated with the real value.',
      () async {
        final list = [4, 5, 6];
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aList: list,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aList, equals(list));
      },
    );

    test(
      'when batch updating aMap to a real value then the database is updated with the real value.',
      () async {
        final map = {3: 30, 4: 40};
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aMap: map,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aMap, equals(map));
      },
    );

    test(
      'when batch updating aSet to a real value then the database is updated with the real value.',
      () async {
        final set = {4, 5, 6};
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aSet: set,
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(updated.first.aSet, equals(set));
      },
    );

    test(
      'when batch updating aRecord then the database is updated with the given value.',
      () async {
        final toUpdate = <Types>[
          Types(
            id: type.id,
            aRecord: ('test', optionalUri: Uri.parse('https://serverpod.dev')),
          ),
        ];

        final updated = await Types.db.update(session, toUpdate);

        expect(
          updated.first.aRecord,
          equals(
            ('test', optionalUri: Uri.parse('https://serverpod.dev')),
          ),
        );
      },
    );

    test(
      'when listing id column in an update query of a row then update completes successfully.',
      () async {
        expect(
          Types.db.updateRow(session, type, columns: (final t) => [t.id]),
          completes,
        );
      },
    );
  });

  group('Given empty model in database', () {
    late EmptyModelWithTable model;
    setUp(() async {
      model = await EmptyModelWithTable.db.insertRow(
        session,
        EmptyModelWithTable(),
      );
    });

    tearDown(() async {
      await EmptyModelWithTable.db.deleteWhere(
        session,
        where: (final t) => Constant.bool(true),
      );
    });

    test('when model is updated then update completes', () async {
      expect(
        EmptyModelWithTable.db.updateRow(session, model),
        completes,
      );
    });

    test(
      'when with columns from different model then error is thrown',
      () async {
        final invalidColumns = [SimpleData.t.num, Types.t.anInt];
        expect(
          EmptyModelWithTable.db.updateRow(
            session,
            model,
            columns: (final t) => invalidColumns,
          ),
          throwsA(
            isA<ArgumentError>()
                .having(
                  (final e) => e.message,
                  'message',
                  equals('Columns do not exist in table'),
                )
                .having((final e) => e.name, 'name', 'columns')
                .having(
                  (final e) => e.invalidValue,
                  'invalidValue',
                  invalidColumns.toString(),
                ),
          ),
        );
      },
    );
  });
}
