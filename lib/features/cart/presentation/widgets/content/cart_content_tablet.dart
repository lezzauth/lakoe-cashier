import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_1.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/content/cart_content.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/content/cart_content_edit.dart';
import 'package:lakoe_pos/features/orders/data/arguments/order_edit_argument.dart';

class CartContentTablet extends StatefulWidget {
  const CartContentTablet({
    super.key,
    this.isNewOrder = true,
    this.noOrder,
    this.arguments,
  });

  final bool isNewOrder;
  final int? noOrder;
  final OrderEditArgument? arguments;

  @override
  State<CartContentTablet> createState() => _CartContentTabletState();
}

class _CartContentTabletState extends State<CartContentTablet> {
  @override
  Widget build(BuildContext context) {
    String title = "Pesanan Baru";

    if (!widget.isNewOrder) {
      title = "Order #${widget.noOrder}";
    }
    return Scaffold(
      appBar: CustomAppbar(
        title: "",
        leading: TextHeading1(title),
      ),
      body: (widget.isNewOrder)
          ? CartContent()
          : CartContentEdit(
              arguments: widget.arguments!,
            ),
    );
  }
}
