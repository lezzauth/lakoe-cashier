import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_state.dart';
import 'package:lakoe_pos/features/cashier/presentation/widgets/appbar/close_cashier_button.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

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
                    label: "Tutup",
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const TextBodyS("Kasir:",
                          color: TColors.neutralDarkLight),
                      TextHeading4(
                        operator.name,
                        color: TColors.neutralDarkDarkest,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        _ => const SafeArea(
            child: Center(
              child: SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
