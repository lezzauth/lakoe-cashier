import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class ErrorDisplay extends StatelessWidget {
  const ErrorDisplay({
    super.key,
    required this.description,
    required this.imageSrc,
    required this.title,
    required this.onAction,
    this.actionTitle,
  });

  final String imageSrc;
  final String title;
  final String description;
  final Function() onAction;
  final String? actionTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    imageSrc,
                    height: 72.46,
                    width: 100,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: TextHeading2(
                    title,
                    color: TColors.neutralDarkDarkest,
                  ),
                ),
                TextBodyM(
                  description,
                  color: TColors.neutralDarkMedium,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: onAction,
                      child: TextActionL(actionTitle ?? "Tutup"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}