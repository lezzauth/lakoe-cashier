import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.g.dart';
part 'employee.freezed.dart';

@freezed
class EmployeeModel with _$EmployeeModel {
  const factory EmployeeModel({
    required String id,
    required String role,
    required String name,
    required String phoneNumber,
    String? email,
    String? profilePicture,
    required bool emailVerified,
    required bool phoneVerified,
    required String outletId,
    required String createdAt,
    required String updatedAt,
  }) = _EmployeeModel;

  factory EmployeeModel.fromJson(Map<String, Object?> json) =>
      _$EmployeeModelFromJson(json);
}

@freezed
class RequestOtpRes with _$RequestOtpRes {
  const factory RequestOtpRes({
    required String id,
    required String target,
    required String type,
    required String action,
    required String createdAt,
    required String updatedAt,
  }) = _RequestOtpRes;

  factory RequestOtpRes.fromJson(Map<String, Object?> json) =>
      _$RequestOtpResFromJson(json);
}

@freezed
class VerifyOtpRes with _$VerifyOtpRes {
  const factory VerifyOtpRes({
    required String token,
  }) = _VerifyOtpRes;

  factory VerifyOtpRes.fromJson(Map<String, Object?> json) =>
      _$VerifyOtpResFromJson(json);
}
