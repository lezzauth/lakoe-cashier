import 'package:freezed_annotation/freezed_annotation.dart';

part 'dio.freezed.dart';
part 'dio.g.dart';

@freezed
class TokenExpiredException with _$TokenExpiredException {
  const factory TokenExpiredException({
    required int? code,
    required String message,
  }) = _TokenExpiredException;

  factory TokenExpiredException.fromJson(Map<String, Object?> json) =>
      _$TokenExpiredExceptionFromJson(json);
}
