import 'package:dio/dio.dart';
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
    } on DioException catch (dioError) {
      String errorMessage;
      switch (dioError.response?.statusCode) {
        case 503:
          errorMessage = "Server unavailable (503)";
          break;
        case 400:
          errorMessage = "Invalid request (400)";
          break;
        case 401:
          errorMessage = "Unauthorized (401)";
          break;
        default:
          errorMessage = "Error: ${dioError.message}";
      }
      emit(BankVerifyActionFailure(errorMessage));
    } catch (e) {
      emit(BankVerifyActionFailure("Unknown error. Please try again."));
    }
  }
}
