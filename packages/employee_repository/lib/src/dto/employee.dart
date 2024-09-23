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
    required String outletId,
  }) = _CreateEmployeeDto;

  factory CreateEmployeeDto.fromJson(Map<String, Object?> json) =>
      _$CreateEmployeeDtoFromJson(json);
}

@freezed
class UpdateEmployeeDto with _$UpdateEmployeeDto {
  const factory UpdateEmployeeDto({
    String? name,
    String? email,
    String? pin,
    String? phoneNumber,
    String? role,
    String? outletId,
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
    required String outletId,
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
