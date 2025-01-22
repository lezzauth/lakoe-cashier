import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';

class SOPItemCard extends StatelessWidget {
  const SOPItemCard({
    super.key,
    required this.title,
    required this.description,
    required this.iconSrc,
    this.onTap,
  });

  final String title;
  final String description;
  final String iconSrc;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: TColors.neutralLightMedium,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: UiIcons(
                iconSrc,
                size: 24,
                color: TColors.primary,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: TextHeading4(title)),
                  Row(
                    children: [
                      Expanded(
                        child: TextBodyS(
                          description,
                          color: TColors.neutralDarkLight,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            if (onTap != null)
              Container(
                margin: const EdgeInsets.only(left: 12),
                child: UiIcons(
                  TIcons.arrowRight,
                  size: 16,
                  color: TColors.primary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
