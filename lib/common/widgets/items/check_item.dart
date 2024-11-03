import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class CheckItem extends StatelessWidget {
  const CheckItem({
    super.key,
    required this.checked,
    this.onTap,
    required this.title,
  });

  final bool checked;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: TColors.neutralLightMedium,
          ),
          borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                          color: !checked
                              ? TColors.neutralDarkLightest
                              : TColors.primary,
                          borderRadius: BorderRadius.circular(24)),
                      child: Center(
                        child: UiIcons(
                          TIcons.check,
                          size: 10,
                          color: TColors.neutralLightLightest,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextHeading3(title),
                    )
                  ],
                ),
              ),
              UiIcons(
                TIcons.arrowRight,
                size: 16,
                color: TColors.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
