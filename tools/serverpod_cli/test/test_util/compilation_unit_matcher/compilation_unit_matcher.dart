import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:test/test.dart';

part '_compilation_unit_matcher.dart';

/// A custom matcher that checks if a CompilationUnit contains a class with a
/// specific name.
///
/// Additional matchers can be chained to this matcher. For example, to check if
/// a class contains a field with a specific name:
///
/// ```dart
/// expect(compilationUnit, containsClass('User').hasField('name'));
/// ```
///
/// The matcher can also be used in a negative context:
/// ```dart
/// expect(compilationUnit, isNot(containsClass('NonExistentClass')));
/// ```
ClassMatcher containsClass(String className) => _ClassMatcherImpl._(className);

/// Parses a string of Dart code into a CompilationUnit.
CompilationUnit parseCode(String code) => parseString(content: code).unit;

/// A matcher that checks if a CompilationUnit contains a class that matches
/// certain criteria.
abstract interface class ClassMatcher {
  /// Chains a [FieldMatcher] that checks if the class contains a field with a
  /// specific name.
  ///
  /// Use [isNullable] to match field nullability. If the value is not set, the
  /// matcher will ignore the nullability of the field.
  FieldMatcher hasField(String fieldName, {bool? isNullable});

  /// Chains a [ConstructorMatcher] that checks if the class contains a constructor.
  ///
  /// Use [isPrivate] to match constructor privacy. If the value is not set, the
  /// matcher will ignore the privacy of the constructor.
  ConstructorMatcher hasConstructor({bool? isPrivate});
}

/// A matcher that can be chained to a [ClassMatcher] to check if the class
/// contains a field that matches certain criteria.
abstract interface class FieldMatcher {}

enum Initializer { this_, super_ }

/// A matcher that can be chained to a [ClassMatcher] to check if the class
/// contains a constructor that matches certain criteria.
abstract interface class ConstructorMatcher {
  /// Chains a [ParameterMatcher] that checks if the constructor contains a parameter
  /// with a specific name.
  ///
  /// Use [isRequired] to match required parameters. If the value is not set, the
  /// matcher will ignore the requirement of the parameter.
  ///
  /// Use [type] to match the type of the parameter. If the value is not set, the
  /// matcher will ignore the type of the parameter.
  ///
  /// Use [initializer] to match parameters that use "this" or "super". If the value is not set, the
  /// matcher will ignore the usage of "this" or "super".
  ParameterMatcher hasParameter(
    String parameterName, {
    bool? isRequired,
    String? type,
    Initializer? initializer,
  });

  ParameterMatcher hasTypedParameter(
    String parameterName, {
    String? type,
    bool? isRequired,
  });

  ParameterMatcher withInitializerParameter(
    String parameterName, {
    Initializer? initializer,
    bool? isRequired,
  });
}

/// A matcher that can be chained to a [ConstructorMatcher] to check if the constructor
/// contains a parameter that matches certain criteria.
abstract interface class ParameterMatcher {}
