// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailCustomerOutletDtoImpl _$$DetailCustomerOutletDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailCustomerOutletDtoImpl(
      status: json['status'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
      template: json['template'] as String?,
    );

Map<String, dynamic> _$$DetailCustomerOutletDtoImplToJson(
        _$DetailCustomerOutletDtoImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'from': instance.from,
      'to': instance.to,
      'template': instance.template,
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

_$UpdateOutletDtoImpl _$$UpdateOutletDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateOutletDtoImpl(
      name: json['name'] as String?,
      address: json['address'] as String?,
      type: json['type'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$UpdateOutletDtoImplToJson(
        _$UpdateOutletDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'type': instance.type,
      'color': instance.color,
    };
