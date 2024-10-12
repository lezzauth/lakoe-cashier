import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_repository/src/models/session.dart';

part 'session.g.dart';
part 'session.freezed.dart';

@freezed
class CreateWASessionDto with _$CreateWASessionDto {
  const factory CreateWASessionDto({
    String? name,
    bool? start,
    required WASessionConfig config,
  }) = _CreateWASessionDto;

  factory CreateWASessionDto.fromJson(Map<String, Object?> json) =>
      _$CreateWASessionDtoFromJson(json);
}
