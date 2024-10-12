import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/features/online_shop/data/arguments/online_shop_ai_sop_new_argument.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/widgets/cards/sop_item_card.dart';
import 'package:point_of_sales_cashier/features/online_shop/utils/constants/sop_items.dart';

class OnlineShopAISOPNewScreen extends StatefulWidget {
  const OnlineShopAISOPNewScreen({super.key, required this.arguments});

  final OnlineShopAISopNewArgument arguments;

  @override
  State<OnlineShopAISOPNewScreen> createState() =>
      _OnlineShopAISOPNewScreenState();
}

class _OnlineShopAISOPNewScreenState extends State<OnlineShopAISOPNewScreen> {
  String _getTitle() {
    switch (widget.arguments.type) {
      case "start":
        return "Start";
      case "deal":
        return "Deal";
      case "closing":
        return "Closing";
      default:
        return "";
    }
  }

  List<SOPItem> _getItems() {
    switch (widget.arguments.type) {
      case "start":
        return SOPItems.startSOP;
      case "deal":
        return SOPItems.dealSOP;
      case "closing":
        return SOPItems.closingSOP;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = _getItems();

    return Scaffold(
      appBar: CustomAppbar(
        title: "Tambah SOP - ${_getTitle()}",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items.elementAt(index);

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: SOPItemCard(
                title: item.title,
                description: item.description,
                iconSrc: item.iconSrc,
              ),
            );
          },
        ),
      ),
    );
  }
}
