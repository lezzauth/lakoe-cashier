import 'package:flutter/material.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class ListShimmer extends StatelessWidget {
  const ListShimmer({
    super.key,
    this.sizeAvatar = 60.0,
    this.circleAvatar = false,
    this.heightTitle = 20.0,
    this.heightSubtitle = 16.0,
    this.crossAlignment = 'start',
  });

  final double? sizeAvatar;
  final bool? circleAvatar;
  final double? heightTitle;
  final double? heightSubtitle;
  final String? crossAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Wrap(
        runSpacing: 12,
        children: List.generate(
          8,
          (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              child: Row(
                crossAxisAlignment: crossAlignment == 'center'
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: const Color(0xFFE8E9F1),
                    highlightColor: const Color(0xFFF8F9FE),
                    child: Container(
                      height: sizeAvatar,
                      width: sizeAvatar,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(circleAvatar! ? 999 : 12.0),
                        color: TColors.neutralLightLightest,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Wrap(
                    spacing: 8.0,
                    direction: Axis.vertical,
                    children: [
                      Shimmer.fromColors(
                        baseColor: const Color(0xFFE8E9F1),
                        highlightColor: const Color(0xFFF8F9FE),
                        child: Container(
                          height: heightTitle,
                          width: 200.0,
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
                          height: heightSubtitle,
                          width: 100.0,
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
            );
          },
        ),
      ),
    );
  }
}
