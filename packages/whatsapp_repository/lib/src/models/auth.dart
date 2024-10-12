import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.g.dart';
part 'auth.freezed.dart';

@freezed
class WAAuthGetQRModel with _$WAAuthGetQRModel {
  const factory WAAuthGetQRModel({
    required String value,
  }) = _WAAuthGetQRModel;

  factory WAAuthGetQRModel.fromJson(Map<String, Object?> json) =>
      _$WAAuthGetQRModelFromJson(json);
}

@freezed
class WAAuthRequestCodeModel with _$WAAuthRequestCodeModel {
  const factory WAAuthRequestCodeModel({
    required String code,
  }) = _WAAuthRequestCodeModel;

  factory WAAuthRequestCodeModel.fromJson(Map<String, Object?> json) =>
      _$WAAuthRequestCodeModelFromJson(json);
}
