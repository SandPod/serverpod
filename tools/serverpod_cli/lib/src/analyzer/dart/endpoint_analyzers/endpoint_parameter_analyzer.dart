import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:serverpod_cli/src/analyzer/code_analysis_collector.dart';
import 'package:serverpod_cli/src/analyzer/dart/definitions.dart';
import 'package:serverpod_cli/src/analyzer/dart/element_extensions.dart';
import 'package:serverpod_cli/src/generator/types.dart';

abstract class EndpointParameterAnalyzer {
  /// Parses a [ParameterElement] into a [ParameterDefinition].
  /// Assumes that the [ParameterElement] is a valid endpoint parameter.
  static Parameters parse(
    List<ParameterElement> parameters,
  ) {
    var requiredParameters = <ParameterDefinition>[];
    var positionalParameters = <ParameterDefinition>[];
    var namedParameters = <ParameterDefinition>[];

    for (var parameter in parameters) {
      var definition = ParameterDefinition(
        name: parameter.name,
        required: _isRequired(parameter),
        type: TypeDefinition.fromDartType(parameter.type),
      );

      if (parameter.isRequiredPositional) {
        requiredParameters.add(definition);
      } else if (parameter.isOptionalPositional) {
        positionalParameters.add(definition);
      } else if (parameter.isNamed) {
        namedParameters.add(definition);
      }
    }

    return Parameters(
      required: requiredParameters,
      positional: positionalParameters,
      named: namedParameters,
    );
  }

  /// Validates a list of [ParameterElement] and returns a list of errors.
  static List<SourceSpanSeverityException> validate(
    List<ParameterElement> parameters,
  ) {
    List<SourceSpanSeverityException> errors = [];
    for (var parameter in parameters) {
      try {
        TypeDefinition.fromDartType(parameter.type);
      } on FromDartTypeClassNameException catch (e) {
        errors.add(SourceSpanSeverityException(
          'The type "${e.type}" is not a supported endpoint parameter type.',
          parameter.span,
        ));
      }
    }
    return errors;
  }

  static bool _isRequired(ParameterElement parameter) {
    if (parameter.isRequiredPositional) {
      return true;
    }

    if (parameter.isRequiredNamed) {
      return true;
    }

    if (parameter.isNamed &&
        parameter.type.nullabilitySuffix == NullabilitySuffix.none) {
      return true;
    }

    return false;
  }
}

class Parameters {
  final List<ParameterDefinition> required;
  final List<ParameterDefinition> positional;
  final List<ParameterDefinition> named;

  bool hasStream() =>
      required.any(
          (element) => element.type.dartType?.isDartAsyncStream ?? false) ||
      positional.any(
          (element) => element.type.dartType?.isDartAsyncStream ?? false) ||
      named.any((element) => element.type.dartType?.isDartAsyncStream ?? false);

  Parameters({
    required this.required,
    required this.positional,
    required this.named,
  });
}
