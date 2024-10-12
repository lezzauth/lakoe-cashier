// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackingImpl _$$TrackingImplFromJson(Map<String, dynamic> json) =>
    _$TrackingImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      object: json['object'] as String,
      id: json['id'] as String,
      waybillId: json['waybill_id'] as String,
      courier:
          TrackingCourier.fromJson(json['courier'] as Map<String, dynamic>),
      destination: TrackingDestination.fromJson(
          json['destination'] as Map<String, dynamic>),
      history: (json['history'] as List<dynamic>)
          .map((e) => TrackingHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      link: json['link'] as String?,
      orderId: json['order_id'] as String,
      origin: TrackingOrigin.fromJson(json['origin'] as Map<String, dynamic>),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$TrackingImplToJson(_$TrackingImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'object': instance.object,
      'id': instance.id,
      'waybill_id': instance.waybillId,
      'courier': instance.courier,
      'destination': instance.destination,
      'history': instance.history,
      'link': instance.link,
      'order_id': instance.orderId,
      'origin': instance.origin,
      'status': instance.status,
    };

_$TrackingCourierImpl _$$TrackingCourierImplFromJson(
        Map<String, dynamic> json) =>
    _$TrackingCourierImpl(
      company: json['company'] as String,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      driverName: json['driver_name'] as String?,
      driverPhone: json['driver_phone'] as String?,
    );

Map<String, dynamic> _$$TrackingCourierImplToJson(
        _$TrackingCourierImpl instance) =>
    <String, dynamic>{
      'company': instance.company,
      'name': instance.name,
      'phone': instance.phone,
      'driver_name': instance.driverName,
      'driver_phone': instance.driverPhone,
    };

_$TrackingDestinationImpl _$$TrackingDestinationImplFromJson(
        Map<String, dynamic> json) =>
    _$TrackingDestinationImpl(
      contactName: json['contact_name'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$TrackingDestinationImplToJson(
        _$TrackingDestinationImpl instance) =>
    <String, dynamic>{
      'contact_name': instance.contactName,
      'address': instance.address,
    };

_$TrackingOriginImpl _$$TrackingOriginImplFromJson(Map<String, dynamic> json) =>
    _$TrackingOriginImpl(
      contactName: json['contact_name'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$TrackingOriginImplToJson(
        _$TrackingOriginImpl instance) =>
    <String, dynamic>{
      'contact_name': instance.contactName,
      'address': instance.address,
    };

_$TrackingHistoryImpl _$$TrackingHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$TrackingHistoryImpl(
      note: json['note'] as String,
      status: json['status'] as String,
      serviceType: json['service_type'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$TrackingHistoryImplToJson(
        _$TrackingHistoryImpl instance) =>
    <String, dynamic>{
      'note': instance.note,
      'status': instance.status,
      'service_type': instance.serviceType,
      'updated_at': instance.updatedAt,
    };
