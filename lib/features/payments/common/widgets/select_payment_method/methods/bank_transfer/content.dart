import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/bank_transfer/bank_account_radio.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/bank_transfer/form.dart';
import 'package:point_of_sales_cashier/features/payments/data/models/bank_account_model.dart';

class BankTransferPaymentContent extends StatefulWidget {
  const BankTransferPaymentContent({super.key});

  @override
  State<BankTransferPaymentContent> createState() =>
      _BankTransferPaymentContentState();
}

class _BankTransferPaymentContentState
    extends State<BankTransferPaymentContent> {
  String selectedAccount = "1";

  List<BankAccountModel> accounts = [
    const BankAccountModel(
        id: "1", bankName: "bni", name: "Thohirin", number: "9283381902"),
    const BankAccountModel(
        id: "2", bankName: "bri", name: "Thohirin", number: "900000283381902"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextHeading3("Pilih rekening bank"),
        ),
        BankTransferPaymentForm(
          accounts: accounts,
        ),
      ],
    );
  }
}
