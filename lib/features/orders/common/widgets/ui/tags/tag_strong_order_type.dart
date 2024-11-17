import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class TagStrongOrderType extends StatelessWidget {
  const TagStrongOrderType({
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
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
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
