import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner.g.dart';
part 'owner.freezed.dart';

@freezed
class OwnerProfileModel with _$OwnerProfileModel {
  const factory OwnerProfileModel({
    required String id,
    required String name,
    required String phoneNumber,
  }) = _OwnerProfileModel;

  factory OwnerProfileModel.fromJson(Map<String, Object?> json) =>
      _$OwnerProfileModelFromJson(json);
}
