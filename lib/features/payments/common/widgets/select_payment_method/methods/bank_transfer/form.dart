import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/bank_transfer/bank_account_radio.dart';
import 'package:point_of_sales_cashier/features/payments/data/models/bank_account_model.dart';

class BankTransferPaymentForm extends StatefulWidget {
  const BankTransferPaymentForm({super.key, required this.accounts});

  final List<BankAccountModel> accounts;

  @override
  State<BankTransferPaymentForm> createState() =>
      _BankTransferPaymentFormState();
}

class _BankTransferPaymentFormState extends State<BankTransferPaymentForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FormBuilderField<String>(
            name: "account",
            initialValue: widget.accounts[0].id,
            builder: (field) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: widget.accounts
                  .map(
                    (account) => Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: BankAccountRadio(
                        value: account.id,
                        groupValue: field.value ?? "",
                        onChanged: field.didChange,
                        account: account,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
