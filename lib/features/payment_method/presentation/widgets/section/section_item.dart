import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class PaymentSectionItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isActive;
  final bool lastItem;

  const PaymentSectionItem({
    super.key,
    required this.title,
    required this.subTitle,
    this.isActive = false,
    this.lastItem = false,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: TColors.neutralLightMedium,
            width: lastItem == true ? 0 : 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextHeading4(
                  title,
                  color: TColors.neutralDarkDark,
                ),
                TextBodyM(
                  subTitle,
                  color: TColors.neutralDarkLightest,
                ),
              ],
            ),
            const SizedBox(width: 12),
            Switch(
              value: isActive,
              onChanged: (value) {},
            )
          ],
        ),
      ),
    );
  }
}
