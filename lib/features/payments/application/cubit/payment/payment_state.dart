import 'dart:io';

import 'package:equatable/equatable.dart';

sealed class PaymentState extends Equatable {}

final class PaymentInitial extends PaymentState {
  @override
  List<Object?> get props => [];
}

final class PaymentCash extends PaymentState {
  final double paidAmount;
  final double change;

  PaymentCash({required this.paidAmount, required this.change});

  @override
  List<Object?> get props => [paidAmount, change];
}

final class PaymentBankTransfer extends PaymentState {
  final double paidAmount;
  final String accountNumber;
  final File photo;

  PaymentBankTransfer({
    required this.accountNumber,
    required this.paidAmount,
    required this.photo,
  });

  @override
  List<Object?> get props => [paidAmount, accountNumber, photo];
}

final class PaymentDebitCredit extends PaymentState {
  final double paidAmount;
  final String accountNumber;
  final double change;

  PaymentDebitCredit({
    required this.accountNumber,
    required this.paidAmount,
    required this.change,
  });

  @override
  List<Object?> get props => [paidAmount, accountNumber, change];
}

final class PaymentQRCode extends PaymentState {
  final double paidAmount;
  final double change;

  PaymentQRCode({
    required this.paidAmount,
    required this.change,
  });

  @override
  List<Object?> get props => [paidAmount, change];
}
