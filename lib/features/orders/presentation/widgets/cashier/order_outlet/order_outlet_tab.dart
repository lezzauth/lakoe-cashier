import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/shimmer/list_shimmer.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/cashier/order_cashier_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/cashier/order_cashier_filter_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/cashier/order_cashier_filter_state.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/cashier/order_cashier_state.dart';
import 'package:lakoe_pos/features/orders/common/widgets/order_list_item/order_list_item.dart';
import 'package:lakoe_pos/features/orders/data/arguments/order_detail_argument.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/cashier/order_outlet/filter/order_outlet_filter.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

class OrderCashierOutlet extends StatefulWidget {
  const OrderCashierOutlet({super.key});

  @override
  State<OrderCashierOutlet> createState() => _OrderCashierOutletState();
}

class _OrderCashierOutletState extends State<OrderCashierOutlet> {
  Future<void> onRefresh() async {
    OrderCashierFilterState filterState =
        context.read<OrderCashierFilterCubit>().state;

    final updatedFilterState = filterState.sort == null
        ? filterState.copyWith(sort: 'NEWEST')
        : filterState;

    await context
        .read<OrderCashierCubit>()
        .findAll(updatedFilterState.toFindAllOrderDto);
  }

  @override
  void initState() {
    super.initState();
    context.read<OrderCashierCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<OrderCashierFilterCubit, OrderCashierFilterState>(
          listener: (context, state) {
            context.read<OrderCashierCubit>().findAll(state.toFindAllOrderDto);
          },
        ),
      ],
      child: Scaffold(
        body: Scrollbar(
          child: RefreshIndicator(
            onRefresh: onRefresh,
            backgroundColor: TColors.neutralLightLightest,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: BlocBuilder<OrderCashierFilterCubit,
                      OrderCashierFilterState>(
                    builder: (context, state) {
                      return OrderOutletFilter(
                        value: state.toFindAllOrderDto,
                        onChanged: (value) {
                          context.read<OrderCashierFilterCubit>().setFilter(
                                status: value.status,
                                sort: value.sort,
                                source: value.source,
                                type: value.type,
                              );
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: BlocBuilder<OrderCashierCubit, OrderCashierState>(
                    builder: (context, state) => switch (state) {
                      OrderCashierLoadSuccess(:final orders) =>
                        CustomScrollView(
                          slivers: [
                            if (orders.isNotEmpty) ...[
                              SliverList.builder(
                                itemCount: orders.length,
                                itemBuilder: (context, index) {
                                  OrderCashierItemRes order =
                                      orders.elementAt(index);

                                  bool isPaid = order.status == "COMPLETED";
                                  bool isCancel = order.status == "CANCELLED";

                                  return OrderListItem(
                                    isPaid: isPaid,
                                    isCancel: isCancel,
                                    type: order.type,
                                    no: order.no,
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        "/orders/detail",
                                        arguments: OrderDetailArgument(
                                          id: order.id,
                                        ),
                                      );
                                    },
                                    price: order.price,
                                    customerName:
                                        order.customer?.name ?? "Umum",
                                    tableName: order.table?.no ?? "-",
                                  );
                                },
                              ),
                              const SliverToBoxAdapter(
                                child: SizedBox(height: 72),
                              ),
                            ],
                            if (orders.isEmpty)
                              SliverToBoxAdapter(
                                child: EmptyList(
                                  image: SvgPicture.asset(
                                    TImages.catBox,
                                    width: 276,
                                    height: 200,
                                  ),
                                  title: "Belum ada pesanan, nih!",
                                  subTitle:
                                      "Saat ini belum ada pesanan masuk. Yuk, bikin pesanan pertama untuk hari ini.",
                                ),
                              ),
                          ],
                        ),
                      OrderCashierLoadFailure() => ListShimmer(
                          crossAlignment: "center",
                          circleAvatar: true,
                          sizeAvatar: 48,
                          heightTitle: 16,
                          heightSubtitle: 12,
                        ),
                      _ => ListShimmer(
                          crossAlignment: "center",
                          circleAvatar: true,
                          sizeAvatar: 48,
                          heightTitle: 16,
                          heightSubtitle: 12,
                        ),
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: const ButtonStyle(
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 20,
                ),
              ),
            ),
            child: const TextActionL(
              "Buat Pesanan Baru",
              color: TColors.neutralLightLightest,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
