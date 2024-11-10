import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:point_of_sales_cashier/common/data/models.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/bank_verify/bank_verify.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_cubit.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_state.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/presentation/widgets/forms/bank_account_form.dart';
import 'package:public_repository/public_repository.dart';

class BankAccountNewScreen extends StatefulWidget {
  const BankAccountNewScreen({super.key});

  @override
  State<BankAccountNewScreen> createState() => _BankAccountNewScreenState();
}

class _BankAccountNewScreenState extends State<BankAccountNewScreen> {
  Future<void> _onSubmitted(
    dynamic value,
    BankListModel? bank,
    String previousAccountNumber,
  ) async {
    if (!context.mounted) return;

    final result = await showModalBottomSheet<BankVerifyArgument?>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (context) {
        return BankVerify(
          bankCode: bank!.bankCode,
          accountNumber: value["accountNumber"],
          bankName: bank.bankName,
          name: bank.name,
        );
      },
    );

    if (result == null) return;

    if (!mounted) return;
    context.read<BankAccountMasterCubit>().create(
          dto: CreateOwnerBankDto(
            name: result.name,
            accountNumber: result.accountNumber,
            accountName: result.accountName,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankAccountMasterCubit, BankAccountMasterState>(
      listener: (context, state) {
        if (state is BankAccountMasterActionSuccess) {
          Navigator.pop(context, true);
        }
      },
      builder: (context, state) => Scaffold(
        appBar: const CustomAppbar(
          title: "Rekening Bank Baru",
          actions: [],
        ),
        body: BankAccountForm(
          onSubmitted: _onSubmitted,
          isLoading: state is BankAccountMasterActionInProgress,
        ),
      ),
    );
  }
}
