import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final String description;
  final List<Widget> children;

  const SectionCard({
    super.key,
    this.title = "",
    this.description = "",
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: TColors.neutralLightLightest,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: EdgeInsets.symmetric(vertical: title.isNotEmpty ? 8 : 0),
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
                  TextHeading3(
                    title,
                  ),
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
          ...children,
        ],
      ),
    );
  }
}
