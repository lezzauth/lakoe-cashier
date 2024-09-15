import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_caption_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class SettingSectionItem extends StatelessWidget {
  final String iconSrc;
  final String title;
  final String routeName;
  final bool isNewItem;

  const SettingSectionItem({
    super.key,
    required this.iconSrc,
    required this.title,
    required this.routeName,
    this.isNewItem = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        splashColor: TColors.neutralLightLight,
        highlightColor: TColors.neutralLightLight,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            children: [
              UiIcons(
                iconSrc,
                height: 20,
                width: 12,
                color: TColors.neutralDarkDark,
              ),
              TextHeading4(title),
              if (isNewItem)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: TColors.successDark,
                  ),
                  child: const TextCaptionM(
                    "BARU",
                    color: TColors.neutralLightLightest,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
