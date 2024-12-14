import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/products/application/cubit/product_master/product_master_filter_state.dart';

class ProductMasterFilterCubit extends Cubit<ProductMasterFilterState> {
  ProductMasterFilterCubit() : super(const ProductMasterFilterState());

  void setFilter({String? name, int? categoryId}) {
    emit(ProductMasterFilterState(
      categoryId: categoryId,
      name: name ?? state.name,
    ));
  }

  void clearFilter() {
    emit(const ProductMasterFilterState());
  }
}
