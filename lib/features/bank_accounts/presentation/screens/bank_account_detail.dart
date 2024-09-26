import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:point_of_sales_cashier/common/data/models.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/bank_verify/bank_verify.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_cubit.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_state.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/presentation/widgets/forms/bank_account_form.dart';
import 'package:public_repository/public_repository.dart';

class BankAccountDetailScreen extends StatefulWidget {
  const BankAccountDetailScreen({super.key});

  @override
  State<BankAccountDetailScreen> createState() =>
      _BankAccountDetailScreenState();
}

class _BankAccountDetailScreenState extends State<BankAccountDetailScreen> {
  Future<void> _onSubmitted(
    String bankId, {
    dynamic value,
    BankListModel? bank,
  }) async {
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
    AuthReady authState = context.read<AuthCubit>().state as AuthReady;

    await context.read<BankAccountMasterCubit>().update(
          ownerId: authState.profile.id,
          bankId: bankId,
          dto: UpdateOwnerBankDto(
            name: result.name,
            accountNumber: result.accountNumber,
            accountName: result.accountName,
            isPrimary: value["isPrimary"] ?? false,
          ),
        );
  }

  Future<void> _onDeleted(String bankId) async {
    AuthReady authState = context.read<AuthCubit>().state as AuthReady;

    await context.read<BankAccountMasterCubit>().delete(
          ownerId: authState.profile.id,
          bankId: bankId,
        );
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as OwnerBankModel;

    return BlocConsumer<BankAccountMasterCubit, BankAccountMasterState>(
      listener: (context, state) {
        if (state is BankAccountMasterActionSuccess) {
          Navigator.pop(context, true);
        }
      },
      builder: (context, state) => Scaffold(
        appBar: const CustomAppbar(
          title: "Ubah Rekening Bank",
        ),
        body: BankAccountForm(
          onSubmitted: (value, bank) {
            FocusScope.of(context).unfocus();
            _onSubmitted(arguments.id, bank: bank, value: value);
          },
          onDeleted: () async {
            return await _onDeleted(arguments.id);
          },
          isLoading: state is BankAccountMasterActionInProgress,
          initialValue: {
            "name": arguments.name,
            "accountNumber": arguments.accountNumber,
            "isPrimary": arguments.isPrimary,
          },
        ),
      ),
    );
  }
}
