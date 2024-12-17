import 'package:flutter/material.dart';
import 'package:lakoe_pos/features/orders/data/arguments/order_detail_argument.dart';
import 'package:lakoe_pos/features/orders/presentation/screens/order_detail.dart';

class OrderDetailTablet extends StatefulWidget {
  const OrderDetailTablet({super.key, required this.arguments});

  final OrderDetailArgument arguments;

  @override
  State<OrderDetailTablet> createState() => _OrderDetailTabletState();
}

class _OrderDetailTabletState extends State<OrderDetailTablet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      margin: EdgeInsets.only(right: 20),
      child: OrderDetailScreen(
        isTabletView: true,
        arguments: widget.arguments,
      ),
    );
  }
}
