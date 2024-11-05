import 'package:cashier_repository/cashier_repository.dart';
import 'package:equatable/equatable.dart';

sealed class OrderMasterState extends Equatable {}

final class OrderMasterInitial extends OrderMasterState {
  @override
  List<Object?> get props => [];
}

final class OrderMasterLoadInProgress extends OrderMasterState {
  @override
  List<Object?> get props => [];
}

final class OrderMasterLoadSuccess extends OrderMasterState {
  final List<OrderCashierItemResponse> orders;

  OrderMasterLoadSuccess({
    required this.orders,
  });

  @override
  List<Object?> get props => [orders];
}

final class OrderMasterLoadFailure extends OrderMasterState {
  final String error;

  OrderMasterLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
