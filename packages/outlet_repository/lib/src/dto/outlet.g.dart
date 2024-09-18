// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailCustomerOutletDtoImpl _$$DetailCustomerOutletDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailCustomerOutletDtoImpl(
      from: json['from'] as String?,
      to: json['to'] as String?,
    );

Map<String, dynamic> _$$DetailCustomerOutletDtoImplToJson(
        _$DetailCustomerOutletDtoImpl instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
    };

_$GetOutletReportDtoImpl _$$GetOutletReportDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$GetOutletReportDtoImpl(
      from: json['from'] as String?,
      to: json['to'] as String?,
      template: json['template'] as String? ?? "TODAY",
    );

Map<String, dynamic> _$$GetOutletReportDtoImplToJson(
        _$GetOutletReportDtoImpl instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'template': instance.template,
    };

_$GetOutletSalesDtoImpl _$$GetOutletSalesDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$GetOutletSalesDtoImpl(
      from: json['from'] as String?,
      to: json['to'] as String?,
      template: json['template'] as String? ?? "TODAY",
    );

Map<String, dynamic> _$$GetOutletSalesDtoImplToJson(
        _$GetOutletSalesDtoImpl instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'template': instance.template,
    };
