import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPackage extends StatelessWidget {
  const ShimmerPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 246,
          child: SvgPicture.asset(
            TImages.placeholderHero,
            fit: BoxFit.fill,
          ),
        ),
      ),
      Shimmer.fromColors(
        baseColor: const Color(0xFFE8E9F1),
        highlightColor: const Color(0xFFF8F9FE),
        child: Container(
          margin: EdgeInsets.only(top: 180),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: TColors.highlightLightest,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                height: 420,
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: TColors.highlightLightest,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                height: 80,
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
