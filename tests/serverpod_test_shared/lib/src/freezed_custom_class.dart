import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_custom_class.freezed.dart';
part 'freezed_custom_class.g.dart';

@freezed
class FreezedCustomClass with _$FreezedCustomClass {
  const factory FreezedCustomClass({
    required final String firstName,
    required final String lastName,
    required final int age,
  }) = _FreezedCustomClass;

  factory FreezedCustomClass.fromJson(
    final Map<String, Object?> json,
  ) => _$FreezedCustomClassFromJson(json);
}
