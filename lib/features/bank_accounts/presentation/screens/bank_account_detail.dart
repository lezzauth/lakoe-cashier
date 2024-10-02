import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:point_of_sales_cashier/common/data/models.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/bank_verify/bank_verify.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_cubit.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_state.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/data/arguments/bank_account_detail_argument.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/presentation/widgets/forms/bank_account_form.dart';
import 'package:public_repository/public_repository.dart';

class BankAccountDetailScreen extends StatefulWidget {
  const BankAccountDetailScreen({
    super.key,
    required this.arguments,
  });

  final BankAccountDetailArgument arguments;

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

    await context.read<BankAccountMasterCubit>().update(
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
    await context.read<BankAccountMasterCubit>().delete(
          bankId: bankId,
        );
  }

  @override
  Widget build(BuildContext context) {
    final arguments = widget.arguments;
    bool isOnlyAccount = widget.arguments.bankAccountLength == 1;

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
            _onSubmitted(arguments.account.id, bank: bank, value: value);
          },
          onDeleted: isOnlyAccount
              ? null
              : () async {
                  return await _onDeleted(arguments.account.id);
                },
          isLoading: state is BankAccountMasterActionInProgress,
          initialValue: {
            "name": arguments.account.name,
            "accountNumber": arguments.account.accountNumber,
            "isPrimary": arguments.account.isPrimary,
          },
        ),
      ),
    );
  }
}
