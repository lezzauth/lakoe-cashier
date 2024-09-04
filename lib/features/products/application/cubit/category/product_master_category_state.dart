import 'package:category_repository/category_repository.dart';
import 'package:equatable/equatable.dart';

sealed class ProductMasterCategoryState extends Equatable {}

final class ProductMasterCategoryInitial extends ProductMasterCategoryState {
  @override
  List<Object> get props => [];
}

final class ProductMasterCategoryLoadInProgress
    extends ProductMasterCategoryState {
  @override
  List<Object?> get props => [];
}

final class ProductMasterCategoryLoadSuccess
    extends ProductMasterCategoryState {
  final List<CategoryModel> categories;

  ProductMasterCategoryLoadSuccess(
    this.categories,
  );

  @override
  List<Object?> get props => [categories];
}

final class ProductMasterCategoryLoadFailure
    extends ProductMasterCategoryState {
  final String error;

  ProductMasterCategoryLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
