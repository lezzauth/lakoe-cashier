import 'package:owner_repository/owner_repository.dart';

class BankAccountDetailArgument {
  final OwnerBankModel account;
  final int bankAccountLength;

  BankAccountDetailArgument({
    required this.account,
    required this.bankAccountLength,
  });
}
