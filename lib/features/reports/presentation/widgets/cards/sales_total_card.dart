import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_1.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/summary/stats_badge.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class SalesTotalCard extends StatelessWidget {
  const SalesTotalCard({
    super.key,
    this.preset = "TODAY",
    this.duration,
    this.totalSalesDiff,
    required this.totalSales,
    required this.totalPastSales,
    this.onTap,
  });

  final String? preset;
  final int? duration;
  final String totalSales;
  final String totalPastSales;
  final int? totalSalesDiff;
  final Function()? onTap;

  StatsType getType() {
    if (totalSalesDiff == 0) return StatsType.neutral;
    if (totalSalesDiff!.isNegative) return StatsType.descend;
    if (totalSalesDiff! > 0) return StatsType.ascend;

    return StatsType.neutral;
  }

  String getComparisonText() {
    if (preset == "TODAY") return "Kemarin";
    if (preset == "THISWEEK") return "Minggu sebelumnya";
    if (preset == "THISMONTH") return "Bulan sebelumnya";
    if (duration != null) return "$duration hari sebelumnya";

    return "";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: TColors.neutralDarkDark,
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: const TextHeading5(
                      "Total Penjualan",
                      color: TColors.neutralDarkLightest,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: TextHeading1(
                      TFormatter.formatToRupiah(double.parse(totalSales)),
                      color: TColors.neutralLightLightest,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        StatsBadge(
                          type: getType(),
                          value: (double.parse(totalPastSales) == 0 &&
                                  double.parse(totalSales) > 0)
                              ? "100%"
                              : "${totalSalesDiff?.abs()}%",
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          child: TextBodyM(
                            "vs ${getComparisonText()}",
                            color: TColors.neutralDarkLightest,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: TColors.neutralDarkMedium,
                borderRadius: BorderRadius.circular(40),
              ),
              child: const UiIcons(
                TIcons.roundGraph,
                size: 16,
                color: TColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
