import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final String description;
  final String? iconSrc;
  final List<Widget>? children;
  final Color? bgColor;

  const SectionCard({
    super.key,
    this.title = "",
    this.description = "",
    this.iconSrc,
    this.children,
    this.bgColor = TColors.neutralLightLightest,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: EdgeInsets.symmetric(vertical: title.isNotEmpty ? 8 : 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: title.isNotEmpty ? 8 : 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title.isNotEmpty)
                  iconSrc != null
                      ? Row(
                          children: [
                            UiIcons(
                              iconSrc!,
                              size: 20,
                              color: TColors.neutralDarkDark,
                            ),
                            const SizedBox(width: 12),
                            TextHeading3(title)
                          ],
                        )
                      : TextHeading3(title),
                if (description.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    child: TextBodyM(
                      description,
                      color: TColors.neutralDarkLight,
                    ),
                  )
              ],
            ),
          ),
          ...?children,
        ],
      ),
    );
  }
}
