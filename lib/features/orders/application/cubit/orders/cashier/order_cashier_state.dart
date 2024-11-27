import 'package:cashier_repository/cashier_repository.dart';
import 'package:equatable/equatable.dart';

sealed class OrderCashierState extends Equatable {}

final class OrderCashierStateInitial extends OrderCashierState {
  @override
  List<Object?> get props => [];
}

final class OrderCashierLoadInProgress extends OrderCashierState {
  @override
  List<Object?> get props => [];
}

final class OrderCashierLoadSuccess extends OrderCashierState {
  final List<OrderCashierItemRes> orders;

  OrderCashierLoadSuccess({
    required this.orders,
  });

  @override
  List<Object?> get props => [orders];
}

final class OrderCashierLoadFailure extends OrderCashierState {
  final String error;

  OrderCashierLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
