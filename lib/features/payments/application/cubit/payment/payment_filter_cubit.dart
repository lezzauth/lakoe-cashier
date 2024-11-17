import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/payments/application/cubit/payment/payment_filter_state.dart';

class PaymentFilterCubit extends Cubit<PaymentFilterState> {
  PaymentFilterCubit() : super(const PaymentFilterState(paymentMethod: "CASH"));

  void setPaymentMethod({required String paymentMethod}) {
    emit(PaymentFilterState(paymentMethod: paymentMethod));
  }
}
