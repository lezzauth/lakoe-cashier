import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_state.dart';

class BankAccountMasterCubit extends Cubit<BankAccountMasterState> {
  final OwnerRepository _ownerRepository = OwnerRepositoryImpl();

  BankAccountMasterCubit() : super(BankAccountMasterInitial());

  Future<void> init(String ownerId) async {
    await findAll(ownerId: ownerId);
  }

  Future<void> findAll({
    required String ownerId,
  }) async {
    try {
      emit(BankAccountMasterLoadInProgress());
      final bankAccounts =
          await _ownerRepository.bank.findAll(ownerId: ownerId);
      emit(BankAccountMasterLoadSuccess(bankAccounts: bankAccounts));
    } catch (e) {
      emit(BankAccountMasterLoadFailure(e.toString()));
    }
  }
}
