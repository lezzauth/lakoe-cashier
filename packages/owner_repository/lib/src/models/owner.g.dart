// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OwnerProfileModelImpl _$$OwnerProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OwnerProfileModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      packageName: json['packageName'] as String,
      outlets: (json['outlets'] as List<dynamic>)
          .map((e) => Outlet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OwnerProfileModelImplToJson(
        _$OwnerProfileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'packageName': instance.packageName,
      'outlets': instance.outlets,
    };

_$OutletImpl _$$OutletImplFromJson(Map<String, dynamic> json) => _$OutletImpl(
      logo: json['logo'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$OutletImplToJson(_$OutletImpl instance) =>
    <String, dynamic>{
      'logo': instance.logo,
      'name': instance.name,
      'address': instance.address,
    };
