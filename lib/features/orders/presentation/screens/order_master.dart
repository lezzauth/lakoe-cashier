import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/form/search_field.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/cashier/order_cashier_filter_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_filter_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_filter_state.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/master/order_outlet/order_outlet_tab.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/cashier/order_outlet/order_outlet_tab.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (popDisposition, popResult) async {
        Navigator.pop(context, true);
      },
      child: Scaffold(
        appBar: CustomAppbar(
          backgroundColor: isMobile ? null : TColors.neutralLightLight,
          search: SearchField(
            hintText: "Cari pesanan disini...",
            controller: _searchController,
            focusNode: _searchFocusNode,
            debounceTime: 500,
            onChanged: (value) {
              if (previousScreen == "cashier") {
                context
                    .read<OrderCashierFilterCubit>()
                    .setFilter(search: value);
              } else {
                OrdersFilterState filterState =
                    context.read<OrdersFilterCubit>().state;

                context.read<OrdersFilterCubit>().setFilter(
                      search: value,
                      from: filterState.from != null
                          ? DateTime.parse(filterState.from!)
                          : null,
                      to: filterState.to != null
                          ? DateTime.parse(filterState.to!)
                          : null,
                    );
              }
            },
          ),
          // bottom: TabContainer(
          //   tabs: [
          //     TabItem(title: "Kasir"),
          //     TabItem(title: "QR Meja", counter: 2)
          //   ],
          // ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: isMobile ? 4.0 : 0.0),
          child: (previousScreen == "cashier")
              ? OrderCashierOutlet(
                  searchController: _searchController,
                  searchFocusNode: _searchFocusNode,
                )
              : OrderOutlet(
                  searchController: _searchController,
                  searchFocusNode: _searchFocusNode,
                ),

          // (previousScreen == "cashier")
          //     ? TabBarView(
          //         children: [
          //           OrderCashierOutlet(
          //             searchController: _searchController,
          //             searchFocusNode: _searchFocusNode,
          //           ),
          //           OrderCashierOnline(),
          //         ],
          //       )
          //     : TabBarView(
          //         children: [
          //           OrderOutlet(
          //             searchController: _searchController,
          //             searchFocusNode: _searchFocusNode,
          //           ),
          //           OrderOnline(),
          //         ],
          //       ),
        ),
      ),
    );
  }
}
