import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:token_provider/token_provider.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthenticationRepository authenticationRepository;
  final TokenProvider _tokenProvider = TokenProvider();

  AuthCubit({required this.authenticationRepository}) : super(AuthInitial());

  Future<void> register(RegisterDto dto) async {
    emit(AuthRegisterInProgress());
    try {
      final response = await authenticationRepository.register(dto);
      emit(AuthRegisterSuccess(token: response.token));
      _tokenProvider.setAppToken(response.token);
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
    AuthState currentState = state;

    emit(AuthVerifyOTPInProgress());
    try {
      final response = await authenticationRepository.verifyOTP(dto);

      switch (response.action) {
        case "LOGIN":
          emit(AuthVerifyOTPSuccessAndLogin(token: response.token));
          _tokenProvider.setAppToken(response.token);
          break;
        case "REGISTER":
          emit(AuthVerifyOTPSuccessAndRegister(
              token: response.token, phoneNumber: dto.phoneNumber));
          _tokenProvider.setAuthToken(response.token);
          break;
        default:
          throw ErrorSummary("unknown action");
      }
    } catch (e) {
      switch (currentState) {
        case AuthRequestOTPSuccess(:final target, :final action):
        case AuthVerifyOTPFailure(:final target, :final action):
          emit(AuthVerifyOTPFailure(
            error: e.toString(),
            action: action,
            target: target,
          ));
          break;
        default:
      }
    }
  }

  void ready(String token, String outletId) {
    emit(AuthReady(token: token, outletId: outletId));
  }
}
