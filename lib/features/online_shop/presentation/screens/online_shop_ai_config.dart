import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';

class OnlineShopAIConfigScreen extends StatefulWidget {
  const OnlineShopAIConfigScreen({super.key});

  @override
  State<OnlineShopAIConfigScreen> createState() =>
      _OnlineShopAIConfigScreenState();
}

class _OnlineShopAIConfigScreenState extends State<OnlineShopAIConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Konfigurasi AI",
      ),
    );
  }
}
