import 'package:equatable/equatable.dart';
import 'package:public_repository/public_repository.dart';

sealed class BankVerifyState extends Equatable {}

final class BankVerifyInitial extends BankVerifyState {
  @override
  List<Object?> get props => [];
}

final class BankVerifyActionInProgress extends BankVerifyState {
  @override
  List<Object?> get props => [];
}

final class BankVerifyActionSuccess extends BankVerifyState {
  final GetBankAccountResponse account;

  BankVerifyActionSuccess({required this.account});

  @override
  List<Object?> get props => [account];
}

final class BankVerifyActionFailure extends BankVerifyState {
  final String status;
  final String message;

  BankVerifyActionFailure({required this.status, required this.message});

  @override
  List<Object?> get props => [status, message];
}
