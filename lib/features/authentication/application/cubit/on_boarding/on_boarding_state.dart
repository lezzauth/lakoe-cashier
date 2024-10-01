import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';

sealed class OnBoardingState extends Equatable {}

final class OnBoardingInitial extends OnBoardingState {
  @override
  List<Object?> get props => [];
}

final class OnBoardingActionInProgress extends OnBoardingState {
  @override
  List<Object?> get props => [];
}

final class OnBoardingActionSuccess extends OnBoardingState {
  final RequestOTPResponse response;

  OnBoardingActionSuccess({required this.response});

  @override
  List<Object?> get props => [response];
}

final class OnBoardingActionFailure extends OnBoardingState {
  final String error;

  OnBoardingActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
