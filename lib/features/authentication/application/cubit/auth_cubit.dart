import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthenticationRepository authenticationRepository;

  AuthCubit({required this.authenticationRepository}) : super(AuthInitial());

  Future<void> register(RegisterDto dto) async {
    emit(AuthRegisterInProgress());
    try {
      final response = await authenticationRepository.register(dto);
      emit(AuthRegisterSuccess(token: response.token));
    } catch (e) {
      emit(AuthRegisterFailure(error: e.toString()));
    }
  }

  Future<void> requestOTP(RequestOTPDto dto) async {
    emit(AuthRequestOTPInProgress());
    try {
      final response = await authenticationRepository.requestOTP(dto);
      emit(AuthRequestOTPSuccess(
        action: response.action,
        id: response.id,
        target: response.target,
        type: response.type,
      ));
    } catch (e) {
      emit(AuthRegisterFailure(error: e.toString()));
    }
  }

  Future<void> verifyOTP(VerifyOTPDto dto) async {
    emit(AuthVerifyOTPInProgress());
    try {
      final response = await authenticationRepository.verifyOTP(dto);
      switch (response.action) {
        case "LOGIN":
          emit(AuthVerifyOTPSuccessAndLogin(token: response.token));
          break;
        case "REGISTER":
          emit(AuthVerifyOTPSuccessAndRegister(token: response.token));
          break;
        default:
          throw ErrorSummary("unknown action");
      }
    } catch (e) {
      emit(AuthVerifyOTPFailure(error: e.toString()));
    }
  }
}
