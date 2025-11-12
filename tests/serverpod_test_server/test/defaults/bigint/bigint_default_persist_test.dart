import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:test/test.dart';

void main() async {
  group(
    "Given a class with 'defaultPersist' BigInt fields",
    () {
      test(
        'when an object of the class is created, then the "defaultPersist" BigInt field with a string should be null',
        () {
          final object = BigIntDefaultPersist();
          expect(object.bigIntDefaultPersistStr, isNull);
        },
      );

      test(
        'when an object of the class is created with a specific value for "bigIntDefaultPersistStr", then the field value should match the provided value',
        () {
          final bigInt = BigInt.one;
          final object = BigIntDefaultPersist(
            bigIntDefaultPersistStr: bigInt,
          );
          expect(
            object.bigIntDefaultPersistStr,
            bigInt,
          );
        },
      );
    },
  );
}
