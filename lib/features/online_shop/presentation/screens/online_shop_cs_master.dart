import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';

class OnlineShopCsMaster extends StatefulWidget {
  const OnlineShopCsMaster({super.key});

  @override
  State<OnlineShopCsMaster> createState() => _OnlineShopCsMasterState();
}

class _OnlineShopCsMasterState extends State<OnlineShopCsMaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        search: SearchField(),
      ),
    );
  }
}