import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:point_of_sales_cashier/features/taxes/application/cubit/tax_master/tax_master_state.dart';
import 'package:point_of_sales_cashier/features/taxes/data/models.dart';

class TaxMasterCubit extends Cubit<TaxMasterState> {
  final OwnerRepository _ownerRepository = OwnerRepositoryImpl();

  TaxMasterCubit() : super(TaxMasterInitial());

  Future<void> findAll() async {
    try {
      emit(TaxMasterLoadInProgress());
      final taxes = await _ownerRepository.tax.findAll();
      emit(TaxMasterLoadSuccess(taxes: taxes));
    } catch (e) {
      emit(TaxMasterLoadFailure(e.toString()));
    }
  }

  Future<void> save({
    required List<TaxField> newTaxes,
    required List<TaxField> updatedTaxes,
    required List<String> removedIds,
  }) async {
    try {
      emit(TaxMasterActionInProgress());

      final newTaxesExecute = newTaxes.map((e) {
        return _ownerRepository.tax.create(
            dto: CreateTaxDto(name: e.name, value: double.parse(e.value)));
      });
      final updateTaxesExecute = updatedTaxes.map((e) {
        return _ownerRepository.tax.update(
            taxId: e.id,
            dto: UpdateTaxDto(name: e.name, value: double.parse(e.value)));
      });

      final removeTaxesExecute = removedIds.map((e) {
        return _ownerRepository.tax.delete(
          taxId: e,
        );
      });

      await Future.wait([
        Future.wait(newTaxesExecute),
        Future.wait(updateTaxesExecute),
        Future.wait(removeTaxesExecute)
      ]);

      emit(TaxMasterActionSuccess());
    } catch (e) {
      emit(TaxMasterActionFailure(e.toString()));
    }
  }
}
