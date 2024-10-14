import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_repository/package_repository.dart';
import 'package:point_of_sales_cashier/features/checkout/application/purchase_state.dart';

class PurchaseCubit extends Cubit<PurchaseState> {
  final PackageRepository _packageRepository = PackageRepositoryImpl();

  PurchaseCubit() : super(PurchaseInitial());

  Future<void> create({
    required PurchaseDto dto,
    required String? packageName,
  }) async {
    try {
      emit(PurchaseActionInProgress());
      final res = await _packageRepository.purchase.create(
        dto: dto,
        packageName: packageName,
      );
      emit(PurchaseActionSuccess(response: res));
    } catch (e) {
      emit(PurchaseActionFailure(e.toString()));
    }
  }
}
