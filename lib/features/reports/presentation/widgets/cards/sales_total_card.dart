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
  const SalesTotalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: TColors.neutralDarkDark,
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
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
                  TFormatter.formatToRupiah(100000000),
                  color: TColors.neutralLightLightest,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    const StatsBadge(type: StatsType.descend, value: "20%"),
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      child: const TextBodyM(
                        "vs Kemarin",
                        color: TColors.neutralDarkLightest,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: TColors.neutralDarkMedium,
              borderRadius: BorderRadius.circular(40),
            ),
            child: const UiIcons(
              TIcons.roundGraph,
              height: 16,
              width: 16,
              color: TColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
