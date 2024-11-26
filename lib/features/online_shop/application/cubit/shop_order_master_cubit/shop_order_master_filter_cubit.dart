import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/online_shop/application/cubit/shop_order_master_cubit/shop_order_master_filter_state.dart';

class ShopOrderCashierFilterCubit extends Cubit<ShopOrderCashierFilterState> {
  ShopOrderCashierFilterCubit() : super(ShopOrderCashierFilterState());

  void setFilter({String? status}) {
    emit(ShopOrderCashierFilterState(status: status));
  }

  void clearFilter() {
    emit(ShopOrderCashierFilterState());
  }
}
