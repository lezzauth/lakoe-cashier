import 'package:dio_provider/dio_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';

sealed class ProductMasterState extends Equatable {}

final class ProductMasterInitial extends ProductMasterState {
  @override
  List<Object> get props => [];
}

final class ProductMasterLoadInProgress extends ProductMasterState {
  @override
  List<Object?> get props => [];
}

final class ProductMasterLoadSuccess extends ProductMasterState {
  final List<ProductModel> products;

  ProductMasterLoadSuccess({
    required this.products,
  });

  @override
  List<Object?> get props => [products];
}

final class ProductMasterLoadFailure extends ProductMasterState {
  final String error;

  ProductMasterLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class ProductMasterActionInProgress extends ProductMasterState {
  @override
  List<Object?> get props => [];
}

final class ProductMasterActionSuccess extends ProductMasterState {
  @override
  List<Object?> get props => [];
}

final class ProductMasterActionFailure extends ProductMasterState {
  final String error;

  ProductMasterActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class ProductMasterReachesLimit extends ProductMasterState {
  final DioExceptionModel res;

  ProductMasterReachesLimit(this.res);

  @override
  List<Object?> get props => [res];
}
