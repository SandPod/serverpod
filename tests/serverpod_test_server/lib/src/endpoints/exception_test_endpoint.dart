import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/exception_with_data.dart';

class ExceptionTestEndpoint extends Endpoint {
  Future<String> throwNormalException(final Session session) async {
    throw Exception('Something went wrong');
  }

  Future<String> throwExceptionWithData(final Session session) async {
    throw ExceptionWithData(
      message: 'Throwing an exception',
      creationDate: DateTime.now(),
      errorFields: [
        'first line error',
        'second line error',
      ],
      someNullableField: 1,
    );
  }

  Future<String> workingWithoutException(final Session session) async {
    return 'Success';
  }
}
