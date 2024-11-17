import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/application/cubit/bank_verify_state.dart';
import 'package:public_repository/public_repository.dart';

class BankVerifyCubit extends Cubit<BankVerifyState> {
  final PublicRepository _publicRepository = PublicRepositoryImpl();

  BankVerifyCubit() : super(BankVerifyInitial());

  Future<void> verify(GetBankAccountDto dto) async {
    try {
      emit(BankVerifyActionInProgress());
      final account = await _publicRepository.getBankAccount(dto);
      emit(BankVerifyActionSuccess(account: account));
    } catch (e) {
      emit(BankVerifyActionFailure(e.toString()));
    }
  }
}
