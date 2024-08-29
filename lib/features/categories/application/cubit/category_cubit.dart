import 'package:category_repository/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryCubit({required this.categoryRepository}) : super(CategoryInitial());

  Future<void> findAll(FindAllCategoryDto dto) async {
    try {
      emit(CategoryLoadInProgress());
      final categories = await categoryRepository.findAll(dto);
      emit(CategoryLoadSuccess(categories));
    } catch (e) {
      emit(CategoryLoadFailure(e.toString()));
    }
  }
}
