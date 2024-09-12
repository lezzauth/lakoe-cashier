import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_list.g.dart';
part 'bank_list.freezed.dart';

@freezed
class BankListModel with _$BankListModel {
  const factory BankListModel({
    @JsonKey(name: "bank_code") required String bankCode,
    @JsonKey(name: "bank_name") required String bankName,
    @JsonKey(name: "swift_code") required String swiftCode,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "code") required String code,
  }) = _BankListModel;

  factory BankListModel.fromJson(Map<String, Object?> json) =>
      _$BankListModelFromJson(json);
}
