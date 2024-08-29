import 'package:cashier_repository/cashier_repository.dart';

sealed class CashierState {}

final class CashierInitial extends CashierState {}

final class CashierOpenInProgress extends CashierState {}

final class CashierOpened extends CashierState {
  final OperatorModel operator;
  final String token;

  CashierOpened({required this.token, required this.operator});
}

final class CashierOpenFailure extends CashierState {
  final String message;
  CashierOpenFailure({required this.message});
}

final class CashierCloseInProgress extends CashierState {}

final class CashierCloseSuccess extends CashierState {}

final class CashierCloseFailure extends CashierState {
  final String message;
  CashierCloseFailure({required this.message});
}
