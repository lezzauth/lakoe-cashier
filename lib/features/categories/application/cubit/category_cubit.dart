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
      emit(CategoryLoadSuccess(categories, dto));
    } catch (e) {
      emit(CategoryLoadFailure(e.toString()));
    }
  }

  Future<void> create(CreateCategoryDto dto) async {
    CategoryState currentState = state;
    try {
      emit(CategoryActionInProgress());
      await categoryRepository.create(dto);
      emit(CategoryActionSuccess());
    } catch (e) {
      emit(CategoryActionFailure(e.toString()));
    }

    if (currentState is CategoryLoadSuccess) {
      await findAll(currentState.dto);
    }
  }

  Future<void> update(int id, UpdateCategoryDto dto) async {
    CategoryState currentState = state;
    try {
      emit(CategoryActionInProgress());
      await categoryRepository.update(id, dto);
      emit(CategoryActionSuccess());
    } catch (e) {
      emit(CategoryActionFailure(e.toString()));
    }

    if (currentState is CategoryLoadSuccess) {
      await findAll(currentState.dto);
    }
  }
}
