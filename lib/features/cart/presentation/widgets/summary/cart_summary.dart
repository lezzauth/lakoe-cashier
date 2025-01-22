import 'package:flutter/material.dart';
import 'package:lakoe_pos/features/orders/common/widgets/summary/order_summary.dart';
import 'package:lakoe_pos/features/orders/data/models.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({
    super.key,
    required this.total,
    required this.tax,
    required this.orderTotal,
    required this.charges,
  });

  final double orderTotal;
  final double total;
  final double tax;
  final List<OrderSummaryChargeModel> charges;

  @override
  Widget build(BuildContext context) {
    return OrderSummary(
      total: total,
      orderTotal: orderTotal,
      charges: charges,
    );
  }
}
