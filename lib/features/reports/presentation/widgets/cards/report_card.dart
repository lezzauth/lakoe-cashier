import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    super.key,
    required this.icon,
    required this.label,
    required this.amount,
  });

  final Widget icon;
  final String label;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: TColors.neutralLightMedium,
          width: 1,
        ),
        color: TColors.neutralLightLight,
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: TColors.neutralLightMedium,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: icon,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: TextBodyS(
                    label,
                    color: TColors.neutralDarkLightest,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextHeading2(
                  amount,
                  color: TColors.neutralDarkDark,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
