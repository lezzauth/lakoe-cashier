import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/bank_transfer/bank_account_radio.dart';
import 'package:point_of_sales_cashier/features/payments/data/arguments/bank_transfer_payment_argument.dart';
import 'package:point_of_sales_cashier/features/payments/data/models/bank_account_model.dart';

class BankTransferPaymentForm extends StatefulWidget {
  final List<BankAccountModel> accounts;
  const BankTransferPaymentForm({super.key, required this.accounts});

  @override
  State<BankTransferPaymentForm> createState() =>
      _BankTransferPaymentFormState();
}

class _BankTransferPaymentFormState extends State<BankTransferPaymentForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: FormBuilderField<String>(
              name: "account",
              initialValue: widget.accounts[0].id,
              builder: (field) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: widget.accounts
                    .map(
                      (account) => Container(
                        margin: EdgeInsets.only(bottom: 12),
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
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          try {
                            BankAccountModel? account =
                                widget.accounts.singleWhere(
                              (account) =>
                                  account.id ==
                                  _formKey.currentState?.value["account"]
                                      as String,
                            );

                            Navigator.pushNamed(
                              context,
                              "/payments/bank_transfer",
                              arguments: BankTransferPaymentArgument(
                                  account: account, amount: 20123),
                            );
                          } catch (e) {
                            print(e);
                          }
                          //
                        } else {
                          print("Validation failed");
                        }
                      },
                      child: TextActionL("Lanjutkan"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
