import 'package:category_repository/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/products/application/cubit/category/product_master_category_state.dart';

class ProductMasterCategoryCubit extends Cubit<ProductMasterCategoryState> {
  final CategoryRepository _categoryRepository = CategoryRepositoryImpl();

  ProductMasterCategoryCubit() : super(ProductMasterCategoryInitial());

  Future<void> init() async {
    await findAll();
  }

  Future<void> findAll() async {
    try {
      emit(ProductMasterCategoryLoadInProgress());
      final categories =
          await _categoryRepository.findAll(FindAllCategoryDto());
      emit(ProductMasterCategoryLoadSuccess(categories));
    } catch (e) {
      emit(ProductMasterCategoryLoadFailure(e.toString()));
    }
  }
}
