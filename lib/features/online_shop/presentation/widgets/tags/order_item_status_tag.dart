import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/features/online_shop/utils/constants/order_status_label.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class OrderItemStatusTag extends StatelessWidget {
  const OrderItemStatusTag({
    super.key,
    required this.status,
  });

  final String status;

  @override
  Widget build(BuildContext context) {
    Color getTagBackgroundColor() {
      switch (status) {
        case "WAITING_FOR_PAYMENT":
          return Color(0xFFE8C600);
        case "CONFIRMED":
          return TColors.successDark;
        case "READY":
          return TColors.infoMedium;
        case "ON_DELIVERY":
          return TColors.primary;
        case "COMPLETED":
          return TColors.neutralDarkDark;
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
        OrderStatusLabel.getLabel(status),
        color: getTagTextColor(),
      ),
    );
  }
}
