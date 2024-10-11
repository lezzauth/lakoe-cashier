import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';

class OnlineShopAISOPScreen extends StatefulWidget {
  const OnlineShopAISOPScreen({super.key});

  @override
  State<OnlineShopAISOPScreen> createState() => _OnlineShopAISOPScreenState();
}

class _OnlineShopAISOPScreenState extends State<OnlineShopAISOPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "SOP",
      ),
    );
  }
}
