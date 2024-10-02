import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/charges/application/cubit/charge_form/charge_form_state.dart';
import 'package:point_of_sales_cashier/features/charges/presentation/widgets/form/field/other_charge_field.dart';

class ChargeFormCubit extends Cubit<ChargeFormState> {
  ChargeFormCubit()
      : super(
          const ChargeFormState(
            charges: [],
            value: <String, dynamic>{},
            chargeCount: 0,
            isFormValid: false,
          ),
        );

  void setValue(
      Map<String, dynamic>? value, bool isFormValid, bool isFormDirty) {
    emit(ChargeFormState(
      charges: state.charges,
      value: value ?? state.value,
      chargeCount: state.chargeCount,
      isFormValid: isFormValid,
      isFormDirty: isFormDirty,
    ));
  }

  void addCharge(OtherChargeField tax) {
    final int newChargeCount = state.chargeCount + 1;
    emit(ChargeFormState(
      charges: [...state.charges, tax],
      value: state.value,
      chargeCount: newChargeCount,
    ));
  }

  void removeCharge(ValueKey key) {
    final List<OtherChargeField> currentCharges = List.from(state.charges);
    currentCharges.removeWhere((e) => e.key == key);

    emit(ChargeFormState(
        charges: currentCharges,
        value: state.value,
        chargeCount: state.chargeCount));
  }
}
