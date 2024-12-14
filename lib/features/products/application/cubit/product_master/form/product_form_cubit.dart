import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/products/application/cubit/product_master/form/product_form_state.dart';

class ProductFormCubit extends Cubit<ProductFormState> {
  ProductFormCubit()
      : super(
          const ProductFormState(
            value: <String, dynamic>{},
            isFormValid: false,
          ),
        );

  void onChangeProduct(
    Map<String, dynamic>? value,
    bool isFormValid,
    bool isFormDirty,
  ) {
    emit(ProductFormState(
      value: value ?? state.value,
      isFormValid: isFormValid,
      isFormDirty: isFormDirty,
    ));
  }
}
