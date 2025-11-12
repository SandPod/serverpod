import 'dart:async';

import 'package:serverpod/serverpod.dart';

class TestExceptionHandler extends ExceptionHandler {
  final eventsStreamController =
      StreamController<DiagnosticEventRecord<ExceptionEvent>>();

  Stream<DiagnosticEventRecord<ExceptionEvent>> get events =>
      eventsStreamController.stream;

  @override
  Future<void> handleTypedEvent(
    final ExceptionEvent event, {
    required final OriginSpace space,
    required final DiagnosticEventContext context,
  }) async {
    eventsStreamController.add(DiagnosticEventRecord(event, space, context));
  }
}
