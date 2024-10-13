import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_master/order_master_completed_cubit.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_master/order_master_completed_state.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/filters/order_date_filter.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/order_list_item/order_list_item.dart';
import 'package:point_of_sales_cashier/features/orders/data/arguments/order_detail_argument.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

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
    // OrderMasterFilterState filterState =
    //     context.read<OrderMasterFilterCubit>().state;
    // await context
    //     .read<OrderMasterCubit>()
    //     .findAll(filterState.toFindAllOrderDto);
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

                                OrderItemResponse order =
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
                    OrderMasterCompletedLoadFailure(:final error) => Center(
                        child: TextBodyS(
                          error,
                          color: TColors.error,
                        ),
                      ),
                    _ => const Center(
                        child: CircularProgressIndicator(),
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
