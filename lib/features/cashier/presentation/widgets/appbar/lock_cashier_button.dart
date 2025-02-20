import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_cubit.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LockCashierButton extends StatefulWidget {
  const LockCashierButton({
    super.key,
    required this.label,
  });
  final String label;

  @override
  State<LockCashierButton> createState() => LockCashierButtonState();
}

class LockCashierButtonState extends State<LockCashierButton> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return SizedBox(
      height: 36,
      width: isMobile ? 36 : null,
      child: ElevatedButton(
        onPressed: () {
          context.read<CartCubit>().reset();
          Navigator.pushNamedAndRemoveUntil(
            context,
            "/home",
            (route) => false,
          );
        },
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: isMobile ? 8 : 12,
              vertical: 0,
            ),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          backgroundColor:
              const WidgetStatePropertyAll(TColors.neutralDarkDarkest),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const UiIcons(
              TIcons.homeLock,
              size: 20,
              color: TColors.neutralLightLightest,
            ),
            ResponsiveLayout(
              mobile: const SizedBox(),
              tablet: Container(
                margin: EdgeInsets.only(left: 8, right: 2),
                child: TextActionL(
                  widget.label,
                  color: TColors.neutralLightLightest,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
