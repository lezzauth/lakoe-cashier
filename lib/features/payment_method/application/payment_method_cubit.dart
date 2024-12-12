import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_state.dart';
import 'package:payment_repository/payment_repository.dart';

class PaymentMethodCubit extends Cubit<PaymentMethodState> {
  final PaymentMethodRepository _repository = PaymentMethodRepositoryImpl();

  PaymentMethodCubit() : super(PaymentMethodInitial());

  Future<void> findAll() async {
    try {
      emit(PaymentMethodLoadInProgress());

      final res = await _repository.findAll();
      emit(PaymentMethodLoadSuccess(paymentMethod: res));
    } catch (e) {
      emit(PaymentMethodLoadFailure(e.toString()));
    }
  }

  Future<void> setActive(List<SetActivePaymentMethodDto> dto) async {
    try {
      emit(PaymentMethodActionInProgress());

      final res = await _repository.setActive(dto);
      emit(PaymentMethodActionSuccess(res: res));
    } catch (e) {
      emit(PaymentMethodInActionFailure(e.toString()));
    }
  }
}
