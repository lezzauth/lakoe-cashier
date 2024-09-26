import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/taxes/application/cubit/tax_form.dart/tax_form_state.dart';
import 'package:point_of_sales_cashier/features/taxes/presentation/widgets/form/field/other_tax_field.dart';

class TaxFormCubit extends Cubit<TaxFormState> {
  TaxFormCubit()
      : super(
          const TaxFormState(
            taxes: [],
            value: <String, dynamic>{},
            taxCount: 0,
            isFormValid: false,
          ),
        );

  void setValue(Map<String, dynamic>? value, bool isFormValid) {
    emit(TaxFormState(
      taxes: state.taxes,
      value: value ?? state.value,
      taxCount: state.taxCount,
      isFormValid: isFormValid,
    ));
  }

  void addTax(OtherTaxField tax) {
    final int newTaxCount = state.taxCount + 1;
    emit(TaxFormState(
      taxes: [...state.taxes, tax],
      value: state.value,
      taxCount: newTaxCount,
    ));
  }

  void removeTax(ValueKey key) {
    final List<OtherTaxField> currentTaxes = List.from(state.taxes);
    currentTaxes.removeWhere((e) => e.key == key);

    emit(TaxFormState(
        taxes: currentTaxes, value: state.value, taxCount: state.taxCount));
  }
}
