import 'package:equatable/equatable.dart';

sealed class OnboardingTransactionState extends Equatable {}

final class OnboardingTransactionInitial extends OnboardingTransactionState {
  @override
  List<Object?> get props => [];
}

final class OnboardingTransactionLoadInProgress
    extends OnboardingTransactionState {
  @override
  List<Object?> get props => [];
}

final class OnboardingTransactionLoadSuccess
    extends OnboardingTransactionState {
  final bool isProductCompleted;
  final bool isBankAccountCompleted;

  OnboardingTransactionLoadSuccess({
    required this.isBankAccountCompleted,
    required this.isProductCompleted,
  });

  @override
  List<Object?> get props => [isProductCompleted, isBankAccountCompleted];
}

final class OnboardingTransactionLoadFailure
    extends OnboardingTransactionState {
  final String error;

  OnboardingTransactionLoadFailure(this.error);

  @override
  List<Object?> get props => [];
}