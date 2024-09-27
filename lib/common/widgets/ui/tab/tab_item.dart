import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_caption_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.title,
    this.counter,
    this.fontSize = TSizes.fontSizeHeading4,
    this.labelAssets,
  });

  final String title;
  final int? counter;
  final double fontSize;
  final Widget? labelAssets;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: labelAssets ??
                  TextHeading4(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontSize: fontSize,
                  ),
            ),
            if (counter != null) ...[
              const SizedBox(width: 8),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: TColors.error,
                ),
                child: Center(
                  child: TextCaptionM(
                    counter!.toString(),
                    color: TColors.neutralLightLightest,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
