import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_filter_state.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/bank_transfer/footer.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/bank_transfer/form.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/radio_group.dart';
import 'package:point_of_sales_cashier/features/payments/data/arguments/bank_transfer_payment_argument.dart';
import 'package:point_of_sales_cashier/features/payments/data/models/bank_account_model.dart';

class BankTransferPaymentContent extends StatefulWidget {
  const BankTransferPaymentContent({super.key});

  @override
  State<BankTransferPaymentContent> createState() =>
      _BankTransferPaymentContentState();
}

class _BankTransferPaymentContentState
    extends State<BankTransferPaymentContent> {
  final _formKey = GlobalKey<FormBuilderState>();

  String selectedAccount = "1";

  List<BankAccountModel> accounts = [
    const BankAccountModel(
        id: "1", bankName: "bni", name: "Thohirin", number: "9283381902"),
    const BankAccountModel(
        id: "2", bankName: "bri", name: "Thohirin", number: "900000283381902"),
  ];

  void _onSubmitted() {
    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValid) {
      return;
    }

    BankAccountModel? account = accounts.singleWhereOrNull(
      (account) =>
          account.id == _formKey.currentState?.value["account"] as String,
    );
    if (account == null) return;

    Navigator.pushNamed(
      context,
      "/payments/bank_transfer",
      arguments: BankTransferPaymentArgument(account: account, amount: 20123),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<PaymentFilterCubit, PaymentFilterState>(
                  builder: (context, state) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 12.0),
                      child: PaymentMethodRadioGroup(
                        value: state.paymentMethod,
                        onChanged: (value) {
                          context
                              .read<PaymentFilterCubit>()
                              .setPaymentMethod(paymentMethod: value!);
                        },
                        limitedValues: const [],
                      ),
                    );
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const TextHeading3("Pilih rekening bank"),
                    ),
                    BankTransferPaymentForm(
                      accounts: accounts,
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BankTransferPaymentFooter(
              onCanceled: () {
                Navigator.pop(context);
              },
              onSubmitted: _onSubmitted,
            ),
          )
        ],
      ),
    );
  }
}
