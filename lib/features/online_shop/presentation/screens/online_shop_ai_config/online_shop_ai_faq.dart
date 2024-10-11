import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';

class OnlineShopAIFAQScreen extends StatefulWidget {
  const OnlineShopAIFAQScreen({super.key});

  @override
  State<OnlineShopAIFAQScreen> createState() => _OnlineShopAIFAQScreenState();
}

class _OnlineShopAIFAQScreenState extends State<OnlineShopAIFAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "FAQ",
      ),
    );
  }
}
