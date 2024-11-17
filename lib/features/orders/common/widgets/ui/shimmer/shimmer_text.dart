import 'package:flutter/material.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerText extends StatelessWidget {
  const ShimmerText({super.key, this.height = 16.0, this.width = 100.0});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE8E9F1),
      highlightColor: const Color(0xFFF8F9FE),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: TColors.neutralLightLightest,
        ),
      ),
    );
  }
}
