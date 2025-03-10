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

    test('when negate matching class and constructor then test passes', () {
      expect(
        compilationUnit,
        isNot(containsClass('User').hasConstructor()),
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

  test(
      'Given compilation unit with class and constructor '
      'when matching class and constructor then test passes', () {
    final compilationUnit = parseCode(
      '''
      class User {
        User();
      }
    ''',
    );

    expect(
      compilationUnit,
      containsClass('User').hasConstructor(),
    );
  });

  group('Given compilation unit with class and non-private constructor', () {
    late final compilationUnit = parseCode(
      '''
      class User {
        User();
      }
    ''',
    );

    test('when matching class and non-private constructor then test passes',
        () {
      expect(
        compilationUnit,
        containsClass('User').hasConstructor(isPrivate: false),
      );
    });

    test('when negate matching class and private constructor then test passes',
        () {
      expect(
        compilationUnit,
        isNot(containsClass('User').hasConstructor(isPrivate: true)),
      );
    });
  });

  group('Given compilation unit with class and private constructor', () {
    late final compilationUnit = parseCode(
      '''
      class User {
        User._();
      }
    ''',
    );

    test('when matching class and private constructor then test passes', () {
      expect(
        compilationUnit,
        containsClass('User').hasConstructor(isPrivate: true),
      );
    });

    test(
        'when negate matching class and non-private constructor then test passes',
        () {
      expect(
        compilationUnit,
        isNot(containsClass('User').hasConstructor(isPrivate: false)),
      );
    });
  });

  group(
      'Given compilation unit with class and constructor with named parameters',
      () {
    late final compilationUnit = parseCode(
      '''
      class User {
        User(this.name, {required this.age, String? address});
        final String name;
        final int age;
        final String? address;
      }
    ''',
    );

    test(
        'when matching class and constructor with required parameter then test passes',
        () {
      expect(
        compilationUnit,
        containsClass('User')
            .hasConstructor()
            .hasParameter('name', isRequired: true),
      );
    });

    test(
        'when matching class and constructor with required parameter then test passes',
        () {
      expect(
        compilationUnit,
        containsClass('User')
            .hasConstructor()
            .hasParameter('age', isRequired: true),
      );
    });

    test(
        'when matching class and constructor with optional parameter then test passes',
        () {
      expect(
        compilationUnit,
        containsClass('User')
            .hasConstructor()
            .hasParameter('address', isRequired: false),
      );
    });

    test(
        'when matching class and constructor with parameter type then test passes',
        () {
      expect(
        compilationUnit,
        containsClass('User')
            .hasConstructor()
            .hasParameter('address', type: 'String?'),
      );
    });
  });

  group(
      'Given compilation unit with class and constructor with initializer parameters',
      () {
    late final compilationUnit = parseCode(
      '''
      class User {
        User(this.name, {required this.age, String? address});
        final String name;
        final int age;
        final String? address;
      }
    ''',
    );

    test(
        'when matching class and constructor with "this" parameter then test passes',
        () {
      expect(
        compilationUnit,
        containsClass('User')
            .hasConstructor()
            .hasParameter('name', initializer: Initializer.this_),
      );
    });

    test(
        'when negate matching class and constructor with "super" parameter then test passes',
        () {
      expect(
        compilationUnit,
        isNot(containsClass('User')
            .hasConstructor()
            .hasParameter('name', initializer: Initializer.super_)),
      );
    });
  });
}
