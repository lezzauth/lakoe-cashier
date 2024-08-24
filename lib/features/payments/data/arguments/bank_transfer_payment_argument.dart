import 'package:point_of_sales_cashier/features/payments/data/models/bank_account_model.dart';

class BankTransferPaymentArgument {
  final BankAccountModel account;
  final double amount;

  BankTransferPaymentArgument({
    required this.account,
    required this.amount,
  });
}
