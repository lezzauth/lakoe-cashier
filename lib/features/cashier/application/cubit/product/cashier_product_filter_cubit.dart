import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_filter_state.dart';

class CashierProductFilterCubit extends Cubit<CashierProductFilterState> {
  CashierProductFilterCubit() : super(const CashierProductFilterState());

  void setFilter({String? name, int? categoryId}) {
    emit(CashierProductFilterState(
      categoryId: categoryId,
      name: name ?? state.name,
    ));
  }

  void clearFilter() {
    emit(const CashierProductFilterState());
  }
}
