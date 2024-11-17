import 'package:category_repository/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/categories/application/cubit/category_master/category_master_state.dart';

class CategoryMasterCubit extends Cubit<CategoryMasterState> {
  final CategoryRepository _categoryRepository = CategoryRepositoryImpl();

  CategoryMasterCubit() : super(CategoryMasterInitial());

  Future<void> init() async {
    await findAll(FindAllCategoryDto());
  }

  Future<void> findAll(FindAllCategoryDto dto) async {
    try {
      emit(CategoryMasterLoadInProgress());
      final categories = await _categoryRepository.findAll(dto);
      emit(CategoryMasterLoadSuccess(categories, dto));
    } catch (e) {
      emit(CategoryMasterLoadFailure(e.toString()));
    }
  }

  Future<void> create(CreateCategoryDto dto) async {
    try {
      emit(CategoryMasterActionInProgress());
      final res = await _categoryRepository.create(dto);
      emit(CategoryMasterActionSuccess(res));
    } catch (e) {
      emit(CategoryMasterActionFailure(e.toString()));
    }
  }

  Future<void> update(int id, UpdateCategoryDto dto) async {
    try {
      emit(CategoryMasterActionInProgress());
      final res = await _categoryRepository.update(id, dto);
      emit(CategoryMasterActionSuccess(res));
    } catch (e) {
      emit(CategoryMasterActionFailure(e.toString()));
    }
  }

  Future<void> delete(int id) async {
    try {
      emit(CategoryMasterActionInProgress());
      final res = await _categoryRepository.delete(id);
      emit(CategoryMasterActionSuccess(res));
    } catch (e) {
      emit(CategoryMasterActionFailure(e.toString()));
    }
  }
}
