/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

import 'dart:io';
import 'package:serverpod_client/serverpod_client.dart';
import 'protocol.dart';

class _EndpointBasicDatabase {
  Client client;
  _EndpointBasicDatabase(this.client);

  Future<int?> storeTypes(Types types,) async {
    return await client.callServerEndpoint('basicDatabase', 'storeTypes', 'int', {
      'types':types,
    });
  }

  Future<Types?> getTypes(int id,) async {
    return await client.callServerEndpoint('basicDatabase', 'getTypes', 'Types', {
      'id':id,
    });
  }

  Future<int?> getTypesRawQuery(int id,) async {
    return await client.callServerEndpoint('basicDatabase', 'getTypesRawQuery', 'int', {
      'id':id,
    });
  }

  Future<int?> countTypesRows() async {
    return await client.callServerEndpoint('basicDatabase', 'countTypesRows', 'int', {
    });
  }

  Future<int?> deleteAllInTypes() async {
    return await client.callServerEndpoint('basicDatabase', 'deleteAllInTypes', 'int', {
    });
  }

  Future<void> createSimpleTestData(int numRows,) async {
    return await client.callServerEndpoint('basicDatabase', 'createSimpleTestData', 'void', {
      'numRows':numRows,
    });
  }

  Future<int?> countSimpleData() async {
    return await client.callServerEndpoint('basicDatabase', 'countSimpleData', 'int', {
    });
  }

  Future<void> deleteAllSimpleTestData() async {
    return await client.callServerEndpoint('basicDatabase', 'deleteAllSimpleTestData', 'void', {
    });
  }

  Future<void> deleteSimpleTestDataLessThan(int num,) async {
    return await client.callServerEndpoint('basicDatabase', 'deleteSimpleTestDataLessThan', 'void', {
      'num':num,
    });
  }

  Future<bool?> findAndDeleteSimpleTestData(int num,) async {
    return await client.callServerEndpoint('basicDatabase', 'findAndDeleteSimpleTestData', 'bool', {
      'num':num,
    });
  }

  Future<SimpleDataList?> findSimpleDataRowsLessThan(int num,int offset,int limit,bool descending,) async {
    return await client.callServerEndpoint('basicDatabase', 'findSimpleDataRowsLessThan', 'SimpleDataList', {
      'num':num,
      'offset':offset,
      'limit':limit,
      'descending':descending,
    });
  }

  Future<bool?> updateSimpleDataRow(int num,int newNum,) async {
    return await client.callServerEndpoint('basicDatabase', 'updateSimpleDataRow', 'bool', {
      'num':num,
      'newNum':newNum,
    });
  }

  Future<int?> storeObjectWithObject(ObjectWithObject object,) async {
    return await client.callServerEndpoint('basicDatabase', 'storeObjectWithObject', 'int', {
      'object':object,
    });
  }

  Future<ObjectWithObject?> getObjectWithObject(int id,) async {
    return await client.callServerEndpoint('basicDatabase', 'getObjectWithObject', 'ObjectWithObject', {
      'id':id,
    });
  }
}

class _EndpointBasicTypes {
  Client client;
  _EndpointBasicTypes(this.client);

  Future<int?> testInt(int? value,) async {
    return await client.callServerEndpoint('basicTypes', 'testInt', 'int', {
      'value':value,
    });
  }

  Future<double?> testDouble(double? value,) async {
    return await client.callServerEndpoint('basicTypes', 'testDouble', 'double', {
      'value':value,
    });
  }

  Future<bool?> testBool(bool? value,) async {
    return await client.callServerEndpoint('basicTypes', 'testBool', 'bool', {
      'value':value,
    });
  }

  Future<DateTime?> testDateTime(DateTime? dateTime,) async {
    return await client.callServerEndpoint('basicTypes', 'testDateTime', 'DateTime', {
      'dateTime':dateTime,
    });
  }

  Future<String?> testString(String? value,) async {
    return await client.callServerEndpoint('basicTypes', 'testString', 'String', {
      'value':value,
    });
  }
}

class _EndpointFutureCalls {
  Client client;
  _EndpointFutureCalls(this.client);

