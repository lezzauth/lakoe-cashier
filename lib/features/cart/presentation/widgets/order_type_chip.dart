import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/responsive/responsive_layout.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

class OrderTypeChip extends StatelessWidget {
  const OrderTypeChip({
    super.key,
    this.selected = false,
    required this.label,
    required this.icon,
    this.onSelected,
  });

  final bool selected;
  final String label;
  final String icon;
  final Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return ChoiceChip(
      label: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        children: [
          UiIcons(
            icon,
            size: 16,
            color: selected ? TColors.primary : TColors.neutralDarkDarkest,
          ),
          ResponsiveLayout(
              mobile: !selected
                  ? TextBodyS(label)
                  : TextHeading5(
                      label,
                      color: TColors.primary,
                    ),
              tablet: !selected
                  ? TextBodyL(label)
                  : TextHeading3(
                      label,
                      color: TColors.primary,
                    ))
        ],
      ),
      selected: selected,
      onSelected: onSelected,
      padding: isMobile
          ? null
          : const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    );
  }
}
