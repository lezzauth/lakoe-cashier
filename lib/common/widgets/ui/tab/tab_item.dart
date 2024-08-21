import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_caption_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.title, this.counter});

  final String title;
  final int? counter;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextHeading4(title),
          if (counter != null) ...[
            const SizedBox(width: 10),
            Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: TColors.error,
              ),
              child: Center(
                child: TextCaptionM(
                  counter!.toString(),
                  color: TColors.neutralLightLightest,
                ),
              ),
            )
          ]
        ],
      ),
    );
  }
}
