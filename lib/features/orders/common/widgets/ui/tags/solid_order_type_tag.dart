import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class SolidOrderTypeTag extends StatelessWidget {
  const SolidOrderTypeTag({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    String getTagLabel() {
      switch (tag) {
        case "dine_in":
          return "Dine In";
        case "takeaway":
          return "Bungkus";
        default:
          return "Dine In";
      }
    }

    Color getTagBackgroundColor() {
      switch (tag) {
        case "dine_in":
          return TColors.successDark;
        case "takeaway":
          return TColors.warningDark;
        default:
          return TColors.successDark;
      }
    }

    Color getTagTextColor() {
      switch (tag) {
        case "dine_in":
          return TColors.neutralLightLightest;
        case "takeaway":
          return TColors.neutralDarkDark;
        default:
          return TColors.neutralLightLightest;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: getTagBackgroundColor(),
      ),
      child: TextHeading5(
        getTagLabel(),
        color: getTagTextColor(),
      ),
    );
  }
}
