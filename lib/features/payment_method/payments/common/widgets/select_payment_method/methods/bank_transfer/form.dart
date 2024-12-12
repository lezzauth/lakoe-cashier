import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_cubit.dart';
import 'package:lakoe_pos/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_state.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/bank_transfer/bank_account_radio.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/bank_account_not_available.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

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
                  child: BankAccountNotAvailable(),
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
              : ShimmerCardBank(),
        _ => ShimmerCardBank(),
      },
    );
  }
}

class ShimmerCardBank extends StatelessWidget {
  const ShimmerCardBank({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 12),
      padding: EdgeInsets.fromLTRB(12, 12, 16, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: TColors.neutralLightMedium,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: const Color(0xFFE8E9F1),
                highlightColor: const Color(0xFFF8F9FE),
                child: Container(
                  width: 160,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: TColors.neutralLightLightest,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Shimmer.fromColors(
                baseColor: const Color(0xFFE8E9F1),
                highlightColor: const Color(0xFFF8F9FE),
                child: Container(
                  width: 100,
                  height: 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: TColors.neutralLightLightest,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
