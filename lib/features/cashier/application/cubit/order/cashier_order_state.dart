import 'package:cashier_repository/cashier_repository.dart';
import 'package:equatable/equatable.dart';

sealed class CashierOrderState extends Equatable {}

final class CashierOrderInitial extends CashierOrderState {
  @override
  List<Object?> get props => [];
}

final class CashierOrderLoadInProgress extends CashierOrderState {
  @override
  List<Object?> get props => [];
}

final class CashierOrderLoadSuccess extends CashierOrderState {
  final List<OrderCashierItemRes> orders;

  CashierOrderLoadSuccess({
    required this.orders,
  });

  @override
  List<Object?> get props => [orders];
}

final class CashierOrderLoadFailure extends CashierOrderState {
  final String error;

  CashierOrderLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class ConnectionIssue extends CashierOrderState {
  final String message;

  ConnectionIssue(this.message);

  @override
  List<Object?> get props => throw UnimplementedError();
}
