import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_state.dart';

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
      accountNumber: accountNumber,
      paidAmount: paidAmount,
      photo: photo,
    ));
  }

  void setDebitCreditPayment({
    required String accountNumber,
    required double paidAmount,
    String? paidFrom,
    required String? approvalCode,
  }) {
    emit(PaymentDebitCredit(
      accountNumber: accountNumber,
      paidAmount: paidAmount,
      change: 0,
      paidFrom: "EDC",
      approvalCode: approvalCode,
    ));
  }

  void setQRCodePayment({
    required double paidAmount,
    required String paidFrom,
    required String? approvalCode,
  }) {
    emit(PaymentQRCode(
      paidAmount: paidAmount,
      change: 0,
      paidFrom: paidFrom,
      approvalCode: approvalCode,
    ));
  }
}
