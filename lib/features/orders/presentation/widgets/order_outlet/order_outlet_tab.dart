import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_master/order_master_cubit.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_master/order_master_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_master/order_master_filter_state.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_master/order_master_state.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/filters/order_date_filter.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/order_list_item/order_list_item.dart';
import 'package:point_of_sales_cashier/features/orders/data/arguments/order_detail_argument.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/widgets/order_outlet/filter/order_outlet_filter.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class OrderOutletTab extends StatefulWidget {
  const OrderOutletTab({
    super.key,
  });

  @override
  State<OrderOutletTab> createState() => _OrderOutletTabState();
}

class _OrderOutletTabState extends State<OrderOutletTab> {
  String? previousScreen;
  Future<void> onRefresh() async {
    OrderMasterFilterState filterState =
        context.read<OrderMasterFilterCubit>().state;
    await context
        .read<OrderMasterCubit>()
        .findAll(filterState.toFindAllOrderDto);
  }

  @override
  void initState() {
    super.initState();
    // context.read<OrderMasterCubit>().init();
    // context.read<OrderMasterCubit>().initCompletedOrder();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      if (args != null) {
        setState(() {
          previousScreen = args['previousScreen'];
        });

        if (previousScreen == 'ExploreProduct') {
          context.read<OrderMasterCubit>().init();
        } else if (previousScreen == 'Settings') {
          context.read<OrderMasterCubit>().initCompletedOrder();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<OrderMasterFilterCubit, OrderMasterFilterState>(
          listener: (context, state) {
            context.read<OrderMasterCubit>().findAll(state.toFindAllOrderDto);
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
                  child: (previousScreen == 'ExploreProduct')
                      ? BlocBuilder<OrderMasterFilterCubit,
                          OrderMasterFilterState>(
                          builder: (context, state) {
                            return OrderOutletFilter(
                              value: state.toFindAllOrderDto,
                              onChanged: (value) {
                                context
                                    .read<OrderMasterFilterCubit>()
                                    .setFilter(
                                      sort: value.sort,
                                      source: value.source,
                                      status: value.status,
                                      type: value.type,
                                    );
                              },
                            );
                          },
                        )
                      : IntrinsicWidth(
                          child: OrderDateFilter(
                            // from: "",
                            template: "ALL",
                            // to: "",
                            onChanged: (template, from, to) {},
                          ),
                        ),
                ),
                Expanded(
                  child: BlocBuilder<OrderMasterCubit, OrderMasterState>(
                      builder: (context, state) => switch (state) {
                            OrderMasterLoadSuccess(:final orders) =>
                              CustomScrollView(
                                slivers: [
                                  if (orders.isNotEmpty) ...[
                                    SliverList.builder(
                                      itemCount: orders.length,
                                      itemBuilder: (context, index) {
                                        OrderItemResponse order =
                                            orders.elementAt(index);
                                        bool isPaid =
                                            order.paymentStatus == "PAID";

                                        return OrderListItem(
                                          // isWithQR: index % 2 == 0,
                                          isPaid: isPaid,
                                          type: order.type,
                                          no: order.no,
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, "/orders/detail",
                                                arguments: OrderDetailArgument(
                                                  id: order.id,
                                                ));
                                          },
                                          price: order.price,
                                          customerName:
                                              order.customer?.name ?? "Umum",
                                          tableName: order.table?.no ?? "-",
                                        );
                                      },
                                    ),
                                    const SliverToBoxAdapter(
                                        child: SizedBox(height: 72))
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
                            OrderMasterLoadFailure(:final error) => Center(
                                child: TextBodyS(
                                  error,
                                  color: TColors.error,
                                ),
                              ),
                            _ => const Center(
                                child: CircularProgressIndicator(),
                              ),
                          }),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: (previousScreen == 'ExploreProduct')
            ? SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    ),
                  ),
                  child: const TextActionL(
                    "Buat Pesanan Baru",
                    color: TColors.neutralLightLightest,
                  ),
                ),
              )
            : SizedBox(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
