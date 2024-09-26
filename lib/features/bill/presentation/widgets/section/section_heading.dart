import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/bill/text_large.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/bill/text_small.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class BillSectionHeading extends StatelessWidget {
  final String outletName;
  final String outletAddress;
  final String orderNumber;
  final String orderType;
  final String? noTable;

  const BillSectionHeading({
    super.key,
    required this.outletName,
    required this.outletAddress,
    required this.orderNumber,
    required this.orderType,
    this.noTable,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            TextLarge(
              outletName.toUpperCase(),
              textAlign: TextAlign.center,
            ),
            TextSmall(
              outletAddress,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Separator(
            color: TColors.neutralDarkDarkest,
            height: 0.5,
            dashWidth: 4.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextLarge(
                "ORDER #$orderNumber".toUpperCase(),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextSmall(
                "$orderType ${noTable ?? ""}",
                textAlign: TextAlign.right,
                isBold: true,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Separator(
            color: TColors.neutralDarkDarkest,
            height: 0.5,
            dashWidth: 4.0,
          ),
        ),
      ],
    );
  }
}
