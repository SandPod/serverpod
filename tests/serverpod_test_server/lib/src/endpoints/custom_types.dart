import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_shared/serverpod_test_shared.dart';

class CustomTypesEndpoint extends Endpoint {
  Future<CustomClass> returnCustomClass(
    final Session session,
    final CustomClass data,
  ) async {
    return data;
  }

  Future<CustomClass?> returnCustomClassNullable(
    final Session session,
    final CustomClass? data,
  ) async {
    return data;
  }

  Future<CustomClass2> returnCustomClass2(
    final Session session,
    final CustomClass2 data,
  ) async {
    return data;
  }

  Future<CustomClass2?> returnCustomClass2Nullable(
    final Session session,
    final CustomClass2? data,
  ) async {
    return data;
  }

  Future<ExternalCustomClass> returnExternalCustomClass(
    final Session session,
    final ExternalCustomClass data,
  ) async {
    return data;
  }

  Future<ExternalCustomClass?> returnExternalCustomClassNullable(
    final Session session,
    final ExternalCustomClass? data,
  ) async {
    return data;
  }

  Future<FreezedCustomClass> returnFreezedCustomClass(
    final Session session,
    final FreezedCustomClass data,
  ) async {
    return data;
  }

  Future<FreezedCustomClass?> returnFreezedCustomClassNullable(
    final Session session,
    final FreezedCustomClass? data,
  ) async {
    return data;
  }

  Future<CustomClassWithoutProtocolSerialization>
  returnCustomClassWithoutProtocolSerialization(
    final Session session,
    final CustomClassWithoutProtocolSerialization data,
  ) async {
    return data;
  }

  Future<CustomClassWithProtocolSerialization>
  returnCustomClassWithProtocolSerialization(
    final Session session,
    final CustomClassWithProtocolSerialization data,
  ) async {
    return data;
  }

  Future<CustomClassWithProtocolSerializationMethod>
  returnCustomClassWithProtocolSerializationMethod(
    final Session session,
    final CustomClassWithProtocolSerializationMethod data,
  ) async {
    return data;
  }

  @override
  Future<void> handleStreamMessage(
    final StreamingSession session,
    final SerializableModel message,
  ) async {
    if (message is CustomClass) {
      // ignore: deprecated_member_use
      await sendStreamMessage(
        session,
        CustomClass('${message.value}${message.value}'),
      );
    }
  }
}
