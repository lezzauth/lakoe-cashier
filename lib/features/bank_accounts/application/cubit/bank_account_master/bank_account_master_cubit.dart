import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_state.dart';

class BankAccountMasterCubit extends Cubit<BankAccountMasterState> {
  final OwnerRepository _ownerRepository = OwnerRepositoryImpl();

  BankAccountMasterCubit() : super(BankAccountMasterInitial());

  Future<void> init() async {
    await findAll();
  }

  Future<void> findAll() async {
    try {
      emit(BankAccountMasterLoadInProgress());
      final bankAccounts = await _ownerRepository.bank.findAll();
      emit(BankAccountMasterLoadSuccess(bankAccounts: bankAccounts));
    } catch (e) {
      emit(BankAccountMasterLoadFailure(e.toString()));
    }
  }

  Future<void> create({
    required CreateOwnerBankDto dto,
  }) async {
    try {
      emit(BankAccountMasterActionInProgress());
      final response = await _ownerRepository.bank.create(dto: dto);
      emit(BankAccountMasterActionSuccess(response: response));
    } catch (e) {
      emit(BankAccountMasterActionFailure(e.toString()));
    }
  }

  Future<void> update({
    required String bankId,
    required UpdateOwnerBankDto dto,
  }) async {
    try {
      emit(BankAccountMasterActionInProgress());

      final response =
          await _ownerRepository.bank.update(bankId: bankId, dto: dto);

      final allBanks = await _ownerRepository.bank.findAll();
      final hasPrimaryBank = allBanks.any((bank) => bank.isPrimary);

      if (!hasPrimaryBank && !response.isPrimary) {
        final forcedPrimaryResponse = await _ownerRepository.bank.update(
          bankId: bankId,
          dto: dto.copyWith(isPrimary: true),
        );
        emit(BankAccountMasterActionSuccess(response: forcedPrimaryResponse));

        CustomToast.show(
          "Rekening bank utama tetap harus ada.",
          position: "center",
        );
      } else {
        emit(BankAccountMasterActionSuccess(response: response));
      }
    } catch (e) {
      emit(BankAccountMasterActionFailure(e.toString()));
    }
  }

  Future<void> delete({required String bankId}) async {
    try {
      emit(BankAccountMasterActionInProgress());
      final response = await _ownerRepository.bank.delete(bankId: bankId);
      emit(BankAccountMasterActionSuccess(response: response));
    } catch (e) {
      emit(BankAccountMasterActionFailure(e.toString()));
    }
  }
}
