import 'package:equatable/equatable.dart';
import 'package:online_shop_repository/online_shop_repository.dart';

sealed class ShopOrderDetailState extends Equatable {}

final class ShopOrderDetailInitial extends ShopOrderDetailState {
  @override
  List<Object?> get props => [];
}

final class ShopOrderDetailLoadInProgress extends ShopOrderDetailState {
  @override
  List<Object?> get props => [];
}

final class ShopOrderDetailLoadSuccess extends ShopOrderDetailState {
  final OrderDetailModel order;

  ShopOrderDetailLoadSuccess({required this.order});

  @override
  List<Object?> get props => [order];
}

final class ShopOrderDetailActionInProgress extends ShopOrderDetailLoadSuccess {
  ShopOrderDetailActionInProgress({required super.order});
}

final class ShopOrderDetailActionSuccess extends ShopOrderDetailLoadSuccess {
  ShopOrderDetailActionSuccess({required super.order});
}

final class ShopOrderDetailActionFailure extends ShopOrderDetailLoadSuccess {
  final String error;

  ShopOrderDetailActionFailure(this.error, {required super.order});

  @override
  List<Object?> get props => [...super.props, error];
}

final class ShopOrderDetailLoadFailure extends ShopOrderDetailState {
  final String error;

  ShopOrderDetailLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
