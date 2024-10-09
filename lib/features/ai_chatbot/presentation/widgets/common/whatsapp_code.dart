import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class WhatsappCode extends StatelessWidget {
  const WhatsappCode({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 48,
        child: GridView.count(
          crossAxisCount: 9,
          crossAxisSpacing: 4,
          children: code.split("").map(
            (char) {
              if (char == "-") {
                return Container(
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: TextHeading2(
                      char,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
              return Container(
                // padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 48,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: TColors.neutralLightMedium,
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: TextHeading2(
                    char,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
