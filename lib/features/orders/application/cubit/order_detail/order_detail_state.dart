import 'package:cashier_repository/cashier_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:order_repository/order_repository.dart';

class OrderDetailOpenedState extends Equatable {
  final String? selectedId;

  const OrderDetailOpenedState(this.selectedId);

  @override
  List<Object?> get props => [selectedId];
}

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
  final CompleteOrderRes? completeResponse;
  final CancelOrderResponse? cancelResponse;

  OrderDetailActionSuccess({
    this.completeResponse,
    this.cancelResponse,
  });

  @override
  List<Object?> get props => [completeResponse, cancelResponse];
}

final class OrderDetailActionFailure extends OrderDetailState {
  final String error;

  OrderDetailActionFailure(this.error);

  @override
  List<Object?> get props => [];
}
