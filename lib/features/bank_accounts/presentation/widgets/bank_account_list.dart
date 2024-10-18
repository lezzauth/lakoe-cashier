import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/wrapper/error_wrapper.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_cubit.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_state.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/data/arguments/bank_account_detail_argument.dart';
import 'package:point_of_sales_cashier/features/bank_accounts/presentation/widgets/bank_account_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class BankAccountList extends StatefulWidget {
  const BankAccountList({
    super.key,
    this.onEdit,
  });

  final Function(OwnerBankModel bankAccount, bool isUpdated)? onEdit;

  @override
  State<BankAccountList> createState() => _BankAccountListState();
}

class _BankAccountListState extends State<BankAccountList> {
  Future<void> _onGoToEditScreen(
      OwnerBankModel bankAccount, int bankAccountLength) async {
    bool? isUpdated = await Navigator.pushNamed(
      context,
      "/bank_accounts/detail",
      arguments: BankAccountDetailArgument(
          account: bankAccount, bankAccountLength: bankAccountLength),
    ) as bool?;
    if (widget.onEdit == null) return;

    widget.onEdit!(bankAccount, isUpdated ?? false);
  }

  Future<void> onRefresh() async {
    if (!mounted) return;

    context.read<BankAccountMasterCubit>().findAll();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankAccountMasterCubit, BankAccountMasterState>(
      builder: (context, state) => switch (state) {
        BankAccountMasterLoadSuccess(:final bankAccounts) => bankAccounts
                .isNotEmpty
            ? ErrorWrapper(
                fetchError: state is BankAccountMasterLoadFailure,
                onRefresh: onRefresh,
                child: ListView.builder(
                  itemCount: bankAccounts.length,
                  itemBuilder: (context, index) {
                    OwnerBankModel bankAccount = bankAccounts.elementAt(index);
                    bool isLastElement = bankAccounts.last == bankAccount;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          BankAccountItem(
                            bankAccount: bankAccount,
                            onTap: () {
                              _onGoToEditScreen(
                                  bankAccount, bankAccounts.length);
                            },
                          ),
                          if (bankAccounts.length >= 3 && isLastElement)
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: const TextBodyM(
                                "Kamu hanya bisa menyimpan sebanyak 3 rekening bank",
                                color: TColors.neutralDarkLightest,
                                textAlign: TextAlign.center,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              )
            : EmptyList(
                title: "Belum ada bank tersimpan, nih!",
                subTitle:
                    "Kamu bisa menyimpan 3 nomor rekening kamu untuk kebutuhan operasional.",
                image: SvgPicture.asset(
                  TImages.bankAccountEmpty,
                  width: 252,
                  height: 181.74,
                ),
              ),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
