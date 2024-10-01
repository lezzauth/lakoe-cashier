import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/otp_input/otp_input_state.dart';
import 'package:token_provider/token_provider.dart';

class OtpInputCubit extends Cubit<OtpInputState> {
  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepositoryImpl();
  final TokenProvider _tokenProvider = TokenProvider();

  OtpInputCubit() : super(OtpInputInitial());

  Future<void> verifyOTP(VerifyOTPDto dto) async {
    try {
      emit(OtpInputActionInProgress());
      final response = await _authenticationRepository.verifyOTP(dto);
      _tokenProvider.setAuthToken(response.token);

      switch (response.action) {
        case "LOGIN":
          emit(OtpInputActionLogin(
            response: response,
          ));
          break;
        case "REGISTER":
          emit(OtpInputActionRegister(
            response: response,
          ));
          break;
        default:
          throw ErrorSummary("unknown action");
      }
    } catch (e) {
      emit(OtpInputActionFailure(e.toString()));
    }
  }
}
