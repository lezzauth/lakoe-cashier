import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/employees/presentation/reports/shifts/screens/shift_report_master.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class ListItemShift extends StatelessWidget {
  final bool? isActive;
  final ShiftHistory shift;
  final VoidCallback onTap;

  const ListItemShift({
    super.key,
    this.isActive = false,
    required this.shift,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor =
        isActive! ? TColors.highlightLightest : TColors.neutralLightDark;
    Color? iconColor =
        isActive! ? TColors.highlightDark : TColors.neutralDarkDark;

    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            radius: 24,
            backgroundColor: backgroundColor,
            child: UiIcons(
              TIcons.billAlt,
              color: iconColor,
            ),
          ),
          title: TextHeading4(TFormatter.dateTime(shift.date)),
          subtitle: Row(
            children: [
              TextBodyS(
                "Kasir: ",
                color: TColors.neutralDarkLight,
              ),
              TextBodyS(
                shift.cashierName,
                color: TColors.neutralDarkLight,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          trailing: UiIcons(
            TIcons.arrowRight,
            size: 16,
            color: TColors.neutralDarkLightest,
          ),
        ),
        const Divider(
          color: TColors.neutralLightMedium,
          indent: 16.0,
          height: 1,
        ),
      ],
    );
  }
}
