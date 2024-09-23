import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  void setCashPayment({
    required double paidAmount,
    required double change,
  }) {
    emit(PaymentCash(paidAmount: paidAmount, change: change));
  }

  void setBankTransferPayment({
    required double paidAmount,
    required String accountNumber,
    required File photo,
  }) {
    emit(PaymentBankTransfer(
        accountNumber: accountNumber, paidAmount: paidAmount, photo: photo));
  }

  void setDebitCreditPayment({
    required String accountNumber,
    required double paidAmount,
  }) {
    emit(PaymentDebitCredit(
        accountNumber: accountNumber, paidAmount: paidAmount, change: 0));
  }

  void setQRCodePayment({
    required double paidAmount,
  }) {
    emit(PaymentQRCode(paidAmount: paidAmount, change: 0));
  }
}
