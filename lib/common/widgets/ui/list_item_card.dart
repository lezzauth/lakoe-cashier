import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_caption_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class ListItemCard extends StatelessWidget {
  final String iconSrc;
  final String title;
  final String subTitle;
  final String routeName;
  final String? textTrailing;
  final bool iconTrailing;
  final bool isNewItem;
  final bool isBoldTitle;
  final bool dangerTheme;
  final Function()? onTap;

  const ListItemCard({
    super.key,
    required this.iconSrc,
    required this.title,
    this.subTitle = "",
    this.routeName = "",
    this.isNewItem = false,
    this.textTrailing,
    this.iconTrailing = true,
    this.isBoldTitle = false,
    this.dangerTheme = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: routeName.isNotEmpty
          ? () {
              Navigator.pushNamed(context, routeName);
            }
          : onTap,
      splashColor: TColors.neutralLightLight,
      highlightColor: TColors.neutralLightLight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        color: dangerTheme == true
            ? TColors.errorLight
            : TColors.neutralLightLightest,
        child: Row(
          crossAxisAlignment: subTitle.isNotEmpty
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            UiIcons(
              iconSrc,
              size: 20,
              color:
                  dangerTheme == true ? TColors.error : TColors.neutralDarkDark,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Wrap(
                spacing: 12,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isBoldTitle == true
                          ? TextHeading3(
                              title,
                              color: dangerTheme == true
                                  ? TColors.error
                                  : TColors.neutralDarkDark,
                              fontWeight: FontWeight.w600,
                            )
                          : TextBodyL(
                              title,
                              color: dangerTheme == true
                                  ? TColors.error
                                  : TColors.neutralDarkDark,
                            ),
                      if (subTitle.isNotEmpty)
                        Column(
                          children: [
                            const SizedBox(height: 4),
                            TextBodyM(
                              subTitle,
                              color: dangerTheme == true
                                  ? TColors.error
                                  : TColors.neutralDarkLight,
                            ),
                          ],
                        ),
                    ],
                  ),
                  if (isNewItem)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
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
            if (iconTrailing != false)
              const Row(
                children: [
                  SizedBox(width: 12),
                  UiIcons(
                    TIcons.arrowRight,
                    size: 12,
                    color: TColors.neutralDarkLightest,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
