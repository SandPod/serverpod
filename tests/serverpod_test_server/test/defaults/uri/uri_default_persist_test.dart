import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:test/test.dart';

void main() async {
  group(
    "Given a class with 'uriDefaultPersist' Uri fields",
    () {
      test(
        'when an object of the class is created, then the "uriDefaultPersist" field should be null',
        () {
          final object = UriDefaultPersist();
          expect(object.uriDefaultPersist, isNull);
        },
      );

      test(
        'when an object of the class is created with a specific value for "uriDefaultPersist", then the field value should match the provided value',
        () {
          final uri = Uri.parse('https://serverpod.dev/overrideValue');
          final object = UriDefaultPersist(uriDefaultPersist: uri);
          expect(object.uriDefaultPersist, equals(uri));
        },
      );
    },
  );
}
