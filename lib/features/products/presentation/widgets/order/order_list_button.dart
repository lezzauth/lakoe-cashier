import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

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
          children: [
            UiIcons(
              TIcons.bill,
              height: 32,
              width: 32,
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
