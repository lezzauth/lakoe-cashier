import 'package:flutter/material.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class OrderItemListShimmer extends StatelessWidget {
  const OrderItemListShimmer({
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

class OrderItemCardShimmer extends StatelessWidget {
  const OrderItemCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 360,
          mainAxisExtent: 114,
          childAspectRatio: 360 / 114,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: 11,
        itemBuilder: (context, index) {
          return Container(
            clipBehavior: Clip.antiAlias,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: TColors.neutralLightLightest,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: const Color(0xFFE8E9F1),
                      highlightColor: const Color(0xFFF8F9FE),
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: TColors.warningLight,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Flexible(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              SizedBox(height: 8),
                              Shimmer.fromColors(
                                baseColor: const Color(0xFFE8E9F1),
                                highlightColor: const Color(0xFFF8F9FE),
                                child: Container(
                                  height: 8,
                                  width: 80.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: TColors.neutralLightLightest,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Shimmer.fromColors(
                            baseColor: const Color(0xFFE8E9F1),
                            highlightColor: const Color(0xFFF8F9FE),
                            child: Container(
                              height: 16,
                              width: 60.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: TColors.neutralLightLightest,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 12),
                Divider(color: TColors.neutralLightMedium, height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Shimmer.fromColors(
                      baseColor: const Color(0xFFE8E9F1),
                      highlightColor: const Color(0xFFF8F9FE),
                      child: Container(
                        height: 10,
                        width: 60.0,
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
                        height: 16,
                        width: 80.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: TColors.neutralLightLightest,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
