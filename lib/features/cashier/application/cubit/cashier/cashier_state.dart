import 'package:cashier_repository/cashier_repository.dart';

sealed class CashierState {}

final class CashierInitial extends CashierState {}

final class CashierOpenInProgress extends CashierState {}

final class CashierOpened extends CashierState {
  final OperatorModel operator;

  CashierOpened({required this.operator});
}

final class CashierOpenFailure extends CashierState {
  final String message;
  CashierOpenFailure({required this.message});
}

final class CashierCloseInProgress extends CashierState {}

final class CashierClosed extends CashierState {}

final class CashierCloseFailure extends CashierState {
  final String message;
  CashierCloseFailure({required this.message});
}

final class GetCashierInProgress extends CashierState {}

final class CashierAlreadyOpen extends CashierState {
  final OperatorModel operator;

  CashierAlreadyOpen({required this.operator});
}

final class GetCashierFailure extends CashierState {
  final String message;
  GetCashierFailure({required this.message});
}
