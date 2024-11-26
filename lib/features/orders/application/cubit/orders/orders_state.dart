import 'package:equatable/equatable.dart';
import 'package:order_repository/order_repository.dart';

sealed class OrdersState extends Equatable {}

final class OrderMasterCompletedInitial extends OrdersState {
  @override
  List<Object?> get props => [];
}

final class OrderMasterCompletedLoadInProgress extends OrdersState {
  @override
  List<Object?> get props => [];
}

final class OrderMasterCompletedLoadSuccess extends OrdersState {
  final List<OrderItemRes> orders;

  OrderMasterCompletedLoadSuccess({
    required this.orders,
  });

  @override
  List<Object?> get props => [orders];
}

final class OrderMasterCompletedLoadFailure extends OrdersState {
  final String error;

  OrderMasterCompletedLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
