import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/completing_data/completing_data_form_state.dart';

class CompletingDataFormCubit extends Cubit<CompletingDataFormState> {
  CompletingDataFormCubit()
      : super(CompletingDataFormState(
          isFormValid: false,
          value: const <String, dynamic>{},
        ));

  void setValue(Map<String, dynamic>? value, bool isFormValid) {
    emit(CompletingDataFormState(
        value: value ?? state.value, isFormValid: isFormValid));
  }
}
