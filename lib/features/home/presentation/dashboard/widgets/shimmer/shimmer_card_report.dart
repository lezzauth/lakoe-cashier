import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCardReport extends StatelessWidget {
  const ShimmerCardReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color(0xFFE8E9F1),
      highlightColor: Color(0xFFF8F9FE),
      child: ResponsiveLayout(
        mobile: Column(
          children: [
            Container(
              height: 138,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: TColors.neutralLightLightest,
                border: Border.all(
                  color: TColors.neutralLightMedium,
                  width: 1,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 138,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: TColors.neutralLightLightest,
                border: Border.all(
                  color: TColors.neutralLightMedium,
                  width: 1,
                ),
              ),
            ),
          ],
        ),
        tablet: Row(
          children: [
            Expanded(
              child: Container(
                height: 138,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: TColors.neutralLightLightest,
                  border: Border.all(
                    color: TColors.neutralLightMedium,
                    width: 1,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Container(
                height: 138,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: TColors.neutralLightLightest,
                  border: Border.all(
                    color: TColors.neutralLightMedium,
                    width: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
