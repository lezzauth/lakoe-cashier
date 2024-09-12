import 'package:equatable/equatable.dart';
import 'package:public_repository/public_repository.dart';

sealed class BankListState extends Equatable {}

final class BankListInitial extends BankListState {
  @override
  List<Object?> get props => [];
}

final class BankListLoadInProgress extends BankListState {
  @override
  List<Object?> get props => [];
}

final class BankListLoadSuccess extends BankListState {
  final List<BankListModel> banks;

  BankListLoadSuccess({required this.banks});

  @override
  List<Object?> get props => [banks];
}

final class BankListLoadFailure extends BankListState {
  final String error;

  BankListLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
