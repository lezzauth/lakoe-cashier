import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_xs.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class CardOrder extends StatelessWidget {
  const CardOrder({
    super.key,
    this.icon,
    this.subTitle = "",
    this.title = "",
    this.onTap,
    this.trailing,
  });

  final Widget? icon;
  final String title;
  final String subTitle;
  final Function()? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.0),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: TColors.neutralLightMedium, width: 1),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: TColors.highlightLightest,
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      margin: const EdgeInsets.only(right: 8.0),
                      child: Center(
                        child: icon,
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextBodyXS(title, color: TColors.neutralDarkLightest),
                          TextHeading4(
                            subTitle,
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (onTap != null && trailing == null)
                Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  child: const UiIcons(
                    TIcons.arrowRight,
                    height: 12,
                    width: 12,
                    color: TColors.neutralLightDarkest,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
