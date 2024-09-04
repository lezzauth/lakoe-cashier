import 'package:category_repository/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/category/cashier_category_state.dart';

class CashierCategoryCubit extends Cubit<CashierCategoryState> {
  final CategoryRepository _categoryRepository = CategoryRepositoryImpl();

  CashierCategoryCubit() : super(CashierCategoryInitial());

  Future<void> init(String outletId) async {
    await findAll(outletId: outletId);
  }

  Future<void> findAll({required String outletId}) async {
    try {
      emit(CashierCategoryLoadInProgress());
      final categories = await _categoryRepository
          .findAll(FindAllCategoryDto(outletId: outletId));
      emit(CashierCategoryLoadSuccess(categories));
    } catch (e) {
      emit(CashierCategoryLoadFailure(e.toString()));
    }
  }
}
