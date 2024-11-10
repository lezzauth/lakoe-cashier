import 'package:equatable/equatable.dart';
import 'package:order_repository/order_repository.dart';

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
  final List<OrderItemRes> orders;

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
