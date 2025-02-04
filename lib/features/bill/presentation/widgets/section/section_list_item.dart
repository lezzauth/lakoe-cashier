import 'package:flutter/material.dart';
import 'package:order_repository/order_repository.dart';
import 'package:lakoe_pos/common/widgets/ui/separator/separator.dart';
import 'package:lakoe_pos/features/bill/presentation/widgets/list_item.dart';
import 'package:lakoe_pos/features/bill/presentation/widgets/list_price.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class BillSectionListItem extends StatefulWidget {
  const BillSectionListItem({
    super.key,
    required this.subtotal,
    required this.items,
  });

  final double subtotal;
  final List<OrderItem> items;

  @override
  State<BillSectionListItem> createState() => _BillSectionListItemState();
}

class _BillSectionListItemState extends State<BillSectionListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const BillListItem(
        //   isHeadList: true,
        //   itemName: "Item",
        //   qty: "Qty",
        //   price: "Harga",
        //   note: '',
        // ),
        // const Padding(
        //   padding: EdgeInsets.symmetric(vertical: 4),
        //   child: Separator(
        //     color: TColors.neutralDarkDarkest,
        //     height: 0.5,
        //     dashWidth: 4.0,
        //   ),
        // ),
        ...widget.items.map(
          (item) => BillListItem(
            itemName: item.product.name,
            qty: item.quantity.toString(),
            price: item.price,
            note: item.notes!,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Separator(
            color: TColors.neutralDarkDarkest,
            height: 0.5,
            dashWidth: 4.0,
          ),
        ),
        BillListPrice(
          label: "Subtotal",
          price: TFormatter.formatToRupiah(widget.subtotal),
        ),
      ],
    );
  }
}
