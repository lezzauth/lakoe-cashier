import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class ProductTransactionReportCard extends StatelessWidget {
  const ProductTransactionReportCard({
    super.key,
    required this.totalProductSold,
    required this.totalTransaction,
  });

  final int totalProductSold;
  final int totalTransaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: TColors.neutralLightMedium,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
        color: TColors.neutralLightLightest,
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: const TextBodyS(
                    "Product Terjual",
                    color: TColors.neutralDarkLightest,
                  ),
                ),
                TextHeading2(
                  TFormatter.formatNumber(totalProductSold),
                  color: TColors.neutralDarkDark,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          Container(
            height: 44,
            width: 44,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(44),
              color: TColors.neutralLightLight,
            ),
            child: const UiIcons(
              TIcons.box2,
              size: 20,
              color: TColors.primary,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: const TextBodyS(
                    "Jumlah Transaksi",
                    color: TColors.neutralDarkLightest,
                  ),
                ),
                TextHeading2(
                  TFormatter.formatNumber(totalTransaction),
                  color: TColors.neutralDarkDark,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
