import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_cubit.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_filter_state.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_state.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/presentation/widgets/bank_account_list.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class BankAccountMasterScreen extends StatelessWidget {
  const BankAccountMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BankAccountMasterFilterCubit(),
      child: const BankAccountMaster(),
    );
  }
}

class BankAccountMaster extends StatefulWidget {
  const BankAccountMaster({super.key});

  @override
  State<BankAccountMaster> createState() => _BankAccountMasterState();
}

class _BankAccountMasterState extends State<BankAccountMaster> {
  Future<void> _onRefresh() async {
    context.read<BankAccountMasterCubit>().findAll();
  }

  Future<void> _onGoToCreateScreen() async {
    bool? newBankAccount =
        await Navigator.pushNamed(context, "/bank_accounts/new") as bool?;

    if (newBankAccount != true) return;
    _onRefresh();
  }

  @override
  void initState() {
    super.initState();

    context.read<BankAccountMasterCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<BankAccountMasterFilterCubit,
              BankAccountMasterFilterState>(
            listener: (context, state) {
              context.read<BankAccountMasterCubit>().findAll();
            },
          ),
          BlocListener<BankAccountMasterCubit, BankAccountMasterState>(
            listener: (context, state) {
              if (state is BankAccountMasterActionSuccess) {
                _onRefresh();
              }
            },
          )
        ],
        child: Scaffold(
          appBar: CustomAppbar(
            search: SearchField(
              hintText: "Cari nomor rekening disini...",
              onChanged: (value) {
                context
                    .read<BankAccountMasterFilterCubit>()
                    .setFilter(search: value);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Scrollbar(
              child: RefreshIndicator(
                onRefresh: _onRefresh,
                backgroundColor: TColors.neutralLightLightest,
                child: const BankAccountList(),
              ),
            ),
          ),
          floatingActionButton: SizedBox(
            height: 48,
            width: 48,
            child: BlocBuilder<BankAccountMasterCubit, BankAccountMasterState>(
              builder: (context, state) => switch (state) {
                BankAccountMasterLoadSuccess(:final bankAccounts) =>
                  bankAccounts.length < 3
                      ? FloatingActionButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          onPressed: _onGoToCreateScreen,
                          elevation: 0,
                          child: const Icon(
                            Icons.add,
                            size: 24,
                          ),
                        )
                      : const SizedBox(),
                _ => const SizedBox(),
              },
            ),
          ),
        ),
      ),
    );
  }
}
