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
