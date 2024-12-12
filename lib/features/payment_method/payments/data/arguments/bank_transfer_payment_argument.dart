import 'package:owner_repository/owner_repository.dart';

class BankTransferPaymentArgument {
  final OwnerBankModel account;
  final double amount;

  BankTransferPaymentArgument({
    required this.account,
    required this.amount,
  });
}
