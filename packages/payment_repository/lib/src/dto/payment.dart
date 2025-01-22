import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.g.dart';
part 'payment.freezed.dart';

@freezed
class SetActivePaymentMethodDto with _$SetActivePaymentMethodDto {
  const factory SetActivePaymentMethodDto({
    required String id,
    required bool isActive,
  }) = _SetActivePaymentMethodDto;

  factory SetActivePaymentMethodDto.fromJson(Map<String, dynamic> json) =>
      _$SetActivePaymentMethodDtoFromJson(json);
}
