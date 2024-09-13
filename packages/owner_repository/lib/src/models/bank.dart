import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank.freezed.dart';
part 'bank.g.dart';

@freezed
class OwnerBankModel with _$OwnerBankModel {
  const factory OwnerBankModel({
    required String id,
    required String name,
    required bool isPrimary,
    required String accountNumber,
    required String accountName,
    required String ownerId,
    required String createdAt,
    required String updatedAt,
  }) = _OwnerBankModel;

  factory OwnerBankModel.fromJson(Map<String, Object?> json) =>
      _$OwnerBankModelFromJson(json);
}
