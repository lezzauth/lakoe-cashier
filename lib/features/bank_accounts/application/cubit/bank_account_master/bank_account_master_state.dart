import 'package:equatable/equatable.dart';
import 'package:owner_repository/owner_repository.dart';

sealed class BankAccountMasterState extends Equatable {}

final class BankAccountMasterInitial extends BankAccountMasterState {
  @override
  List<Object?> get props => [];
}

final class BankAccountMasterLoadInProgress extends BankAccountMasterState {
  @override
  List<Object?> get props => [];
}

final class BankAccountMasterLoadSuccess extends BankAccountMasterState {
  final List<OwnerBankModel> bankAccounts;

  BankAccountMasterLoadSuccess({required this.bankAccounts});

  @override
  List<Object?> get props => [bankAccounts];
}

final class BankAccountMasterLoadFailure extends BankAccountMasterState {
  final String error;

  BankAccountMasterLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class BankAccountMasterActionInProgress extends BankAccountMasterState {
  @override
  List<Object?> get props => [];
}

final class BankAccountMasterActionSuccess extends BankAccountMasterState {
  final OwnerBankModel response;

  BankAccountMasterActionSuccess({required this.response});

  @override
  List<Object?> get props => [response];
}

final class BankAccountMasterActionFailure extends BankAccountMasterState {
  final String error;

  BankAccountMasterActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
