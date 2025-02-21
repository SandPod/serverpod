import 'package:serverpod_cli/src/analyzer/models/definitions.dart';
import 'package:serverpod_cli/src/test_util/builders/type_definition_builder.dart';

import 'serializable_entity_field_definition_builder.dart';

typedef _FieldBuilder = SerializableModelFieldDefinition Function();

class ExceptionDefinitionBuilder {
  String _fileName;
  String _sourceFileName;
  String _className;
  List<String> _subDirParts;
  bool _serverOnly;
  List<_FieldBuilder> _fields;
  List<String>? _documentation;

  ExceptionDefinitionBuilder()
      : _fileName = 'example',
        _sourceFileName = 'example.yaml',
        _className = 'Example',
        _fields = [],
        _subDirParts = [],
        _serverOnly = false;

  ExceptionDefinition build() {
    return ExceptionDefinition(
      fileName: _fileName,
      sourceFileName: _sourceFileName,
      className: _className,
      fields: _fields.map((f) => f()).toList(),
      subDirParts: _subDirParts,
      serverOnly: _serverOnly,
      documentation: _documentation,
      type: TypeDefinitionBuilder().withClassName(_className).build(),
    );
  }

  ExceptionDefinitionBuilder withFileName(String fileName) {
    _fileName = fileName;
    return this;
  }

  ExceptionDefinitionBuilder withSourceFileName(String sourceFileName) {
    _sourceFileName = sourceFileName;
    return this;
  }

  ExceptionDefinitionBuilder withClassName(String className) {
    _className = className;
    return this;
  }

  ExceptionDefinitionBuilder withSubDirParts(List<String> subDirParts) {
    _subDirParts = subDirParts;
    return this;
  }

  ExceptionDefinitionBuilder withServerOnly(bool serverOnly) {
    _serverOnly = serverOnly;
    return this;
  }

  ExceptionDefinitionBuilder withSimpleField(
    String fieldName,
    String type, {
    dynamic defaultValue,
    bool nullable = false,
  }) {
    _fields.add(
      () => FieldDefinitionBuilder()
          .withName(fieldName)
          .withTypeDefinition(type, nullable)
          .withDefaults(defaultModelValue: defaultValue)
          .build(),
    );
    return this;
  }

  ExceptionDefinitionBuilder withListField(
    String fieldName,
    String className, {
    bool nullable = false,
    ModelFieldScopeDefinition scope = ModelFieldScopeDefinition.all,
  }) {
    _fields.add(
      () => FieldDefinitionBuilder()
          .withName(fieldName)
          .withShouldPersist(false)
          .withScope(scope)
          .withType(
            TypeDefinitionBuilder()
                .withNullable(nullable)
                .withClassName('List')
                .withGenerics([
              TypeDefinitionBuilder().withClassName(className).build()
            ]).build(),
          )
          .build(),
    );
    return this;
  }

  ExceptionDefinitionBuilder withMapField(
    String fieldName, {
    required String keyType,
    required String valueType,
    bool nullable = false,
    ModelFieldScopeDefinition scope = ModelFieldScopeDefinition.all,
  }) {
    _fields.add(
      () => FieldDefinitionBuilder()
          .withName(fieldName)
          .withShouldPersist(false)
          .withScope(scope)
          .withType(
            TypeDefinitionBuilder()
                .withNullable(nullable)
                .withClassName('Map')
                .withGenerics([
              TypeDefinitionBuilder().withClassName(keyType).build(),
              TypeDefinitionBuilder().withClassName(valueType).build(),
            ]).build(),
          )
          .build(),
    );
    return this;
  }

  ExceptionDefinitionBuilder withField(SerializableModelFieldDefinition field) {
    _fields.add(() => field);
    return this;
  }

  ExceptionDefinitionBuilder withFields(
    List<SerializableModelFieldDefinition> fields,
  ) {
    _fields = fields.map((f) => () => f).toList();
    return this;
  }

  ExceptionDefinitionBuilder withDocumentation(List<String>? documentation) {
    _documentation = documentation;
    return this;
  }
}
