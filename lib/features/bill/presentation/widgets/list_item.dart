import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/bill/text_small.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/bill/text_xsmall.dart';

class BillListItem extends StatelessWidget {
  final String itemName;
  final String qty;
  final String price;
  final bool hasNote;
  final String? note;
  final bool isBold;
  final bool isHeadList;

  const BillListItem({
    super.key,
    required this.itemName,
    required this.qty,
    required this.price,
    this.hasNote = false,
    this.note,
    this.isBold = false,
    this.isHeadList = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: TextSmall(
                  itemName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  isBold: isBold,
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                flex: 1,
                child: TextSmall(
                  isHeadList == true ? qty : "x$qty",
                  isBold: isBold,
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                flex: 1,
                child: TextSmall(
                  isHeadList == true ? price : "Rp$price",
                  textAlign: TextAlign.right,
                  isBold: isBold,
                ),
              ),
            ],
          ),
          hasNote == true
              ? Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextXSmall(
                    note!,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
