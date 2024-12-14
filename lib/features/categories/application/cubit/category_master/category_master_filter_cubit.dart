import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/categories/application/cubit/category_master/category_master_filter_state.dart';

class CategoryMasterFilterCubit extends Cubit<CategoryMasterFilterState> {
  CategoryMasterFilterCubit() : super(const CategoryMasterFilterState());

  void setFilter({String? search}) {
    emit(CategoryMasterFilterState(search: search ?? state.search));
  }

  void clearFilter() {
    emit(const CategoryMasterFilterState());
  }
}
