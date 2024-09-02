import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_container.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_item.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/widgets/order_online/order_online_tab.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/widgets/order_outlet/order_outlet_tab.dart';

class OrderMasterScreen extends StatefulWidget {
  const OrderMasterScreen({super.key});

  @override
  State<OrderMasterScreen> createState() => _OrderMasterScreenState();
}

class _OrderMasterScreenState extends State<OrderMasterScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppbar(
          search: SearchField(
            hintText: "Cari pesanan disini...",
          ),
          bottom: const TabContainer(
            tabs: [
              TabItem(title: "Outlet"),
              TabItem(
                title: "Online",
                counter: 2,
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OrderOutletTab(),
            OrderOnlineTab(),
          ],
        ),
      ),
    );
  }
}
