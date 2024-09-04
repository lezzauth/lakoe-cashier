import 'package:category_repository/category_repository.dart';
import 'package:equatable/equatable.dart';

sealed class CashierCategoryState extends Equatable {}

final class CashierCategoryInitial extends CashierCategoryState {
  @override
  List<Object> get props => [];
}

final class CashierCategoryLoadInProgress extends CashierCategoryState {
  @override
  List<Object?> get props => [];
}

final class CashierCategoryLoadSuccess extends CashierCategoryState {
  final List<CategoryModel> categories;

  CashierCategoryLoadSuccess(
    this.categories,
  );

  @override
  List<Object?> get props => [categories];
}

final class CashierCategoryLoadFailure extends CashierCategoryState {
  final String error;

  CashierCategoryLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
