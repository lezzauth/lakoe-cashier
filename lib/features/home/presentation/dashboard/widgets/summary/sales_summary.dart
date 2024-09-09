import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/summary/stats_badge.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class SalesSummary extends StatelessWidget {
  const SalesSummary({super.key, required this.sales});

  final OutletReportSalesModel sales;

  StatsType getType() {
    if (sales.diff == null) return StatsType.neutral;
    if (sales.diff! == 0) return StatsType.neutral;
    if (sales.diff!.isNegative) return StatsType.descend;
    if (sales.diff! > 0) return StatsType.ascend;

    return StatsType.neutral;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TColors.neutralLightLight,
        borderRadius: BorderRadius.circular(
          16.0,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              TImages.receiptSlip,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Penjualan",
                          style: GoogleFonts.inter(
                            color: TColors.neutralDarkDarkest,
                            fontSize: TSizes.fontSizeHeading3,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 8.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          StatsBadge(
                              type: getType(), value: "${sales.diff ?? 0}%"),
                          Text(
                            "vs Kemarin",
                            style: GoogleFonts.inter(
                              color: TColors.neutralDarkLightest,
                              fontSize: TSizes.fontSizeBodyM,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  "${sales.diff ?? 0}",
                  style: GoogleFonts.inter(
                    color: TColors.infoMedium,
                    fontSize: TSizes.fontSizeHeading1,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
