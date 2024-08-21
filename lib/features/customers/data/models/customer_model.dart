import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

@freezed
class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
    required String name,
    required String phoneNumber,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, Object?> json) =>
      _$CustomerModelFromJson(json);
}
