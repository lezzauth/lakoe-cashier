import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';

class OnlineShopAIGlossaryScreen extends StatefulWidget {
  const OnlineShopAIGlossaryScreen({super.key});

  @override
  State<OnlineShopAIGlossaryScreen> createState() =>
      _OnlineShopAIGlossaryScreenState();
}

class _OnlineShopAIGlossaryScreenState
    extends State<OnlineShopAIGlossaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Kata istilah",
      ),
    );
  }
}
