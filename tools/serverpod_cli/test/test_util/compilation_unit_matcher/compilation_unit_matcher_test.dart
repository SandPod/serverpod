import 'package:test/test.dart';

import 'compilation_unit_matcher.dart';

void main() {
  test(
      'Given empty compilation unit when negate matching with class name then test fails',
      () {
    final compilationUnit = parseCode('');

    expect(
      compilationUnit,
      isNot(containsClass('User')),
    );
  });

  group('Given compilation unit with class', () {
    late final compilationUnit = parseCode(
      '''
      class User {}
      ''',
    );

    test('when matching with class name then test passes', () {
      expect(
        compilationUnit,
        containsClass('User'),
      );
    });

    test('when negate matching with non-existent class name then test passes',
        () {
      expect(
        compilationUnit,
        isNot(containsClass('NonExistentClass')),
      );
    });

    test(
        'when negate matching with non-existent field of the class then test passes',
        () {
      expect(
        compilationUnit,
        isNot(containsClass('User').hasField('nonExistentField')),
      );
    });
  });

  group('Given compilation unit with class and field', () {
    late final compilationUnit = parseCode(
      '''
      class User {
        final String name;
      }
    ''',
    );

    test('when matching class and field then test passes', () {
      expect(
        compilationUnit,
        containsClass('User').hasField('name'),
      );
    });
  });

  group('Given compilation unit with class and non-nullable field', () {
    late final compilationUnit = parseCode(
      '''
      class User {
        final String name;
      }
    ''',
    );

    test('when matching class and non-nullable field then test passes', () {
      expect(
        compilationUnit,
        containsClass('User').hasField('name', isNullable: false),
      );
    });

    test('when negate matching class and nullable field then test passes', () {
      expect(
        compilationUnit,
        isNot(containsClass('User').hasField('name', isNullable: true)),
      );
    });
  });

  group('Given compilation unit with class and nullable field', () {
    late final compilationUnit = parseCode(
      '''
      class User {
        final String? name;
      }
    ''',
    );

    test('when matching class and field then test passes', () {
      expect(
        compilationUnit,
        containsClass('User').hasField('name'),
      );
    });

    test('when matching class and nullable field then test passes', () {
      expect(
        compilationUnit,
        containsClass('User').hasField('name', isNullable: true),
      );
    });

    test('when negate matching class and non-nullable field then test passes',
        () {
      expect(
        compilationUnit,
        isNot(containsClass('User').hasField('name', isNullable: false)),
      );
    });
  });
}
