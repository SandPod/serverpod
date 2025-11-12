import 'package:serverpod/serverpod.dart';
import 'package:serverpod/src/server/future_call_manager/future_call_diagnostics_service.dart';
import 'package:serverpod/src/server/future_call_manager/future_call_manager.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';

import '../test_tools/serverpod_test_tools.dart';

export 'package:serverpod/src/server/future_call_manager/future_call_manager.dart';

class FutureCallManagerBuilder {
  FutureCallSessionBuilder _sessionBuilder;

  Session _internalSession;

  InitializeFutureCall _initializeFutureCall =
      (
        final FutureCall futureCall,
        final String name,
      ) {
        // Skip initialization
      };

  FutureCallConfig _config = const FutureCallConfig(
    concurrencyLimit: 1,
    scanInterval: Duration(milliseconds: 10),
  );

  Protocol _protocol = Protocol();

  FutureCallDiagnosticsService _diagnosticsService = _MockDiagnosticsService();

  FutureCallManagerBuilder({
    required final FutureCallSessionBuilder sessionProvider,
    required final Session internalSession,
  }) : _sessionBuilder = sessionProvider,
       _internalSession = internalSession;

  factory FutureCallManagerBuilder.fromTestSessionBuilder(
    final TestSessionBuilder sessionBuilder,
  ) {
    return FutureCallManagerBuilder(
      sessionProvider: (final String futureCallName) => sessionBuilder.build(),
      internalSession: sessionBuilder.build(),
    );
  }

  FutureCallManager build() => FutureCallManager(
    _config,
    _protocol,
    diagnosticsService: _diagnosticsService,
    internalSession: _internalSession,
    sessionProvider: _sessionBuilder,
    initializeFutureCall: _initializeFutureCall,
  );

  FutureCallManagerBuilder withConfig(final FutureCallConfig config) {
    _config = config;
    return this;
  }

  FutureCallManagerBuilder withDiagnosticsService(
    final FutureCallDiagnosticsService diagnosticsService,
  ) {
    _diagnosticsService = diagnosticsService;
    return this;
  }

  FutureCallManagerBuilder withInitializeFutureCall(
    final InitializeFutureCall initializeFutureCall,
  ) {
    _initializeFutureCall = initializeFutureCall;
    return this;
  }

  FutureCallManagerBuilder withInternalSession(
    final Session internalSession,
  ) {
    _internalSession = internalSession;
    return this;
  }

  FutureCallManagerBuilder withProtocol(final Protocol protocol) {
    _protocol = protocol;
    return this;
  }

  FutureCallManagerBuilder withSessionProvider(
    final FutureCallSessionBuilder sessionProvider,
  ) {
    _sessionBuilder = sessionProvider;
    return this;
  }
}

class _MockDiagnosticsService implements FutureCallDiagnosticsService {
  @override
  void submitCallException(
    final Object error,
    final StackTrace stackTrace, {
    required final Session session,
  }) {
    throw StateError('Diagnostics service not implemented');
  }

  @override
  void submitFrameworkException(
    final Object error,
    final StackTrace stackTrace, {
    final String? message,
  }) {
    throw StateError('Diagnostics service not implemented');
  }
}
