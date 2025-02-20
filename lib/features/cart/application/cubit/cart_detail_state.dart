import 'package:cashier_repository/cashier_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:order_repository/order_repository.dart';

sealed class CartDetailState extends Equatable {}

final class CartDetailInitial extends CartDetailState {
  @override
  List<Object?> get props => [];
}

final class CartDetailLoadInProgress extends CartDetailState {
  @override
  List<Object?> get props => [];
}

final class CartDetailLoadSuccess extends CartDetailState {
  final PreviewOrderPriceResponse previewOrderPrice;

  CartDetailLoadSuccess({required this.previewOrderPrice});

  @override
  List<Object?> get props => [previewOrderPrice];
}

final class CartDetailLoadFailure extends CartDetailState {
  final String error;

  CartDetailLoadFailure(this.error);
  @override
  List<Object?> get props => [error];
}

final class CartDetailActionInProgress extends CartDetailState {
  @override
  List<Object?> get props => [];
}

final class CartDetailActionSuccess extends CartDetailState {
  final SaveOrderResponse res;

  CartDetailActionSuccess({required this.res});
  @override
  List<Object?> get props => [res];
}

final class CartDetailActionFailure extends CartDetailState {
  final String error;

  CartDetailActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class CartDetailCompleteActionSuccess extends CartDetailState {
  final CompleteOrderRes res;

  CartDetailCompleteActionSuccess({required this.res});

  @override
  List<Object?> get props => [res];
}

final class CartDetailCompleteActionFailure extends CartDetailState {
  final String error;

  CartDetailCompleteActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
