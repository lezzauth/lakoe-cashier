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
