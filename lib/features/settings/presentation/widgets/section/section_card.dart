import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class SettingSectionCard extends StatelessWidget {
  final String title;
  final String description;
  final List<Widget> children;

  const SettingSectionCard({
    super.key,
    required this.title,
    required this.children,
    this.description = "",
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: TColors.neutralLightLightest,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextHeading3(
                  title,
                ),
                if (description.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
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
