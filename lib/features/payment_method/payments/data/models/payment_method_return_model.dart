sealed class PaymentMethodReturnModel {}

final class CashPaymentMethodReturn extends PaymentMethodReturnModel {
  final int paidAmount;
  final int change;

  CashPaymentMethodReturn({required this.paidAmount, required this.change});
}
