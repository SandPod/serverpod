import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:test/test.dart';

void main() async {
  group(
    "Given a class with 'defaultModel' fields",
    () {
      test(
        'when an object of the class is created, then the "defaultModel=now" field should not be in UTC',
        () {
          final object = DateTimeDefaultModel();
          expect(object.dateTimeDefaultModelNow.isUtc, isFalse);
        },
      );

      test(
        'when an object of the class is created, then the "defaultModel" field with UTC string should be in UTC',
        () {
          final object = DateTimeDefaultModel();
          expect(object.dateTimeDefaultModelStr.isUtc, isTrue);
        },
      );

      test(
        'when an object of the class is created, then the nullable "defaultModel" field with UTC string should be in UTC',
        () {
          final object = DateTimeDefaultModel();
          expect(object.dateTimeDefaultModelStrNull?.isUtc, isTrue);
        },
      );

      test(
        'when an object of the class is created, then the "defaultModel=now" field value should match the current time',
        () {
          final object = DateTimeDefaultModel();
          expect(
            object.dateTimeDefaultModelNow.difference(DateTime.now()).inSeconds,
            0,
          );
        },
      );

      test(
        'when an object of the class is created, then the "defaultModel" field value should match the default',
        () {
          final object = DateTimeDefaultModel();
          expect(
            object.dateTimeDefaultModelStr,
            DateTime.parse('2024-05-24T22:00:00.000Z'),
          );
        },
      );

      test(
        'when an object of the class is created, then the nullable "defaultModel" field value should match the default',
        () {
          final object = DateTimeDefaultModel();
          expect(
            object.dateTimeDefaultModelStrNull,
            DateTime.parse('2024-05-24T22:00:00.000Z'),
          );
        },
      );

      test(
        'when an object of the class is created with a specific value for "dateTimeDefaultModelNow", then the field value should match the provided value',
        () {
          final date = DateTime.parse('2024-05-01T22:00:00.000Z');
          final object = DateTimeDefaultModel(
            dateTimeDefaultModelNow: date,
          );
          expect(
            object.dateTimeDefaultModelNow,
            date,
          );
        },
      );

      test(
        'when an object of the class is created with a specific value for "dateTimeDefaultModelStr", then the field value should match the provided value',
        () {
          final date = DateTime.parse('2024-05-05T22:00:00.000Z');
          final object = DateTimeDefaultModel(
            dateTimeDefaultModelStr: date,
          );
          expect(
            object.dateTimeDefaultModelStr,
            date,
          );
        },
      );

      test(
        'when an object of the class is created with a specific value for "dateTimeDefaultModelStrNull", then the field value should match the provided value',
        () {
          final date = DateTime.parse('2024-05-05T22:00:00.000Z');
          final object = DateTimeDefaultModel(
            dateTimeDefaultModelStrNull: date,
          );
          expect(
            object.dateTimeDefaultModelStrNull,
            date,
          );
        },
      );
    },
  );
}
