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

@freezed
class GetBankAccountResponse with _$GetBankAccountResponse {
  const factory GetBankAccountResponse({
    required String status,
    required String message,
    required BankAccountModel data,
  }) = _GetBankAccountResponse;

  factory GetBankAccountResponse.fromJson(Map<String, Object?> json) =>
      _$GetBankAccountResponseFromJson(json);
}

@freezed
class BankAccountModel with _$BankAccountModel {
  const factory BankAccountModel({
    @JsonKey(name: "kodeBank") required String bankCode,
    @JsonKey(name: "namaBank") required String bankName,
    @JsonKey(name: "noRekening") required String accountNumber,
    @JsonKey(name: "nama") required String accountName,
  }) = _BankAccountModel;

  factory BankAccountModel.fromJson(Map<String, Object?> json) =>
      _$BankAccountModelFromJson(json);
}
