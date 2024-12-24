import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:owner_repository/owner_repository.dart';

class CardItemHistory extends StatelessWidget {
  const CardItemHistory({super.key, required this.data, required this.onTap});

  final PurchaseModel data;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.end,
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
                TextBodyS(
                  data.status,
                  color: (data.status != "UNPAID")
                      ? TColors.success
                      : TColors.error,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6),
                TextHeading4(
                  TFormatter.formatToRupiah(double.parse(data.amount)),
                  fontWeight: FontWeight.w900,
                  color: TColors.neutralDarkDark,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
