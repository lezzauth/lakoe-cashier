import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/items/check_item.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/features/home/application/cubit/onboarding_transaction/onboarding_transaction_cubit.dart';
import 'package:point_of_sales_cashier/features/home/application/cubit/onboarding_transaction/onboarding_transaction_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingTransactionScreen extends StatefulWidget {
  const OnboardingTransactionScreen({super.key});

  @override
  State<OnboardingTransactionScreen> createState() =>
      _OnboardingTransactionScreenState();
}

class _OnboardingTransactionScreenState
    extends State<OnboardingTransactionScreen> {
  void _onInit() {
    context.read<OnboardingTransactionCubit>().init();
  }

  Future<void> _onGoToCreateProduct() async {
    await Navigator.pushNamed(context, "/products/new");
    _onInit();
  }

  Future<void> _onGoToCreateBankAccount() async {
    await Navigator.pushNamed(context, "/bank_accounts/new");
    _onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Lengkapi Data",
      ),
      body: BlocBuilder<OnboardingTransactionCubit, OnboardingTransactionState>(
        builder: (context, state) => switch (state) {
          OnboardingTransactionLoadSuccess(
            :final isBankAccountCompleted,
            :final isProductCompleted
          ) =>
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                child: const TextHeading2(
                                  "Lengkapi data dulu, yuk!",
                                ),
                              ),
                              TextBodyM(
                                "Kamu perlu melengkapi minimal data berikut ini untuk dapat mulai jualan",
                                color: TColors.neutralDarkMedium,
                              ),
                            ],
                          ),
                        ),
                        CheckItem(
                          checked: isProductCompleted,
                          title: "Satu data produk",
                          onTap:
                              isProductCompleted ? null : _onGoToCreateProduct,
                        ),
                        SizedBox(height: 8),
                        CheckItem(
                          checked: isBankAccountCompleted,
                          title: "Satu rekening bank",
                          onTap: isBankAccountCompleted
                              ? null
                              : _onGoToCreateBankAccount,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 1,
                        color: TColors.neutralLightMedium,
                      ),
                    ),
                  ),
                  width: double.infinity,
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: (!state.isBankAccountCompleted ||
                              !state.isProductCompleted)
                          ? null
                          : () {
                              Navigator.pop(
                                context,
                                state.isBankAccountCompleted &&
                                    state.isProductCompleted,
                              );
                            },
                      child: const TextActionL("Lanjutan"),
                    ),
                  ),
                )
              ],
            ),
          _ => const Center(
              child: CircularProgressIndicator(),
            ),
        },
      ),
    );
  }
}
