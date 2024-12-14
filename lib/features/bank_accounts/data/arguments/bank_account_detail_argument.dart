import 'package:owner_repository/owner_repository.dart';

class BankAccountDetailArgument {
  final OwnerBankModel bank;
  final int bankAccountLength;

  BankAccountDetailArgument({
    required this.bank,
    required this.bankAccountLength,
  });
}
