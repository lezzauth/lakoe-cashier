import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_caption_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class AccountOtherSectionItem extends StatelessWidget {
  final String iconSrc;
  final String title;
  final String routeName;
  final String? textTrailing;
  final bool isNewItem;

  const AccountOtherSectionItem({
    super.key,
    required this.iconSrc,
    required this.title,
    required this.routeName,
    this.isNewItem = false,
    this.textTrailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      splashColor: TColors.neutralLightLight,
      highlightColor: TColors.neutralLightLight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            UiIcons(
              iconSrc,
              height: 20,
              width: 12,
              color: TColors.neutralDarkDark,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextBodyM(
                title,
                color: TColors.neutralDarkDark,
              ),
            ),
            // if (isNewItem)
            //   Container(
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 8,
            //       vertical: 6,
            //     ),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(24),
            //       color: TColors.successDark,
            //     ),
            //     child: const TextCaptionM(
            //       "BARU",
            //       color: TColors.neutralLightLightest,
            //     ),
            //   ),
            if (textTrailing != null)
              Row(
                children: [
                  const SizedBox(width: 12),
                  TextBodyS(
                    textTrailing!,
                    color: TColors.neutralDarkLightest,
                  ),
                ],
              ),
            const SizedBox(width: 12),
            const UiIcons(
              TIcons.arrowRight,
              height: 12,
              width: 12,
              color: TColors.neutralDarkLightest,
            ),
          ],
        ),
      ),
    );
  }
}
