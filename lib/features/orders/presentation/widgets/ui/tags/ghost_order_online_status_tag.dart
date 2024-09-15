import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class GhostOrderOnlineStatusTag extends StatelessWidget {
  const GhostOrderOnlineStatusTag({
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
          return "Diproses";
        case "done":
          return "Selesai";
        case "declined":
          return "Ditolak";
        default:
          return "Pesanan Baru";
      }
    }

    Color getTagBackgroundColor() {
      switch (status) {
        case "new":
          return TColors.neutralLightMedium;
        case "on_progress":
          return TColors.infoLight;
        case "done":
          return TColors.successLight;
        case "declined":
          return TColors.errorLight;
        default:
          return TColors.neutralLightMedium;
      }
    }

    Color getTagTextColor() {
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
