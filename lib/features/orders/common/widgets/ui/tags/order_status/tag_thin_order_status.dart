import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class TagThinOrderStatus extends StatelessWidget {
  const TagThinOrderStatus({
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
          return TColors.infoLight;
        case "CLOSED":
          return TColors.errorLight;
        case "COMPLETED":
          return TColors.successLight;
        case "CANCELLED":
          return TColors.neutralLightDark;
        default:
          return TColors.infoLight;
      }
    }

    Color getTagTextColor() {
      switch (tag) {
        case "OPEN":
          return TColors.infoDark;
        case "CLOSED":
          return TColors.errorDark;
        case "COMPLETED":
          return TColors.successDark;
        case "CANCELLED":
          return TColors.neutralDarkDarkest;
        default:
          return TColors.infoDark;
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
