import 'package:cashier_repository/cashier_repository.dart';
import 'package:equatable/equatable.dart';

sealed class OrderMasterCompletedState extends Equatable {}

final class OrderMasterCompletedInitial extends OrderMasterCompletedState {
  @override
  List<Object?> get props => [];
}

final class OrderMasterCompletedLoadInProgress
    extends OrderMasterCompletedState {
  @override
  List<Object?> get props => [];
}

final class OrderMasterCompletedLoadSuccess extends OrderMasterCompletedState {
  final List<OrderItemResponse> orders;

  OrderMasterCompletedLoadSuccess({
    required this.orders,
  });

  @override
  List<Object?> get props => [orders];
}

final class OrderMasterCompletedLoadFailure extends OrderMasterCompletedState {
  final String error;

  OrderMasterCompletedLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
