import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_repository/online_shop_repository.dart';
import 'package:point_of_sales_cashier/features/online_shop/application/cubit/shop_order_master_cubit/shop_order_master_state.dart';

class ShopOrderMasterCubit extends Cubit<ShopOrderMasterState> {
  final OnlineShopRepository _onlineShopRepository = OnlineShopRepositoryImpl();

  ShopOrderMasterCubit() : super(ShopOrderMasterInitial());

  Future<void> findAll({
    String? outletId,
    required FindAllOrderDto dto,
  }) async {
    try {
      emit(ShopOrderMasterLoadInProgress());
      final orders =
          await _onlineShopRepository.findAll(outletId: outletId, dto: dto);

      emit(ShopOrderMasterLoadSuccess(orders: orders));
    } catch (e) {
      emit(ShopOrderMasterLoadFailure(e.toString()));
    }
  }
}
