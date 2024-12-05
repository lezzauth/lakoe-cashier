import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:employee_repository/employee_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/employees/application/cubit/forgot_pin/forgot_pin_state.dart';

class ForgotPinCubit extends Cubit<ForgotPinState> {
  final EmployeeRepository repository = EmployeeRepositoryImpl();

  ForgotPinCubit() : super(ForgotPinInitial());

  Future<void> requestOTP(String id, RequestOtpDto dto) async {
    try {
      emit(RequestOtpInProgress());
      final res = await repository.requestOTP(id, dto);
      emit(RequestOtpSuccess(res: res));
    } catch (e) {
      emit(RequestOtpFailure(e.toString()));
    }
  }

  Future<void> verifyOTP(String id, VerifyOtpDto dto) async {
    try {
      emit(VerifyOtpInProgress());
      final res = await repository.verifyOTP(id, dto);
      emit(VerifyOtpSuccess(res: res));
    } catch (e) {
      emit(VerifyOtpFailure(e.toString()));
    }
  }

  Future<void> updatePin(String id, UpdatePinDto dto) async {
    try {
      emit(UpdatePinInProgress());
      final res = await repository.updatePIN(id, dto);
      emit(UpdatePinSuccess(res: res));
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
        } else if (statusCode == 409) {
          errorMessage = "This pin already used by another employee (409)";
        }
      } else {
        errorMessage = "Unable to connect to server";
      }

      emit(UpdatePinFailure(errorMessage));
    } catch (e) {
      emit(UpdatePinFailure(e.toString()));
    }
  }
}
