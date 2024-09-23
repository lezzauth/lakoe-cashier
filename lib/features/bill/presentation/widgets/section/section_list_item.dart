import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/widgets/list_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class BillSectionListItem extends StatefulWidget {
  const BillSectionListItem({super.key});

  @override
  State<BillSectionListItem> createState() => _BillSectionListItemState();
}

class _BillSectionListItemState extends State<BillSectionListItem> {
  List<_BillListItem> listBillListItem = [
    _BillListItem(
      itemName: "Nama Item#1",
      qty: "1",
      price: "5.000",
      note: "Catatan tambahan",
    ),
    _BillListItem(
      itemName: "Nama Item#2",
      qty: "1",
      price: "5.000",
    ),
    _BillListItem(
      itemName: "Nama Item#3",
      qty: "1",
      price: "10.000",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BillListItem(
          isHeadList: true,
          itemName: "Item",
          qty: "Qty",
          price: "Harga",
          isBold: true,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Separator(
            color: TColors.neutralDarkDarkest,
            height: 0.5,
            dashWidth: 4.0,
          ),
        ),
        ...listBillListItem.map(
          (item) => BillListItem(
            itemName: item.itemName,
            qty: item.qty,
            price: item.price,
            hasNote: item.note != null,
            note: item.note,
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
      ],
    );
  }
}

class _BillListItem {
  final String itemName;
  final String qty;
  final String price;
  final String? note;

  _BillListItem({
    required this.itemName,
    required this.qty,
    required this.price,
    this.note,
  });
}
