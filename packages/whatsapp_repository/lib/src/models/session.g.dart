// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WASessionModelImpl _$$WASessionModelImplFromJson(Map<String, dynamic> json) =>
    _$WASessionModelImpl(
      name: json['name'] as String,
      me: json['me'] == null
          ? null
          : WASessionMe.fromJson(json['me'] as Map<String, dynamic>),
      status: json['status'] as String,
      config: WASessionConfig.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WASessionModelImplToJson(
        _$WASessionModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'me': instance.me,
      'status': instance.status,
      'config': instance.config,
    };

_$WASessionMeImpl _$$WASessionMeImplFromJson(Map<String, dynamic> json) =>
    _$WASessionMeImpl(
      id: json['id'] as String,
      pushName: json['pushName'] as String,
    );

Map<String, dynamic> _$$WASessionMeImplToJson(_$WASessionMeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pushName': instance.pushName,
    };

_$WASessionConfigImpl _$$WASessionConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$WASessionConfigImpl(
      metadata: json['metadata'] == null
          ? null
          : WASessionConfigMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>),
      debug: json['debug'] as bool?,
      noweb: json['noweb'] == null
          ? null
          : WASessionConfigNoweb.fromJson(
              json['noweb'] as Map<String, dynamic>),
      webhooks: (json['webhooks'] as List<dynamic>)
          .map(
              (e) => WASessionConfigWebhook.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WASessionConfigImplToJson(
        _$WASessionConfigImpl instance) =>
    <String, dynamic>{
      'metadata': instance.metadata,
      'debug': instance.debug,
      'noweb': instance.noweb,
      'webhooks': instance.webhooks,
    };

_$WASessionConfigMetadataImpl _$$WASessionConfigMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$WASessionConfigMetadataImpl(
      userId: json['user.id'] as String?,
      userEmail: json['user.email'] as String?,
    );

Map<String, dynamic> _$$WASessionConfigMetadataImplToJson(
        _$WASessionConfigMetadataImpl instance) =>
    <String, dynamic>{
      'user.id': instance.userId,
      'user.email': instance.userEmail,
    };

_$WASessionConfigNowebImpl _$$WASessionConfigNowebImplFromJson(
        Map<String, dynamic> json) =>
    _$WASessionConfigNowebImpl(
      store: WASessionConfigNowebStore.fromJson(
          json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WASessionConfigNowebImplToJson(
        _$WASessionConfigNowebImpl instance) =>
    <String, dynamic>{
      'store': instance.store,
    };

_$WASessionConfigNowebStoreImpl _$$WASessionConfigNowebStoreImplFromJson(
        Map<String, dynamic> json) =>
    _$WASessionConfigNowebStoreImpl(
      enabled: json['enabled'] as bool,
      fullSync: json['fullSync'] as bool,
    );

Map<String, dynamic> _$$WASessionConfigNowebStoreImplToJson(
        _$WASessionConfigNowebStoreImpl instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'fullSync': instance.fullSync,
    };

_$WASessionConfigWebhookImpl _$$WASessionConfigWebhookImplFromJson(
        Map<String, dynamic> json) =>
    _$WASessionConfigWebhookImpl(
      url: json['url'] as String,
      events:
          (json['events'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$WASessionConfigWebhookImplToJson(
        _$WASessionConfigWebhookImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'events': instance.events,
    };
