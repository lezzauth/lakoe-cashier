import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_repository/online_shop_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/features/online_shop/application/cubit/shop_order_master_cubit/shop_order_master_cubit.dart';
import 'package:point_of_sales_cashier/features/online_shop/application/cubit/shop_order_master_cubit/shop_order_master_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/online_shop/application/cubit/shop_order_master_cubit/shop_order_master_filter_state.dart';
import 'package:point_of_sales_cashier/features/online_shop/application/cubit/shop_order_master_cubit/shop_order_master_state.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/widgets/cards/order_item_card.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/widgets/filter/order_status_filter.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class OnlineShopOrderMasterScreen extends StatelessWidget {
  const OnlineShopOrderMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopOrderMasterFilterCubit(),
      child: OnlineShopOrderMaster(),
    );
  }
}

class OnlineShopOrderMaster extends StatefulWidget {
  const OnlineShopOrderMaster({super.key});

  @override
  State<OnlineShopOrderMaster> createState() => _OnlineShopOrderMasterState();
}

class _OnlineShopOrderMasterState extends State<OnlineShopOrderMaster> {
  Future<void> _onInit() async {
    context.read<ShopOrderMasterCubit>().findAll(dto: FindAllOrderDto());
  }

  Future<void> _onRefresh() async {
    final filterState = context.read<ShopOrderMasterFilterCubit>().state;

    context
        .read<ShopOrderMasterCubit>()
        .findAll(dto: FindAllOrderDto(status: filterState.status));
  }

  @override
  void initState() {
    super.initState();

    _onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShopOrderMasterFilterCubit, ShopOrderMasterFilterState>(
      listener: (context, filterState) {
        context
            .read<ShopOrderMasterCubit>()
            .findAll(dto: FindAllOrderDto(status: filterState.status));
      },
      child: Scaffold(
        appBar: CustomAppbar(
          search: SearchField(
            hintText: "Cari pesanan disini",
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: BlocBuilder<ShopOrderMasterFilterCubit,
                ShopOrderMasterFilterState>(builder: (context, state) {
              return OrderStatusFilter(
                value: state.status,
                onChanged: (status) {
                  context
                      .read<ShopOrderMasterFilterCubit>()
                      .setFilter(status: status);
                },
              );
            }),
          ),
        ),
        body: Scrollbar(
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            backgroundColor: TColors.neutralLightLightest,
            child: BlocBuilder<ShopOrderMasterCubit, ShopOrderMasterState>(
              builder: (context, state) => switch (state) {
                ShopOrderMasterLoadSuccess(:final orders) => orders.isEmpty
                    ? EmptyList(
                        title: "Belum ada pesanan, nih!",
                        subTitle:
                            "Hari ini belum ada pesanan dari toko online kamu. Yuk! promosikan lagi.")
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.builder(
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            final order = orders.elementAt(index);

                            return Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: OrderItemCard(
                                order: order,
                                onTap: () {
                                  //
                                },
                              ),
                            );
                          },
                        ),
                      ),
                _ => const Center(
                    child: CircularProgressIndicator(),
                  ),
              },
            ),
          ),
        ),
      ),
    );
  }
}
