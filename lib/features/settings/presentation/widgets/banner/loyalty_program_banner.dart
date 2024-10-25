import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class LoyaltyProgramBanner extends StatelessWidget {
  const LoyaltyProgramBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (kDebugMode) {
          print("loyalty program");
        }
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: TColors.warningLight,
          border: Border.all(
            width: 0.5,
            color: TColors.warningMedium,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset(
                TImages.loyaltyBannerWaves,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  SvgPicture.asset(
                    TImages.lakoeCoin,
                    height: 36,
                    width: 36,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          child: const TextHeading4(
                            "Program  Loyalitas",
                          ),
                        ),
                        const TextBodyS(
                          "Buat pelanggan kamu menjadi lebih setia",
                          color: TColors.neutralDarkMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
