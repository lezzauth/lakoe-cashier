import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_cubit.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_state.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/bank_transfer/bank_account_radio.dart';

class BankTransferPaymentForm extends StatefulWidget {
  const BankTransferPaymentForm({super.key});

  @override
  State<BankTransferPaymentForm> createState() =>
      _BankTransferPaymentFormState();
}

class _BankTransferPaymentFormState extends State<BankTransferPaymentForm> {
  void _onInit() {
    AuthReady authState = context.read<AuthCubit>().state as AuthReady;

    context.read<BankAccountMasterCubit>().init(authState.profile.id);
  }

  @override
  void initState() {
    super.initState();
    _onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankAccountMasterCubit, BankAccountMasterState>(
      builder: (context, state) => switch (state) {
        BankAccountMasterLoadSuccess(:final bankAccounts) => Column(
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
          ),
        _ => const Center(
            child: CircularProgressIndicator(),
          ),
      },
    );
  }
}
