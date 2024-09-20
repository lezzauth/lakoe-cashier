import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  void setCashPayment({
    required int paidAmount,
    required int change,
  }) {
    emit(PaymentCash(paidAmount: paidAmount, change: change));
  }

  void setBankTransferPayment({
    required int paidAmount,
    required String accountNumber,
    required File photo,
  }) {
    emit(PaymentBankTransfer(
        accountNumber: accountNumber, paidAmount: paidAmount, photo: photo));
  }
}
