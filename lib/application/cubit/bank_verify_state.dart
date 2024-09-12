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
  final BankAccountModel account;

  BankVerifyActionSuccess({required this.account});

  @override
  List<Object?> get props => [account];
}

final class BankVerifyActionFailure extends BankVerifyState {
  final String error;

  BankVerifyActionFailure(this.error);

  @override
  List<Object?> get props => [];
}
