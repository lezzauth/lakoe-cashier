import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/form/search_field.dart';
import 'package:lakoe_pos/common/widgets/ui/tab/tab_container.dart';
import 'package:lakoe_pos/common/widgets/ui/tab/tab_item.dart';
import 'package:lakoe_pos/features/orders/application/cubit/order_master/order_master_completed_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/order_master/order_master_filter_cubit.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/order_completed/order_online/order_online_tab.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/order_completed/order_outlet/order_outlet_tab.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/order_online/order_online_tab.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/order_outlet/order_outlet_tab.dart';

class OrderMasterScreen extends StatelessWidget {
  const OrderMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OrderMasterFilterCubit()),
        BlocProvider(create: (context) => OrderMasterCompletedCubit()),
      ],
      child: DefaultTabController(
        length: 2,
        child: OrderMaster(),
      ),
    );
  }
}

class OrderMasterCompletedFilterCubit {}

class OrderMaster extends StatelessWidget {
  OrderMaster({
    super.key,
  });

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments from the route
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // Extract specific values from the arguments
    final String? previousScreen = args?['previousScreen'];

    return Scaffold(
      appBar: CustomAppbar(
        search: SearchField(
          hintText: "Cari pesanan disini...",
          controller: _searchController,
          debounceTime: 500,
          onChanged: (value) {
            context.read<OrderMasterFilterCubit>().setFilter(
                  search: value,
                );
          },
        ),
        bottom: const TabContainer(
          tabs: [
            TabItem(title: "Kasir"),
            TabItem(title: "QR Meja", counter: 2)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: (previousScreen == "ExploreProduct")
            ? TabBarView(
                children: [
                  OrderOutletTab(),
                  OrderOnlineTab(),
                ],
              )
            : TabBarView(
                children: [
                  OrderOutletCompletedTab(),
                  OrderOnlineCompletedTab(),
                ],
              ),
      ),
    );
  }
}
