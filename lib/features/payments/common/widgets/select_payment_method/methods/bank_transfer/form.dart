import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_cubit.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_state.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/bank_transfer/bank_account_radio.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/select_payment_method_not_available.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class BankTransferPaymentForm extends StatefulWidget {
  const BankTransferPaymentForm({super.key});

  @override
  State<BankTransferPaymentForm> createState() =>
      _BankTransferPaymentFormState();
}

class _BankTransferPaymentFormState extends State<BankTransferPaymentForm> {
  void _onInit() {
    context.read<BankAccountMasterCubit>().init();
  }

  @override
  void initState() {
    super.initState();
    _onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankAccountMasterCubit, BankAccountMasterState>(
      listener: (context, state) {
        if (state is BankAccountMasterLoadSuccess) {
          if (state.bankAccounts.isEmpty) {
            Navigator.pop(context);
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const CustomBottomsheet(
                  child: SelectPaymentMethodNotAvailable(),
                );
              },
            );
          }
        }
      },
      builder: (context, state) => switch (state) {
        BankAccountMasterLoadSuccess(:final bankAccounts) =>
          bankAccounts.isNotEmpty
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FormBuilderField<String>(
                        name: "account",
                        initialValue: bankAccounts[0].id,
                        builder: (field) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: bankAccounts
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
                )
              : const Center(
                  child: TextBodyS(
                    "Tidak ada akun",
                    color: TColors.neutralDarkLight,
                  ),
                ),
        _ => const Center(
            child: CircularProgressIndicator(),
          ),
      },
    );
  }
}
