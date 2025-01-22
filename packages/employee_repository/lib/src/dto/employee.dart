import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.g.dart';
part 'employee.freezed.dart';

@freezed
class CreateEmployeeDto with _$CreateEmployeeDto {
  const factory CreateEmployeeDto({
    required String name,
    String? email,
    required String pin,
    required String phoneNumber,
    required String role,
    String? outletId,
  }) = _CreateEmployeeDto;

  factory CreateEmployeeDto.fromJson(Map<String, Object?> json) =>
      _$CreateEmployeeDtoFromJson(json);
}

extension CreateToJsonFilterExtension on CreateEmployeeDto {
  Map<String, dynamic> toJsonFilter() {
    final Map<String, dynamic> json = toJson();
    json.removeWhere((key, value) => value == null);
    return json;
  }
}

@freezed
class UpdateEmployeeDto with _$UpdateEmployeeDto {
  const factory UpdateEmployeeDto({
    String? name,
    String? email,
    String? pin,
    String? phoneNumber,
    String? role,
  }) = _UpdateEmployeeDto;

  factory UpdateEmployeeDto.fromJson(Map<String, Object?> json) =>
      _$UpdateEmployeeDtoFromJson(json);
}

extension ToJsonFilterExtension on UpdateEmployeeDto {
  Map<String, dynamic> toJsonFilter() {
    final Map<String, dynamic> json = toJson();
    json.removeWhere((key, value) => value == null);
    return json;
  }
}

@freezed
class FindAllEmployeeDto with _$FindAllEmployeeDto {
  const factory FindAllEmployeeDto({
    String? outletId,
  }) = _FindAllEmployeeDto;

  factory FindAllEmployeeDto.fromJson(Map<String, Object?> json) =>
      _$FindAllEmployeeDtoFromJson(json);
}

extension QueryStringExtension on FindAllEmployeeDto {
  String toQueryString() {
    final Map<String, dynamic> queryParams = toJson();

    queryParams.removeWhere((key, value) => value == null);

    return queryParams.entries
        .map((entry) =>
            '${entry.key}=${Uri.encodeComponent(entry.value.toString())}')
        .join('&');
  }
}

@freezed
class RequestOtpDto with _$RequestOtpDto {
  const factory RequestOtpDto({
    required String phoneNumber,
  }) = _RequestOtpDto;

  factory RequestOtpDto.fromJson(Map<String, Object?> json) =>
      _$RequestOtpDtoFromJson(json);
}

@freezed
class VerifyOtpDto with _$VerifyOtpDto {
  const factory VerifyOtpDto({
    required String phoneNumber,
    required String code,
  }) = _VerifyOtpDto;

  factory VerifyOtpDto.fromJson(Map<String, Object?> json) =>
      _$VerifyOtpDtoFromJson(json);
}

@freezed
class UpdatePinDto with _$UpdatePinDto {
  const factory UpdatePinDto({
    required String pin,
    required String token,
  }) = _UpdatePinDto;

  factory UpdatePinDto.fromJson(Map<String, Object?> json) =>
      _$UpdatePinDtoFromJson(json);
}
