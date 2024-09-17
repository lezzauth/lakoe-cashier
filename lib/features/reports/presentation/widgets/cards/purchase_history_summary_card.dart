import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class PurchaseHistorySummaryCard extends StatelessWidget {
  const PurchaseHistorySummaryCard({
    super.key,
    required this.title,
    required this.value,
    this.onTap,
  });

  final String title;
  final String value;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: TColors.neutralLightLight,
          border: Border.all(
            width: 1,
            color: TColors.neutralLightMedium,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: TextHeading5(
                title,
                color: TColors.neutralDarkLightest,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextHeading3(
                    value,
                    color: TColors.neutralDarkDarkest,
                  ),
                ),
                if (onTap != null)
                  const UiIcons(
                    TIcons.arrowRight,
                    height: 12,
                    width: 12,
                    color: TColors.primary,
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
