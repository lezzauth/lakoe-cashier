// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateCategoryDtoImpl _$$CreateCategoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateCategoryDtoImpl(
      outletId: json['outletId'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$CreateCategoryDtoImplToJson(
        _$CreateCategoryDtoImpl instance) =>
    <String, dynamic>{
      'outletId': instance.outletId,
      'name': instance.name,
      'icon': instance.icon,
    };

_$UpdateCategoryDtoImpl _$$UpdateCategoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateCategoryDtoImpl(
      name: json['name'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$UpdateCategoryDtoImplToJson(
        _$UpdateCategoryDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
    };