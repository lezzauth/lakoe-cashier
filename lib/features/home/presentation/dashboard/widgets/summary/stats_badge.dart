import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

enum StatsType { ascend, descend }

class StatsBadge extends StatelessWidget {
  final StatsType type;
  final String value;

  const StatsBadge({
    super.key,
    required this.type,
    required this.value,
  });

  Color getColor() {
    if (type == StatsType.ascend) return TColors.successDark;
    return TColors.errorDark;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        color: getColor(),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 4.0,
        children: [
          if (type == StatsType.ascend)
            const UiIcons(
              TIcons.graphStatsAscend,
              height: 12,
              width: 12,
            ),
          if (type == StatsType.descend)
            const UiIcons(
              TIcons.graphStatsDescend,
              height: 12,
              width: 12,
            ),
          Text(
            value,
            style: GoogleFonts.inter(
              color: TColors.neutralLightLightest,
              fontSize: TSizes.fontSizeHeading5,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
