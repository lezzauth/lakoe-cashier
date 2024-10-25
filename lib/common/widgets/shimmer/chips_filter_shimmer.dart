import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class ChipsFilterShimmer extends StatelessWidget {
  const ChipsFilterShimmer({
    super.key,
    this.length = 8,
  });

  final int length;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 8.0,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: List.generate(
        length,
        (index) {
          return Shimmer.fromColors(
            baseColor: const Color(0xFFE8E9F1),
            highlightColor: const Color(0xFFF8F9FE),
            child: Container(
              height: 36,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: TColors.neutralLightLightest,
                border: Border.all(color: TColors.neutralLightMedium, width: 1),
              ),
            ),
          );
        },
      ),
    );
  }
}
