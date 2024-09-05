import 'package:cashier_repository/cashier_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:order_repository/order_repository.dart';

sealed class OrderDetailState extends Equatable {}

final class OrderDetailInitial extends OrderDetailState {
  @override
  List<Object?> get props => [];
}

final class OrderDetailLoadInProgress extends OrderDetailState {
  @override
  List<Object?> get props => [];
}

final class OrderDetailLoadSuccess extends OrderDetailState {
  final OrderModel order;

  OrderDetailLoadSuccess({required this.order});

  @override
  List<Object?> get props => [order];
}

final class OrderDetailLoadFailure extends OrderDetailState {
  final String error;

  OrderDetailLoadFailure(this.error);

  @override
  List<Object?> get props => [];
}

final class OrderDetailActionInProgress extends OrderDetailState {
  @override
  List<Object?> get props => [];
}

final class OrderDetailActionSuccess extends OrderDetailState {
  final CompleteOrderResponse response;

  OrderDetailActionSuccess({required this.response});

  @override
  List<Object?> get props => [];
}

final class OrderDetailActionFailure extends OrderDetailState {
  final String error;

  OrderDetailActionFailure(this.error);

  @override
  List<Object?> get props => [];
}
