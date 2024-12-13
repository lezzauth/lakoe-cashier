import 'package:flutter/material.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCardPackage extends StatelessWidget {
  const ShimmerCardPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (index) {
        return Padding(
          padding: EdgeInsets.only(top: 12),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: TColors.neutralLightMedium,
                width: 1,
              ),
            ),
            clipBehavior: Clip.hardEdge,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Shimmer.fromColors(
                baseColor: Color(0xFFE8E9F1),
                highlightColor: Color(0xFFF8F9FE),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 32,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32 / 2),
                        color: TColors.neutralLightLightest,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 16,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32 / 2),
                        color: TColors.neutralLightLightest,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 16,
                      width: 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32 / 2),
                        color: TColors.neutralLightLightest,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 20,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32 / 2),
                        color: TColors.neutralLightLightest,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
