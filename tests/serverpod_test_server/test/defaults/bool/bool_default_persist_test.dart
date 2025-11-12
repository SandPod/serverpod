import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:test/test.dart';

void main() async {
  group(
    "Given a class with 'defaultPersist' fields",
    () {
      test(
        'when an object of the class is created, then the "boolDefaultPersistTrue" field should be null',
        () {
          final object = BoolDefaultPersist();
          expect(object.boolDefaultPersistTrue, isNull);
        },
      );

      test(
        'when an object of the class is created, then the "boolDefaultPersistFalse" field should be null',
        () {
          final object = BoolDefaultPersist();
          expect(object.boolDefaultPersistFalse, isNull);
        },
      );

      test(
        'when an object of the class is created with a specific value for "boolDefaultPersistTrue", then the field value should match the provided value',
        () {
          final object = BoolDefaultPersist(boolDefaultPersistTrue: false);
          expect(object.boolDefaultPersistTrue, isFalse);
        },
      );

      test(
        'when an object of the class is created with a specific value for "boolDefaultPersistFalse", then the field value should match the provided value',
        () {
          final object = BoolDefaultPersist(boolDefaultPersistFalse: true);
          expect(object.boolDefaultPersistFalse, isTrue);
        },
      );

      test(
        'when an object of the class is created with a null value for "boolDefaultPersistTrue", then the field value should be null',
        () {
          final object = BoolDefaultPersist(boolDefaultPersistTrue: null);
          expect(object.boolDefaultPersistTrue, isNull);
        },
      );

      test(
        'when an object of the class is created with a null value for "boolDefaultPersistFalse", then the field value should be null',
        () {
          final object = BoolDefaultPersist(boolDefaultPersistFalse: null);
          expect(object.boolDefaultPersistFalse, isNull);
        },
      );
    },
  );
}
