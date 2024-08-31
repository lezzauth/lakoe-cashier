import 'package:cashier_repository/cashier_repository.dart';
import 'package:equatable/equatable.dart';

sealed class OrderState extends Equatable {}

final class OrderInitial extends OrderState {
  @override
  List<Object?> get props => [];
}

final class OrderLoadInProgress extends OrderState {
  @override
  List<Object?> get props => [];
}

final class OrderLoadSuccess extends OrderState {
  final List<OrderItemResponse> orders;
  final FindAllOrderDto dto;

  OrderLoadSuccess({required this.orders, required this.dto});

  @override
  List<Object?> get props => [orders];
}

final class OrderLoadFailure extends OrderState {
  final String error;

  OrderLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
