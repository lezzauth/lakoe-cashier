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
    String? packageExpiretAt,
    String? email,
    @Default('0') String balance,
    @Default(false) bool emailVerified,
    @Default(false) bool phoneVerified,
    required String createdAt,
    required String updatedAt,
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

@freezed
class RequestOTPRes with _$RequestOTPRes {
  const factory RequestOTPRes({
    required String id,
    required String target,
    required String type,
    required String action,
    String? expireAt,
    String? createdAt,
    String? updatedAt,
  }) = _RequestOTPRes;

  factory RequestOTPRes.fromJson(Map<String, Object?> json) =>
      _$RequestOTPResFromJson(json);
}
