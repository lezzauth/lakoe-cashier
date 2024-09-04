import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';

sealed class CashierProductState extends Equatable {}

final class CashierProductInitial extends CashierProductState {
  @override
  List<Object> get props => [];
}

final class CashierProductLoadInProgress extends CashierProductState {
  @override
  List<Object?> get props => [];
}

final class CashierProductLoadSuccess extends CashierProductState {
  final List<ProductModel> products;

  CashierProductLoadSuccess({required this.products});

  @override
  List<Object?> get props => [products];
}

final class CashierProductLoadFailure extends CashierProductState {
  final String error;

  CashierProductLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
