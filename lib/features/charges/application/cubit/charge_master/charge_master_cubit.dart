import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:lakoe_pos/features/charges/application/cubit/charge_master/charge_master_state.dart';
import 'package:lakoe_pos/features/charges/data/models.dart';

class ChargeMasterCubit extends Cubit<ChargeMasterState> {
  final OwnerRepository _ownerRepository = OwnerRepositoryImpl();

  ChargeMasterCubit() : super(ChargeMasterInitial());

  Future<void> findAll() async {
    try {
      emit(ChargeMasterLoadInProgress());
      final charges = await _ownerRepository.charge.findAll();
      emit(ChargeMasterLoadSuccess(charges: charges));
    } catch (e) {
      emit(ChargeMasterLoadFailure(e.toString()));
    }
  }

  Future<void> save({
    required List<ChargeField> newCharges,
    required List<ChargeField> updatedCharges,
    required List<String> removedIds,
  }) async {
    try {
      emit(ChargeMasterActionInProgress());

      final newChargesExecute = newCharges.map((e) {
        return _ownerRepository.charge.create(
            dto: CreateChargeDto(
          name: e.name,
          value: double.parse(e.value),
          isPercentage: e.unit == "percentage",
        ));
      });
      final updateChargesExecute = updatedCharges.map((e) {
        return _ownerRepository.charge.update(
            chargeId: e.id,
            dto: UpdateChargeDto(
              name: e.name,
              value: double.parse(e.value),
              isPercentage: e.unit == "percentage",
            ));
      });

      final removeChargesExecute = removedIds.map((e) {
        return _ownerRepository.charge.delete(
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
