import 'package:freezed_annotation/freezed_annotation.dart';

part 'dio.freezed.dart';
part 'dio.g.dart';

@freezed
class DioExceptionModel with _$DioExceptionModel {
  const factory DioExceptionModel({
    required int? code,
    required String message,
  }) = _DioExceptionModel;

  factory DioExceptionModel.fromJson(Map<String, Object?> json) =>
      _$DioExceptionModelFromJson(json);
}
