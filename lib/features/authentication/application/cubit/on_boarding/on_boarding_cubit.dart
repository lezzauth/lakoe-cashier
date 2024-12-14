import 'package:authentication_repository/authentication_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/on_boarding/on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepositoryImpl();

  OnBoardingCubit() : super(OnBoardingInitial());

  Future<void> requestOTP(RequestOTPDto dto) async {
    try {
      emit(OnBoardingActionInProgress());
      final response = await _authenticationRepository.requestOTP(dto);
      emit(OnBoardingActionSuccess(response: response));
    } catch (e) {
      if (e is DioException) {
        final resError = e.error as DioExceptionModel;
        if (resError.statusCode == 429) {
          emit(OnBoardingActionFailure("Too many requests (429)"));
        } else {
          emit(OnBoardingActionFailure(e.message ?? "An error occurred."));
        }
      } else {
        emit(OnBoardingActionFailure("Unexpected error occurred: $e"));
      }
    }
  }
}
