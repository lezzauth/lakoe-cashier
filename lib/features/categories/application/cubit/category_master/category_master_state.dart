import 'package:category_repository/category_repository.dart';
import 'package:equatable/equatable.dart';

sealed class CategoryMasterState extends Equatable {}

final class CategoryMasterInitial extends CategoryMasterState {
  @override
  List<Object> get props => [];
}

final class CategoryMasterLoadInProgress extends CategoryMasterState {
  @override
  List<Object?> get props => [];
}

final class CategoryMasterLoadSuccess extends CategoryMasterState {
  final List<CategoryModel> categories;
  final FindAllCategoryDto dto;

  CategoryMasterLoadSuccess(this.categories, this.dto);

  @override
  List<Object?> get props => [categories];
}

final class CategoryMasterLoadFailure extends CategoryMasterState {
  final String error;

  CategoryMasterLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class CategoryMasterActionInProgress extends CategoryMasterState {
  @override
  List<Object?> get props => [];
}

final class CategoryMasterActionSuccess extends CategoryMasterState {
  final CategoryModel category;
  CategoryMasterActionSuccess(this.category);
  @override
  List<Object?> get props => [];
}

final class CategoryMasterActionFailure extends CategoryMasterState {
  final String error;

  CategoryMasterActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class ConnectionIssue extends CategoryMasterState {
  final String message;

  ConnectionIssue(this.message);

  @override
  List<Object?> get props => throw UnimplementedError();
}
