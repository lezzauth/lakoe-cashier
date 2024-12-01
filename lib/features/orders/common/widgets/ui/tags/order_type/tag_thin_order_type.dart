import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class TagThinOrderType extends StatelessWidget {
  const TagThinOrderType({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    String getTagLabel() {
      switch (tag) {
        case "DINEIN":
          return "Makan di Tempat";
        case "TAKEAWAY":
          return "Dibungkus";
        default:
          return "Makan di Tempat";
      }
    }

    Color getTagBackgroundColor() {
      switch (tag) {
        case "DINEIN":
          return TColors.successLight;
        case "TAKEAWAY":
          return TColors.warningLight;
        default:
          return TColors.successLight;
      }
    }

    Color getTagTextColor() {
      switch (tag) {
        case "DINEIN":
          return TColors.successDark;
        case "TAKEAWAY":
          return TColors.warningDark;
        default:
          return TColors.successDark;
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
