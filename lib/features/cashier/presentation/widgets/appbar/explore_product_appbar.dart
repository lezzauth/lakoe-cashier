import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_state.dart';
import 'package:lakoe_pos/features/cashier/presentation/widgets/appbar/close_cashier_button.dart';
import 'package:lakoe_pos/features/cashier/presentation/widgets/appbar/lock_cashier_button.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class ExploreProductAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const ExploreProductAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CashierCubit, CashierState>(
      builder: (context, state) => switch (state) {
        CashierOpened(:final operator) => SafeArea(
            child: Container(
              color: TColors.neutralLightLight,
              height: double.maxFinite,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CloseCashierButton(
                    label: "Tutup Kasir",
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextBodyS(
                            "Kasir",
                            color: TColors.neutralDarkLight,
                          ),
                          ResponsiveLayout(
                            mobile: TextHeading4(
                              operator.name,
                              color: TColors.neutralDarkDarkest,
                            ),
                            tablet: TextHeading4(
                              operator.name,
                              color: TColors.neutralDarkDarkest,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 12),
                      LockCashierButton(label: "Kunci")
                    ],
                  ),
                ],
              ),
            ),
          ),
        _ => SafeArea(
            child: Container(
              color: TColors.neutralLightLight,
              height: double.maxFinite,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CloseCashierButton(
                    label: "Tutup Kasir",
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const TextBodyS("Kasir:",
                              color: TColors.neutralDarkLight),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            child: Shimmer.fromColors(
                              baseColor: const Color(0xFFE8E9F1),
                              highlightColor: const Color(0xFFF8F9FE),
                              child: Container(
                                height: 16.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: TColors.neutralLightLightest,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      const LockCashierButton(label: "Kunci")
                    ],
                  ),
                ],
              ),
            ),
          ),
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
