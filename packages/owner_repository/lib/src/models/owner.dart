import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner.g.dart';
part 'owner.freezed.dart';

@freezed
class OwnerProfileModel with _$OwnerProfileModel {
  const factory OwnerProfileModel({
    required String id,
    required String name,
    required String phoneNumber,
    required String packageName,
    String? email,
    required List<Outlet> outlets,
  }) = _OwnerProfileModel;

  factory OwnerProfileModel.fromJson(Map<String, Object?> json) =>
      _$OwnerProfileModelFromJson(json);
}

@freezed
class Outlet with _$Outlet {
  const factory Outlet({
    required String logo,
    required String name,
    required String address,
  }) = _Outlet;

  factory Outlet.fromJson(Map<String, Object?> json) => _$OutletFromJson(json);
}

@freezed
class UpdateOwnerModel with _$UpdateOwnerModel {
  const factory UpdateOwnerModel({
    required String id,
    required String name,
    required String phoneNumber,
    String? email,
    required String balance,
    required bool emailVerified,
    required bool phoneVerified,
    required String packageName,
    String? packageExpiretAt,
    required String createdAt,
    required String updatedAt,
  }) = _UpdateOwnerModel;

  factory UpdateOwnerModel.fromJson(Map<String, Object?> json) =>
      _$UpdateOwnerModelFromJson(json);
}
