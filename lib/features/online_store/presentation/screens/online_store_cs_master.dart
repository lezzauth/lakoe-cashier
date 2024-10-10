import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';

class OnlineStoreCsMaster extends StatefulWidget {
  const OnlineStoreCsMaster({super.key});

  @override
  State<OnlineStoreCsMaster> createState() => _OnlineStoreCsMasterState();
}

class _OnlineStoreCsMasterState extends State<OnlineStoreCsMaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        search: SearchField(),
      ),
    );
  }
}
