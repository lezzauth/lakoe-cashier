import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';

class OrderListButton extends StatelessWidget {
  const OrderListButton({
    super.key,
    this.onTap,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: TColors.greenGradient,
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 11.5, horizontal: 12),
        child: const Wrap(
          direction: Axis.horizontal,
          spacing: 8.0,
          alignment: WrapAlignment.center,
          children: [
            UiIcons(
              TIcons.bill,
              size: 32,
              color: TColors.neutralLightLightest,
            ),
            TextHeading5(
              "Semua\nPesanan",
              color: TColors.neutralLightLightest,
            )
          ],
        ),
      ),
    );
  }
}
