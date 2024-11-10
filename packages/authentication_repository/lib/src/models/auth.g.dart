// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterResponseImpl _$$RegisterResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterResponseImpl(
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
      tokenExpireIn: (json['tokenExpireIn'] as num).toInt(),
      refreshTokenExpireIn: (json['refreshTokenExpireIn'] as num).toInt(),
    );

Map<String, dynamic> _$$RegisterResponseImplToJson(
        _$RegisterResponseImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'tokenExpireIn': instance.tokenExpireIn,
      'refreshTokenExpireIn': instance.refreshTokenExpireIn,
    };

_$RequestOTPResponseImpl _$$RequestOTPResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestOTPResponseImpl(
      id: json['id'] as String,
      target: json['target'] as String,
      type: json['type'] as String,
      action: json['action'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$RequestOTPResponseImplToJson(
        _$RequestOTPResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'target': instance.target,
      'type': instance.type,
      'action': instance.action,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$VerifyOTPResponseImpl _$$VerifyOTPResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyOTPResponseImpl(
      action: json['action'] as String,
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
      tokenExpireIn: (json['tokenExpireIn'] as num).toInt(),
      refreshTokenExpireIn: (json['refreshTokenExpireIn'] as num).toInt(),
    );

Map<String, dynamic> _$$VerifyOTPResponseImplToJson(
        _$VerifyOTPResponseImpl instance) =>
    <String, dynamic>{
      'action': instance.action,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'tokenExpireIn': instance.tokenExpireIn,
      'refreshTokenExpireIn': instance.refreshTokenExpireIn,
    };

_$RefreshTokenResImpl _$$RefreshTokenResImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshTokenResImpl(
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
      tokenExpireIn: (json['tokenExpireIn'] as num).toInt(),
      refreshTokenExpireIn: (json['refreshTokenExpireIn'] as num).toInt(),
    );

Map<String, dynamic> _$$RefreshTokenResImplToJson(
        _$RefreshTokenResImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'tokenExpireIn': instance.tokenExpireIn,
      'refreshTokenExpireIn': instance.refreshTokenExpireIn,
    };
