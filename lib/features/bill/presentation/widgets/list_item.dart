import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/bill/text_small.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

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
            TextSmall(
              isHeadList == true ? qty : "x$qty",
              isBold: isHeadList,
            ),
            const SizedBox(width: 4),
            Expanded(
              flex: 2,
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
                child: TextSmall(
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
