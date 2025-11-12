import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:test/test.dart';

void main() async {
  group(
    "Given an exception with 'default' fields",
    () {
      test(
        'when an exception is created, then the "defaultBoolean" field should match the default value',
        () {
          final exception = DefaultException();
          expect(
            exception.defaultBoolean,
            equals(true),
          );
        },
      );

      test(
        'when an exception is created, then the "defaultDateTime" field should match the default value',
        () {
          final exception = DefaultException();
          expect(
            exception.defaultDateTime.difference(DateTime.now()).inSeconds,
            0,
          );
        },
      );

      test(
        'when an exception is created, then the "defaultDouble" field should match the default value',
        () {
          final exception = DefaultException();
          expect(
            exception.defaultDouble,
            equals(10.5),
          );
        },
      );

      test(
        'when an exception is created, then the "defaultDuration" field should match the default value',
        () {
          final exception = DefaultException();
          expect(
            exception.defaultDuration,
            equals(const Duration(days: 1, hours: 2, minutes: 30)),
          );
        },
      );

      test(
        'when an exception is created, then the "defaultEnum" field should match the default value',
        () {
          final exception = DefaultException();
          expect(
            exception.defaultEnum,
            equals(ByNameEnum.byName1),
          );
        },
      );

      test(
        'when an exception is created, then the "defaultInteger" field should match the default value',
        () {
          final exception = DefaultException();
          expect(
            exception.defaultInteger,
            equals(10),
          );
        },
      );

      test(
        'when an exception is created, then the "defaultString" field should match the default value',
        () {
          final exception = DefaultException();
          expect(
            exception.defaultString,
            equals('Default error message'),
          );
        },
      );

      test(
        'when an exception is created, then the "defaultUuid" field should match the default value',
        () {
          final exception = DefaultException();
          expect(
            exception.defaultUuid,
            isNotNull,
          );
        },
      );

      test(
        'when an exception is created, then the "defaultModelField" field should match the default value',
        () {
          final exception = DefaultException();
          expect(
            exception.defaultModelField,
            equals('Model specific message'),
          );
        },
      );

      test(
        'when an exception is created, then the "defaultMixField" field should match the defaultModel value',
        () {
          final exception = DefaultException();
          expect(
            exception.defaultMixField,
            equals('Model specific mix message'),
          );
        },
      );

      test(
        'when an exception is created with a specific value for "defaultBoolean", then the field value should match the provided value',
        () {
          final exception = DefaultException(
            defaultBoolean: false,
          );
          expect(
            exception.defaultBoolean,
            equals(false),
          );
        },
      );

      test(
        'when an exception is created with a specific value for "defaultDateTime", then the field value should match the provided value',
        () {
          final dateTime = DateTime.now().subtract(const Duration(days: 1));
          final exception = DefaultException(
            defaultDateTime: dateTime,
          );
          expect(
            exception.defaultDateTime,
            equals(dateTime),
          );
        },
      );

      test(
        'when an exception is created with a specific value for "defaultDouble", then the field value should match the provided value',
        () {
          final exception = DefaultException(
            defaultDouble: 20.5,
          );
          expect(
            exception.defaultDouble,
            equals(20.5),
          );
        },
      );

      test(
        'when an exception is created with a specific value for "defaultDuration", then the field value should match the provided value',
        () {
          const duration = Duration(hours: 5);
          final exception = DefaultException(
            defaultDuration: duration,
          );
          expect(
            exception.defaultDuration,
            equals(duration),
          );
        },
      );

      test(
        'when an exception is created with a specific value for "defaultEnum", then the field value should match the provided value',
        () {
          final exception = DefaultException(
            defaultEnum: ByNameEnum.byName2,
          );
          expect(
            exception.defaultEnum,
            equals(ByNameEnum.byName2),
          );
        },
      );

      test(
        'when an exception is created with a specific value for "defaultInteger", then the field value should match the provided value',
        () {
          final exception = DefaultException(
            defaultInteger: 25,
          );
          expect(
            exception.defaultInteger,
            equals(25),
          );
        },
      );

      test(
        'when an exception is created with a specific value for "defaultString", then the field value should match the provided value',
        () {
          final exception = DefaultException(
            defaultString: 'Custom error message',
          );
          expect(
            exception.defaultString,
            equals('Custom error message'),
          );
        },
      );

      test(
        'when an exception is created with a specific value for "defaultUuid", then the field value should match the provided value',
        () {
          final uuid = UuidValue.fromString(
            '550e8400-e29b-41d4-a716-446655440000',
          );
          final exception = DefaultException(
            defaultUuid: uuid,
          );
          expect(
            exception.defaultUuid,
            equals(uuid),
          );
        },
      );

      test(
        'when an exception is created with a specific value for "defaultModelField", then the field value should match the provided value',
        () {
          final exception = DefaultException(
            defaultModelField: 'Custom model message',
          );
          expect(
            exception.defaultModelField,
            equals('Custom model message'),
          );
        },
      );

      test(
        'when an exception is created with a specific value for "defaultMixField", then the field value should match the provided value',
        () {
          final exception = DefaultException(
            defaultMixField: 'Custom mix message',
          );
          expect(
            exception.defaultMixField,
            equals('Custom mix message'),
          );
        },
      );
    },
  );
}
