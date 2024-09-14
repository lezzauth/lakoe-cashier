import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:point_of_sales_cashier/features/charges/application/cubit/charge_master/charge_master_state.dart';
import 'package:point_of_sales_cashier/features/charges/data/models.dart';

class ChargeMasterCubit extends Cubit<ChargeMasterState> {
  final OwnerRepository _ownerRepository = OwnerRepositoryImpl();

  ChargeMasterCubit() : super(ChargeMasterInitial());

  Future<void> findAll({required ownerId}) async {
    try {
      emit(ChargeMasterLoadInProgress());
      final charges = await _ownerRepository.charge.findAll(ownerId: ownerId);
      emit(ChargeMasterLoadSuccess(charges: charges));
    } catch (e) {
      emit(ChargeMasterLoadFailure(e.toString()));
    }
  }

  Future<void> save({
    required ownerId,
    required List<ChargeField> newCharges,
    required List<ChargeField> updatedCharges,
    required List<String> removedIds,
  }) async {
    try {
      emit(ChargeMasterActionInProgress());

      final newChargesExecute = newCharges.map((e) {
        return _ownerRepository.charge.create(
            ownerId: ownerId,
            dto: CreateChargeDto(
                name: e.name,
                value: int.parse(e.value),
                isPrecentage: e.unit == "percentage"));
      });
      final updateChargesExecute = updatedCharges.map((e) {
        return _ownerRepository.charge.update(
            ownerId: ownerId,
            chargeId: e.id,
            dto: UpdateChargeDto(
                name: e.name,
                value: int.parse(e.value),
                isPrecentage: e.unit == "percentage"));
      });

      final removeChargesExecute = removedIds.map((e) {
        return _ownerRepository.charge.delete(
          ownerId: ownerId,
          chargeId: e,
        );
      });

      await Future.wait([
        Future.wait(newChargesExecute),
        Future.wait(updateChargesExecute),
        Future.wait(removeChargesExecute)
      ]);

      emit(ChargeMasterActionSuccess());
    } catch (e) {
      emit(ChargeMasterActionFailure(e.toString()));
    }
  }
}
