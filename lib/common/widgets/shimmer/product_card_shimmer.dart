import 'package:flutter/material.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 208,
        mainAxisExtent: 235.5,
        childAspectRatio: 208 / 235.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: TColors.neutralLightLightest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 1, color: TColors.neutralLightMedium),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Shimmer.fromColors(
                    baseColor: const Color(0xFFE8E9F1),
                    highlightColor: const Color(0xFFF8F9FE),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        color: TColors.neutralLightMedium,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      height: 165.5,
                      width: 208,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Shimmer.fromColors(
                        baseColor: const Color(0xFFE8E9F1),
                        highlightColor: const Color(0xFFF8F9FE),
                        child: Container(
                          height: 16,
                          width: 140.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: TColors.neutralLightLightest,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Shimmer.fromColors(
                        baseColor: const Color(0xFFE8E9F1),
                        highlightColor: const Color(0xFFF8F9FE),
                        child: Container(
                          height: 12,
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: TColors.neutralLightLightest,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
