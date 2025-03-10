part of 'compilation_unit_matcher.dart';

class _ClassMatcherImpl extends Matcher implements ClassMatcher {
  final String className;
  _ClassMatcherImpl._(this.className);

  ClassDeclaration? featureValueOf(actual) {
    if (actual is! CompilationUnit) return null;

    return actual.declarations
        .whereType<ClassDeclaration>()
        .where((d) => d._hasMatchingClass(className))
        .firstOrNull;
  }

  @override
  bool matches(Object? item, Map matchState) {
    return featureValueOf(item) != null;
  }

  @override
  Description describeMismatch(
    dynamic item,
    Description mismatchDescription,
    Map matchState,
    bool verbose,
  ) {
    if (item is! CompilationUnit) {
      return mismatchDescription.add('is not a CompilationUnit');
    }

    final classNames = item.declarations
        .whereType<ClassDeclaration>()
        .map((d) => d.name.lexeme)
        .join(', ');

    return mismatchDescription.add(
        'does not contain class "$className". Found classes: [$classNames]');
  }

  @override
  Description describe(Description description) {
    return description.add('a CompilationUnit containing class "$className"');
  }

  @override
  FieldMatcher hasField(String fieldName, {bool? isNullable}) {
    return _FieldMatcherImpl._(this, fieldName, isNullable: isNullable);
  }

  @override
  ConstructorMatcher hasConstructor({bool? isPrivate}) {
    return _ConstructorMatcherImpl._(this, isPrivate: isPrivate);
  }
}

class _FieldMatcherImpl extends Matcher implements FieldMatcher {
  final _ClassMatcherImpl parent;
  final String fieldName;
  final bool? isNullable;
  _FieldMatcherImpl._(this.parent, this.fieldName, {this.isNullable});

  FieldDeclaration? featureValueOf(actual) {
    var classDecl = parent.featureValueOf(actual);
    if (classDecl == null) return null;

    return classDecl.members
        .whereType<FieldDeclaration>()
        .where((f) => f._hasMatchingVariable(fieldName))
        .firstOrNull;
  }

  @override
  bool matches(item, Map matchState) {
    var field = featureValueOf(item);
    if (field is! FieldDeclaration) return false;

    return field._hasMatchingNullable(isNullable);
  }

  @override
  Description describeMismatch(
    dynamic item,
    Description mismatchDescription,
    Map matchState,
    bool verbose,
  ) {
    var classDecl = parent.featureValueOf(item);
    if (classDecl == null) {
      return parent.describeMismatch(
        item,
        mismatchDescription,
        matchState,
        verbose,
      );
    }

    var fieldDecl = featureValueOf(item);
    if (fieldDecl is! FieldDeclaration) {
      final fieldNames = classDecl.members
          .whereType<FieldDeclaration>()
          .expand((f) => f.fields.variables)
          .map((v) => v.name.lexeme)
          .join(', ');

      return mismatchDescription.add(
          'does not contain field "$fieldName". Found fields: [$fieldNames]');
    }

    return mismatchDescription.add(
        'contains field "$fieldName" but the field is ${isNullable == true ? 'non-nullable' : 'nullable'}');
  }

  @override
  Description describe(Description description) {
    var nullable = isNullable != null
        ? '${isNullable == true ? '' : 'non-'}nullable '
        : '';
    return parent.describe(description).add(
          ' with a ${nullable}field "$fieldName"',
        );
  }
}

class _ConstructorMatcherImpl extends Matcher implements ConstructorMatcher {
  final _ClassMatcherImpl parent;
  final bool? isPrivate;
  _ConstructorMatcherImpl._(this.parent, {this.isPrivate});

  ConstructorDeclaration? featureValueOf(actual) {
    var classDecl = parent.featureValueOf(actual);
    if (classDecl == null) return null;

    return classDecl.members.whereType<ConstructorDeclaration>().firstOrNull;
  }

  @override
  bool matches(item, Map matchState) {
    var constructor = featureValueOf(item);
    if (constructor is! ConstructorDeclaration) return false;

    return constructor._hasMatchingPrivate(isPrivate);
  }

  @override
  Description describeMismatch(
    dynamic item,
    Description mismatchDescription,
    Map matchState,
    bool verbose,
  ) {
    var classDecl = parent.featureValueOf(item);
    if (classDecl == null) {
      return parent.describeMismatch(
        item,
        mismatchDescription,
        matchState,
        verbose,
      );
    }

    var constructorDecl = featureValueOf(item);
    if (constructorDecl is! ConstructorDeclaration) {
      return mismatchDescription.add('does not contain a constructor');
    }

    return mismatchDescription.add(
        'contains a constructor but it is ${isPrivate == true ? 'not private' : 'private'}');
  }

