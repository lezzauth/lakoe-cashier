import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_repository/online_shop_repository.dart';
import 'package:point_of_sales_cashier/features/online_shop/application/cubit/shop_order_detail_cubit/shop_order_track_state.dart';

class ShopOrderTrackCubit extends Cubit<ShopOrderTrackState> {
  final OnlineShopRepository _onlineShopRepository = OnlineShopRepositoryImpl();

  ShopOrderTrackCubit() : super(ShopOrderTrackInitial());

  Future<void> track({
    String? outletId,
    required String orderId,
  }) async {
    try {
      emit(ShopOrderTrackLoadInProgress());
      final track = await _onlineShopRepository.track(
          outletId: outletId, orderId: orderId);
      emit(ShopOrderTrackLoadSuccess(track: track));
    } catch (e) {
      emit(ShopOrderTrackLoadFailure(e.toString()));
    }
  }
}
