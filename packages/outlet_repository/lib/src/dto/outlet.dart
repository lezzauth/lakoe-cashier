import 'package:freezed_annotation/freezed_annotation.dart';

part 'outlet.freezed.dart';
part 'outlet.g.dart';

@freezed
class DetailCustomerOutletDto with _$DetailCustomerOutletDto {
  const factory DetailCustomerOutletDto({
    String? status,
    String? from,
    String? to,
    String? template,
  }) = _DetailCustomerOutletDto;

  factory DetailCustomerOutletDto.fromJson(Map<String, Object?> json) =>
      _$DetailCustomerOutletDtoFromJson(json);
}

extension CopyWithExtension on DetailCustomerOutletDto {
  DetailCustomerOutletDto copyWith({
    String? status,
    String? from,
    String? to,
    String? template,
  }) {
    return DetailCustomerOutletDto(
      status: status ?? this.status,
      from: from ?? this.from,
      to: to ?? this.to,
      template: template ?? this.template,
    );
  }
}

extension QueryStringExtension on DetailCustomerOutletDto {
  String toQueryString() {
    final Map<String, dynamic> queryParams = {
      "status": status,
      "from": from,
      "to": to,
      "template": template,
    };

    queryParams.removeWhere((key, value) => value == null);

    return queryParams.entries
        .map((entry) =>
            '${entry.key}=${Uri.encodeComponent(entry.value.toString())}')
        .join('&');
  }
}

@freezed
class GetOutletReportDto with _$GetOutletReportDto {
  const factory GetOutletReportDto({
    String? from,
    String? to,
    @Default("TODAY") String? template,
  }) = _GetOutletReportDto;

  factory GetOutletReportDto.fromJson(Map<String, Object?> json) =>
      _$GetOutletReportDtoFromJson(json);
}

extension GetOutletReportDtoQueryStringExtension on GetOutletReportDto {
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
class GetOutletSalesDto with _$GetOutletSalesDto {
  const factory GetOutletSalesDto({
    String? from,
    String? to,
    @Default("TODAY") String? template,
  }) = _GetOutletSalesDto;

  factory GetOutletSalesDto.fromJson(Map<String, Object?> json) =>
      _$GetOutletSalesDtoFromJson(json);
}

extension GetOutletSalesDtoQueryStringExtension on GetOutletSalesDto {
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
class UpdateOutletDto with _$UpdateOutletDto {
  const factory UpdateOutletDto({
    String? name,
    String? address,
    String? type,
    String? color,
  }) = _UpdateOutletDto;

  factory UpdateOutletDto.fromJson(Map<String, Object?> json) =>
      _$UpdateOutletDtoFromJson(json);
}

extension UpdateOutletDtoQueryStringExtension on UpdateOutletDto {
  String toQueryString() {
    final Map<String, dynamic> queryParams = toJson();

    queryParams.removeWhere((key, value) => value == null);

    return queryParams.entries
        .map((entry) =>
            '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value.toString())}')
        .join('&');
  }
}