  @override
  Description describe(Description description) {
    var private = isPrivate != null
        ? isPrivate == true
            ? 'private '
            : 'non-private '
        : '';
    return parent.describe(description).add(
          ' with a ${private}constructor',
        );
  }

  @override
  ParameterMatcher hasParameter(
    String parameterName, {
    bool? isRequired,
    String? type,
    Initializer? initializer,
  }) {
    return _ParameterMatcherImpl._(this, parameterName,
        isRequired: isRequired, type: type, initializer: initializer);
  }
}

class _ParameterMatcherImpl extends Matcher implements ParameterMatcher {
  final _ConstructorMatcherImpl parent;
  final String parameterName;
  final bool? isRequired;
  final String? type;
  final Initializer? initializer;
  _ParameterMatcherImpl._(this.parent, this.parameterName,
      {this.isRequired, this.type, this.initializer});

  FormalParameter? featureValueOf(actual) {
    var constructorDecl = parent.featureValueOf(actual);
    if (constructorDecl == null) return null;

    return constructorDecl.parameters.parameters
        .where((p) => p.name?.lexeme == parameterName)
        .firstOrNull;
  }

  @override
  bool matches(item, Map matchState) {
    var parameter = featureValueOf(item);
    if (parameter is! FormalParameter) return false;

    if (!parameter._hasMatchingInitializerParameter(initializer)) return false;
    if (!parameter._hasMatchingRequired(isRequired)) return false;
    if (!parameter._hasMatchingType(type)) return false;

    return true;
  }

  @override
  Description describeMismatch(
    dynamic item,
    Description mismatchDescription,
    Map matchState,
    bool verbose,
  ) {
    var constructorDecl = parent.featureValueOf(item);
    if (constructorDecl == null) {
      return parent.describeMismatch(
        item,
        mismatchDescription,
        matchState,
        verbose,
      );
    }

    var parameterDecl = featureValueOf(item);
    if (parameterDecl is! FormalParameter) {
      final parameterNames = constructorDecl.parameters.parameters
          .map((p) => p.name?.lexeme)
          .where((e) => e != null)
          .join(', ');

      return mismatchDescription.add(
          'does not contain parameter "$parameterName". Found parameters: [$parameterNames]');
    }

    return mismatchDescription.add(
        'contains parameter "$parameterName" but it does not match the specified criteria');
  }

  @override
  Description describe(Description description) {
    var required = isRequired != null
        ? isRequired == true
            ? 'required '
            : 'optional '
        : '';
    var paramType = type != null ? '$type ' : '';
    var initializerStr = initializer != null
        ? initializer == Initializer.this_
            ? 'this.'
            : 'super.'
        : '';
    return parent.describe(description).add(
          ' with a ${required}${paramType}${initializerStr}parameter "$parameterName"',
        );
  }
}

extension _ClassDeclarationExtensions on ClassDeclaration {
  bool _hasMatchingClass(String name) {
    return this.name.lexeme == name;
  }
}

extension _FieldDeclarationExtensions on FieldDeclaration {
  bool _hasMatchingVariable(String name) {
    return fields.variables.any((variable) => variable.name.toString() == name);
  }

  bool _hasMatchingNullable(bool? isNullable) {
    if (isNullable == null) return true;

    return fields.type?.question == null ? !isNullable : isNullable;
  }
}

extension _ConstructorDeclarationExtensions on ConstructorDeclaration {
  bool _hasMatchingPrivate(bool? isPrivate) {
    if (isPrivate == null) return true;

    var privateConstructor = name?.lexeme.startsWith('_') ?? false;
    return privateConstructor == isPrivate;
  }
}

extension _FormalParameterExtensions on FormalParameter {
  bool _hasMatchingRequired(bool? isRequired) {
    if (isRequired == null) return true;

    return this.isRequired == (isRequired == true);
  }

  bool _hasMatchingType(String? type) {
    if (type == null) return true;

    var resolvedThis = this;
    if (resolvedThis is DefaultFormalParameter) {
      return resolvedThis.parameter._hasMatchingType(type);
    }

    if (resolvedThis is! SimpleFormalParameter) return false;

    return resolvedThis.type.toString() == type;
  }

  bool _hasMatchingInitializerParameter(Initializer? initializer) {
    if (initializer == null) return true;

    var parameterInitializer = beginToken.lexeme;

    return switch (initializer) {
      Initializer.this_ => parameterInitializer == 'this',
      Initializer.super_ => parameterInitializer == 'super',
    };
  }
}
