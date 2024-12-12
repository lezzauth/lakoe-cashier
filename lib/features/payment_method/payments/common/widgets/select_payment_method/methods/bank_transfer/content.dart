import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_cubit.dart';
import 'package:lakoe_pos/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_state.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_cubit.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_filter_cubit.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_filter_state.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_state.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/bank_transfer/footer.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/bank_transfer/form.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/radio_group.dart';
import 'package:lakoe_pos/features/payment_method/payments/data/arguments/bank_transfer_payment_argument.dart';

class BankTransferPaymentContent extends StatefulWidget {
  const BankTransferPaymentContent({
    super.key,
    required this.amount,
  });

  final double amount;

  @override
  State<BankTransferPaymentContent> createState() =>
      _BankTransferPaymentContentState();
}

class _BankTransferPaymentContentState
    extends State<BankTransferPaymentContent> {
  final _formKey = GlobalKey<FormBuilderState>();

  String selectedAccount = "1";

  void _onSubmitted() async {
    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValid) return;

    dynamic value = _formKey.currentState?.value;

    BankAccountMasterState bankAccountMasterState =
        context.read<BankAccountMasterCubit>().state;

    if (bankAccountMasterState is! BankAccountMasterLoadSuccess) return;

    OwnerBankModel? account = bankAccountMasterState.bankAccounts
        .singleWhereOrNull((item) => item.id == value["account"]);

    if (account == null) return;

    final transferValue = await Navigator.pushNamed(
      context,
      "/payments/bank_transfer",
      arguments: BankTransferPaymentArgument(
        account: account,
        amount: widget.amount,
      ),
    ) as PaymentBankTransfer?;

    if (transferValue == null) return;

    if (!mounted) return;

    context.read<PaymentCubit>().setBankTransferPayment(
          accountNumber: transferValue.accountNumber,
          paidAmount: transferValue.paidAmount,
          photo: transferValue.photo,
        );

    Navigator.pop(context);
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
                        horizontal: 20.0,
                        vertical: 12.0,
                      ),
                      child: PaymentMethodRadioGroup(
                        value: state.paymentMethod,
                        onChanged: (value) {
                          context
                              .read<PaymentFilterCubit>()
                              .setPaymentMethod(paymentMethod: value!);
                        },
                        limitedValues: [],
                      ),
                    );
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextHeading3("Pilih rekening bank"),
                    ),
                    BankTransferPaymentForm()
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
