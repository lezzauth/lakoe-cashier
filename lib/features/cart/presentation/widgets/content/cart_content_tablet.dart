import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_1.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/widgets/content/cart_content.dart';

class CartContentTablet extends StatefulWidget {
  const CartContentTablet({super.key});

  @override
  State<CartContentTablet> createState() => _CartContentTabletState();
}

class _CartContentTabletState extends State<CartContentTablet> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
        title: "",
        leading: TextHeading1("Order"),
      ),
      body: CartContent(),
    );
  }
}
