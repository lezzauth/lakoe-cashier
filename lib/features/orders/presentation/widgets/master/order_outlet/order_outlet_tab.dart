import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_filter_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_filter_state.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:logman/logman.dart';
import 'package:order_repository/order_repository.dart';
import 'package:lakoe_pos/common/widgets/shimmer/list_shimmer.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_state.dart';
import 'package:lakoe_pos/features/orders/common/widgets/filters/order_date_filter.dart';
import 'package:lakoe_pos/features/orders/common/widgets/order_list_item/order_list_item.dart';
import 'package:lakoe_pos/features/orders/data/arguments/order_detail_argument.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

class OrderOutlet extends StatefulWidget {
  const OrderOutlet({
    super.key,
  });

  @override
  State<OrderOutlet> createState() => _OrderOutletState();
}

class _OrderOutletState extends State<OrderOutlet> {
  bool isFilterUsed = false;

  Future<void> onRefresh() async {
    OrdersFilterState filterState = context.read<OrdersFilterCubit>().state;
    await context.read<OrdersCubit>().findAll(filterState.toFindAllOrderDto);
  }

  @override
  void initState() {
    super.initState();
    context.read<OrdersCubit>().init();
  }

  // onFilterOpen() {
  //   return showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     builder: (context) {
  //       return CustomBottomsheet(
  //         child: Column(
  //           children: [
  //             Text("Urutkan"),
  //             Text("Status"),
  //             Text("Type [TAKEWAR | DINEIN]"),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrdersFilterCubit, OrdersFilterState>(
      listener: (context, state) {
        Logman.instance.info("LISTENER XXX");
        // context.read<OrdersCubit>().findAll(FindAllOrderDto(
        //       sort: "NEWEST",
        //       rangeType: state.rangeType,
        //       startDate: state.startDate,
        //       endDate: state.endDate,
        //     ));
      },
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<OrdersFilterCubit, OrdersFilterState>(
                          builder: (context, state) {
                        return IntrinsicWidth(
                          child: OrderDateFilter(
                            template: state.rangeType ?? "ALL",
                            from: state.startDate,
                            to: state.endDate,
                            onChanged: (template, from, to) {
                              Logman.instance.info("onChanged XXX $template");
                              context.read<OrdersFilterCubit>().setFilter(
                                    // rangeType: template,
                                    // startDate: from,
                                    // endDate: to,
                                    rangeType: "LAST1DAY",
                                  );
                            },
                          ),
                        );
                      }),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(left: 8),
                        child: InputChip(
                          label: Row(
                            children: [
                              const UiIcons(
                                TIcons.filter,
                                color: TColors.primary,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              const TextBodyM(
                                "Filter",
                                color: TColors.neutralDarkDarkest,
                              ),
                              if (isFilterUsed) ...[
                                const SizedBox(width: 4),
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: TColors.error,
                                  ),
                                )
                              ],
                            ],
                          ),
                          // onPressed: onFilterOpen,
                        ),
                      ),
                    ],
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
                                    tableName: order.table?.no ?? "Bebas",
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
                                  title: "Belum ada pesanan, nih!",
                                  subTitle:
                                      "Saat ini belum ada pesanan yang selesai, nih!\nYuk, selesaikan pesanan pertama untuk hari ini.",
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