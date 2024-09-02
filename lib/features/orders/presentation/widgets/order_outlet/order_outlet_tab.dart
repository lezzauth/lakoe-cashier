import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_cubit.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_state.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/order_list_item/order_list_item.dart';
import 'package:point_of_sales_cashier/features/orders/data/arguments/order_detail_argument.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/widgets/order_outlet/filter/order_outlet_filter.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class OrderOutletTab extends StatefulWidget {
  const OrderOutletTab({super.key});

  @override
  State<OrderOutletTab> createState() => _OrderOutletTabState();
}

class _OrderOutletTabState extends State<OrderOutletTab> {
  FindAllOrderDto _filter = const FindAllOrderDto(status: "OPEN");

  Future<void> onFetchOrders() async {
    AuthState authState = context.read<AuthCubit>().state;
    if (authState is! AuthReady) return;

    await context.read<OrderCubit>().findAll(_filter);
  }

  Future<void> onRefresh() async {
    await onFetchOrders();
  }

  Future<void> _onFilterChanged(FindAllOrderDto filter) async {
    setState(() {
      _filter = filter;
    });
    await onRefresh();
  }

  @override
  void initState() {
    super.initState();
    onFetchOrders();
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
                child: OrderOutletFilter(
                  value: _filter,
                  onChanged: _onFilterChanged,
                ),
              ),
              Expanded(
                child: BlocBuilder<OrderCubit, OrderState>(
                    builder: (context, state) => switch (state) {
                          OrderLoadSuccess(:final orders) => CustomScrollView(
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
                                            context,
                                            "/orders/detail",
                                            arguments: OrderDetailArgument(
                                              id: index.toString(),
                                              orderType: order.type,
                                              type: "outlet",
                                            ),
                                          );
                                        },
                                        price: order.price,
                                        customerName:
                                            order.customer?.name ?? "Bebas",
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
                                          "Hari ini belum ada pesanan masuk. Yuk, bikin pesanan pertama untuk hari ini.",
                                    ),
                                  ),
                              ],
                            ),
                          OrderLoadFailure(:final error) => Center(
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
      floatingActionButton: SizedBox(
        height: 40,
        child: ElevatedButton(
          onPressed: () {},
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
