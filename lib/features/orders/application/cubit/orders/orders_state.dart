import 'package:equatable/equatable.dart';
import 'package:order_repository/order_repository.dart';

sealed class OrdersState extends Equatable {}

final class OrdersStateInitial extends OrdersState {
  @override
  List<Object?> get props => [];
}

final class OrdersLoadInProgress extends OrdersState {
  @override
  List<Object?> get props => [];
}

final class OrdersLoadSuccess extends OrdersState {
  final List<OrderItemRes> orders;

  OrdersLoadSuccess({
    required this.orders,
  });

  @override
  List<Object?> get props => [orders];
}

final class OrdersLoadFailure extends OrdersState {
  final String error;

  OrdersLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
