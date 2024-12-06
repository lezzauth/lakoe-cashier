import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class TagStrongOrderStatus extends StatelessWidget {
  const TagStrongOrderStatus({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    String getTagLabel() {
      switch (tag) {
        case "OPEN":
          return "Berlangsung";
        case "CLOSED":
          return "Terhutang";
        case "COMPLETED":
          return "Selesai";
        case "CANCELLED":
          return "Dibatalkan";
        default:
          return "Berlangsung";
      }
    }

    Color getTagBackgroundColor() {
      switch (tag) {
        case "OPEN":
          return TColors.infoDark;
        case "CLOSED":
          return TColors.error;
        case "COMPLETED":
          return TColors.success;
        case "CANCELLED":
          return TColors.neutralDarkDark;
        default:
          return TColors.infoDark;
      }
    }

    Color getTagTextColor() {
      switch (tag) {
        case "OPEN":
          return TColors.neutralLightLightest;
        case "CLOSED":
          return TColors.neutralLightLightest;
        case "COMPLETED":
          return TColors.neutralLightLightest;
        case "CANCELLED":
          return TColors.neutralLightLightest;
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
