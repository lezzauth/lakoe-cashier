import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:package_repository/package_repository.dart';

class CardItemHistory extends StatelessWidget {
  const CardItemHistory({super.key, required this.data});

  final ListHistoryPurchaseModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: TColors.neutralLightLightest,
        border: Border.all(
          color: TColors.neutralLightMedium,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextHeading3(
                "Paket ${TFormatter.capitalizeEachWord(data.packageName)} - ${data.period} Bulan",
                color: TColors.neutralDarkDark,
              ),
              SizedBox(height: 4),
              TextBodyS(
                TFormatter.dateTime(data.createdAt),
                color: TColors.neutralDarkLight,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextBodyM(
                data.status,
                color: TColors.success,
              ),
              TextHeading3(
                TFormatter.formatToRupiah(double.parse(data.amount)),
                fontWeight: FontWeight.w900,
                color: TColors.neutralDarkDark,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
