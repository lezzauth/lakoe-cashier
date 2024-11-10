import 'package:authentication_repository/authentication_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
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
      final res = await _authenticationRepository.verifyOTP(dto);
      _tokenProvider.setAuthToken(res.token, res.tokenExpireIn);
      _tokenProvider.setAuthRefreshToken(res.refreshToken);

      switch (res.action) {
        case "LOGIN":
          emit(OtpInputActionLogin(
            response: res,
          ));
          break;
        case "REGISTER":
          emit(OtpInputActionRegister(
            response: res,
          ));
          break;
        default:
          throw ErrorSummary("unknown action");
      }
    } catch (e) {
      if (e is DioException) {
        final resError = e.error as DioExceptionModel;
        emit(OtpInputActionFailure(resError));
        return;
      }

      emit(
        OtpInputActionFailure(
          DioExceptionModel(
            statusCode: 400,
            error: e.toString(),
            message: "Otp input action failure",
          ),
        ),
      );
    }
  }
}
