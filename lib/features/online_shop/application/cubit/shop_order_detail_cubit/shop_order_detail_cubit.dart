import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_repository/online_shop_repository.dart';
import 'package:point_of_sales_cashier/features/online_shop/application/cubit/shop_order_detail_cubit/shop_order_detail_state.dart';

class ShopOrderDetailCubit extends Cubit<ShopOrderDetailState> {
  final OnlineShopRepository _onlineShopRepository = OnlineShopRepositoryImpl();

  ShopOrderDetailCubit() : super(ShopOrderDetailInitial());

  Future<void> findOne({
    String? outletId,
    required String orderId,
  }) async {
    try {
      emit(ShopOrderDetailLoadInProgress());
      final order = await _onlineShopRepository.findOne(
          orderId: orderId, outletId: outletId);
      emit(ShopOrderDetailLoadSuccess(order: order));
    } catch (e) {
      emit(ShopOrderDetailLoadFailure(e.toString()));
    }
  }

  Future<void> proceed({
    String? outletId,
    required String orderId,
  }) async {
    final currentState = state as ShopOrderDetailLoadSuccess;

    try {
      emit(ShopOrderDetailActionInProgress(order: currentState.order));
      await _onlineShopRepository.proceed(orderId: orderId, outletId: outletId);
      emit(ShopOrderDetailActionSuccess(order: currentState.order));
    } catch (e) {
      emit(ShopOrderDetailActionFailure(
        e.toString(),
        order: currentState.order,
      ));
    }
  }
}
