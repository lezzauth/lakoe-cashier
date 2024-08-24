import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_account_model.freezed.dart';

@freezed
class BankAccountModel with _$BankAccountModel {
  const factory BankAccountModel({
    required String id,
    required String name,
    required String number,
    required String bankName,
  }) = _BankAccountModel;
}
