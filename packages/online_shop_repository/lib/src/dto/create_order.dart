import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_order.g.dart';
part 'create_order.freezed.dart';

@freezed
class CreateOrderDto with _$CreateOrderDto {
  const factory CreateOrderDto({
    @JsonKey(name: "customer_name") required String customerName,
    @JsonKey(name: "customer_phone_number") required String customerPhoneNumber,
    required String address,
    required double latitude,
    required double longitude,
    @JsonKey(name: "payment_method") required String paymentMethod,
    required List<CreateOrderProductDto> products,
  }) = _CreateOrderDto;

  factory CreateOrderDto.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderDtoFromJson(json);
}

@freezed
class CreateOrderProductDto with _$CreateOrderProductDto {
  const factory CreateOrderProductDto({
    required String id,
    required int quantity,
  }) = _CreateOrderProductDto;

  factory CreateOrderProductDto.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderProductDtoFromJson(json);
}
