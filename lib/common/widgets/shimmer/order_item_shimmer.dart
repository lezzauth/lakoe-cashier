import 'package:flutter/material.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class OrderItemShimmer extends StatelessWidget {
  const OrderItemShimmer({
    super.key,
    this.hasAvatar = true,
  });

  final bool? hasAvatar;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(8, (index) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: TColors.neutralLightMedium,
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                if (hasAvatar!)
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Shimmer.fromColors(
                      baseColor: const Color(0xFFE8E9F1),
                      highlightColor: const Color(0xFFF8F9FE),
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(44 / 2),
                          color: TColors.neutralLightLightest,
                        ),
                      ),
                    ),
                  ),
                Flexible(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        spacing: 10.0,
                        direction: Axis.vertical,
                        children: [
                          Shimmer.fromColors(
                            baseColor: const Color(0xFFE8E9F1),
                            highlightColor: const Color(0xFFF8F9FE),
                            child: Container(
                              height: 16,
                              width: 120.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: TColors.neutralLightLightest,
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: const Color(0xFFE8E9F1),
                            highlightColor: const Color(0xFFF8F9FE),
                            child: Container(
                              height: 12,
                              width: 80.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: TColors.neutralLightLightest,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 10.0,
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.end,
                        children: [
                          Shimmer.fromColors(
                            baseColor: const Color(0xFFE8E9F1),
                            highlightColor: const Color(0xFFF8F9FE),
                            child: Container(
                              height: 8,
                              width: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: TColors.neutralLightLightest,
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: const Color(0xFFE8E9F1),
                            highlightColor: const Color(0xFFF8F9FE),
                            child: Container(
                              height: 12,
                              width: 80.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: TColors.neutralLightLightest,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
