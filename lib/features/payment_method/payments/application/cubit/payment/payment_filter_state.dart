import 'package:equatable/equatable.dart';

class PaymentFilterState extends Equatable {
  final String paymentMethod;

  const PaymentFilterState({required this.paymentMethod});

  @override
  List<Object?> get props => [paymentMethod];
}
