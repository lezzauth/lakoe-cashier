import 'package:equatable/equatable.dart';

sealed class PaymentState extends Equatable {}

final class PaymentInitial extends PaymentState {
  @override
  List<Object?> get props => [];
}

final class PaymentCash extends PaymentState {
  final int paidAmount;
  final int change;

  PaymentCash({required this.paidAmount, required this.change});

  @override
  List<Object?> get props => [paidAmount, change];
}
