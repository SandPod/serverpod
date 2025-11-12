import 'package:serverpod/serverpod.dart';

class MethodSignaturePermutationsEndpoint extends Endpoint {
  Future<String> echoPositionalArg(
    final Session session,
    final String string,
  ) async {
    return string;
  }

  Future<String> echoNamedArg(
    final Session session, {
    required final String string,
  }) async {
    return string;
  }

  Future<String?> echoNullableNamedArg(
    final Session session, {
    final String? string,
  }) async {
    return string;
  }

  Future<String?> echoOptionalArg(
    final Session session, [
    final String? string,
  ]) async {
    return string;
  }

  Future<List<String?>> echoPositionalAndNamedArgs(
    final Session session,
    final String string1, {
    required final String string2,
  }) async {
    return [string1, string2];
  }

  Future<List<String?>> echoPositionalAndNullableNamedArgs(
    final Session session,
    final String string1, {
    final String? string2,
  }) async {
    return [string1, string2];
  }

  Future<List<String?>> echoPositionalAndOptionalArgs(
    final Session session,
    final String string1, [
    final String? string2,
  ]) async {
    return [string1, string2];
  }

  Stream<String> echoNamedArgStream(
    final Session session, {
    required final Stream<String> strings,
  }) async* {
    await for (final string in strings) {
      yield string;
    }
  }

  Future<String> echoNamedArgStreamAsFuture(
    final Session session, {
    required final Stream<String> strings,
  }) async {
    return strings.first;
  }

  Stream<String> echoPositionalArgStream(
    final Session session,
    final Stream<String> strings,
  ) async* {
    await for (final string in strings) {
      yield string;
    }
  }

  Future<String> echoPositionalArgStreamAsFuture(
    final Session session,
    final Stream<String> strings,
  ) async {
    return strings.first;
  }
}
