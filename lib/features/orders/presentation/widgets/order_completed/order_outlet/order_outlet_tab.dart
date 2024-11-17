import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_repository/order_repository.dart';
import 'package:lakoe_pos/common/widgets/shimmer/list_shimmer.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/features/orders/application/cubit/order_master/order_master_completed_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/order_master/order_master_completed_state.dart';
import 'package:lakoe_pos/features/orders/common/widgets/filters/order_date_filter.dart';
import 'package:lakoe_pos/features/orders/common/widgets/order_list_item/order_list_item.dart';
import 'package:lakoe_pos/features/orders/data/arguments/order_detail_argument.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

class OrderOutletCompletedTab extends StatefulWidget {
  const OrderOutletCompletedTab({
    super.key,
  });

  @override
  State<OrderOutletCompletedTab> createState() =>
      _OrderOutletCompletedTabState();
}

class _OrderOutletCompletedTabState extends State<OrderOutletCompletedTab> {
  String? previousScreen;
  Future<void> onRefresh() async {
    context.read<OrderMasterCompletedCubit>().init();
  }

  @override
  void initState() {
    super.initState();
    context.read<OrderMasterCompletedCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: IntrinsicWidth(
                  child: OrderDateFilter(
                    // from: "",
                    template: "ALL",
                    // to: "",
                    onChanged: (template, from, to) {},
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<OrderMasterCompletedCubit,
                    OrderMasterCompletedState>(
                  builder: (context, state) => switch (state) {
                    OrderMasterCompletedLoadSuccess(:final orders) =>
                      CustomScrollView(
                        slivers: [
                          if (orders.isNotEmpty) ...[
                            SliverList.builder(
                              itemCount: orders.length,
                              itemBuilder: (context, index) {
                                final reversedIndex = orders.length - 1 - index;

                                OrderItemRes order =
                                    orders.elementAt(reversedIndex);
                                bool isPaid = order.paymentStatus == "PAID";

                                return OrderListItem(
                                  isPaid: isPaid,
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
                                  customerName: order.customer?.name ?? "Umum",
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
                    OrderMasterCompletedLoadFailure() => ListShimmer(
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
    );
  }
}
