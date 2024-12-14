import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class SolidOrderOnlineStatusTag extends StatelessWidget {
  const SolidOrderOnlineStatusTag({
    super.key,
    required this.status,
  });

  final String status;

  @override
  Widget build(BuildContext context) {
    String getTagLabel() {
      switch (status) {
        case "new":
          return "Pesanan Baru";
        case "on_progress":
          return "Pesanan Diproses";
        case "done":
          return "Pesanan Selesai";
        case "declined":
          return "Pesanan Ditolak";
        default:
          return "Pesanan Baru";
      }
    }

    Color getTagBackgroundColor() {
      switch (status) {
        case "new":
          return TColors.neutralDarkDark;
        case "on_progress":
          return TColors.infoMedium;
        case "done":
          return TColors.successDark;
        case "declined":
          return TColors.errorDark;
        default:
          return TColors.neutralDarkDark;
      }
    }

    Color getTagTextColor() {
      return TColors.neutralLightLightest;
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
