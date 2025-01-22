import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/account/manage_account/application/delete_account_state.dart';
import 'package:logman/logman.dart';
import 'package:owner_repository/owner_repository.dart';

class ReasonsCubit extends Cubit<ReasonsState> {
  ReasonsCubit() : super(const ReasonsState(reasons: []));

  void toggleReason(String reason, bool isSelected) {
    final updatedReasons = List<String>.from(state.reasons);
    if (isSelected) {
      if (!updatedReasons.contains(reason)) {
        updatedReasons.add(reason);
      }
    } else {
      updatedReasons.remove(reason);
    }
    emit(ReasonsState(reasons: updatedReasons));
  }

  void updateOtherReason(String reason) {
    final updatedReasons = List<String>.from(state.reasons);
    updatedReasons.removeWhere((r) => r.startsWith('Lainnya: '));
    if (reason.isNotEmpty) {
      updatedReasons.add('Lainnya: $reason');
    }
    emit(ReasonsState(reasons: updatedReasons));
  }
}

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final OwnerRepository _ownerRepository = OwnerRepositoryImpl();

  DeleteAccountCubit() : super(DeleteAccountInitial());

  Future<void> deleteAccount(DeleteAccountDto dto) async {
    emit(DeleteAccountLoadInProgress());
    try {
      final res = await _ownerRepository.deleteAccount(dto);
      emit(DeleteAccountLoadSuccess(res));
    } on DioException catch (e) {
      final error = e.error as DioExceptionModel?;
      String errorMessage = "Terjadi kesalahan. Silakan coba lagi.";

      if (error != null) {
        final statusCode = error.statusCode;

        if (statusCode == 400) {
          errorMessage = "Invalid or expired code (400)";
        } else if (statusCode == 401) {
          errorMessage = "Access denied (401)";
        } else if (statusCode == 500) {
          errorMessage = "Server error (500)";
        } else if (statusCode == 429) {
          errorMessage = "Too many requests (429)";
        }

        Logman.instance.error(
            "Catch Delete Account ${e.response?.statusCode}: ${e.response?.data}");
      } else {
        errorMessage = "Unable to connect to server";
        Logman.instance.error("Catch Edit Account ${e.message}");
      }

      emit(DeleteAccountLoadFailure(errorMessage));
    } catch (e) {
      emit(DeleteAccountLoadFailure(e.toString()));
    }
  }
}
