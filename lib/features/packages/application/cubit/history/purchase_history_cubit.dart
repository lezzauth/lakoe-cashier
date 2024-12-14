import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/packages/application/cubit/history/purchase_history_state.dart';
import 'package:owner_repository/owner_repository.dart';

class PurchaseHistoryCubit extends Cubit<PurchaseHistoryState> {
  final OwnerRepository _repository = OwnerRepositoryImpl();

  PurchaseHistoryCubit() : super(PurchaseHistoryInitial());

  Future<void> findAll() async {
    try {
      emit(PurchaseHistoryLoadInProgress());
      final res = await _repository.purchase.findAll();
      emit(PurchaseHistoryLoadSuccess(purchases: res));
    } catch (e) {
      emit(PurchaseHistoryLoadFailure(e.toString()));
    }
  }
}
