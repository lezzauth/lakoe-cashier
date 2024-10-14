import 'package:freezed_annotation/freezed_annotation.dart';

part 'package.g.dart';
part 'package.freezed.dart';

@freezed
class DetailPakcageDto with _$DetailPakcageDto {
  const factory DetailPakcageDto({
    required String name,
  }) = _DetailPakcageDto;

  factory DetailPakcageDto.fromJson(Map<String, dynamic> json) =>
      _$DetailPakcageDtoFromJson(json);
}
