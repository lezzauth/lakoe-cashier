import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/application/cubit/bank_verify_state.dart';
import 'package:public_repository/public_repository.dart';

class BankVerifyCubit extends Cubit<BankVerifyState> {
  final PublicRepository _publicRepository = PublicRepositoryImpl();

  BankVerifyCubit() : super(BankVerifyInitial());

  Future<void> verify(GetBankAccountDto dto) async {
    try {
      emit(BankVerifyActionInProgress());
      final res = await _publicRepository.getBankAccount(dto);
      emit(BankVerifyActionSuccess(account: res));
    } catch (e) {
      String status = "Unknown";
      String message = "Unknown error. Please try again.";

      if (e.toString().contains("Error status:")) {
        final parts = e.toString().split("Error status:");
        if (parts.length > 1) {
          final errorDetails = parts[1].split(", Message:");
          status = errorDetails[0].trim();
          message = errorDetails.length > 1
              ? errorDetails[1].trim()
              : "No message provided.";
        }
      }

      emit(BankVerifyActionFailure(status: status, message: message));
    }
  }
}
