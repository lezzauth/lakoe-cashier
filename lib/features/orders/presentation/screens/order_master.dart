import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/form/search_field.dart';
import 'package:lakoe_pos/common/widgets/ui/tab/tab_container.dart';
import 'package:lakoe_pos/common/widgets/ui/tab/tab_item.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/cashier/order_cashier_filter_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_filter_cubit.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/master/order_online/order_online_tab.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/master/order_outlet/order_outlet_tab.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/cashier/order_online/order_online_tab.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/cashier/order_outlet/order_outlet_tab.dart';

class OrderMasterScreen extends StatelessWidget {
  const OrderMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OrdersFilterCubit()),
        BlocProvider(create: (context) => OrderCashierFilterCubit()),
      ],
      child: DefaultTabController(
        length: 2,
        child: OrderMaster(),
      ),
    );
  }
}

class OrderMaster extends StatelessWidget {
  OrderMaster({super.key});

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final String? previousScreen = args?['previousScreen'];

    return Scaffold(
      appBar: CustomAppbar(
        search: SearchField(
          hintText: "Cari pesanan disini...",
          controller: _searchController,
          focusNode: _searchFocusNode,
          debounceTime: 500,
          onChanged: (value) {
            if (previousScreen == "ExploreProduct") {
              context.read<OrderCashierFilterCubit>().setFilter(search: value);
            } else {
              context.read<OrdersFilterCubit>().setFilter(search: value);
            }
          },
        ),
        bottom: TabContainer(
          tabs: [
            TabItem(title: "Kasir"),
            TabItem(title: "QR Meja", counter: 2)
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 4.0),
        child: (previousScreen == "ExploreProduct")
            ? TabBarView(
                children: [
                  OrderCashierOutlet(
                    searchController: _searchController,
                    searchFocusNode: _searchFocusNode,
                  ),
                  OrderCashierOnline(),
                ],
              )
            : TabBarView(
                children: [
                  OrderOutlet(
                    searchController: _searchController,
                    searchFocusNode: _searchFocusNode,
                  ),
                  OrderOnline(),
                ],
              ),
      ),
    );
  }
}
