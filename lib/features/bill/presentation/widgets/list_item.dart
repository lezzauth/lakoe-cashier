import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/bill/text_small.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/bill/text_xsmall.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class BillListItem extends StatelessWidget {
  final String itemName;
  final String qty;
  final String price;
  final String note;
  final bool isHeadList;

  const BillListItem({
    super.key,
    required this.itemName,
    required this.qty,
    required this.price,
    required this.note,
    this.isHeadList = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: TextSmall(
                itemName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                isBold: isHeadList,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              flex: 1,
              child: TextSmall(
                isHeadList == true ? qty : "x$qty",
                isBold: isHeadList,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              flex: 1,
              child: TextSmall(
                isHeadList == true
                    ? price
                    : TFormatter.formatToRupiah(double.parse(price)),
                textAlign: TextAlign.right,
                isBold: isHeadList,
              ),
            ),
          ],
        ),
        (note.isNotEmpty)
            ? Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextXSmall(
                  note,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
