/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'large_message.dart' as _i2;
import 'small_message.dart' as _i3;
export 'large_message.dart';
export 'small_message.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.LargeMessage) {
      return _i2.LargeMessage.fromJson(data) as T;
    }
    if (t == _i3.SmallMessage) {
      return _i3.SmallMessage.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.LargeMessage?>()) {
      return (data != null ? _i2.LargeMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.SmallMessage?>()) {
      return (data != null ? _i3.SmallMessage.fromJson(data) : null) as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    switch (data) {
      case _i2.LargeMessage():
        return 'LargeMessage';
      case _i3.SmallMessage():
        return 'SmallMessage';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'LargeMessage') {
      return deserialize<_i2.LargeMessage>(data['data']);
    }
    if (dataClassName == 'SmallMessage') {
      return deserialize<_i3.SmallMessage>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
