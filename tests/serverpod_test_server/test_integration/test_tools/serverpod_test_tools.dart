/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async' as _i3;
import 'dart:convert' as _i21;
import 'dart:typed_data' as _i5;

import 'package:serverpod/serverpod.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i4;
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_test/serverpod_test.dart' as _i1;
import 'package:serverpod_test_module_server/serverpod_test_module_server.dart'
    as _i19;
import 'package:serverpod_test_server/src/generated/endpoints.dart';
import 'package:serverpod_test_server/src/generated/module_datatype.dart'
    as _i20;
import 'package:serverpod_test_server/src/generated/my_feature/models/my_feature_model.dart'
    as _i26;
import 'package:serverpod_test_server/src/generated/object_field_scopes.dart'
    as _i16;
import 'package:serverpod_test_server/src/generated/object_with_enum.dart'
    as _i13;
import 'package:serverpod_test_server/src/generated/object_with_object.dart'
    as _i14;
import 'package:serverpod_test_server/src/generated/protocol.dart' as _i17;
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/src/generated/required/model_with_required_field.dart'
    as _i15;
import 'package:serverpod_test_server/src/generated/scopes/scope_server_only_field.dart'
    as _i23;
import 'package:serverpod_test_server/src/generated/scopes/scope_server_only_field_child.dart'
    as _i24;
import 'package:serverpod_test_server/src/generated/session_auth_info.dart'
    as _i25;
import 'package:serverpod_test_server/src/generated/simple_data.dart' as _i10;
import 'package:serverpod_test_server/src/generated/simple_data_list.dart'
    as _i11;
import 'package:serverpod_test_server/src/generated/test_enum.dart' as _i18;
import 'package:serverpod_test_server/src/generated/types.dart' as _i12;
import 'package:serverpod_test_server/src/generated/types_record.dart' as _i22;
import 'package:serverpod_test_shared/src/custom_classes.dart' as _i7;
import 'package:serverpod_test_shared/src/external_custom_class.dart' as _i8;
import 'package:serverpod_test_shared/src/freezed_custom_class.dart' as _i9;
import 'package:serverpod_test_shared/src/protocol_custom_classes.dart' as _i6;

export 'package:serverpod_test/serverpod_test_public_exports.dart';

/// Creates a new test group that takes a callback that can be used to write tests.
/// The callback has two parameters: `sessionBuilder` and `endpoints`.
/// `sessionBuilder` is used to build a `Session` object that represents the server state during an endpoint call and is used to set up scenarios.
/// `endpoints` contains all your Serverpod endpoints and lets you call them:
/// ```dart
/// withServerpod('Given Example endpoint', (sessionBuilder, endpoints) {
///   test('when calling `hello` then should return greeting', () async {
///     final greeting = await endpoints.example.hello(sessionBuilder, 'Michael');
///     expect(greeting, 'Hello Michael');
///   });
/// });
/// ```
///
/// **Configuration options**
///
/// [applyMigrations] Whether pending migrations should be applied when starting Serverpod. Defaults to `true`
///
/// [enableSessionLogging] Whether session logging should be enabled. Defaults to `false`
///
/// [rollbackDatabase] Options for when to rollback the database during the test lifecycle.
/// By default `withServerpod` does all database operations inside a transaction that is rolled back after each `test` case.
/// Just like the following enum describes, the behavior of the automatic rollbacks can be configured:
/// ```dart
/// /// Options for when to rollback the database during the test lifecycle.
/// enum RollbackDatabase {
///   /// After each test. This is the default.
///   afterEach,
///
///   /// After all tests.
///   afterAll,
///
///   /// Disable rolling back the database.
///   disabled,
/// }
/// ```
///
/// [runMode] The run mode that Serverpod should be running in. Defaults to `test`.
///
/// [serverpodLoggingMode] The logging mode used when creating Serverpod. Defaults to `ServerpodLoggingMode.normal`
///
/// [serverpodStartTimeout] The timeout to use when starting Serverpod, which connects to the database among other things. Defaults to `Duration(seconds: 30)`.
///
/// [testServerOutputMode] Options for controlling test server output during test execution. Defaults to `TestServerOutputMode.normal`.
/// ```dart
/// /// Options for controlling test server output during test execution.
/// enum TestServerOutputMode {
///   /// Default mode - only stderr is printed (stdout suppressed).
///   /// This hides normal startup/shutdown logs while preserving error messages.
///   normal,
///
///   /// All logging - both stdout and stderr are printed.
///   /// Useful for debugging when you need to see all server output.
///   verbose,
///
///   /// No logging - both stdout and stderr are suppressed.
///   /// Completely silent mode, useful when you don't want any server output.
///   silent,
/// }
/// ```
///
/// [testGroupTagsOverride] By default Serverpod test tools tags the `withServerpod` test group with `"integration"`.
/// This is to provide a simple way to only run unit or integration tests.
/// This property allows this tag to be overridden to something else. Defaults to `['integration']`.
///
/// [experimentalFeatures] Optionally specify experimental features. See [Serverpod] for more information.
@_i1.isTestGroup
void withServerpod(
  final String testGroupName,
  final _i1.TestClosure<TestEndpoints> testClosure, {
  final bool? applyMigrations,
  final bool? enableSessionLogging,
  final _i2.ExperimentalFeatures? experimentalFeatures,
  final _i1.RollbackDatabase? rollbackDatabase,
  final String? runMode,
  final _i2.RuntimeParametersListBuilder? runtimeParametersBuilder,
  final _i2.ServerpodLoggingMode? serverpodLoggingMode,
  final Duration? serverpodStartTimeout,
  final List<String>? testGroupTagsOverride,
  final _i1.TestServerOutputMode? testServerOutputMode,
}) {
  _i1.buildWithServerpod<_InternalTestEndpoints>(
    testGroupName,
    _i1.TestServerpod(
      testEndpoints: _InternalTestEndpoints(),
      endpoints: Endpoints(),
      serializationManager: Protocol(),
      runMode: runMode,
      applyMigrations: applyMigrations,
      isDatabaseEnabled: true,
      serverpodLoggingMode: serverpodLoggingMode,
      testServerOutputMode: testServerOutputMode,
      experimentalFeatures: experimentalFeatures,
      runtimeParametersBuilder: runtimeParametersBuilder,
    ),
    maybeRollbackDatabase: rollbackDatabase,
    maybeEnableSessionLogging: enableSessionLogging,
    maybeTestGroupTagsOverride: testGroupTagsOverride,
    maybeServerpodStartTimeout: serverpodStartTimeout,
    maybeTestServerOutputMode: testServerOutputMode,
  )(testClosure);
}

class TestEndpoints {
  late final _AsyncTasksEndpoint asyncTasks;

  late final _AuthenticationEndpoint authentication;

  late final _BasicTypesEndpoint basicTypes;

  late final _BasicTypesStreamingEndpoint basicTypesStreaming;

  late final _CloudStorageEndpoint cloudStorage;

  late final _S3CloudStorageEndpoint s3CloudStorage;

  late final _CustomClassProtocolEndpoint customClassProtocol;

  late final _CustomTypesEndpoint customTypes;

  late final _BasicDatabase basicDatabase;

  late final _TransactionsDatabaseEndpoint transactionsDatabase;

  late final _DeprecationEndpoint deprecation;

  late final _DiagnosticEventTestEndpoint diagnosticEventTest;

  late final _EchoRequestEndpoint echoRequest;

  late final _EchoRequiredFieldEndpoint echoRequiredField;

  late final _EmailAuthTestMethods emailAuthTestMethods;

  late final _ConcreteBaseEndpoint concreteBase;

  late final _ConcreteSubClassEndpoint concreteSubClass;

  late final _IndependentEndpoint independent;

  late final _ConcreteFromModuleAbstractBaseEndpoint
  concreteFromModuleAbstractBase;

  late final _ConcreteModuleBaseEndpoint concreteModuleBase;

  late final _LoggedInEndpoint loggedIn;

  late final _MyLoggedInEndpoint myLoggedIn;

  late final _AdminEndpoint admin;

  late final _MyAdminEndpoint myAdmin;

  late final _MyConcreteAdminEndpoint myConcreteAdmin;

  late final _ExceptionTestEndpoint exceptionTest;

  late final _FailedCallsEndpoint failedCalls;

  late final _FieldScopesEndpoint fieldScopes;

  late final _FutureCallsEndpoint futureCalls;

  late final _ListParametersEndpoint listParameters;

  late final _LoggingEndpoint logging;

  late final _StreamLogging streamLogging;

  late final _StreamQueryLogging streamQueryLogging;

  late final _LoggingDisabledEndpoint loggingDisabled;

  late final _MapParametersEndpoint mapParameters;

  late final _MethodSignaturePermutationsEndpoint methodSignaturePermutations;

  late final _MethodStreaming methodStreaming;

  late final _AuthenticatedMethodStreaming authenticatedMethodStreaming;

  late final _ModuleEndpointSubclass moduleEndpointSubclass;

  late final _ModuleEndpointAdaptation moduleEndpointAdaptation;

  late final _ModuleEndpointReduction moduleEndpointReduction;

  late final _ModuleEndpointExtension moduleEndpointExtension;

  late final _ModuleSerializationEndpoint moduleSerialization;

  late final _NamedParametersEndpoint namedParameters;

  late final _OptionalParametersEndpoint optionalParameters;

  late final _RecordParametersEndpoint recordParameters;

  late final _RedisEndpoint redis;

  late final _ServerOnlyScopedFieldModelEndpoint serverOnlyScopedFieldModel;

  late final _ServerOnlyScopedFieldChildModelEndpoint
  serverOnlyScopedFieldChildModel;

  late final _SessionAuthenticationEndpoint sessionAuthentication;

  late final _SessionAuthenticationStreamingEndpoint
  sessionAuthenticationStreaming;

  late final _SetParametersEndpoint setParameters;

  late final _SignInRequiredEndpoint signInRequired;

  late final _AdminScopeRequiredEndpoint adminScopeRequired;

  late final _SimpleEndpoint simple;

  late final _StreamingEndpoint streaming;

  late final _StreamingLoggingEndpoint streamingLogging;

  late final _SubSubDirTestEndpoint subSubDirTest;

  late final _SubDirTestEndpoint subDirTest;

  late final _TestToolsEndpoint testTools;

  late final _AuthenticatedTestToolsEndpoint authenticatedTestTools;

  late final _UnauthenticatedEndpoint unauthenticated;

  late final _PartiallyUnauthenticatedEndpoint partiallyUnauthenticated;

  late final _UnauthenticatedRequireLoginEndpoint unauthenticatedRequireLogin;

  late final _RequireLoginEndpoint requireLogin;

  late final _UploadEndpoint upload;

  late final _MyFeatureEndpoint myFeature;
}

class _InternalTestEndpoints extends TestEndpoints
    implements _i1.InternalTestEndpoints {
  @override
  void initialize(
    final _i2.SerializationManager serializationManager,
    final _i2.EndpointDispatch endpoints,
  ) {
    asyncTasks = _AsyncTasksEndpoint(
      endpoints,
      serializationManager,
    );
    authentication = _AuthenticationEndpoint(
      endpoints,
      serializationManager,
    );
    basicTypes = _BasicTypesEndpoint(
      endpoints,
      serializationManager,
    );
    basicTypesStreaming = _BasicTypesStreamingEndpoint(
      endpoints,
      serializationManager,
    );
    cloudStorage = _CloudStorageEndpoint(
      endpoints,
      serializationManager,
    );
    s3CloudStorage = _S3CloudStorageEndpoint(
      endpoints,
      serializationManager,
    );
    customClassProtocol = _CustomClassProtocolEndpoint(
      endpoints,
      serializationManager,
    );
    customTypes = _CustomTypesEndpoint(
      endpoints,
      serializationManager,
    );
    basicDatabase = _BasicDatabase(
      endpoints,
      serializationManager,
    );
    transactionsDatabase = _TransactionsDatabaseEndpoint(
      endpoints,
      serializationManager,
    );
    deprecation = _DeprecationEndpoint(
      endpoints,
      serializationManager,
    );
    diagnosticEventTest = _DiagnosticEventTestEndpoint(
      endpoints,
      serializationManager,
    );
    echoRequest = _EchoRequestEndpoint(
      endpoints,
      serializationManager,
    );
    echoRequiredField = _EchoRequiredFieldEndpoint(
      endpoints,
      serializationManager,
    );
    emailAuthTestMethods = _EmailAuthTestMethods(
      endpoints,
      serializationManager,
    );
    concreteBase = _ConcreteBaseEndpoint(
      endpoints,
      serializationManager,
    );
    concreteSubClass = _ConcreteSubClassEndpoint(
      endpoints,
      serializationManager,
    );
    independent = _IndependentEndpoint(
      endpoints,
      serializationManager,
    );
    concreteFromModuleAbstractBase = _ConcreteFromModuleAbstractBaseEndpoint(
      endpoints,
      serializationManager,
    );
    concreteModuleBase = _ConcreteModuleBaseEndpoint(
      endpoints,
      serializationManager,
    );
    loggedIn = _LoggedInEndpoint(
      endpoints,
      serializationManager,
    );
    myLoggedIn = _MyLoggedInEndpoint(
      endpoints,
      serializationManager,
    );
    admin = _AdminEndpoint(
      endpoints,
      serializationManager,
    );
    myAdmin = _MyAdminEndpoint(
      endpoints,
      serializationManager,
    );
    myConcreteAdmin = _MyConcreteAdminEndpoint(
      endpoints,
      serializationManager,
    );
    exceptionTest = _ExceptionTestEndpoint(
      endpoints,
      serializationManager,
    );
    failedCalls = _FailedCallsEndpoint(
      endpoints,
      serializationManager,
    );
    fieldScopes = _FieldScopesEndpoint(
      endpoints,
      serializationManager,
    );
    futureCalls = _FutureCallsEndpoint(
      endpoints,
      serializationManager,
    );
    listParameters = _ListParametersEndpoint(
      endpoints,
      serializationManager,
    );
    logging = _LoggingEndpoint(
      endpoints,
      serializationManager,
    );
    streamLogging = _StreamLogging(
      endpoints,
      serializationManager,
    );
    streamQueryLogging = _StreamQueryLogging(
      endpoints,
      serializationManager,
    );
    loggingDisabled = _LoggingDisabledEndpoint(
      endpoints,
      serializationManager,
    );
    mapParameters = _MapParametersEndpoint(
      endpoints,
      serializationManager,
    );
    methodSignaturePermutations = _MethodSignaturePermutationsEndpoint(
      endpoints,
      serializationManager,
    );
    methodStreaming = _MethodStreaming(
      endpoints,
      serializationManager,
    );
    authenticatedMethodStreaming = _AuthenticatedMethodStreaming(
      endpoints,
      serializationManager,
    );
    moduleEndpointSubclass = _ModuleEndpointSubclass(
      endpoints,
      serializationManager,
    );
    moduleEndpointAdaptation = _ModuleEndpointAdaptation(
      endpoints,
      serializationManager,
    );
    moduleEndpointReduction = _ModuleEndpointReduction(
      endpoints,
      serializationManager,
    );
    moduleEndpointExtension = _ModuleEndpointExtension(
      endpoints,
      serializationManager,
    );
    moduleSerialization = _ModuleSerializationEndpoint(
      endpoints,
      serializationManager,
    );
    namedParameters = _NamedParametersEndpoint(
      endpoints,
      serializationManager,
    );
    optionalParameters = _OptionalParametersEndpoint(
      endpoints,
      serializationManager,
    );
    recordParameters = _RecordParametersEndpoint(
      endpoints,
      serializationManager,
    );
    redis = _RedisEndpoint(
      endpoints,
      serializationManager,
    );
    serverOnlyScopedFieldModel = _ServerOnlyScopedFieldModelEndpoint(
      endpoints,
      serializationManager,
    );
    serverOnlyScopedFieldChildModel = _ServerOnlyScopedFieldChildModelEndpoint(
      endpoints,
      serializationManager,
    );
    sessionAuthentication = _SessionAuthenticationEndpoint(
      endpoints,
      serializationManager,
    );
    sessionAuthenticationStreaming = _SessionAuthenticationStreamingEndpoint(
      endpoints,
      serializationManager,
    );
    setParameters = _SetParametersEndpoint(
      endpoints,
      serializationManager,
    );
    signInRequired = _SignInRequiredEndpoint(
      endpoints,
      serializationManager,
    );
    adminScopeRequired = _AdminScopeRequiredEndpoint(
      endpoints,
      serializationManager,
    );
    simple = _SimpleEndpoint(
      endpoints,
      serializationManager,
    );
    streaming = _StreamingEndpoint(
      endpoints,
      serializationManager,
    );
    streamingLogging = _StreamingLoggingEndpoint(
      endpoints,
      serializationManager,
    );
    subSubDirTest = _SubSubDirTestEndpoint(
      endpoints,
      serializationManager,
    );
    subDirTest = _SubDirTestEndpoint(
      endpoints,
      serializationManager,
    );
    testTools = _TestToolsEndpoint(
      endpoints,
      serializationManager,
    );
    authenticatedTestTools = _AuthenticatedTestToolsEndpoint(
      endpoints,
      serializationManager,
    );
    unauthenticated = _UnauthenticatedEndpoint(
      endpoints,
      serializationManager,
    );
    partiallyUnauthenticated = _PartiallyUnauthenticatedEndpoint(
      endpoints,
      serializationManager,
    );
    unauthenticatedRequireLogin = _UnauthenticatedRequireLoginEndpoint(
      endpoints,
      serializationManager,
    );
    requireLogin = _RequireLoginEndpoint(
      endpoints,
      serializationManager,
    );
    upload = _UploadEndpoint(
      endpoints,
      serializationManager,
    );
    myFeature = _MyFeatureEndpoint(
      endpoints,
      serializationManager,
    );
  }
}

