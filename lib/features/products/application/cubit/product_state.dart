import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';

sealed class ProductState extends Equatable {}

final class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

final class ProductLoadInProgress extends ProductState {
  @override
  List<Object?> get props => [];
}

final class ProductLoadSuccess extends ProductState {
  final List<ProductModel> products;
  final FindAllProductDto dto;

  ProductLoadSuccess(this.products, this.dto);

  @override
  List<Object?> get props => [products, dto];
}

final class ProductLoadFailure extends ProductState {
  final String error;

  ProductLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class ProductActionInProgress extends ProductState {
  @override
  List<Object?> get props => [];
}

final class ProductActionSuccess extends ProductState {
  @override
  List<Object?> get props => [];
}

final class ProductActionFailure extends ProductState {
  final String error;

  ProductActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