  Future<void> makeFutureCall(SimpleData? data,) async {
    return await client.callServerEndpoint('futureCalls', 'makeFutureCall', 'void', {
      'data':data,
    });
  }
}

class _EndpointSimple {
  Client client;
  _EndpointSimple(this.client);

  Future<void> setGlobalInt(int? value,[int? secondValue,]) async {
    return await client.callServerEndpoint('simple', 'setGlobalInt', 'void', {
      'value':value,
      'secondValue': secondValue,
    });
  }

  Future<void> addToGlobalInt() async {
    return await client.callServerEndpoint('simple', 'addToGlobalInt', 'void', {
    });
  }

  Future<int> getGlobalInt() async {
    return await client.callServerEndpoint('simple', 'getGlobalInt', 'int', {
    });
  }
}

class _EndpointLogging {
  Client client;
  _EndpointLogging(this.client);

  Future<void> logInfo(String message,) async {
    return await client.callServerEndpoint('logging', 'logInfo', 'void', {
      'message':message,
    });
  }

  Future<void> logDebugAndInfoAndError(String debug,String info,String error,) async {
    return await client.callServerEndpoint('logging', 'logDebugAndInfoAndError', 'void', {
      'debug':debug,
      'info':info,
      'error':error,
    });
  }

  Future<void> twoQueries() async {
    return await client.callServerEndpoint('logging', 'twoQueries', 'void', {
    });
  }
}

class _EndpointAsyncTasks {
  Client client;
  _EndpointAsyncTasks(this.client);

  Future<void> insertRowToSimpleDataAfterDelay(int num,int seconds,) async {
    return await client.callServerEndpoint('asyncTasks', 'insertRowToSimpleDataAfterDelay', 'void', {
      'num':num,
      'seconds':seconds,
    });
  }

  Future<void> throwExceptionAfterDelay(int seconds,) async {
    return await client.callServerEndpoint('asyncTasks', 'throwExceptionAfterDelay', 'void', {
      'seconds':seconds,
    });
  }
}

class _EndpointTransactionsDatabase {
  Client client;
  _EndpointTransactionsDatabase(this.client);

  Future<void> removeRow(int num,) async {
    return await client.callServerEndpoint('transactionsDatabase', 'removeRow', 'void', {
      'num':num,
    });
  }

  Future<bool> updateInsertDelete(int numUpdate,int numInsert,int numDelete,) async {
    return await client.callServerEndpoint('transactionsDatabase', 'updateInsertDelete', 'bool', {
      'numUpdate':numUpdate,
      'numInsert':numInsert,
      'numDelete':numDelete,
    });
  }
}

class _EndpointLoggingDisabled {
  Client client;
  _EndpointLoggingDisabled(this.client);

  Future<void> logInfo(String message,) async {
    return await client.callServerEndpoint('loggingDisabled', 'logInfo', 'void', {
      'message':message,
    });
  }
}

class Client extends ServerpodClient {
  late final _EndpointBasicDatabase basicDatabase;
  late final _EndpointBasicTypes basicTypes;
  late final _EndpointFutureCalls futureCalls;
  late final _EndpointSimple simple;
  late final _EndpointLogging logging;
  late final _EndpointAsyncTasks asyncTasks;
  late final _EndpointTransactionsDatabase transactionsDatabase;
  late final _EndpointLoggingDisabled loggingDisabled;

  Client(host, {SecurityContext? context, ServerpodClientErrorCallback? errorHandler, AuthenticationKeyManager? authenticationKeyManager}) : super(host, Protocol.instance, context: context, errorHandler: errorHandler, authenticationKeyManager: authenticationKeyManager) {
    basicDatabase = _EndpointBasicDatabase(this);
    basicTypes = _EndpointBasicTypes(this);
    futureCalls = _EndpointFutureCalls(this);
    simple = _EndpointSimple(this);
    logging = _EndpointLogging(this);
    asyncTasks = _EndpointAsyncTasks(this);
    transactionsDatabase = _EndpointTransactionsDatabase(this);
    loggingDisabled = _EndpointLoggingDisabled(this);
  }
}