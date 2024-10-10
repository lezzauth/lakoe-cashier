import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/online_shop/application/cubit/shop_order_detail_cubit/shop_order_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/online_shop/application/cubit/shop_order_detail_cubit/shop_order_detail_state.dart';
import 'package:point_of_sales_cashier/features/online_shop/data/arguments/online_shop_order_detail_argument.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/widgets/sections/order_info_section/order_info_section.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/widgets/sections/order_price_breakdown_section/order_price_breakdown_section.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/widgets/sections/order_product_detail_section/order_product_detail_section.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/widgets/sections/order_shipping_detail_section/order_shipping_detail_section.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/widgets/sections/order_status_section/order_status_section.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class OnlineShopOrderDetailScreen extends StatelessWidget {
  const OnlineShopOrderDetailScreen({super.key, required this.arguments});

  final OnlineShopOrderDetailArgument arguments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopOrderDetailCubit(),
      child: OnlineShopOrderDetail(arguments: arguments),
    );
  }
}

class OnlineShopOrderDetail extends StatefulWidget {
  const OnlineShopOrderDetail({super.key, required this.arguments});

  final OnlineShopOrderDetailArgument arguments;

  @override
  State<OnlineShopOrderDetail> createState() => _OnlineShopOrderDetailState();
}

class _OnlineShopOrderDetailState extends State<OnlineShopOrderDetail> {
  Future<void> _onInit() async {
    context
        .read<ShopOrderDetailCubit>()
        .findOne(orderId: widget.arguments.order.id);
  }

  Future<void> _onRefresh() async {
    await context
        .read<ShopOrderDetailCubit>()
        .findOne(orderId: widget.arguments.order.id);
  }

  @override
  void initState() {
    super.initState();

    _onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          title: widget.arguments.order.invoiceNumber,
        ),
        body: BlocBuilder<ShopOrderDetailCubit, ShopOrderDetailState>(
          builder: (context, state) => switch (state) {
            ShopOrderDetailLoadSuccess(:final order) => Column(
                children: [
                  Expanded(
                    child: Scrollbar(
                      child: RefreshIndicator(
                        onRefresh: _onRefresh,
                        backgroundColor: TColors.neutralLightLight,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: OrderStatusSection(order: order),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: OrderInfoSection(order: order),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: OrderProductDetailSection(order: order),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: OrderShippingDetailSection(order: order),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: OrderPriceBreakdownSection(order: order),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          //
                        },
                        child: const TextActionL("Kembali"),
                      ),
                    ),
                  )
                ],
              ),
            _ => const Center(
                child: CircularProgressIndicator(),
              ),
          },
        ));
  }
}
