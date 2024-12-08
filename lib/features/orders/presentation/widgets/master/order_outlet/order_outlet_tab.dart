import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_filter_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_filter_state.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/master/order_outlet/filter/order_outlet_filter.dart';
import 'package:order_repository/order_repository.dart';
import 'package:lakoe_pos/common/widgets/shimmer/list_shimmer.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_state.dart';
import 'package:lakoe_pos/features/orders/common/widgets/order_list_item/order_list_item.dart';
import 'package:lakoe_pos/features/orders/data/arguments/order_detail_argument.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

class OrderOutlet extends StatefulWidget {
  const OrderOutlet({super.key});

  @override
  State<OrderOutlet> createState() => _OrderOutletState();
}

class _OrderOutletState extends State<OrderOutlet> {
  bool _isFilterUsed = false;

  Future<void> onRefresh() async {
    OrdersFilterState filterState = context.read<OrdersFilterCubit>().state;

    final updatedFilterState = filterState.sort == null
        ? filterState.copyWith(sort: 'NEWEST')
        : filterState;

    await context
        .read<OrdersCubit>()
        .findAll(updatedFilterState.toFindAllOrderDto);
  }

  @override
  void initState() {
    super.initState();
    context.read<OrdersCubit>().init();
  }

  void _handleClearFilter() {
    setState(() {
      _isFilterUsed = false;
    });
    context.read<OrdersFilterCubit>().clearFilter();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<OrdersCubit, OrdersState>(
          listener: (context, state) {},
        ),
        BlocListener<OrdersFilterCubit, OrdersFilterState>(
          listener: (context, state) {
            context.read<OrdersCubit>().findAll(state.toFindAllOrderDto);
          },
        )
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
                  child: BlocBuilder<OrdersFilterCubit, OrdersFilterState>(
                    builder: (context, state) {
                      return OrderOutletFilter(
                        value: state.toFindAllOrderDto,
                        isFilterUsed: _isFilterUsed,
                        onChanged: (value) {
                          final cubit = context.read<OrdersFilterCubit>();

                          cubit.setFilter(
                            sort: value.sort,
                            source: value.source,
                            type: value.type,
                            status: value.status,
                            template: value.template,
                            from: value.template == "CUSTOM"
                                ? DateTime.parse(value.from!)
                                : null,
                            to: value.template == "CUSTOM"
                                ? DateTime.parse(value.to!)
                                : null,
                          );

                          setState(() {
                            _isFilterUsed = cubit.hasFilterChanged();
                          });
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: BlocBuilder<OrdersCubit, OrdersState>(
                    builder: (context, state) => switch (state) {
                      OrdersLoadSuccess(:final orders) => CustomScrollView(
                          slivers: [
                            if (orders.isNotEmpty) ...[
                              SliverList.builder(
                                itemCount: orders.length,
                                itemBuilder: (context, index) {
                                  OrderItemRes order = orders.elementAt(index);

                                  return OrderListItem(
                                    order: order,
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        "/orders/detail",
                                        arguments: OrderDetailArgument(
                                          id: order.id,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              const SliverToBoxAdapter(
                                  child: SizedBox(height: 72)),
                            ],
                            if (orders.isEmpty)
                              SliverToBoxAdapter(
                                child: EmptyList(
                                  image: SvgPicture.asset(
                                    TImages.catBox,
                                    width: 276,
                                    height: 200,
                                  ),
                                  title: (!_isFilterUsed)
                                      ? "Belum ada pesanan, nih!"
                                      : "Pesanan tidak ditemukan",
                                  subTitle: (!_isFilterUsed)
                                      ? "Saat ini kamu belum pernah melakukan transaksi sama sekali."
                                      : "Ubah tanggal atau hapus filter untuk melihat penjualan kamu.",
                                  action: (!_isFilterUsed)
                                      ? SizedBox.shrink()
                                      : TextButton(
                                          onPressed: _handleClearFilter,
                                          child: TextActionL(
                                            "Hapus Filter",
                                            color: TColors.primary,
                                          ),
                                        ),
                                ),
                              ),
                          ],
                        ),
                      OrdersLoadFailure() => ListShimmer(
                          crossAlignment: "center",
                          circleAvatar: true,
                          sizeAvatar: 48,
                          heightTitle: 16,
                          heightSubtitle: 12,
                        ),
                      _ => const ListShimmer(
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
      ),
    );
  }
}
