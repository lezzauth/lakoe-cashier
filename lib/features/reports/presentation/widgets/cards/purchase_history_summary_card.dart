import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_1.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class PurchaseHistorySummaryCard extends StatelessWidget {
  const PurchaseHistorySummaryCard({
    super.key,
    required this.title,
    required this.value,
    this.strongCard = false,
    this.isCenter = false,
    this.onTap,
  });

  final String title;
  final String value;
  final bool strongCard;
  final bool isCenter;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = TColors.neutralLightLight;
    Color labelColor = TColors.neutralDarkLightest;
    Color valueColor = TColors.neutralDarkDarkest;

    if (strongCard) {
      backgroundColor = TColors.neutralDarkDark;
      labelColor = TColors.neutralDarkLightest;
      valueColor = TColors.neutralLightLightest;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor,
          border: Border.all(
            width: 1,
            color: TColors.neutralLightMedium,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment:
              isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            TextHeading5(title, color: labelColor),
            SizedBox(height: 8),
            strongCard
                ? TextHeading1(value, color: valueColor)
                : TextHeading3(value, color: valueColor)
          ],
        ),
      ),
    );
  }
}