class _AsyncTasksEndpoint {
  _AsyncTasksEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> insertRowToSimpleDataAfterDelay(
    final _i1.TestSessionBuilder sessionBuilder,
    final int num,
    final int seconds,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'asyncTasks',
            method: 'insertRowToSimpleDataAfterDelay',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'asyncTasks',
          methodName: 'insertRowToSimpleDataAfterDelay',
          parameters: _i1.testObjectToJson({
            'num': num,
            'seconds': seconds,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> throwExceptionAfterDelay(
    final _i1.TestSessionBuilder sessionBuilder,
    final int seconds,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'asyncTasks',
            method: 'throwExceptionAfterDelay',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'asyncTasks',
          methodName: 'throwExceptionAfterDelay',
          parameters: _i1.testObjectToJson({'seconds': seconds}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _AuthenticationEndpoint {
  _AuthenticationEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> removeAllUsers(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'authentication',
            method: 'removeAllUsers',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'authentication',
          methodName: 'removeAllUsers',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<int> countUsers(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'authentication',
            method: 'countUsers',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'authentication',
          methodName: 'countUsers',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<int>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> createUser(
    final _i1.TestSessionBuilder sessionBuilder,
    final String email,
    final String password,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'authentication',
            method: 'createUser',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'authentication',
          methodName: 'createUser',
          parameters: _i1.testObjectToJson({
            'email': email,
            'password': password,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i4.AuthenticationResponse> authenticate(
    final _i1.TestSessionBuilder sessionBuilder,
    final String email,
    final String password, [
    final List<String>? scopes,
  ]) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'authentication',
            method: 'authenticate',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'authentication',
          methodName: 'authenticate',
          parameters: _i1.testObjectToJson({
            'email': email,
            'password': password,
            'scopes': scopes,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i4.AuthenticationResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> signOut(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'authentication',
            method: 'signOut',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'authentication',
          methodName: 'signOut',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> updateScopes(
    final _i1.TestSessionBuilder sessionBuilder,
    final int userId,
    final List<String> scopes,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'authentication',
            method: 'updateScopes',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'authentication',
          methodName: 'updateScopes',
          parameters: _i1.testObjectToJson({
            'userId': userId,
            'scopes': scopes,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _BasicTypesEndpoint {
  _BasicTypesEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<int?> testInt(
    final _i1.TestSessionBuilder sessionBuilder,
    final int? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicTypes',
            method: 'testInt',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicTypes',
          methodName: 'testInt',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<int?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<double?> testDouble(
    final _i1.TestSessionBuilder sessionBuilder,
    final double? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicTypes',
            method: 'testDouble',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicTypes',
          methodName: 'testDouble',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<double?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<bool?> testBool(
    final _i1.TestSessionBuilder sessionBuilder,
    final bool? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicTypes',
            method: 'testBool',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicTypes',
          methodName: 'testBool',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<DateTime?> testDateTime(
    final _i1.TestSessionBuilder sessionBuilder,
    final DateTime? dateTime,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicTypes',
            method: 'testDateTime',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicTypes',
          methodName: 'testDateTime',
          parameters: _i1.testObjectToJson({'dateTime': dateTime}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<DateTime?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String?> testString(
    final _i1.TestSessionBuilder sessionBuilder,
    final String? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicTypes',
            method: 'testString',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicTypes',
          methodName: 'testString',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i5.ByteData?> testByteData(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i5.ByteData? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicTypes',
            method: 'testByteData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicTypes',
          methodName: 'testByteData',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i5.ByteData?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Duration?> testDuration(
    final _i1.TestSessionBuilder sessionBuilder,
    final Duration? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicTypes',
            method: 'testDuration',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicTypes',
          methodName: 'testDuration',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Duration?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i2.UuidValue?> testUuid(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i2.UuidValue? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicTypes',
            method: 'testUuid',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicTypes',
          methodName: 'testUuid',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i2.UuidValue?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Uri?> testUri(
    final _i1.TestSessionBuilder sessionBuilder,
    final Uri? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicTypes',
            method: 'testUri',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicTypes',
          methodName: 'testUri',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Uri?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<BigInt?> testBigInt(
    final _i1.TestSessionBuilder sessionBuilder,
    final BigInt? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicTypes',
            method: 'testBigInt',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicTypes',
          methodName: 'testBigInt',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<BigInt?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _BasicTypesStreamingEndpoint {
  _BasicTypesStreamingEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Stream<int?> testInt(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int?> value,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'basicTypesStreaming',
              method: 'testInt',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'basicTypesStreaming',
              methodName: 'testInt',
              arguments: {},
              requestedInputStreams: ['value'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'value': value},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<double?> testDouble(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<double?> value,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<double?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'basicTypesStreaming',
              method: 'testDouble',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'basicTypesStreaming',
              methodName: 'testDouble',
              arguments: {},
              requestedInputStreams: ['value'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'value': value},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<bool?> testBool(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<bool?> value,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<bool?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'basicTypesStreaming',
              method: 'testBool',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'basicTypesStreaming',
              methodName: 'testBool',
              arguments: {},
              requestedInputStreams: ['value'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'value': value},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<DateTime?> testDateTime(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<DateTime?> value,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<DateTime?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'basicTypesStreaming',
              method: 'testDateTime',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'basicTypesStreaming',
              methodName: 'testDateTime',
              arguments: {},
              requestedInputStreams: ['value'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'value': value},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<String?> testString(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<String?> value,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<String?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'basicTypesStreaming',
              method: 'testString',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'basicTypesStreaming',
              methodName: 'testString',
              arguments: {},
              requestedInputStreams: ['value'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'value': value},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<_i5.ByteData?> testByteData(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<_i5.ByteData?> value,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<_i5.ByteData?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'basicTypesStreaming',
              method: 'testByteData',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'basicTypesStreaming',
              methodName: 'testByteData',
              arguments: {},
              requestedInputStreams: ['value'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'value': value},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<Duration?> testDuration(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<Duration?> value,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<Duration?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'basicTypesStreaming',
              method: 'testDuration',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'basicTypesStreaming',
              methodName: 'testDuration',
              arguments: {},
              requestedInputStreams: ['value'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'value': value},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<_i2.UuidValue?> testUuid(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<_i2.UuidValue?> value,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<_i2.UuidValue?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'basicTypesStreaming',
              method: 'testUuid',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'basicTypesStreaming',
              methodName: 'testUuid',
              arguments: {},
              requestedInputStreams: ['value'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'value': value},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<Uri?> testUri(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<Uri?> value,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<Uri?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'basicTypesStreaming',
              method: 'testUri',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'basicTypesStreaming',
              methodName: 'testUri',
              arguments: {},
              requestedInputStreams: ['value'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'value': value},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<BigInt?> testBigInt(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<BigInt?> value,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<BigInt?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'basicTypesStreaming',
              method: 'testBigInt',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'basicTypesStreaming',
              methodName: 'testBigInt',
              arguments: {},
              requestedInputStreams: ['value'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'value': value},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }
}

class _CloudStorageEndpoint {
  _CloudStorageEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> reset(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'cloudStorage',
            method: 'reset',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'cloudStorage',
          methodName: 'reset',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> storePublicFile(
    final _i1.TestSessionBuilder sessionBuilder,
    final String path,
    final _i5.ByteData byteData,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'cloudStorage',
            method: 'storePublicFile',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'cloudStorage',
          methodName: 'storePublicFile',
          parameters: _i1.testObjectToJson({
            'path': path,
            'byteData': byteData,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i5.ByteData?> retrievePublicFile(
    final _i1.TestSessionBuilder sessionBuilder,
    final String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'cloudStorage',
            method: 'retrievePublicFile',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'cloudStorage',
          methodName: 'retrievePublicFile',
          parameters: _i1.testObjectToJson({'path': path}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i5.ByteData?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<bool?> existsPublicFile(
    final _i1.TestSessionBuilder sessionBuilder,
    final String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'cloudStorage',
            method: 'existsPublicFile',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'cloudStorage',
          methodName: 'existsPublicFile',
          parameters: _i1.testObjectToJson({'path': path}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> deletePublicFile(
    final _i1.TestSessionBuilder sessionBuilder,
    final String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'cloudStorage',
            method: 'deletePublicFile',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'cloudStorage',
          methodName: 'deletePublicFile',
          parameters: _i1.testObjectToJson({'path': path}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String?> getPublicUrlForFile(
    final _i1.TestSessionBuilder sessionBuilder,
    final String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'cloudStorage',
            method: 'getPublicUrlForFile',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'cloudStorage',
          methodName: 'getPublicUrlForFile',
          parameters: _i1.testObjectToJson({'path': path}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String?> getDirectFilePostUrl(
    final _i1.TestSessionBuilder sessionBuilder,
    final String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'cloudStorage',
            method: 'getDirectFilePostUrl',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'cloudStorage',
          methodName: 'getDirectFilePostUrl',
          parameters: _i1.testObjectToJson({'path': path}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<bool> verifyDirectFileUpload(
    final _i1.TestSessionBuilder sessionBuilder,
    final String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'cloudStorage',
            method: 'verifyDirectFileUpload',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'cloudStorage',
          methodName: 'verifyDirectFileUpload',
          parameters: _i1.testObjectToJson({'path': path}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _S3CloudStorageEndpoint {
  _S3CloudStorageEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> storePublicFile(
    final _i1.TestSessionBuilder sessionBuilder,
    final String path,
    final _i5.ByteData byteData,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 's3CloudStorage',
            method: 'storePublicFile',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 's3CloudStorage',
          methodName: 'storePublicFile',
          parameters: _i1.testObjectToJson({
            'path': path,
            'byteData': byteData,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i5.ByteData?> retrievePublicFile(
    final _i1.TestSessionBuilder sessionBuilder,
    final String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 's3CloudStorage',
            method: 'retrievePublicFile',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 's3CloudStorage',
          methodName: 'retrievePublicFile',
          parameters: _i1.testObjectToJson({'path': path}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i5.ByteData?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<bool?> existsPublicFile(
    final _i1.TestSessionBuilder sessionBuilder,
    final String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 's3CloudStorage',
            method: 'existsPublicFile',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 's3CloudStorage',
          methodName: 'existsPublicFile',
          parameters: _i1.testObjectToJson({'path': path}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> deletePublicFile(
    final _i1.TestSessionBuilder sessionBuilder,
    final String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 's3CloudStorage',
            method: 'deletePublicFile',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 's3CloudStorage',
          methodName: 'deletePublicFile',
          parameters: _i1.testObjectToJson({'path': path}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String?> getPublicUrlForFile(
    final _i1.TestSessionBuilder sessionBuilder,
    final String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 's3CloudStorage',
            method: 'getPublicUrlForFile',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 's3CloudStorage',
          methodName: 'getPublicUrlForFile',
          parameters: _i1.testObjectToJson({'path': path}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String?> getDirectFilePostUrl(
    final _i1.TestSessionBuilder sessionBuilder,
    final String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 's3CloudStorage',
            method: 'getDirectFilePostUrl',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 's3CloudStorage',
          methodName: 'getDirectFilePostUrl',
          parameters: _i1.testObjectToJson({'path': path}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<bool> verifyDirectFileUpload(
    final _i1.TestSessionBuilder sessionBuilder,
    final String path,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 's3CloudStorage',
            method: 'verifyDirectFileUpload',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 's3CloudStorage',
          methodName: 'verifyDirectFileUpload',
          parameters: _i1.testObjectToJson({'path': path}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _CustomClassProtocolEndpoint {
  _CustomClassProtocolEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<_i6.ProtocolCustomClass> getProtocolField(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'customClassProtocol',
            method: 'getProtocolField',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'customClassProtocol',
          methodName: 'getProtocolField',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i6.ProtocolCustomClass>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _CustomTypesEndpoint {
  _CustomTypesEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<_i7.CustomClass> returnCustomClass(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i7.CustomClass data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'customTypes',
            method: 'returnCustomClass',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'customTypes',
          methodName: 'returnCustomClass',
          parameters: _i1.testObjectToJson({'data': data}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i7.CustomClass>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i7.CustomClass?> returnCustomClassNullable(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i7.CustomClass? data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'customTypes',
            method: 'returnCustomClassNullable',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'customTypes',
          methodName: 'returnCustomClassNullable',
          parameters: _i1.testObjectToJson({'data': data}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i7.CustomClass?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i7.CustomClass2> returnCustomClass2(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i7.CustomClass2 data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'customTypes',
            method: 'returnCustomClass2',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'customTypes',
          methodName: 'returnCustomClass2',
          parameters: _i1.testObjectToJson({'data': data}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i7.CustomClass2>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i7.CustomClass2?> returnCustomClass2Nullable(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i7.CustomClass2? data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'customTypes',
            method: 'returnCustomClass2Nullable',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'customTypes',
          methodName: 'returnCustomClass2Nullable',
          parameters: _i1.testObjectToJson({'data': data}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i7.CustomClass2?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i8.ExternalCustomClass> returnExternalCustomClass(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i8.ExternalCustomClass data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'customTypes',
            method: 'returnExternalCustomClass',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'customTypes',
          methodName: 'returnExternalCustomClass',
          parameters: _i1.testObjectToJson({'data': data}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i8.ExternalCustomClass>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i8.ExternalCustomClass?> returnExternalCustomClassNullable(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i8.ExternalCustomClass? data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'customTypes',
            method: 'returnExternalCustomClassNullable',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'customTypes',
          methodName: 'returnExternalCustomClassNullable',
          parameters: _i1.testObjectToJson({'data': data}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i8.ExternalCustomClass?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i9.FreezedCustomClass> returnFreezedCustomClass(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i9.FreezedCustomClass data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'customTypes',
            method: 'returnFreezedCustomClass',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'customTypes',
          methodName: 'returnFreezedCustomClass',
          parameters: _i1.testObjectToJson({'data': data}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i9.FreezedCustomClass>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i9.FreezedCustomClass?> returnFreezedCustomClassNullable(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i9.FreezedCustomClass? data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'customTypes',
            method: 'returnFreezedCustomClassNullable',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'customTypes',
          methodName: 'returnFreezedCustomClassNullable',
          parameters: _i1.testObjectToJson({'data': data}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i9.FreezedCustomClass?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i7.CustomClassWithoutProtocolSerialization>
  returnCustomClassWithoutProtocolSerialization(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i7.CustomClassWithoutProtocolSerialization data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'customTypes',
            method: 'returnCustomClassWithoutProtocolSerialization',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'customTypes',
          methodName: 'returnCustomClassWithoutProtocolSerialization',
          parameters: _i1.testObjectToJson({'data': data}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i7.CustomClassWithoutProtocolSerialization>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i7.CustomClassWithProtocolSerialization>
  returnCustomClassWithProtocolSerialization(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i7.CustomClassWithProtocolSerialization data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'customTypes',
            method: 'returnCustomClassWithProtocolSerialization',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'customTypes',
          methodName: 'returnCustomClassWithProtocolSerialization',
          parameters: _i1.testObjectToJson({'data': data}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i7.CustomClassWithProtocolSerialization>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i7.CustomClassWithProtocolSerializationMethod>
  returnCustomClassWithProtocolSerializationMethod(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i7.CustomClassWithProtocolSerializationMethod data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'customTypes',
            method: 'returnCustomClassWithProtocolSerializationMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'customTypes',
          methodName: 'returnCustomClassWithProtocolSerializationMethod',
          parameters: _i1.testObjectToJson({'data': data}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i7.CustomClassWithProtocolSerializationMethod>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _BasicDatabase {
  _BasicDatabase(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> deleteAllSimpleTestData(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'deleteAllSimpleTestData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'deleteAllSimpleTestData',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> deleteSimpleTestDataLessThan(
    final _i1.TestSessionBuilder sessionBuilder,
    final int num,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'deleteSimpleTestDataLessThan',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'deleteSimpleTestDataLessThan',
          parameters: _i1.testObjectToJson({'num': num}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> findAndDeleteSimpleTestData(
    final _i1.TestSessionBuilder sessionBuilder,
    final int num,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'findAndDeleteSimpleTestData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'findAndDeleteSimpleTestData',
          parameters: _i1.testObjectToJson({'num': num}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> createSimpleTestData(
    final _i1.TestSessionBuilder sessionBuilder,
    final int numRows,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'createSimpleTestData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'createSimpleTestData',
          parameters: _i1.testObjectToJson({'numRows': numRows}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<_i10.SimpleData>> findSimpleData(
    final _i1.TestSessionBuilder sessionBuilder, {
    required final int limit,
    required final int offset,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'findSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'findSimpleData',
          parameters: _i1.testObjectToJson({
            'limit': limit,
            'offset': offset,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<_i10.SimpleData>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i10.SimpleData?> findFirstRowSimpleData(
    final _i1.TestSessionBuilder sessionBuilder,
    final int num,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'findFirstRowSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'findFirstRowSimpleData',
          parameters: _i1.testObjectToJson({'num': num}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i10.SimpleData?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i10.SimpleData?> findByIdSimpleData(
    final _i1.TestSessionBuilder sessionBuilder,
    final int id,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'findByIdSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'findByIdSimpleData',
          parameters: _i1.testObjectToJson({'id': id}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i10.SimpleData?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i11.SimpleDataList?> findSimpleDataRowsLessThan(
    final _i1.TestSessionBuilder sessionBuilder,
    final int num,
    final int offset,
    final int limit,
    final bool descending,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'findSimpleDataRowsLessThan',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'findSimpleDataRowsLessThan',
          parameters: _i1.testObjectToJson({
            'num': num,
            'offset': offset,
            'limit': limit,
            'descending': descending,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i11.SimpleDataList?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i10.SimpleData> insertRowSimpleData(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i10.SimpleData simpleData,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'insertRowSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'insertRowSimpleData',
          parameters: _i1.testObjectToJson({'simpleData': simpleData}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i10.SimpleData>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i10.SimpleData> updateRowSimpleData(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i10.SimpleData simpleData,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'updateRowSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'updateRowSimpleData',
          parameters: _i1.testObjectToJson({'simpleData': simpleData}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i10.SimpleData>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<int> deleteRowSimpleData(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i10.SimpleData simpleData,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'deleteRowSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'deleteRowSimpleData',
          parameters: _i1.testObjectToJson({'simpleData': simpleData}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<int>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<int>> deleteWhereSimpleData(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'deleteWhereSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'deleteWhereSimpleData',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<int>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<int> countSimpleData(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'countSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'countSimpleData',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<int>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i12.Types> insertTypes(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i12.Types value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'insertTypes',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'insertTypes',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i12.Types>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i12.Types> updateTypes(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i12.Types value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'updateTypes',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'updateTypes',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i12.Types>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<int?> countTypesRows(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'countTypesRows',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'countTypesRows',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<int?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<int>> deleteAllInTypes(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'deleteAllInTypes',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'deleteAllInTypes',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<int>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i12.Types?> getTypes(
    final _i1.TestSessionBuilder sessionBuilder,
    final int id,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'getTypes',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'getTypes',
          parameters: _i1.testObjectToJson({'id': id}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i12.Types?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<int?> getTypesRawQuery(
    final _i1.TestSessionBuilder sessionBuilder,
    final int id,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'getTypesRawQuery',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'getTypesRawQuery',
          parameters: _i1.testObjectToJson({'id': id}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<int?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i13.ObjectWithEnum> storeObjectWithEnum(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i13.ObjectWithEnum object,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'storeObjectWithEnum',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'storeObjectWithEnum',
          parameters: _i1.testObjectToJson({'object': object}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i13.ObjectWithEnum>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i13.ObjectWithEnum?> getObjectWithEnum(
    final _i1.TestSessionBuilder sessionBuilder,
    final int id,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'getObjectWithEnum',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'getObjectWithEnum',
          parameters: _i1.testObjectToJson({'id': id}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i13.ObjectWithEnum?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i14.ObjectWithObject> storeObjectWithObject(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i14.ObjectWithObject object,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'storeObjectWithObject',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'storeObjectWithObject',
          parameters: _i1.testObjectToJson({'object': object}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i14.ObjectWithObject>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i14.ObjectWithObject?> getObjectWithObject(
    final _i1.TestSessionBuilder sessionBuilder,
    final int id,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'getObjectWithObject',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'getObjectWithObject',
          parameters: _i1.testObjectToJson({'id': id}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i14.ObjectWithObject?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<int> deleteAll(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'deleteAll',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'deleteAll',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<int>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<bool> testByteDataStore(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'basicDatabase',
            method: 'testByteDataStore',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'basicDatabase',
          methodName: 'testByteDataStore',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _TransactionsDatabaseEndpoint {
  _TransactionsDatabaseEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> removeRow(
    final _i1.TestSessionBuilder sessionBuilder,
    final int num,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'transactionsDatabase',
            method: 'removeRow',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'transactionsDatabase',
          methodName: 'removeRow',
          parameters: _i1.testObjectToJson({'num': num}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<bool> updateInsertDelete(
    final _i1.TestSessionBuilder sessionBuilder,
    final int numUpdate,
    final int numInsert,
    final int numDelete,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'transactionsDatabase',
            method: 'updateInsertDelete',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'transactionsDatabase',
          methodName: 'updateInsertDelete',
          parameters: _i1.testObjectToJson({
            'numUpdate': numUpdate,
            'numInsert': numInsert,
            'numDelete': numDelete,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _DeprecationEndpoint {
  _DeprecationEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  @deprecated
  _i3.Future<void> setGlobalDouble(
    final _i1.TestSessionBuilder sessionBuilder,
    final double? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'deprecation',
            method: 'setGlobalDouble',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'deprecation',
          methodName: 'setGlobalDouble',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  @Deprecated('Marking endpoint method as deprecated')
  _i3.Future<double> getGlobalDouble(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'deprecation',
            method: 'getGlobalDouble',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'deprecation',
          methodName: 'getGlobalDouble',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<double>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _DiagnosticEventTestEndpoint {
  _DiagnosticEventTestEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> submitExceptionEvent(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'diagnosticEventTest',
            method: 'submitExceptionEvent',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'diagnosticEventTest',
          methodName: 'submitExceptionEvent',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _EchoRequestEndpoint {
  _EchoRequestEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String?> echoAuthenticationKey(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'echoRequest',
            method: 'echoAuthenticationKey',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'echoRequest',
          methodName: 'echoAuthenticationKey',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<String>?> echoHttpHeader(
    final _i1.TestSessionBuilder sessionBuilder,
    final String headerName,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'echoRequest',
            method: 'echoHttpHeader',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'echoRequest',
          methodName: 'echoHttpHeader',
          parameters: _i1.testObjectToJson({'headerName': headerName}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<String>?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _EchoRequiredFieldEndpoint {
  _EchoRequiredFieldEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<_i15.ModelWithRequiredField> echoModel(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i15.ModelWithRequiredField model,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'echoRequiredField',
            method: 'echoModel',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'echoRequiredField',
          methodName: 'echoModel',
          parameters: _i1.testObjectToJson({'model': model}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i15.ModelWithRequiredField>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> throwException(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'echoRequiredField',
            method: 'throwException',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'echoRequiredField',
          methodName: 'throwException',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _EmailAuthTestMethods {
  _EmailAuthTestMethods(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String?> findVerificationCode(
    final _i1.TestSessionBuilder sessionBuilder,
    final String userName,
    final String email,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'emailAuthTestMethods',
            method: 'findVerificationCode',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'emailAuthTestMethods',
          methodName: 'findVerificationCode',
          parameters: _i1.testObjectToJson({
            'userName': userName,
            'email': email,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String?> findResetCode(
    final _i1.TestSessionBuilder sessionBuilder,
    final String email,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'emailAuthTestMethods',
            method: 'findResetCode',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'emailAuthTestMethods',
          methodName: 'findResetCode',
          parameters: _i1.testObjectToJson({'email': email}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> tearDown(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'emailAuthTestMethods',
            method: 'tearDown',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'emailAuthTestMethods',
          methodName: 'tearDown',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<bool> createUser(
    final _i1.TestSessionBuilder sessionBuilder,
    final String userName,
    final String email,
    final String password,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'emailAuthTestMethods',
            method: 'createUser',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'emailAuthTestMethods',
          methodName: 'createUser',
          parameters: _i1.testObjectToJson({
            'userName': userName,
            'email': email,
            'password': password,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _ConcreteBaseEndpoint {
  _ConcreteBaseEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> virtualMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'concreteBase',
            method: 'virtualMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'concreteBase',
          methodName: 'virtualMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String> concreteMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'concreteBase',
            method: 'concreteMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'concreteBase',
          methodName: 'concreteMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String> abstractBaseMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'concreteBase',
            method: 'abstractBaseMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'concreteBase',
          methodName: 'abstractBaseMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<String> abstractBaseStreamMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<String>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'concreteBase',
              method: 'abstractBaseStreamMethod',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'concreteBase',
              methodName: 'abstractBaseStreamMethod',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }
}

class _ConcreteSubClassEndpoint {
  _ConcreteSubClassEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> subClassVirtualMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'concreteSubClass',
            method: 'subClassVirtualMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'concreteSubClass',
          methodName: 'subClassVirtualMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String> virtualMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'concreteSubClass',
            method: 'virtualMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'concreteSubClass',
          methodName: 'virtualMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String> concreteMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'concreteSubClass',
            method: 'concreteMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'concreteSubClass',
          methodName: 'concreteMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String> abstractBaseMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'concreteSubClass',
            method: 'abstractBaseMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'concreteSubClass',
          methodName: 'abstractBaseMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<String> abstractBaseStreamMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<String>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'concreteSubClass',
              method: 'abstractBaseStreamMethod',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'concreteSubClass',
              methodName: 'abstractBaseStreamMethod',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }
}

class _IndependentEndpoint {
  _IndependentEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> subClassVirtualMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'independent',
            method: 'subClassVirtualMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'independent',
          methodName: 'subClassVirtualMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String> virtualMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'independent',
            method: 'virtualMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'independent',
          methodName: 'virtualMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String> concreteMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'independent',
            method: 'concreteMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'independent',
          methodName: 'concreteMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String> abstractBaseMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'independent',
            method: 'abstractBaseMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'independent',
          methodName: 'abstractBaseMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<String> abstractBaseStreamMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<String>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'independent',
              method: 'abstractBaseStreamMethod',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'independent',
              methodName: 'abstractBaseStreamMethod',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }
}

class _ConcreteFromModuleAbstractBaseEndpoint {
  _ConcreteFromModuleAbstractBaseEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> virtualMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'concreteFromModuleAbstractBase',
            method: 'virtualMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'concreteFromModuleAbstractBase',
          methodName: 'virtualMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String> abstractBaseMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'concreteFromModuleAbstractBase',
            method: 'abstractBaseMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'concreteFromModuleAbstractBase',
          methodName: 'abstractBaseMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _ConcreteModuleBaseEndpoint {
  _ConcreteModuleBaseEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> virtualMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'concreteModuleBase',
            method: 'virtualMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'concreteModuleBase',
          methodName: 'virtualMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String> concreteMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'concreteModuleBase',
            method: 'concreteMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'concreteModuleBase',
          methodName: 'concreteMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String> abstractBaseMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'concreteModuleBase',
            method: 'abstractBaseMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'concreteModuleBase',
          methodName: 'abstractBaseMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _LoggedInEndpoint {
  _LoggedInEndpoint(
    final _endpointDispatch,
    final _serializationManager,
  );
}

class _MyLoggedInEndpoint {
  _MyLoggedInEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> echo(
    final _i1.TestSessionBuilder sessionBuilder,
    final String value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'myLoggedIn',
            method: 'echo',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'myLoggedIn',
          methodName: 'echo',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _AdminEndpoint {
  _AdminEndpoint(
    final _endpointDispatch,
    final _serializationManager,
  );
}

class _MyAdminEndpoint {
  _MyAdminEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> echo(
    final _i1.TestSessionBuilder sessionBuilder,
    final String value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'myAdmin',
            method: 'echo',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'myAdmin',
          methodName: 'echo',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _MyConcreteAdminEndpoint {
  _MyConcreteAdminEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> echo(
    final _i1.TestSessionBuilder sessionBuilder,
    final String value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'myConcreteAdmin',
            method: 'echo',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'myConcreteAdmin',
          methodName: 'echo',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _ExceptionTestEndpoint {
  _ExceptionTestEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> throwNormalException(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'exceptionTest',
            method: 'throwNormalException',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'exceptionTest',
          methodName: 'throwNormalException',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String> throwExceptionWithData(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'exceptionTest',
            method: 'throwExceptionWithData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'exceptionTest',
          methodName: 'throwExceptionWithData',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String> workingWithoutException(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'exceptionTest',
            method: 'workingWithoutException',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'exceptionTest',
          methodName: 'workingWithoutException',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _FailedCallsEndpoint {
  _FailedCallsEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> failedCall(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'failedCalls',
            method: 'failedCall',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'failedCalls',
          methodName: 'failedCall',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> failedDatabaseQuery(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'failedCalls',
            method: 'failedDatabaseQuery',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'failedCalls',
          methodName: 'failedDatabaseQuery',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<bool> failedDatabaseQueryCaughtException(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'failedCalls',
            method: 'failedDatabaseQueryCaughtException',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'failedCalls',
          methodName: 'failedDatabaseQueryCaughtException',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> slowCall(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'failedCalls',
            method: 'slowCall',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'failedCalls',
          methodName: 'slowCall',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> caughtException(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'failedCalls',
            method: 'caughtException',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'failedCalls',
          methodName: 'caughtException',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _FieldScopesEndpoint {
  _FieldScopesEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> storeObject(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i16.ObjectFieldScopes object,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'fieldScopes',
            method: 'storeObject',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'fieldScopes',
          methodName: 'storeObject',
          parameters: _i1.testObjectToJson({'object': object}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i16.ObjectFieldScopes?> retrieveObject(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'fieldScopes',
            method: 'retrieveObject',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'fieldScopes',
          methodName: 'retrieveObject',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i16.ObjectFieldScopes?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _FutureCallsEndpoint {
  _FutureCallsEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> makeFutureCall(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i10.SimpleData? data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'futureCalls',
            method: 'makeFutureCall',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'futureCalls',
          methodName: 'makeFutureCall',
          parameters: _i1.testObjectToJson({'data': data}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> makeFutureCallThatThrows(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i10.SimpleData? data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'futureCalls',
            method: 'makeFutureCallThatThrows',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'futureCalls',
          methodName: 'makeFutureCallThatThrows',
          parameters: _i1.testObjectToJson({'data': data}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _ListParametersEndpoint {
  _ListParametersEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<List<int>> returnIntList(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<int> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnIntList',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnIntList',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<int>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<List<int>>> returnIntListList(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<List<int>> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnIntListList',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnIntListList',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<List<int>>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<int>?> returnIntListNullable(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<int>? list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnIntListNullable',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnIntListNullable',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<int>?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<List<int>?>> returnIntListNullableList(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<List<int>?> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnIntListNullableList',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnIntListNullableList',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<List<int>?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<List<int>>?> returnIntListListNullable(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<List<int>>? list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnIntListListNullable',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnIntListListNullable',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<List<int>>?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<int?>> returnIntListNullableInts(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<int?> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnIntListNullableInts',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnIntListNullableInts',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<int?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<int?>?> returnNullableIntListNullableInts(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<int?>? list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnNullableIntListNullableInts',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnNullableIntListNullableInts',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<int?>?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<double>> returnDoubleList(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<double> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnDoubleList',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnDoubleList',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<double>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<double?>> returnDoubleListNullableDoubles(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<double?> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnDoubleListNullableDoubles',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnDoubleListNullableDoubles',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<double?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<bool>> returnBoolList(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<bool> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnBoolList',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnBoolList',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<bool>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<bool?>> returnBoolListNullableBools(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<bool?> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnBoolListNullableBools',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnBoolListNullableBools',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<bool?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<String>> returnStringList(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<String> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnStringList',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnStringList',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<String>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<String?>> returnStringListNullableStrings(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<String?> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnStringListNullableStrings',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnStringListNullableStrings',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<String?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<DateTime>> returnDateTimeList(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<DateTime> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnDateTimeList',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnDateTimeList',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<DateTime>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<DateTime?>> returnDateTimeListNullableDateTimes(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<DateTime?> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnDateTimeListNullableDateTimes',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnDateTimeListNullableDateTimes',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<DateTime?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<_i5.ByteData>> returnByteDataList(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<_i5.ByteData> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnByteDataList',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnByteDataList',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<_i5.ByteData>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<_i5.ByteData?>> returnByteDataListNullableByteDatas(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<_i5.ByteData?> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnByteDataListNullableByteDatas',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnByteDataListNullableByteDatas',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<_i5.ByteData?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<_i10.SimpleData>> returnSimpleDataList(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<_i10.SimpleData> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnSimpleDataList',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnSimpleDataList',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<_i10.SimpleData>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<_i10.SimpleData?>> returnSimpleDataListNullableSimpleData(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<_i10.SimpleData?> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnSimpleDataListNullableSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnSimpleDataListNullableSimpleData',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<_i10.SimpleData?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<_i10.SimpleData>?> returnSimpleDataListNullable(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<_i10.SimpleData>? list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnSimpleDataListNullable',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnSimpleDataListNullable',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<_i10.SimpleData>?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<_i10.SimpleData?>?>
  returnNullableSimpleDataListNullableSimpleData(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<_i10.SimpleData?>? list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnNullableSimpleDataListNullableSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnNullableSimpleDataListNullableSimpleData',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<_i10.SimpleData?>?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<Duration>> returnDurationList(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<Duration> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnDurationList',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnDurationList',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<Duration>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<Duration?>> returnDurationListNullableDurations(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<Duration?> list,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'listParameters',
            method: 'returnDurationListNullableDurations',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'listParameters',
          methodName: 'returnDurationListNullableDurations',
          parameters: _i1.testObjectToJson({'list': list}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<Duration?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _LoggingEndpoint {
  _LoggingEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> slowQueryMethod(
    final _i1.TestSessionBuilder sessionBuilder,
    final int seconds,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'logging',
            method: 'slowQueryMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'logging',
          methodName: 'slowQueryMethod',
          parameters: _i1.testObjectToJson({'seconds': seconds}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> queryMethod(
    final _i1.TestSessionBuilder sessionBuilder,
    final int queries,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'logging',
            method: 'queryMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'logging',
          methodName: 'queryMethod',
          parameters: _i1.testObjectToJson({'queries': queries}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> failedQueryMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'logging',
            method: 'failedQueryMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'logging',
          methodName: 'failedQueryMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> slowMethod(
    final _i1.TestSessionBuilder sessionBuilder,
    final int delayMillis,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'logging',
            method: 'slowMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'logging',
          methodName: 'slowMethod',
          parameters: _i1.testObjectToJson({'delayMillis': delayMillis}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> failingMethod(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'logging',
            method: 'failingMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'logging',
          methodName: 'failingMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> emptyMethod(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'logging',
            method: 'emptyMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'logging',
          methodName: 'emptyMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> log(
    final _i1.TestSessionBuilder sessionBuilder,
    final String message,
    final List<int> logLevels,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'logging',
            method: 'log',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'logging',
          methodName: 'log',
          parameters: _i1.testObjectToJson({
            'message': message,
            'logLevels': logLevels,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> logInfo(
    final _i1.TestSessionBuilder sessionBuilder,
    final String message,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'logging',
            method: 'logInfo',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'logging',
          methodName: 'logInfo',
          parameters: _i1.testObjectToJson({'message': message}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> logDebugAndInfoAndError(
    final _i1.TestSessionBuilder sessionBuilder,
    final String debug,
    final String info,
    final String error,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'logging',
            method: 'logDebugAndInfoAndError',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'logging',
          methodName: 'logDebugAndInfoAndError',
          parameters: _i1.testObjectToJson({
            'debug': debug,
            'info': info,
            'error': error,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> twoQueries(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'logging',
            method: 'twoQueries',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'logging',
          methodName: 'twoQueries',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<int> streamEmpty(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> input,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'logging',
              method: 'streamEmpty',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'logging',
              methodName: 'streamEmpty',
              arguments: {},
              requestedInputStreams: ['input'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'input': input},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<int> streamLogging(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> input,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'logging',
              method: 'streamLogging',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'logging',
              methodName: 'streamLogging',
              arguments: {},
              requestedInputStreams: ['input'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'input': input},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<int> streamQueryLogging(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> input,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'logging',
              method: 'streamQueryLogging',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'logging',
              methodName: 'streamQueryLogging',
              arguments: {},
              requestedInputStreams: ['input'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'input': input},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<int> streamException(final _i1.TestSessionBuilder sessionBuilder) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'logging',
              method: 'streamException',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'logging',
              methodName: 'streamException',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }
}

class _StreamLogging {
  _StreamLogging(
    final _endpointDispatch,
    final _serializationManager,
  );
}

class _StreamQueryLogging {
  _StreamQueryLogging(
    final _endpointDispatch,
    final _serializationManager,
  );
}

class _LoggingDisabledEndpoint {
  _LoggingDisabledEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> logInfo(
    final _i1.TestSessionBuilder sessionBuilder,
    final String message,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'loggingDisabled',
            method: 'logInfo',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'loggingDisabled',
          methodName: 'logInfo',
          parameters: _i1.testObjectToJson({'message': message}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _MapParametersEndpoint {
  _MapParametersEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<Map<String, int>> returnIntMap(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, int> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnIntMap',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnIntMap',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, int>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, int>?> returnIntMapNullable(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, int>? map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnIntMapNullable',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnIntMapNullable',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, int>?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, Map<String, int>>> returnNestedIntMap(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, Map<String, int>> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnNestedIntMap',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnNestedIntMap',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, Map<String, int>>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, int?>> returnIntMapNullableInts(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, int?> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnIntMapNullableInts',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnIntMapNullableInts',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, int?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, int?>?> returnNullableIntMapNullableInts(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, int?>? map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnNullableIntMapNullableInts',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnNullableIntMapNullableInts',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, int?>?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<int, int>> returnIntIntMap(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<int, int> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnIntIntMap',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnIntIntMap',
          parameters: _i1.testObjectToJson({
            'map': _i17.mapContainerToJson(map),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then((final map) => _i17.Protocol().deserialize<Map<int, int>>(map));
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, Map<int, int>>> returnNestedIntIntMap(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, Map<int, int>> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnNestedIntIntMap',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnNestedIntIntMap',
          parameters: _i1.testObjectToJson({
            'map': _i17.mapContainerToJson(map),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, Map<int, int>>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<_i18.TestEnum, int>> returnEnumIntMap(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<_i18.TestEnum, int> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnEnumIntMap',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnEnumIntMap',
          parameters: _i1.testObjectToJson({
            'map': _i17.mapContainerToJson(map),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final map) =>
                  _i17.Protocol().deserialize<Map<_i18.TestEnum, int>>(map),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, _i18.TestEnum>> returnEnumMap(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, _i18.TestEnum> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnEnumMap',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnEnumMap',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, _i18.TestEnum>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, double>> returnDoubleMap(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, double> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnDoubleMap',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnDoubleMap',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, double>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, double?>> returnDoubleMapNullableDoubles(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, double?> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnDoubleMapNullableDoubles',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnDoubleMapNullableDoubles',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, double?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, bool>> returnBoolMap(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, bool> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnBoolMap',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnBoolMap',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, bool>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, bool?>> returnBoolMapNullableBools(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, bool?> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnBoolMapNullableBools',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnBoolMapNullableBools',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, bool?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, String>> returnStringMap(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, String> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnStringMap',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnStringMap',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, String>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, String?>> returnStringMapNullableStrings(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, String?> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnStringMapNullableStrings',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnStringMapNullableStrings',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, String?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, DateTime>> returnDateTimeMap(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, DateTime> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnDateTimeMap',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnDateTimeMap',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, DateTime>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, DateTime?>> returnDateTimeMapNullableDateTimes(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, DateTime?> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnDateTimeMapNullableDateTimes',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnDateTimeMapNullableDateTimes',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, DateTime?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, _i5.ByteData>> returnByteDataMap(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, _i5.ByteData> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnByteDataMap',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnByteDataMap',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, _i5.ByteData>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, _i5.ByteData?>> returnByteDataMapNullableByteDatas(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, _i5.ByteData?> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnByteDataMapNullableByteDatas',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnByteDataMapNullableByteDatas',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, _i5.ByteData?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, _i10.SimpleData>> returnSimpleDataMap(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, _i10.SimpleData> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnSimpleDataMap',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnSimpleDataMap',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, _i10.SimpleData>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, _i10.SimpleData?>>
  returnSimpleDataMapNullableSimpleData(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, _i10.SimpleData?> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnSimpleDataMapNullableSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnSimpleDataMapNullableSimpleData',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, _i10.SimpleData?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, _i10.SimpleData>?> returnSimpleDataMapNullable(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, _i10.SimpleData>? map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnSimpleDataMapNullable',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnSimpleDataMapNullable',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, _i10.SimpleData>?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, _i10.SimpleData?>?>
  returnNullableSimpleDataMapNullableSimpleData(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, _i10.SimpleData?>? map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnNullableSimpleDataMapNullableSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnNullableSimpleDataMapNullableSimpleData',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, _i10.SimpleData?>?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, Duration>> returnDurationMap(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, Duration> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnDurationMap',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnDurationMap',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, Duration>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, Duration?>> returnDurationMapNullableDurations(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, Duration?> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnDurationMapNullableDurations',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnDurationMapNullableDurations',
          parameters: _i1.testObjectToJson({'map': map}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Map<String, Duration?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<(Map<int, String>, String), String>>
  returnNestedNonStringKeyedMapInsideRecordInsideMap(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<(Map<int, String>, String), String> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnNestedNonStringKeyedMapInsideRecordInsideMap',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName: 'returnNestedNonStringKeyedMapInsideRecordInsideMap',
          parameters: _i1.testObjectToJson({
            'map': _i17.mapContainerToJson(map),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<Map<(Map<int, String>, String), String>>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, (Map<int, int>,)>>
  returnDeeplyNestedNonStringKeyedMapInsideRecordInsideMap(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, (Map<int, int>,)> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'mapParameters',
            method: 'returnDeeplyNestedNonStringKeyedMapInsideRecordInsideMap',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'mapParameters',
          methodName:
              'returnDeeplyNestedNonStringKeyedMapInsideRecordInsideMap',
          parameters: _i1.testObjectToJson({
            'map': _i17.mapContainerToJson(map),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<Map<String, (Map<int, int>,)>>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _MethodSignaturePermutationsEndpoint {
  _MethodSignaturePermutationsEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> echoPositionalArg(
    final _i1.TestSessionBuilder sessionBuilder,
    final String string,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'methodSignaturePermutations',
            method: 'echoPositionalArg',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'methodSignaturePermutations',
          methodName: 'echoPositionalArg',
          parameters: _i1.testObjectToJson({'string': string}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String> echoNamedArg(
    final _i1.TestSessionBuilder sessionBuilder, {
    required final String string,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'methodSignaturePermutations',
            method: 'echoNamedArg',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'methodSignaturePermutations',
          methodName: 'echoNamedArg',
          parameters: _i1.testObjectToJson({'string': string}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String?> echoNullableNamedArg(
    final _i1.TestSessionBuilder sessionBuilder, {
    final String? string,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'methodSignaturePermutations',
            method: 'echoNullableNamedArg',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'methodSignaturePermutations',
          methodName: 'echoNullableNamedArg',
          parameters: _i1.testObjectToJson({'string': string}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String?> echoOptionalArg(
    final _i1.TestSessionBuilder sessionBuilder, [
    final String? string,
  ]) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'methodSignaturePermutations',
            method: 'echoOptionalArg',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'methodSignaturePermutations',
          methodName: 'echoOptionalArg',
          parameters: _i1.testObjectToJson({'string': string}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<String?>> echoPositionalAndNamedArgs(
    final _i1.TestSessionBuilder sessionBuilder,
    final String string1, {
    required final String string2,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'methodSignaturePermutations',
            method: 'echoPositionalAndNamedArgs',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'methodSignaturePermutations',
          methodName: 'echoPositionalAndNamedArgs',
          parameters: _i1.testObjectToJson({
            'string1': string1,
            'string2': string2,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<String?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<String?>> echoPositionalAndNullableNamedArgs(
    final _i1.TestSessionBuilder sessionBuilder,
    final String string1, {
    final String? string2,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'methodSignaturePermutations',
            method: 'echoPositionalAndNullableNamedArgs',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'methodSignaturePermutations',
          methodName: 'echoPositionalAndNullableNamedArgs',
          parameters: _i1.testObjectToJson({
            'string1': string1,
            'string2': string2,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<String?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<String?>> echoPositionalAndOptionalArgs(
    final _i1.TestSessionBuilder sessionBuilder,
    final String string1, [
    final String? string2,
  ]) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'methodSignaturePermutations',
            method: 'echoPositionalAndOptionalArgs',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'methodSignaturePermutations',
          methodName: 'echoPositionalAndOptionalArgs',
          parameters: _i1.testObjectToJson({
            'string1': string1,
            'string2': string2,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<String?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<String> echoNamedArgStream(
    final _i1.TestSessionBuilder sessionBuilder, {
    required final _i3.Stream<String> strings,
  }) {
    final _localTestStreamManager = _i1.TestStreamManager<String>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodSignaturePermutations',
              method: 'echoNamedArgStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodSignaturePermutations',
              methodName: 'echoNamedArgStream',
              arguments: {},
              requestedInputStreams: ['strings'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'strings': strings},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<String> echoNamedArgStreamAsFuture(
    final _i1.TestSessionBuilder sessionBuilder, {
    required final _i3.Stream<String> strings,
  }) async {
    final _localTestStreamManager = _i1.TestStreamManager<String>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodSignaturePermutations',
              method: 'echoNamedArgStreamAsFuture',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodSignaturePermutations',
              methodName: 'echoNamedArgStreamAsFuture',
              arguments: {},
              requestedInputStreams: ['strings'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'strings': strings},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Stream<String> echoPositionalArgStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<String> strings,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<String>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodSignaturePermutations',
              method: 'echoPositionalArgStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodSignaturePermutations',
              methodName: 'echoPositionalArgStream',
              arguments: {},
              requestedInputStreams: ['strings'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'strings': strings},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<String> echoPositionalArgStreamAsFuture(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<String> strings,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<String>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodSignaturePermutations',
              method: 'echoPositionalArgStreamAsFuture',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodSignaturePermutations',
              methodName: 'echoPositionalArgStreamAsFuture',
              arguments: {},
              requestedInputStreams: ['strings'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'strings': strings},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }
}

class _MethodStreaming {
  _MethodStreaming(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Stream<int> simpleStream(final _i1.TestSessionBuilder sessionBuilder) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'simpleStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'simpleStream',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<int> neverEndingStreamWithDelay(
    final _i1.TestSessionBuilder sessionBuilder,
    final int millisecondsDelay,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'neverEndingStreamWithDelay',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'neverEndingStreamWithDelay',
              arguments: {'millisecondsDelay': millisecondsDelay},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<void> methodCallEndpoint(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'methodStreaming',
            method: 'methodCallEndpoint',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'methodStreaming',
          methodName: 'methodCallEndpoint',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<int> intReturnFromStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> stream,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'intReturnFromStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'intReturnFromStream',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Future<int?> nullableIntReturnFromStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int?> stream,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<int?>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'nullableIntReturnFromStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'nullableIntReturnFromStream',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Stream<int?> getBroadcastStream(final _i1.TestSessionBuilder sessionBuilder) {
    final _localTestStreamManager = _i1.TestStreamManager<int?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'getBroadcastStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'getBroadcastStream',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<bool> wasBroadcastStreamCanceled(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'methodStreaming',
            method: 'wasBroadcastStreamCanceled',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'methodStreaming',
          methodName: 'wasBroadcastStreamCanceled',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<bool> wasSessionWillCloseListenerCalled(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'methodStreaming',
            method: 'wasSessionWillCloseListenerCalled',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'methodStreaming',
          methodName: 'wasSessionWillCloseListenerCalled',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<int> intStreamFromValue(
    final _i1.TestSessionBuilder sessionBuilder,
    final int value,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'intStreamFromValue',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'intStreamFromValue',
              arguments: {'value': value},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<int> intEchoStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> stream,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'intEchoStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'intEchoStream',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<dynamic> dynamicEchoStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<dynamic> stream,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<dynamic>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'dynamicEchoStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'dynamicEchoStream',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<int?> nullableIntEchoStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int?> stream,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'nullableIntEchoStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'nullableIntEchoStream',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<void> voidReturnAfterStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> stream,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<void>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'voidReturnAfterStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'voidReturnAfterStream',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Stream<int> multipleIntEchoStreams(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> stream1,
    final _i3.Stream<int> stream2,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'multipleIntEchoStreams',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'multipleIntEchoStreams',
              arguments: {},
              requestedInputStreams: [
                'stream1',
                'stream2',
              ],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {
            'stream1': stream1,
            'stream2': stream2,
          },
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<void> directVoidReturnWithStreamInput(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> stream,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<void>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'directVoidReturnWithStreamInput',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'directVoidReturnWithStreamInput',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Future<int> directOneIntReturnWithStreamInput(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> stream,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'directOneIntReturnWithStreamInput',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'directOneIntReturnWithStreamInput',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Future<int> simpleInputReturnStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> stream,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'simpleInputReturnStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'simpleInputReturnStream',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Stream<int> simpleStreamWithParameter(
    final _i1.TestSessionBuilder sessionBuilder,
    final int value,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'simpleStreamWithParameter',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'simpleStreamWithParameter',
              arguments: {'value': value},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<_i10.SimpleData> simpleDataStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final int value,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<_i10.SimpleData>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'simpleDataStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'simpleDataStream',
              arguments: {'value': value},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<_i10.SimpleData> simpleInOutDataStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<_i10.SimpleData> simpleDataStream,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<_i10.SimpleData>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'simpleInOutDataStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'simpleInOutDataStream',
              arguments: {},
              requestedInputStreams: ['simpleDataStream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'simpleDataStream': simpleDataStream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<List<int>> simpleListInOutIntStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<List<int>> simpleDataListStream,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<List<int>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'simpleListInOutIntStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'simpleListInOutIntStream',
              arguments: {},
              requestedInputStreams: ['simpleDataListStream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'simpleDataListStream': simpleDataListStream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<List<_i10.SimpleData>> simpleListInOutDataStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<List<_i10.SimpleData>> simpleDataListStream,
  ) {
    final _localTestStreamManager =
        _i1.TestStreamManager<List<_i10.SimpleData>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'simpleListInOutDataStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'simpleListInOutDataStream',
              arguments: {},
              requestedInputStreams: ['simpleDataListStream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'simpleDataListStream': simpleDataListStream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<List<_i4.UserInfo>> simpleListInOutOtherModuleTypeStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<List<_i4.UserInfo>> userInfoListStream,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<List<_i4.UserInfo>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'simpleListInOutOtherModuleTypeStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'simpleListInOutOtherModuleTypeStream',
              arguments: {},
              requestedInputStreams: ['userInfoListStream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'userInfoListStream': userInfoListStream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<List<_i10.SimpleData>?> simpleNullableListInOutNullableDataStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<List<_i10.SimpleData>?> simpleDataListStream,
  ) {
    final _localTestStreamManager =
        _i1.TestStreamManager<List<_i10.SimpleData>?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'simpleNullableListInOutNullableDataStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'simpleNullableListInOutNullableDataStream',
              arguments: {},
              requestedInputStreams: ['simpleDataListStream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'simpleDataListStream': simpleDataListStream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<List<_i10.SimpleData?>> simpleListInOutNullableDataStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<List<_i10.SimpleData?>> simpleDataListStream,
  ) {
    final _localTestStreamManager =
        _i1.TestStreamManager<List<_i10.SimpleData?>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'simpleListInOutNullableDataStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'simpleListInOutNullableDataStream',
              arguments: {},
              requestedInputStreams: ['simpleDataListStream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'simpleDataListStream': simpleDataListStream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<Set<int>> simpleSetInOutIntStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<Set<int>> simpleDataSetStream,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<Set<int>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'simpleSetInOutIntStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'simpleSetInOutIntStream',
              arguments: {},
              requestedInputStreams: ['simpleDataSetStream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'simpleDataSetStream': simpleDataSetStream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<Set<_i10.SimpleData>> simpleSetInOutDataStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<Set<_i10.SimpleData>> simpleDataSetStream,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<Set<_i10.SimpleData>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'simpleSetInOutDataStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'simpleSetInOutDataStream',
              arguments: {},
              requestedInputStreams: ['simpleDataSetStream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'simpleDataSetStream': simpleDataSetStream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<Set<_i10.SimpleData>> nestedSetInListInOutDataStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<List<Set<_i10.SimpleData>>> simpleDataSetStream,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<Set<_i10.SimpleData>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'nestedSetInListInOutDataStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'nestedSetInListInOutDataStream',
              arguments: {},
              requestedInputStreams: ['simpleDataSetStream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'simpleDataSetStream': simpleDataSetStream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<void> simpleEndpoint(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'methodStreaming',
            method: 'simpleEndpoint',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'methodStreaming',
          methodName: 'simpleEndpoint',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> intParameter(
    final _i1.TestSessionBuilder sessionBuilder,
    final int value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'methodStreaming',
            method: 'intParameter',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'methodStreaming',
          methodName: 'intParameter',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<int> doubleInputValue(
    final _i1.TestSessionBuilder sessionBuilder,
    final int value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'methodStreaming',
            method: 'doubleInputValue',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'methodStreaming',
          methodName: 'doubleInputValue',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<int>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> delayedResponse(
    final _i1.TestSessionBuilder sessionBuilder,
    final int delay,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'methodStreaming',
            method: 'delayedResponse',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'methodStreaming',
          methodName: 'delayedResponse',
          parameters: _i1.testObjectToJson({'delay': delay}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<int> delayedStreamResponse(
    final _i1.TestSessionBuilder sessionBuilder,
    final int delay,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'delayedStreamResponse',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'delayedStreamResponse',
              arguments: {'delay': delay},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<void> delayedNeverListenedInputStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final int delay,
    final _i3.Stream<int> stream,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<void>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'delayedNeverListenedInputStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'delayedNeverListenedInputStream',
              arguments: {'delay': delay},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Future<void> delayedPausedInputStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final int delay,
    final _i3.Stream<int> stream,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<void>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'delayedPausedInputStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'delayedPausedInputStream',
              arguments: {'delay': delay},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Future<void> completeAllDelayedResponses(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'methodStreaming',
            method: 'completeAllDelayedResponses',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'methodStreaming',
          methodName: 'completeAllDelayedResponses',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> inStreamThrowsException(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> stream,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<void>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'inStreamThrowsException',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'inStreamThrowsException',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Future<void> inStreamThrowsSerializableException(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> stream,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<void>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'inStreamThrowsSerializableException',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'inStreamThrowsSerializableException',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Stream<int> outStreamThrowsException(
    final _i1.TestSessionBuilder sessionBuilder,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'outStreamThrowsException',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'outStreamThrowsException',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<int> outStreamThrowsSerializableException(
    final _i1.TestSessionBuilder sessionBuilder,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'outStreamThrowsSerializableException',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'outStreamThrowsSerializableException',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<void> throwsExceptionVoid(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> stream,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<void>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'throwsExceptionVoid',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'throwsExceptionVoid',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Future<void> throwsSerializableExceptionVoid(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> stream,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<void>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'throwsSerializableExceptionVoid',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'throwsSerializableExceptionVoid',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Future<int> throwsException(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> stream,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'throwsException',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'throwsException',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Future<int> throwsSerializableException(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> stream,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'throwsSerializableException',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'throwsSerializableException',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Stream<int> throwsExceptionStream(final _i1.TestSessionBuilder sessionBuilder) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'throwsExceptionStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'throwsExceptionStream',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<int> exceptionThrownBeforeStreamReturn(
    final _i1.TestSessionBuilder sessionBuilder,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'exceptionThrownBeforeStreamReturn',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'exceptionThrownBeforeStreamReturn',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<int> exceptionThrownInStreamReturn(
    final _i1.TestSessionBuilder sessionBuilder,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'exceptionThrownInStreamReturn',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'exceptionThrownInStreamReturn',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<int> throwsSerializableExceptionStream(
    final _i1.TestSessionBuilder sessionBuilder,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'throwsSerializableExceptionStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'throwsSerializableExceptionStream',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<bool> didInputStreamHaveError(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> stream,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<bool>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'didInputStreamHaveError',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'didInputStreamHaveError',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Future<bool> didInputStreamHaveSerializableExceptionError(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> stream,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<bool>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'methodStreaming',
              method: 'didInputStreamHaveSerializableExceptionError',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'methodStreaming',
              methodName: 'didInputStreamHaveSerializableExceptionError',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }
}

class _AuthenticatedMethodStreaming {
  _AuthenticatedMethodStreaming(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Stream<int> simpleStream(final _i1.TestSessionBuilder sessionBuilder) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'authenticatedMethodStreaming',
              method: 'simpleStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'authenticatedMethodStreaming',
              methodName: 'simpleStream',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<int> intEchoStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> stream,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'authenticatedMethodStreaming',
              method: 'intEchoStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'authenticatedMethodStreaming',
              methodName: 'intEchoStream',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }
}

class _ModuleEndpointSubclass {
  _ModuleEndpointSubclass(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> echoString(
    final _i1.TestSessionBuilder sessionBuilder,
    final String value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleEndpointSubclass',
            method: 'echoString',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleEndpointSubclass',
          methodName: 'echoString',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<(int, BigInt)> echoRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final (int, BigInt) value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleEndpointSubclass',
            method: 'echoRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleEndpointSubclass',
          methodName: 'echoRecord',
          parameters: _i1.testObjectToJson({
            'value': _i17.mapRecordToJson(value),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol().deserialize<(int, BigInt)>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<int>> echoContainer(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<int> value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleEndpointSubclass',
            method: 'echoContainer',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleEndpointSubclass',
          methodName: 'echoContainer',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<int>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i19.ModuleClass> echoModel(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i19.ModuleClass value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleEndpointSubclass',
            method: 'echoModel',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleEndpointSubclass',
          methodName: 'echoModel',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i19.ModuleClass>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _ModuleEndpointAdaptation {
  _ModuleEndpointAdaptation(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> echoString(
    final _i1.TestSessionBuilder sessionBuilder,
    final String value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleEndpointAdaptation',
            method: 'echoString',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleEndpointAdaptation',
          methodName: 'echoString',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<(int, BigInt)> echoRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final (int, BigInt) value, [
    final int? multiplier,
  ]) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleEndpointAdaptation',
            method: 'echoRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleEndpointAdaptation',
          methodName: 'echoRecord',
          parameters: _i1.testObjectToJson({
            'value': _i17.mapRecordToJson(value),
            'multiplier': multiplier,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol().deserialize<(int, BigInt)>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<int>> echoContainer(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<int> value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleEndpointAdaptation',
            method: 'echoContainer',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleEndpointAdaptation',
          methodName: 'echoContainer',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<int>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i19.ModuleClass> echoModel(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i19.ModuleClass value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleEndpointAdaptation',
            method: 'echoModel',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleEndpointAdaptation',
          methodName: 'echoModel',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i19.ModuleClass>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _ModuleEndpointReduction {
  _ModuleEndpointReduction(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<(int, BigInt)> echoRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final (int, BigInt) value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleEndpointReduction',
            method: 'echoRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleEndpointReduction',
          methodName: 'echoRecord',
          parameters: _i1.testObjectToJson({
            'value': _i17.mapRecordToJson(value),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol().deserialize<(int, BigInt)>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<int>> echoContainer(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<int> value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleEndpointReduction',
            method: 'echoContainer',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleEndpointReduction',
          methodName: 'echoContainer',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<int>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i19.ModuleClass> echoModel(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i19.ModuleClass value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleEndpointReduction',
            method: 'echoModel',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleEndpointReduction',
          methodName: 'echoModel',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i19.ModuleClass>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _ModuleEndpointExtension {
  _ModuleEndpointExtension(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> greet(
    final _i1.TestSessionBuilder sessionBuilder,
    final String name,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleEndpointExtension',
            method: 'greet',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleEndpointExtension',
          methodName: 'greet',
          parameters: _i1.testObjectToJson({'name': name}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> ignoredMethod(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleEndpointExtension',
            method: 'ignoredMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleEndpointExtension',
          methodName: 'ignoredMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String> echoString(
    final _i1.TestSessionBuilder sessionBuilder,
    final String value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleEndpointExtension',
            method: 'echoString',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleEndpointExtension',
          methodName: 'echoString',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<(int, BigInt)> echoRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final (int, BigInt) value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleEndpointExtension',
            method: 'echoRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleEndpointExtension',
          methodName: 'echoRecord',
          parameters: _i1.testObjectToJson({
            'value': _i17.mapRecordToJson(value),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol().deserialize<(int, BigInt)>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<int>> echoContainer(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<int> value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleEndpointExtension',
            method: 'echoContainer',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleEndpointExtension',
          methodName: 'echoContainer',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<int>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i19.ModuleClass> echoModel(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i19.ModuleClass value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleEndpointExtension',
            method: 'echoModel',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleEndpointExtension',
          methodName: 'echoModel',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i19.ModuleClass>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _ModuleSerializationEndpoint {
  _ModuleSerializationEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<bool> serializeModuleObject(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleSerialization',
            method: 'serializeModuleObject',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleSerialization',
          methodName: 'serializeModuleObject',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i19.ModuleClass> modifyModuleObject(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i19.ModuleClass object,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleSerialization',
            method: 'modifyModuleObject',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleSerialization',
          methodName: 'modifyModuleObject',
          parameters: _i1.testObjectToJson({'object': object}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i19.ModuleClass>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i20.ModuleDatatype> serializeNestedModuleObject(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'moduleSerialization',
            method: 'serializeNestedModuleObject',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'moduleSerialization',
          methodName: 'serializeNestedModuleObject',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i20.ModuleDatatype>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _NamedParametersEndpoint {
  _NamedParametersEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<bool> namedParametersMethod(
    final _i1.TestSessionBuilder sessionBuilder, {
    required final int namedInt,
    required final int intWithDefaultValue,
    final int? nullableInt,
    final int? nullableIntWithDefaultValue,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'namedParameters',
            method: 'namedParametersMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'namedParameters',
          methodName: 'namedParametersMethod',
          parameters: _i1.testObjectToJson({
            'namedInt': namedInt,
            'intWithDefaultValue': intWithDefaultValue,
            'nullableInt': nullableInt,
            'nullableIntWithDefaultValue': nullableIntWithDefaultValue,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<bool> namedParametersMethodEqualInts(
    final _i1.TestSessionBuilder sessionBuilder, {
    required final int namedInt,
    final int? nullableInt,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'namedParameters',
            method: 'namedParametersMethodEqualInts',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'namedParameters',
          methodName: 'namedParametersMethodEqualInts',
          parameters: _i1.testObjectToJson({
            'namedInt': namedInt,
            'nullableInt': nullableInt,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _OptionalParametersEndpoint {
  _OptionalParametersEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<int?> returnOptionalInt(
    final _i1.TestSessionBuilder sessionBuilder, [
    final int? optionalInt,
  ]) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'optionalParameters',
            method: 'returnOptionalInt',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'optionalParameters',
          methodName: 'returnOptionalInt',
          parameters: _i1.testObjectToJson({'optionalInt': optionalInt}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<int?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _RecordParametersEndpoint {
  _RecordParametersEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<(int,)> returnRecordOfInt(
    final _i1.TestSessionBuilder sessionBuilder,
    final (int,) record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnRecordOfInt',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnRecordOfInt',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then((final record) => _i17.Protocol().deserialize<(int,)>(record));
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<(int,)?> returnNullableRecordOfInt(
    final _i1.TestSessionBuilder sessionBuilder,
    final (int,)? record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnNullableRecordOfInt',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnNullableRecordOfInt',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then((final record) => _i17.Protocol().deserialize<(int,)?>(record));
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<(int?,)> returnRecordOfNullableInt(
    final _i1.TestSessionBuilder sessionBuilder,
    final (int?,) record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnRecordOfNullableInt',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnRecordOfNullableInt',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then((final record) => _i17.Protocol().deserialize<(int?,)>(record));
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<(int?,)?> returnNullableRecordOfNullableInt(
    final _i1.TestSessionBuilder sessionBuilder,
    final (int?,)? record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnNullableRecordOfNullableInt',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnNullableRecordOfNullableInt',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then((final record) => _i17.Protocol().deserialize<(int?,)?>(record));
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<(int?,)?> streamNullableRecordOfNullableInt(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<(int?,)?> values,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<(int?,)?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'recordParameters',
              method: 'streamNullableRecordOfNullableInt',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'recordParameters',
              methodName: 'streamNullableRecordOfNullableInt',
              arguments: {},
              requestedInputStreams: ['values'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'values': values},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<(int, String)> returnIntStringRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final (int, String) record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnIntStringRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnIntStringRecord',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol().deserialize<(int, String)>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<(int, String)?> returnNullableIntStringRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final (int, String)? record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnNullableIntStringRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnNullableIntStringRecord',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol().deserialize<(int, String)?>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<(int, _i10.SimpleData)> returnIntSimpleDataRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final (int, _i10.SimpleData) record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnIntSimpleDataRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnIntSimpleDataRecord',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) =>
                  _i17.Protocol().deserialize<(int, _i10.SimpleData)>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<(int, _i10.SimpleData)?> returnNullableIntSimpleDataRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final (int, _i10.SimpleData)? record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnNullableIntSimpleDataRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnNullableIntSimpleDataRecord',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) =>
                  _i17.Protocol().deserialize<(int, _i10.SimpleData)?>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<(Map<String, int>,)> returnStringKeyedMapRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final (Map<String, int>,) record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnStringKeyedMapRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnStringKeyedMapRecord',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) =>
                  _i17.Protocol().deserialize<(Map<String, int>,)>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<(Map<int, int>,)> returnNonStringKeyedMapRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final (Map<int, int>,) record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnNonStringKeyedMapRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnNonStringKeyedMapRecord',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol().deserialize<(Map<int, int>,)>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<(Set<(int,)>,)> returnSetWithNestedRecordRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final (Set<(int,)>,) record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnSetWithNestedRecordRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnSetWithNestedRecordRecord',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol().deserialize<(Set<(int,)>,)>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<({int number, String text})> returnNamedIntStringRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final ({int number, String text}) record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnNamedIntStringRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnNamedIntStringRecord',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<({int number, String text})>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<({int number, String text})?> returnNamedNullableIntStringRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final ({int number, String text})? record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnNamedNullableIntStringRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnNamedNullableIntStringRecord',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<({int number, String text})?>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<({_i10.SimpleData data, int number})>
  returnRecordOfNamedIntAndObject(
    final _i1.TestSessionBuilder sessionBuilder,
    final ({_i10.SimpleData data, int number}) record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnRecordOfNamedIntAndObject',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnRecordOfNamedIntAndObject',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<({_i10.SimpleData data, int number})>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<({_i10.SimpleData data, int number})?>
  returnNullableRecordOfNamedIntAndObject(
    final _i1.TestSessionBuilder sessionBuilder,
    final ({_i10.SimpleData data, int number})? record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnNullableRecordOfNamedIntAndObject',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnNullableRecordOfNamedIntAndObject',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<({_i10.SimpleData data, int number})?>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<({_i10.SimpleData? data, int? number})>
  returnRecordOfNamedNullableIntAndNullableObject(
    final _i1.TestSessionBuilder sessionBuilder,
    final ({_i10.SimpleData? data, int? number}) record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnRecordOfNamedNullableIntAndNullableObject',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnRecordOfNamedNullableIntAndNullableObject',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<({_i10.SimpleData? data, int? number})>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<({Map<int, int> intIntMap})> returnNamedNonStringKeyedMapRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final ({Map<int, int> intIntMap}) record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnNamedNonStringKeyedMapRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnNamedNonStringKeyedMapRecord',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<({Map<int, int> intIntMap})>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<({Set<(bool,)> boolSet})> returnNamedSetWithNestedRecordRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final ({Set<(bool,)> boolSet}) record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnNamedSetWithNestedRecordRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnNamedSetWithNestedRecordRecord',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) =>
                  _i17.Protocol().deserialize<({Set<(bool,)> boolSet})>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<(Map<(Map<int, String>, String), String>,)>
  returnNestedNonStringKeyedMapInsideRecordInsideMapInsideRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final (Map<(Map<int, String>, String), String>,) map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method:
                'returnNestedNonStringKeyedMapInsideRecordInsideMapInsideRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName:
              'returnNestedNonStringKeyedMapInsideRecordInsideMapInsideRecord',
          parameters: _i1.testObjectToJson({'map': _i17.mapRecordToJson(map)}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<(Map<(Map<int, String>, String), String>,)>(
                    record,
                  ),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<(int, {_i10.SimpleData data})> returnRecordTypedef(
    final _i1.TestSessionBuilder sessionBuilder,
    final (int, {_i10.SimpleData data}) record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnRecordTypedef',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnRecordTypedef',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<(int, {_i10.SimpleData data})>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<(int, {_i10.SimpleData data})?> returnNullableRecordTypedef(
    final _i1.TestSessionBuilder sessionBuilder,
    final (int, {_i10.SimpleData data})? record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnNullableRecordTypedef',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnNullableRecordTypedef',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<(int, {_i10.SimpleData data})?>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<(int, _i10.SimpleData)>> returnListOfIntSimpleDataRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<(int, _i10.SimpleData)> recordList,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnListOfIntSimpleDataRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnListOfIntSimpleDataRecord',
          parameters: _i1.testObjectToJson({
            'recordList': _i17.mapContainerToJson(recordList),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<List<(int, _i10.SimpleData)>>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<(int, _i10.SimpleData)?>>
  returnListOfNullableIntSimpleDataRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<(int, _i10.SimpleData)?> record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnListOfNullableIntSimpleDataRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnListOfNullableIntSimpleDataRecord',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapContainerToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<List<(int, _i10.SimpleData)?>>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<(int, _i10.SimpleData)>> returnSetOfIntSimpleDataRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<(int, _i10.SimpleData)> recordSet,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnSetOfIntSimpleDataRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnSetOfIntSimpleDataRecord',
          parameters: _i1.testObjectToJson({
            'recordSet': _i17.mapContainerToJson(recordSet),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<Set<(int, _i10.SimpleData)>>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<(int, _i10.SimpleData)?>>
  returnSetOfNullableIntSimpleDataRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<(int, _i10.SimpleData)?> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnSetOfNullableIntSimpleDataRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnSetOfNullableIntSimpleDataRecord',
          parameters: _i1.testObjectToJson({
            'set': _i17.mapContainerToJson(set),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<Set<(int, _i10.SimpleData)?>>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<(int, _i10.SimpleData)>?>
  returnNullableSetOfIntSimpleDataRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<(int, _i10.SimpleData)>? recordSet,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnNullableSetOfIntSimpleDataRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnNullableSetOfIntSimpleDataRecord',
          parameters: _i1.testObjectToJson({
            'recordSet': recordSet == null
                ? null
                : _i17.mapContainerToJson(recordSet),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<Set<(int, _i10.SimpleData)>?>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, (int, _i10.SimpleData)>>
  returnStringMapOfIntSimpleDataRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, (int, _i10.SimpleData)> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnStringMapOfIntSimpleDataRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnStringMapOfIntSimpleDataRecord',
          parameters: _i1.testObjectToJson({
            'map': _i17.mapContainerToJson(map),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<Map<String, (int, _i10.SimpleData)>>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, (int, _i10.SimpleData)?>>
  returnStringMapOfNullableIntSimpleDataRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<String, (int, _i10.SimpleData)?> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnStringMapOfNullableIntSimpleDataRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnStringMapOfNullableIntSimpleDataRecord',
          parameters: _i1.testObjectToJson({
            'map': _i17.mapContainerToJson(map),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<Map<String, (int, _i10.SimpleData)?>>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<(String, int), (int, _i10.SimpleData)>>
  returnRecordMapOfIntSimpleDataRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final Map<(String, int), (int, _i10.SimpleData)> map,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnRecordMapOfIntSimpleDataRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnRecordMapOfIntSimpleDataRecord',
          parameters: _i1.testObjectToJson({
            'map': _i17.mapContainerToJson(map),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<Map<(String, int), (int, _i10.SimpleData)>>(
                    record,
                  ),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Map<String, List<Set<(int,)>>>> returnStringMapOfListOfRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<List<Map<String, (int,)>>> input,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnStringMapOfListOfRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnStringMapOfListOfRecord',
          parameters: _i1.testObjectToJson({
            'input': _i17.mapContainerToJson(input),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<Map<String, List<Set<(int,)>>>>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<({(_i10.SimpleData, double) namedSubRecord})>
  returnNestedNamedRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final ({(_i10.SimpleData, double) namedSubRecord}) record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnNestedNamedRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnNestedNamedRecord',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<({(_i10.SimpleData, double) namedSubRecord})>(
                    record,
                  ),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<({(_i10.SimpleData, double)? namedSubRecord})>
  returnNestedNullableNamedRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final ({(_i10.SimpleData, double)? namedSubRecord}) record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnNestedNullableNamedRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnNestedNullableNamedRecord',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<({(_i10.SimpleData, double)? namedSubRecord})>(
                    record,
                  ),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<((int, String), {(_i10.SimpleData, double) namedSubRecord})>
  returnNestedPositionalAndNamedRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final ((int, String), {(_i10.SimpleData, double) namedSubRecord}) record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnNestedPositionalAndNamedRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnNestedPositionalAndNamedRecord',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) =>
                  _i17.Protocol().deserialize<
                    ((int, String), {(_i10.SimpleData, double) namedSubRecord})
                  >(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<((int, String), {(_i10.SimpleData, double) namedSubRecord})>>
  returnListOfNestedPositionalAndNamedRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<((int, String), {(_i10.SimpleData, double) namedSubRecord})>
    recordList,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'returnListOfNestedPositionalAndNamedRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'returnListOfNestedPositionalAndNamedRecord',
          parameters: _i1.testObjectToJson({
            'recordList': _i17.mapContainerToJson(recordList),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) =>
                  _i17.Protocol().deserialize<
                    List<
                      (
                        (int, String), {
                        (_i10.SimpleData, double) namedSubRecord,
                      })
                    >
                  >(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<
    List<((int, String), {(_i10.SimpleData, double) namedSubRecord})?>?
  >
  streamNullableListOfNullableNestedPositionalAndNamedRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<((int, String), {(_i10.SimpleData, double) namedSubRecord})?>?
    initialValue,
    final _i3.Stream<
      List<((int, String), {(_i10.SimpleData, double) namedSubRecord})?>?
    >
    values,
  ) {
    final _localTestStreamManager =
        _i1.TestStreamManager<
          List<((int, String), {(_i10.SimpleData, double) namedSubRecord})?>?
        >();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'recordParameters',
              method:
                  'streamNullableListOfNullableNestedPositionalAndNamedRecord',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'recordParameters',
              methodName:
                  'streamNullableListOfNullableNestedPositionalAndNamedRecord',
              arguments: {
                'initialValue': initialValue == null
                    ? null
                    : _i21.jsonDecode(
                        _i2.SerializationManager.encode(
                          _i17.mapContainerToJson(initialValue),
                        ),
                      ),
              },
              requestedInputStreams: ['values'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'values': values},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<_i22.TypesRecord> echoModelClassWithRecordField(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i22.TypesRecord value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'echoModelClassWithRecordField',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'echoModelClassWithRecordField',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i22.TypesRecord>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i22.TypesRecord?> echoNullableModelClassWithRecordField(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i22.TypesRecord? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'echoNullableModelClassWithRecordField',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'echoNullableModelClassWithRecordField',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i22.TypesRecord?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i19.ModuleClass?>
  echoNullableModelClassWithRecordFieldFromExternalModule(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i19.ModuleClass? value,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'echoNullableModelClassWithRecordFieldFromExternalModule',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'echoNullableModelClassWithRecordFieldFromExternalModule',
          parameters: _i1.testObjectToJson({'value': value}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i19.ModuleClass?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<_i22.TypesRecord> streamOfModelClassWithRecordField(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i22.TypesRecord initialValue,
    final _i3.Stream<_i22.TypesRecord> values,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<_i22.TypesRecord>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'recordParameters',
              method: 'streamOfModelClassWithRecordField',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'recordParameters',
              methodName: 'streamOfModelClassWithRecordField',
              arguments: {
                'initialValue': _i21.jsonDecode(
                  _i2.SerializationManager.encode(initialValue),
                ),
              },
              requestedInputStreams: ['values'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'values': values},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<_i22.TypesRecord?> streamOfNullableModelClassWithRecordField(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i22.TypesRecord? initialValue,
    final _i3.Stream<_i22.TypesRecord?> values,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<_i22.TypesRecord?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'recordParameters',
              method: 'streamOfNullableModelClassWithRecordField',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'recordParameters',
              methodName: 'streamOfNullableModelClassWithRecordField',
              arguments: {
                'initialValue': _i21.jsonDecode(
                  _i2.SerializationManager.encode(initialValue),
                ),
              },
              requestedInputStreams: ['values'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'values': values},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<_i19.ModuleClass?>
  streamOfNullableModelClassWithRecordFieldFromExternalModule(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i19.ModuleClass? initialValue,
    final _i3.Stream<_i19.ModuleClass?> values,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<_i19.ModuleClass?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'recordParameters',
              method:
                  'streamOfNullableModelClassWithRecordFieldFromExternalModule',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'recordParameters',
              methodName:
                  'streamOfNullableModelClassWithRecordFieldFromExternalModule',
              arguments: {
                'initialValue': _i21.jsonDecode(
                  _i2.SerializationManager.encode(initialValue),
                ),
              },
              requestedInputStreams: ['values'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'values': values},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<int> recordParametersWithCustomNames(
    final _i1.TestSessionBuilder sessionBuilder,
    final (int,) positionalRecord, {
    required final (int,) namedRecord,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'recordParameters',
            method: 'recordParametersWithCustomNames',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'recordParameters',
          methodName: 'recordParametersWithCustomNames',
          parameters: _i1.testObjectToJson({
            'positionalRecord': _i17.mapRecordToJson(positionalRecord),
            'namedRecord': _i17.mapRecordToJson(namedRecord),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<int>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _RedisEndpoint {
  _RedisEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> setSimpleData(
    final _i1.TestSessionBuilder sessionBuilder,
    final String key,
    final _i10.SimpleData data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'redis',
            method: 'setSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'redis',
          methodName: 'setSimpleData',
          parameters: _i1.testObjectToJson({
            'key': key,
            'data': data,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> setSimpleDataWithLifetime(
    final _i1.TestSessionBuilder sessionBuilder,
    final String key,
    final _i10.SimpleData data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'redis',
            method: 'setSimpleDataWithLifetime',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'redis',
          methodName: 'setSimpleDataWithLifetime',
          parameters: _i1.testObjectToJson({
            'key': key,
            'data': data,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i10.SimpleData?> getSimpleData(
    final _i1.TestSessionBuilder sessionBuilder,
    final String key,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'redis',
            method: 'getSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'redis',
          methodName: 'getSimpleData',
          parameters: _i1.testObjectToJson({'key': key}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i10.SimpleData?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> deleteSimpleData(
    final _i1.TestSessionBuilder sessionBuilder,
    final String key,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'redis',
            method: 'deleteSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'redis',
          methodName: 'deleteSimpleData',
          parameters: _i1.testObjectToJson({'key': key}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> resetMessageCentralTest(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'redis',
            method: 'resetMessageCentralTest',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'redis',
          methodName: 'resetMessageCentralTest',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i10.SimpleData?> listenToChannel(
    final _i1.TestSessionBuilder sessionBuilder,
    final String channel,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'redis',
            method: 'listenToChannel',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'redis',
          methodName: 'listenToChannel',
          parameters: _i1.testObjectToJson({'channel': channel}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i10.SimpleData?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> postToChannel(
    final _i1.TestSessionBuilder sessionBuilder,
    final String channel,
    final _i10.SimpleData data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'redis',
            method: 'postToChannel',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'redis',
          methodName: 'postToChannel',
          parameters: _i1.testObjectToJson({
            'channel': channel,
            'data': data,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<int> countSubscribedChannels(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'redis',
            method: 'countSubscribedChannels',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'redis',
          methodName: 'countSubscribedChannels',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<int>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _ServerOnlyScopedFieldModelEndpoint {
  _ServerOnlyScopedFieldModelEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<_i23.ScopeServerOnlyField> getScopeServerOnlyField(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'serverOnlyScopedFieldModel',
            method: 'getScopeServerOnlyField',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'serverOnlyScopedFieldModel',
          methodName: 'getScopeServerOnlyField',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i23.ScopeServerOnlyField>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _ServerOnlyScopedFieldChildModelEndpoint {
  _ServerOnlyScopedFieldChildModelEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<_i24.ScopeServerOnlyFieldChild> getProtocolField(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'serverOnlyScopedFieldChildModel',
            method: 'getProtocolField',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'serverOnlyScopedFieldChildModel',
          methodName: 'getProtocolField',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i24.ScopeServerOnlyFieldChild>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _SessionAuthenticationEndpoint {
  _SessionAuthenticationEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String?> getAuthenticatedUserId(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'sessionAuthentication',
            method: 'getAuthenticatedUserId',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'sessionAuthentication',
          methodName: 'getAuthenticatedUserId',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<String>> getAuthenticatedScopes(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'sessionAuthentication',
            method: 'getAuthenticatedScopes',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'sessionAuthentication',
          methodName: 'getAuthenticatedScopes',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<String>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String?> getAuthenticatedAuthId(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'sessionAuthentication',
            method: 'getAuthenticatedAuthId',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'sessionAuthentication',
          methodName: 'getAuthenticatedAuthId',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i25.SessionAuthInfo> getAuthenticationInfo(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'sessionAuthentication',
            method: 'getAuthenticationInfo',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'sessionAuthentication',
          methodName: 'getAuthenticationInfo',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i25.SessionAuthInfo>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<bool> isAuthenticated(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'sessionAuthentication',
            method: 'isAuthenticated',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'sessionAuthentication',
          methodName: 'isAuthenticated',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<String?> streamAuthenticatedUserId(
    final _i1.TestSessionBuilder sessionBuilder,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<String?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'sessionAuthentication',
              method: 'streamAuthenticatedUserId',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'sessionAuthentication',
              methodName: 'streamAuthenticatedUserId',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<bool> streamIsAuthenticated(
    final _i1.TestSessionBuilder sessionBuilder,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<bool>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'sessionAuthentication',
              method: 'streamIsAuthenticated',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'sessionAuthentication',
              methodName: 'streamIsAuthenticated',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }
}

class _SessionAuthenticationStreamingEndpoint {
  _SessionAuthenticationStreamingEndpoint(
    final _endpointDispatch,
    final _serializationManager,
  );
}

class _SetParametersEndpoint {
  _SetParametersEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<Set<int>> returnIntSet(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<int> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnIntSet',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnIntSet',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<int>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<Set<int>>> returnIntSetSet(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<Set<int>> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnIntSetSet',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnIntSetSet',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<Set<int>>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<List<int>>> returnIntListSet(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<List<int>> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnIntListSet',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnIntListSet',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<List<int>>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<int>?> returnIntSetNullable(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<int>? set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnIntSetNullable',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnIntSetNullable',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<int>?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<Set<int>?>> returnIntSetNullableSet(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<Set<int>?> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnIntSetNullableSet',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnIntSetNullableSet',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<Set<int>?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<Set<int>>?> returnIntSetSetNullable(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<Set<int>>? set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnIntSetSetNullable',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnIntSetSetNullable',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<Set<int>>?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<int?>> returnIntSetNullableInts(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<int?> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnIntSetNullableInts',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnIntSetNullableInts',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<int?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<int?>?> returnNullableIntSetNullableInts(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<int?>? set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnNullableIntSetNullableInts',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnNullableIntSetNullableInts',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<int?>?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<double>> returnDoubleSet(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<double> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnDoubleSet',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnDoubleSet',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<double>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<double?>> returnDoubleSetNullableDoubles(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<double?> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnDoubleSetNullableDoubles',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnDoubleSetNullableDoubles',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<double?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<bool>> returnBoolSet(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<bool> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnBoolSet',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnBoolSet',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<bool>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<bool?>> returnBoolSetNullableBools(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<bool?> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnBoolSetNullableBools',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnBoolSetNullableBools',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<bool?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<String>> returnStringSet(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<String> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnStringSet',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnStringSet',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<String>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<String?>> returnStringSetNullableStrings(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<String?> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnStringSetNullableStrings',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnStringSetNullableStrings',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<String?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<DateTime>> returnDateTimeSet(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<DateTime> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnDateTimeSet',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnDateTimeSet',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<DateTime>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<DateTime?>> returnDateTimeSetNullableDateTimes(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<DateTime?> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnDateTimeSetNullableDateTimes',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnDateTimeSetNullableDateTimes',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<DateTime?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<_i5.ByteData>> returnByteDataSet(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<_i5.ByteData> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnByteDataSet',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnByteDataSet',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<_i5.ByteData>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<_i5.ByteData?>> returnByteDataSetNullableByteDatas(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<_i5.ByteData?> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnByteDataSetNullableByteDatas',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnByteDataSetNullableByteDatas',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<_i5.ByteData?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<_i10.SimpleData>> returnSimpleDataSet(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<_i10.SimpleData> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnSimpleDataSet',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnSimpleDataSet',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<_i10.SimpleData>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<_i10.SimpleData?>> returnSimpleDataSetNullableSimpleData(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<_i10.SimpleData?> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnSimpleDataSetNullableSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnSimpleDataSetNullableSimpleData',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<_i10.SimpleData?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<Duration>> returnDurationSet(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<Duration> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnDurationSet',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnDurationSet',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<Duration>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<Set<Duration?>> returnDurationSetNullableDurations(
    final _i1.TestSessionBuilder sessionBuilder,
    final Set<Duration?> set,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'setParameters',
            method: 'returnDurationSetNullableDurations',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'setParameters',
          methodName: 'returnDurationSetNullableDurations',
          parameters: _i1.testObjectToJson({'set': set}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<Set<Duration?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _SignInRequiredEndpoint {
  _SignInRequiredEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<bool> testMethod(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'signInRequired',
            method: 'testMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'signInRequired',
          methodName: 'testMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _AdminScopeRequiredEndpoint {
  _AdminScopeRequiredEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<bool> testMethod(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'adminScopeRequired',
            method: 'testMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'adminScopeRequired',
          methodName: 'testMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _SimpleEndpoint {
  _SimpleEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<void> setGlobalInt(
    final _i1.TestSessionBuilder sessionBuilder,
    final int? value, [
    final int? secondValue,
  ]) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'simple',
            method: 'setGlobalInt',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'simple',
          methodName: 'setGlobalInt',
          parameters: _i1.testObjectToJson({
            'value': value,
            'secondValue': secondValue,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> addToGlobalInt(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'simple',
            method: 'addToGlobalInt',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'simple',
          methodName: 'addToGlobalInt',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<int> getGlobalInt(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'simple',
            method: 'getGlobalInt',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'simple',
          methodName: 'getGlobalInt',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<int>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<String> hello(
    final _i1.TestSessionBuilder sessionBuilder,
    final String name,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'simple',
            method: 'hello',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'simple',
          methodName: 'hello',
          parameters: _i1.testObjectToJson({'name': name}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _StreamingEndpoint {
  _StreamingEndpoint(
    final _endpointDispatch,
    final _serializationManager,
  );
}

class _StreamingLoggingEndpoint {
  _StreamingLoggingEndpoint(
    final _endpointDispatch,
    final _serializationManager,
  );
}

class _SubSubDirTestEndpoint {
  _SubSubDirTestEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> testMethod(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'subSubDirTest',
            method: 'testMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'subSubDirTest',
          methodName: 'testMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _SubDirTestEndpoint {
  _SubDirTestEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> testMethod(final _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'subDirTest',
            method: 'testMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'subDirTest',
          methodName: 'testMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _TestToolsEndpoint {
  _TestToolsEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<_i2.UuidValue> returnsSessionId(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'returnsSessionId',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'returnsSessionId',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i2.UuidValue>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<String?>> returnsSessionEndpointAndMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'returnsSessionEndpointAndMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'returnsSessionEndpointAndMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<String?>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<_i2.UuidValue> returnsSessionIdFromStream(
    final _i1.TestSessionBuilder sessionBuilder,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<_i2.UuidValue>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'testTools',
              method: 'returnsSessionIdFromStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'testTools',
              methodName: 'returnsSessionIdFromStream',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<String?> returnsSessionEndpointAndMethodFromStream(
    final _i1.TestSessionBuilder sessionBuilder,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<String?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'testTools',
              method: 'returnsSessionEndpointAndMethodFromStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'testTools',
              methodName: 'returnsSessionEndpointAndMethodFromStream',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<String> returnsString(
    final _i1.TestSessionBuilder sessionBuilder,
    final String string,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'returnsString',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'returnsString',
          parameters: _i1.testObjectToJson({'string': string}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<int> returnsStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final int n,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'testTools',
              method: 'returnsStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'testTools',
              methodName: 'returnsStream',
              arguments: {'n': n},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<List<int>> returnsListFromInputStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> numbers,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<List<int>>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'testTools',
              method: 'returnsListFromInputStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'testTools',
              methodName: 'returnsListFromInputStream',
              arguments: {},
              requestedInputStreams: ['numbers'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'numbers': numbers},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Future<List<_i10.SimpleData>> returnsSimpleDataListFromInputStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<_i10.SimpleData> simpleDatas,
  ) async {
    final _localTestStreamManager =
        _i1.TestStreamManager<List<_i10.SimpleData>>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'testTools',
              method: 'returnsSimpleDataListFromInputStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'testTools',
              methodName: 'returnsSimpleDataListFromInputStream',
              arguments: {},
              requestedInputStreams: ['simpleDatas'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'simpleDatas': simpleDatas},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Stream<int> returnsStreamFromInputStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> numbers,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'testTools',
              method: 'returnsStreamFromInputStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'testTools',
              methodName: 'returnsStreamFromInputStream',
              arguments: {},
              requestedInputStreams: ['numbers'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'numbers': numbers},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<_i10.SimpleData> returnsSimpleDataStreamFromInputStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<_i10.SimpleData> simpleDatas,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<_i10.SimpleData>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'testTools',
              method: 'returnsSimpleDataStreamFromInputStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'testTools',
              methodName: 'returnsSimpleDataStreamFromInputStream',
              arguments: {},
              requestedInputStreams: ['simpleDatas'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'simpleDatas': simpleDatas},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<void> postNumberToSharedStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final int number,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'postNumberToSharedStream',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'postNumberToSharedStream',
          parameters: _i1.testObjectToJson({'number': number}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<int> postNumberToSharedStreamAndReturnStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final int number,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'testTools',
              method: 'postNumberToSharedStreamAndReturnStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'testTools',
              methodName: 'postNumberToSharedStreamAndReturnStream',
              arguments: {'number': number},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<int> listenForNumbersOnSharedStream(
    final _i1.TestSessionBuilder sessionBuilder,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'testTools',
              method: 'listenForNumbersOnSharedStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'testTools',
              methodName: 'listenForNumbersOnSharedStream',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<void> createSimpleData(
    final _i1.TestSessionBuilder sessionBuilder,
    final int data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'createSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'createSimpleData',
          parameters: _i1.testObjectToJson({'data': data}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<_i10.SimpleData>> getAllSimpleData(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'getAllSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'getAllSimpleData',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<_i10.SimpleData>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> createSimpleDatasInsideTransactions(
    final _i1.TestSessionBuilder sessionBuilder,
    final int data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'createSimpleDatasInsideTransactions',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'createSimpleDatasInsideTransactions',
          parameters: _i1.testObjectToJson({'data': data}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> createSimpleDataAndThrowInsideTransaction(
    final _i1.TestSessionBuilder sessionBuilder,
    final int data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'createSimpleDataAndThrowInsideTransaction',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'createSimpleDataAndThrowInsideTransaction',
          parameters: _i1.testObjectToJson({'data': data}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> createSimpleDatasInParallelTransactionCalls(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'createSimpleDatasInParallelTransactionCalls',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'createSimpleDatasInParallelTransactionCalls',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i10.SimpleData> echoSimpleData(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i10.SimpleData simpleData,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'echoSimpleData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'echoSimpleData',
          parameters: _i1.testObjectToJson({'simpleData': simpleData}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i10.SimpleData>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<_i10.SimpleData>> echoSimpleDatas(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<_i10.SimpleData> simpleDatas,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'echoSimpleDatas',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'echoSimpleDatas',
          parameters: _i1.testObjectToJson({'simpleDatas': simpleDatas}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<_i10.SimpleData>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i12.Types> echoTypes(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i12.Types typesModel,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'echoTypes',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'echoTypes',
          parameters: _i1.testObjectToJson({'typesModel': typesModel}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i12.Types>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<_i12.Types>> echoTypesList(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<_i12.Types> typesList,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'echoTypesList',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'echoTypesList',
          parameters: _i1.testObjectToJson({'typesList': typesList}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<_i12.Types>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i20.ModuleDatatype> echoModuleDatatype(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i20.ModuleDatatype moduleDatatype,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'echoModuleDatatype',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'echoModuleDatatype',
          parameters: _i1.testObjectToJson({'moduleDatatype': moduleDatatype}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i20.ModuleDatatype>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<_i20.ModuleDatatype?> streamModuleDatatype(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i20.ModuleDatatype? initialValue,
    final _i3.Stream<_i20.ModuleDatatype?> values,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<_i20.ModuleDatatype?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'testTools',
              method: 'streamModuleDatatype',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'testTools',
              methodName: 'streamModuleDatatype',
              arguments: {
                'initialValue': _i21.jsonDecode(
                  _i2.SerializationManager.encode(initialValue),
                ),
              },
              requestedInputStreams: ['values'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'values': values},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<_i19.ModuleClass> echoModuleClass(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i19.ModuleClass moduleClass,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'echoModuleClass',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'echoModuleClass',
          parameters: _i1.testObjectToJson({'moduleClass': moduleClass}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i19.ModuleClass>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<_i19.ModuleClass?> streamModuleClass(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i19.ModuleClass? initialValue,
    final _i3.Stream<_i19.ModuleClass?> values,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<_i19.ModuleClass?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'testTools',
              method: 'streamModuleClass',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'testTools',
              methodName: 'streamModuleClass',
              arguments: {
                'initialValue': _i21.jsonDecode(
                  _i2.SerializationManager.encode(initialValue),
                ),
              },
              requestedInputStreams: ['values'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'values': values},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<(String, (int, bool))> echoRecord(
    final _i1.TestSessionBuilder sessionBuilder,
    final (String, (int, bool)) record,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'echoRecord',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'echoRecord',
          parameters: _i1.testObjectToJson({
            'record': _i17.mapRecordToJson(record),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) =>
                  _i17.Protocol().deserialize<(String, (int, bool))>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<(String, (int, bool))>> echoRecords(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<(String, (int, bool))> records,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'echoRecords',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'echoRecords',
          parameters: _i1.testObjectToJson({
            'records': _i17.mapContainerToJson(records),
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then(
              (final record) => _i17.Protocol()
                  .deserialize<List<(String, (int, bool))>>(record),
            );
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<
    (String, (Map<String, int>, {bool flag, _i10.SimpleData simpleData}))
  >
  recordEchoStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final (String, (Map<String, int>, {bool flag, _i10.SimpleData simpleData}))
    initialValue,
    final _i3.Stream<
      (String, (Map<String, int>, {bool flag, _i10.SimpleData simpleData}))
    >
    stream,
  ) {
    final _localTestStreamManager =
        _i1.TestStreamManager<
          (String, (Map<String, int>, {bool flag, _i10.SimpleData simpleData}))
        >();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'testTools',
              method: 'recordEchoStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'testTools',
              methodName: 'recordEchoStream',
              arguments: {
                'initialValue': _i21.jsonDecode(
                  _i2.SerializationManager.encode(
                    _i17.mapRecordToJson(initialValue),
                  ),
                ),
              },
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<List<(String, int)>> listOfRecordEchoStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<(String, int)> initialValue,
    final _i3.Stream<List<(String, int)>> stream,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<List<(String, int)>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'testTools',
              method: 'listOfRecordEchoStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'testTools',
              methodName: 'listOfRecordEchoStream',
              arguments: {
                'initialValue': _i21.jsonDecode(
                  _i2.SerializationManager.encode(
                    _i17.mapContainerToJson(initialValue),
                  ),
                ),
              },
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<
    (String, (Map<String, int>, {bool flag, _i10.SimpleData simpleData}))?
  >
  nullableRecordEchoStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final (String, (Map<String, int>, {bool flag, _i10.SimpleData simpleData}))?
    initialValue,
    final _i3.Stream<
      (String, (Map<String, int>, {bool flag, _i10.SimpleData simpleData}))?
    >
    stream,
  ) {
    final _localTestStreamManager =
        _i1.TestStreamManager<
          (String, (Map<String, int>, {bool flag, _i10.SimpleData simpleData}))?
        >();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'testTools',
              method: 'nullableRecordEchoStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'testTools',
              methodName: 'nullableRecordEchoStream',
              arguments: {
                'initialValue': _i21.jsonDecode(
                  _i2.SerializationManager.encode(
                    _i17.mapRecordToJson(initialValue),
                  ),
                ),
              },
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<List<(String, int)>?> nullableListOfRecordEchoStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final List<(String, int)>? initialValue,
    final _i3.Stream<List<(String, int)>?> stream,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<List<(String, int)>?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'testTools',
              method: 'nullableListOfRecordEchoStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'testTools',
              methodName: 'nullableListOfRecordEchoStream',
              arguments: {
                'initialValue': initialValue == null
                    ? null
                    : _i21.jsonDecode(
                        _i2.SerializationManager.encode(
                          _i17.mapContainerToJson(initialValue),
                        ),
                      ),
              },
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Stream<_i22.TypesRecord?> modelWithRecordsEchoStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i22.TypesRecord? initialValue,
    final _i3.Stream<_i22.TypesRecord?> stream,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<_i22.TypesRecord?>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'testTools',
              method: 'modelWithRecordsEchoStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'testTools',
              methodName: 'modelWithRecordsEchoStream',
              arguments: {
                'initialValue': _i21.jsonDecode(
                  _i2.SerializationManager.encode(initialValue),
                ),
              },
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<void> logMessageWithSession(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'logMessageWithSession',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'logMessageWithSession',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> addWillCloseListenerToSessionAndThrow(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'addWillCloseListenerToSessionAndThrow',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'addWillCloseListenerToSessionAndThrow',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<int> addWillCloseListenerToSessionIntStreamMethodAndThrow(
    final _i1.TestSessionBuilder sessionBuilder,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'testTools',
              method: 'addWillCloseListenerToSessionIntStreamMethodAndThrow',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'testTools',
              methodName:
                  'addWillCloseListenerToSessionIntStreamMethodAndThrow',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<void> putInLocalCache(
    final _i1.TestSessionBuilder sessionBuilder,
    final String key,
    final _i10.SimpleData data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'putInLocalCache',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'putInLocalCache',
          parameters: _i1.testObjectToJson({
            'key': key,
            'data': data,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i10.SimpleData?> getFromLocalCache(
    final _i1.TestSessionBuilder sessionBuilder,
    final String key,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'getFromLocalCache',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'getFromLocalCache',
          parameters: _i1.testObjectToJson({'key': key}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i10.SimpleData?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> putInLocalPrioCache(
    final _i1.TestSessionBuilder sessionBuilder,
    final String key,
    final _i10.SimpleData data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'putInLocalPrioCache',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'putInLocalPrioCache',
          parameters: _i1.testObjectToJson({
            'key': key,
            'data': data,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i10.SimpleData?> getFromLocalPrioCache(
    final _i1.TestSessionBuilder sessionBuilder,
    final String key,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'getFromLocalPrioCache',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'getFromLocalPrioCache',
          parameters: _i1.testObjectToJson({'key': key}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i10.SimpleData?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> putInQueryCache(
    final _i1.TestSessionBuilder sessionBuilder,
    final String key,
    final _i10.SimpleData data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'putInQueryCache',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'putInQueryCache',
          parameters: _i1.testObjectToJson({
            'key': key,
            'data': data,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i10.SimpleData?> getFromQueryCache(
    final _i1.TestSessionBuilder sessionBuilder,
    final String key,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'getFromQueryCache',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'getFromQueryCache',
          parameters: _i1.testObjectToJson({'key': key}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i10.SimpleData?>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> putInLocalCacheWithGroup(
    final _i1.TestSessionBuilder sessionBuilder,
    final String key,
    final _i10.SimpleData data,
    final String group,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'testTools',
            method: 'putInLocalCacheWithGroup',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'testTools',
          methodName: 'putInLocalCacheWithGroup',
          parameters: _i1.testObjectToJson({
            'key': key,
            'data': data,
            'group': group,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _AuthenticatedTestToolsEndpoint {
  _AuthenticatedTestToolsEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> returnsString(
    final _i1.TestSessionBuilder sessionBuilder,
    final String string,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'authenticatedTestTools',
            method: 'returnsString',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'authenticatedTestTools',
          methodName: 'returnsString',
          parameters: _i1.testObjectToJson({'string': string}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<int> returnsStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final int n,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'authenticatedTestTools',
              method: 'returnsStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'authenticatedTestTools',
              methodName: 'returnsStream',
              arguments: {'n': n},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<List<int>> returnsListFromInputStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> numbers,
  ) async {
    final _localTestStreamManager = _i1.TestStreamManager<List<int>>();
    return _i1.callAwaitableFunctionWithStreamInputAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'authenticatedTestTools',
              method: 'returnsListFromInputStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'authenticatedTestTools',
              methodName: 'returnsListFromInputStream',
              arguments: {},
              requestedInputStreams: ['numbers'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'numbers': numbers},
        );
        return _localTestStreamManager.outputStreamController.stream;
      },
    );
  }

  _i3.Stream<int> intEchoStream(
    final _i1.TestSessionBuilder sessionBuilder,
    final _i3.Stream<int> stream,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'authenticatedTestTools',
              method: 'intEchoStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'authenticatedTestTools',
              methodName: 'intEchoStream',
              arguments: {},
              requestedInputStreams: ['stream'],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {'stream': stream},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }
}

class _UnauthenticatedEndpoint {
  _UnauthenticatedEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<bool> unauthenticatedMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'unauthenticated',
            method: 'unauthenticatedMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'unauthenticated',
          methodName: 'unauthenticatedMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<bool> unauthenticatedStream(
    final _i1.TestSessionBuilder sessionBuilder,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<bool>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'unauthenticated',
              method: 'unauthenticatedStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'unauthenticated',
              methodName: 'unauthenticatedStream',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }
}

class _PartiallyUnauthenticatedEndpoint {
  _PartiallyUnauthenticatedEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<bool> unauthenticatedMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'partiallyUnauthenticated',
            method: 'unauthenticatedMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'partiallyUnauthenticated',
          methodName: 'unauthenticatedMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<bool> unauthenticatedStream(
    final _i1.TestSessionBuilder sessionBuilder,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<bool>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'partiallyUnauthenticated',
              method: 'unauthenticatedStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'partiallyUnauthenticated',
              methodName: 'unauthenticatedStream',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<bool> authenticatedMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'partiallyUnauthenticated',
            method: 'authenticatedMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'partiallyUnauthenticated',
          methodName: 'authenticatedMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<bool> authenticatedStream(final _i1.TestSessionBuilder sessionBuilder) {
    final _localTestStreamManager = _i1.TestStreamManager<bool>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'partiallyUnauthenticated',
              method: 'authenticatedStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'partiallyUnauthenticated',
              methodName: 'authenticatedStream',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }
}

class _UnauthenticatedRequireLoginEndpoint {
  _UnauthenticatedRequireLoginEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<bool> unauthenticatedMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'unauthenticatedRequireLogin',
            method: 'unauthenticatedMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'unauthenticatedRequireLogin',
          methodName: 'unauthenticatedMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<bool> unauthenticatedStream(
    final _i1.TestSessionBuilder sessionBuilder,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<bool>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'unauthenticatedRequireLogin',
              method: 'unauthenticatedStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'unauthenticatedRequireLogin',
              methodName: 'unauthenticatedStream',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }
}

class _RequireLoginEndpoint {
  _RequireLoginEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<bool> unauthenticatedMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'requireLogin',
            method: 'unauthenticatedMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'requireLogin',
          methodName: 'unauthenticatedMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<bool> unauthenticatedStream(
    final _i1.TestSessionBuilder sessionBuilder,
  ) {
    final _localTestStreamManager = _i1.TestStreamManager<bool>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        final _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
              endpoint: 'requireLogin',
              method: 'unauthenticatedStream',
            );
        final _localCallContext = await _endpointDispatch
            .getMethodStreamCallContext(
              createSessionCallback: (_) => _localUniqueSession,
              endpointPath: 'requireLogin',
              methodName: 'unauthenticatedStream',
              arguments: {},
              requestedInputStreams: [],
              serializationManager: _serializationManager,
            );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }
}

class _UploadEndpoint {
  _UploadEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<bool> uploadByteData(
    final _i1.TestSessionBuilder sessionBuilder,
    final String path,
    final _i5.ByteData data,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'upload',
            method: 'uploadByteData',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'upload',
          methodName: 'uploadByteData',
          parameters: _i1.testObjectToJson({
            'path': path,
            'data': data,
          }),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<bool>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _MyFeatureEndpoint {
  _MyFeatureEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<String> myFeatureMethod(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'myFeature',
            method: 'myFeatureMethod',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'myFeature',
          methodName: 'myFeatureMethod',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<String>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i26.MyFeatureModel> myFeatureModel(
    final _i1.TestSessionBuilder sessionBuilder,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      final _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'myFeature',
            method: 'myFeatureModel',
          );
      try {
        final _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'myFeature',
          methodName: 'myFeatureModel',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        final _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i26.MyFeatureModel>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}
