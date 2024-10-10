import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';

class OnlineStoreAiConfigScreen extends StatefulWidget {
  const OnlineStoreAiConfigScreen({super.key});

  @override
  State<OnlineStoreAiConfigScreen> createState() =>
      _OnlineStoreAiConfigScreenState();
}

class _OnlineStoreAiConfigScreenState extends State<OnlineStoreAiConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Konfigurasi AI",
      ),
    );
  }
}
