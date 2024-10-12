import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.g.dart';
part 'session.freezed.dart';

@freezed
class WASessionModel with _$WASessionModel {
  const factory WASessionModel({
    required String name,
    WASessionMe? me,
    required String status,
    required WASessionConfig config,
  }) = _WASessionModel;

  factory WASessionModel.fromJson(Map<String, Object?> json) =>
      _$WASessionModelFromJson(json);
}

@freezed
class WASessionMe with _$WASessionMe {
  const factory WASessionMe({
    required String id,
    required String pushName,
  }) = _WASessionMe;

  factory WASessionMe.fromJson(Map<String, Object?> json) =>
      _$WASessionMeFromJson(json);
}

@freezed
class WASessionConfig with _$WASessionConfig {
  const factory WASessionConfig({
    WASessionConfigMetadata? metadata,
    bool? debug,
    WASessionConfigNoweb? noweb,
    required List<WASessionConfigWebhook> webhooks,
  }) = _WASessionConfig;

  factory WASessionConfig.fromJson(Map<String, Object?> json) =>
      _$WASessionConfigFromJson(json);
}

@freezed
class WASessionConfigMetadata with _$WASessionConfigMetadata {
  const factory WASessionConfigMetadata({
    @JsonKey(name: "user.id") String? userId,
    @JsonKey(name: "user.email") String? userEmail,
  }) = _WASessionConfigMetadata;

  factory WASessionConfigMetadata.fromJson(Map<String, Object?> json) =>
      _$WASessionConfigMetadataFromJson(json);
}

@freezed
class WASessionConfigNoweb with _$WASessionConfigNoweb {
  const factory WASessionConfigNoweb({
    required WASessionConfigNowebStore store,
  }) = _WASessionConfigNoweb;

  factory WASessionConfigNoweb.fromJson(Map<String, Object?> json) =>
      _$WASessionConfigNowebFromJson(json);
}

@freezed
class WASessionConfigNowebStore with _$WASessionConfigNowebStore {
  const factory WASessionConfigNowebStore({
    required bool enabled,
    required bool fullSync,
  }) = _WASessionConfigNowebStore;

  factory WASessionConfigNowebStore.fromJson(Map<String, Object?> json) =>
      _$WASessionConfigNowebStoreFromJson(json);
}

@freezed
class WASessionConfigWebhook with _$WASessionConfigWebhook {
  const factory WASessionConfigWebhook({
    required String url,
    required List<String> events,
  }) = _WASessionConfigWebhook;

  factory WASessionConfigWebhook.fromJson(Map<String, Object?> json) =>
      _$WASessionConfigWebhookFromJson(json);
}
