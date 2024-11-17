import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_state.dart';
import 'package:lakoe_pos/features/home/application/cubit/onboarding_transaction/onboarding_transaction_cubit.dart';
import 'package:lakoe_pos/features/home/application/cubit/onboarding_transaction/onboarding_transaction_state.dart';
import 'package:lakoe_pos/features/home/data/arguments/open_cashier_pin_argument.dart';
import 'package:lakoe_pos/features/home/presentation/dashboard/widgets/forms/initial_balance_form.dart';
import 'package:lakoe_pos/features/home/presentation/dashboard/widgets/item_menu/item_menu_container.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:lakoe_pos/utils/device/device_uility.dart';
import 'package:shimmer/shimmer.dart';

class MainMenuTablet extends StatefulWidget {
  final Function()? onTap;

  const MainMenuTablet({
    super.key,
    this.onTap,
  });

  @override
  State<MainMenuTablet> createState() => _MainMenuTabletState();
}

class _MainMenuTabletState extends State<MainMenuTablet> {
  onCashierOpened() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CustomBottomsheet(
          child: Padding(
            padding: TDeviceUtils.getViewInsets(context),
            child: const InitialBalanceForm(),
          ),
        );
      },
    );
  }

  onCashierAlreadyOpened() {
    Navigator.pushNamed(
      context,
      "/cashier/open-cashier-pin",
      arguments: OpenCashierReInitial(),
    );
  }

  Future<void> _onOnboardingOpen() async {
    bool? isCompleted =
        await Navigator.pushNamed(context, "/cashier/onboarding-transaction")
            as bool?;

    _onInit();

    if (isCompleted != true) return;
    onCashierOpened();
  }

  void _onInit() {
    context.read<OnboardingTransactionCubit>().init();
  }

  @override
  void initState() {
    super.initState();
    _onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: BlocBuilder<OnboardingTransactionCubit,
              OnboardingTransactionState>(
            builder: (context, onboardingState) => switch (onboardingState) {
              OnboardingTransactionLoadSuccess(
                :final isProductCompleted,
                :final isBankAccountCompleted
              ) =>
                BlocBuilder<CashierCubit, CashierState>(
                  builder: (context, state) => GestureDetector(
                    onTap: () {
                      bool isOnboardingNotCompleted =
                          !isProductCompleted || !isBankAccountCompleted;

                      if (isOnboardingNotCompleted) {
                        _onOnboardingOpen();
                        return;
                      }

                      if (state is! CashierOpened) {
                        onCashierOpened();
                      } else {
                        onCashierAlreadyOpened();
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: state is CashierOpened
                              ? TColors.greenGradient
                              : TColors.redGradient,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              right: 0,
                              child: SvgPicture.asset(
                                TImages.mainMenuWaves,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                          bottom: 12,
                                        ),
                                        child: UiIcons(
                                          state is CashierOpened
                                              ? TIcons.lock
                                              : TIcons.cashier,
                                          color: TColors.neutralLightLightest,
                                        ),
                                      ),
                                      Text(
                                        "Buka Kasir",
                                        style: GoogleFonts.inter(
                                          fontSize: TSizes.fontSizeBodyL,
                                          fontWeight: FontWeight.w700,
                                          color: TColors.neutralLightLightest,
                                        ),
                                      )
                                    ],
                                  ),
                                  if (state is CashierOpened)
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 4.0),
                                          child: Text(
                                            "Kasir: ",
                                            style: GoogleFonts.inter(
                                              fontSize: TSizes.fontSizeBodyM,
                                              fontWeight: FontWeight.w400,
                                              color: TColors.neutralLightLight,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          state.operator.name,
                                          style: GoogleFonts.inter(
                                            fontSize: TSizes.fontSizeBodyL,
                                            fontWeight: FontWeight.w700,
                                            color: TColors.neutralLightLightest,
                                          ),
                                        )
                                      ],
                                    ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              _ => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Shimmer.fromColors(
                    baseColor: const Color(0xFFE8E9F1),
                    highlightColor: const Color(0xFFF8F9FE),
                    child: Container(
                      height: 90.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: TColors.neutralLightLightest,
                      ),
                    ),
                  ),
                ),
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 24),
            child: ItemMenuContainer(),
          ),
        ),
      ],
    );
  }
}
