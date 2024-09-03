import 'package:category_repository/category_repository.dart';
import 'package:equatable/equatable.dart';

sealed class CategoryState extends Equatable {}

final class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

final class CategoryLoadInProgress extends CategoryState {
  @override
  List<Object?> get props => [];
}

final class CategoryLoadSuccess extends CategoryState {
  final List<CategoryModel> categories;
  final FindAllCategoryDto dto;

  CategoryLoadSuccess(this.categories, this.dto);

  @override
  List<Object?> get props => [categories];
}

final class CategoryLoadFailure extends CategoryState {
  final String error;

  CategoryLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class CategoryActionInProgress extends CategoryState {
  @override
  List<Object?> get props => [];
}

final class CategoryActionSuccess extends CategoryState {
  @override
  List<Object?> get props => [];
}

final class CategoryActionFailure extends CategoryState {
  final String error;

  CategoryActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
