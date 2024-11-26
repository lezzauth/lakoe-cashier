import 'package:equatable/equatable.dart';
import 'package:online_shop_repository/online_shop_repository.dart';

sealed class ShopOrderCashierState extends Equatable {}

final class ShopOrderMasterInitial extends ShopOrderCashierState {
  @override
  List<Object?> get props => [];
}

final class ShopOrderMasterLoadInProgress extends ShopOrderCashierState {
  @override
  List<Object?> get props => [];
}

final class ShopOrderMasterLoadSuccess extends ShopOrderCashierState {
  final List<OrderModel> orders;

  ShopOrderMasterLoadSuccess({required this.orders});

  @override
  List<Object?> get props => [orders];
}

final class ShopOrderMasterLoadFailure extends ShopOrderCashierState {
  final String error;

  ShopOrderMasterLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
