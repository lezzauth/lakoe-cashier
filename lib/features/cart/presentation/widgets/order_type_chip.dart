import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:responsive_framework/responsive_framework.dart';

class OrderTypeChip extends StatelessWidget {
  const OrderTypeChip({
    super.key,
    this.selected = false,
    required this.type,
    this.onSelected,
  });

  final bool selected;
  final LabelValue type;
  final Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    String iconChip = TIcons.servingDome;
    Color strongColor = TColors.neutralDarkDarkest;
    Color softColor = TColors.highlightLightest;

    if (type.value == "DINEIN") {
      iconChip = TIcons.servingDome;
    } else if (type.value == "TAKEAWAY") {
      iconChip = TIcons.bag;
    } else if (type.value == "GOFOOD") {
      iconChip = TIcons.gofood;
    } else if (type.value == "GRABFOOD") {
      iconChip = TIcons.grabfood;
    }

    if (selected) {
      if (type.value == "GOFOOD") {
        strongColor = Color(0xffE4363C);
        softColor = Color(0xffE4363C).withOpacity(0.1);
      } else if (type.value == "GRABFOOD") {
        strongColor = Color(0xff00B14F);
        softColor = Color(0xff00B14F).withOpacity(0.1);
      } else {
        strongColor = TColors.primary;
      }
    }

    return ChoiceChip(
      color: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return softColor;
          }

          return Colors.transparent;
        },
      ),
      side: WidgetStateBorderSide.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return BorderSide(
            color: strongColor,
            width: 1,
            style: BorderStyle.solid,
          );
        }

        return const BorderSide(
          color: TColors.neutralLightDark,
          width: 1,
          style: BorderStyle.solid,
        );
      }),
      label: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        children: [
          UiIcons(iconChip, size: 16, color: strongColor),
          ResponsiveLayout(
              mobile: !selected
                  ? TextBodyS(type.label)
                  : TextHeading5(
                      type.label,
                      color: strongColor,
                    ),
              tablet: !selected
                  ? TextBodyL(type.label)
                  : TextHeading3(
                      type.label,
                      color: strongColor,
                    ))
        ],
      ),
      selected: selected,
      onSelected: onSelected,
      padding: isMobile
          ? EdgeInsets.symmetric(horizontal: 4, vertical: 0)
          : EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    );
  }
}
