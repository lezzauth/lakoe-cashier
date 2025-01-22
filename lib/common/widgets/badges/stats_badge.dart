import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';

enum StatsType { ascend, descend, neutral }

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
    if (type == StatsType.neutral) return TColors.neutralDarkLight;
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
              size: 12,
              color: TColors.neutralLightLightest,
            ),
          if (type == StatsType.descend)
            const UiIcons(
              TIcons.graphStatsDescend,
              size: 12,
              color: TColors.neutralLightLightest,
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
