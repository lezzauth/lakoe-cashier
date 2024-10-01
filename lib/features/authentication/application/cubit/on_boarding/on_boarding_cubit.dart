import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/on_boarding/on_boarding_state.dart';

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
      emit(OnBoardingActionFailure(e.toString()));
    }
  }
}
