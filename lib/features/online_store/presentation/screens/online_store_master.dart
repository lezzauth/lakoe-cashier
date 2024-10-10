import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';

class OnlineStoreMasterScreen extends StatefulWidget {
  const OnlineStoreMasterScreen({super.key});

  @override
  State<OnlineStoreMasterScreen> createState() =>
      _OnlineStoreMasterScreenState();
}

class _OnlineStoreMasterScreenState extends State<OnlineStoreMasterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "online_store_master"),
      body: Column(
        children: [
          FilledButton(
            onPressed: () {
              Navigator.pushNamed(context, "/online_store/customer_service");
            },
            child: TextBodyM(
              "Customer Service",
            ),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pushNamed(context, "/online_store/ai_configuration");
            },
            child: TextBodyM(
              "Konfigurasi AI",
            ),
          ),
        ],
      ),
    );
  }
}
