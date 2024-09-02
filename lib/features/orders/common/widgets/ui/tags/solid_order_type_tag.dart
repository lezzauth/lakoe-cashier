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
        case "DINEIN":
          return "Dine In";
        case "TAKEAWAY":
          return "Bungkus";
        default:
          return "Dine In";
      }
    }

    Color getTagBackgroundColor() {
      switch (tag) {
        case "DINEIN":
          return TColors.successDark;
        case "TAKEAWAY":
          return TColors.warningDark;
        default:
          return TColors.successDark;
      }
    }

    Color getTagTextColor() {
      switch (tag) {
        case "DINEIN":
          return TColors.neutralLightLightest;
        case "TAKEAWAY":
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
