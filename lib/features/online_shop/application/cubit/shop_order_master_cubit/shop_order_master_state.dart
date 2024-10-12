import 'package:equatable/equatable.dart';
import 'package:online_shop_repository/online_shop_repository.dart';

sealed class ShopOrderMasterState extends Equatable {}

final class ShopOrderMasterInitial extends ShopOrderMasterState {
  @override
  List<Object?> get props => [];
}

final class ShopOrderMasterLoadInProgress extends ShopOrderMasterState {
  @override
  List<Object?> get props => [];
}

final class ShopOrderMasterLoadSuccess extends ShopOrderMasterState {
  final List<OrderModel> orders;

  ShopOrderMasterLoadSuccess({required this.orders});

  @override
  List<Object?> get props => [orders];
}

final class ShopOrderMasterLoadFailure extends ShopOrderMasterState {
  final String error;

  ShopOrderMasterLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
