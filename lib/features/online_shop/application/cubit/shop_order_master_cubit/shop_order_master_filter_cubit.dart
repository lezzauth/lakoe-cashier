import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/online_shop/application/cubit/shop_order_master_cubit/shop_order_master_filter_state.dart';

class ShopOrderMasterFilterCubit extends Cubit<ShopOrderMasterFilterState> {
  ShopOrderMasterFilterCubit() : super(ShopOrderMasterFilterState());

  void setFilter({String? status}) {
    emit(ShopOrderMasterFilterState(status: status));
  }

  void clearFilter() {
    emit(ShopOrderMasterFilterState());
  }
}
