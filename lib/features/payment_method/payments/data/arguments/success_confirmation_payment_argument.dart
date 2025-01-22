import 'package:cashier_repository/cashier_repository.dart';

class SuccessConfirmationPaymentArgument {
  final CompleteOrderRes payment;
  final bool isCashier;

  SuccessConfirmationPaymentArgument({
    required this.payment,
    this.isCashier = false,
  });
}
