import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_xs.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';

class CardOrder extends StatelessWidget {
  const CardOrder({
    super.key,
    this.icon,
    this.trailingIcon,
    this.subTitle = "",
    this.title = "",
    this.onTap,
    this.trailing,
    this.isReadOnly = false,
  });

  final Widget? icon;
  final Widget? trailingIcon;
  final String title;
  final String subTitle;
  final Function()? onTap;
  final Widget? trailing;
  final bool isReadOnly;

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
            color: TColors.neutralLightLightest,
          ),
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: TColors.highlightLightest,
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      margin: EdgeInsets.only(right: 8.0),
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
                    trailingIcon ?? SizedBox.shrink(),
                  ],
                ),
              ),
              if (trailing == null && isReadOnly == false)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: const UiIcons(
                    TIcons.arrowRight,
                    size: 12,
                    color: TColors.neutralLightDarkest,
                  ),
                ),
              if (trailing != null)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: trailing!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
