import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/shimmer/chips_filter_shimmer.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/custom_toast.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class RepostMasterShimmer extends StatelessWidget {
  const RepostMasterShimmer({super.key, this.errorText});

  final String? errorText;

  @override
  Widget build(BuildContext context) {
    if (errorText != null && errorText!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        CustomToast.show(
          "Oops… terjadi kesalah, nih!",
          backgroundColor: TColors.error,
          position: "bottom",
          duration: 2,
        );
      });
    }

    return Shimmer.fromColors(
      baseColor: const Color(0xFFE8E9F1),
      highlightColor: const Color(0xFFF8F9FE),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: null,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: ChipsFilterShimmer(length: 3),
              ),
            ),
            Container(
              height: 120,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: TColors.neutralDarkDark,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: TColors.neutralDarkDark,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: TColors.neutralDarkDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 120,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: TColors.neutralDarkDark,
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 24,
              width: 120,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: TColors.neutralDarkDark,
              ),
            ),
            Column(
              children: List.generate(
                3,
                (i) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          margin: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: TColors.neutralDarkDark,
                          ),
                        ),
                        SizedBox(width: 8),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 16,
                                width: 160,
                                margin: EdgeInsets.symmetric(vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: TColors.neutralDarkDark,
                                ),
                              ),
                              Container(
                                height: 12,
                                width: 120,
                                margin: EdgeInsets.symmetric(vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: TColors.neutralDarkDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
