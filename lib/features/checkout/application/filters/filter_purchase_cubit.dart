import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/checkout/application/filters/filter_purchase_state.dart';

class FilterPurchaseCubit extends Cubit<FilterPurchaseState> {
  FilterPurchaseCubit() : super(const FilterPurchaseState());

  void setFilter({String? status}) {
    emit(FilterPurchaseState(status: status ?? state.status));
  }

  void clearFilter() {
    emit(const FilterPurchaseState());
  }
}
