import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';

class OnlineShopMasterScreen extends StatefulWidget {
  const OnlineShopMasterScreen({super.key});

  @override
  State<OnlineShopMasterScreen> createState() => _OnlineShopMasterScreenState();
}

class _OnlineShopMasterScreenState extends State<OnlineShopMasterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "online_shop_master"),
      body: Column(
        children: [
          FilledButton(
            onPressed: () {
              Navigator.pushNamed(context, "/online_shop/orders");
            },
            child: TextBodyM(
              "Daftar Pesanan",
            ),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pushNamed(context, "/online_shop/customer_service");
            },
            child: TextBodyM(
              "Customer Service",
            ),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pushNamed(context, "/online_shop/ai_configuration");
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
