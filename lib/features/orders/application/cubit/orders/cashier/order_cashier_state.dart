import 'package:cashier_repository/cashier_repository.dart';
import 'package:equatable/equatable.dart';

sealed class OrderCashierState extends Equatable {}

final class OrderMasterInitial extends OrderCashierState {
  @override
  List<Object?> get props => [];
}

final class OrderMasterLoadInProgress extends OrderCashierState {
  @override
  List<Object?> get props => [];
}

final class OrderMasterLoadSuccess extends OrderCashierState {
  final List<OrderCashierItemRes> orders;

  OrderMasterLoadSuccess({
    required this.orders,
  });

  @override
  List<Object?> get props => [orders];
}

final class OrderMasterLoadFailure extends OrderCashierState {
  final String error;

  OrderMasterLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
