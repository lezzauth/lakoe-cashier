import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/order/cashier_order_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/order/cashier_order_state.dart';
import 'package:point_of_sales_cashier/features/orders/data/arguments/order_detail_argument.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/order/order_item.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/order/order_list_button.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class CashierOpenOrderList extends StatelessWidget {
  const CashierOpenOrderList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CashierOrderCubit, CashierOrderState>(
      builder: (context, state) => switch (state) {
        CashierOrderLoadSuccess(:final orders) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 8.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                OrderListButton(
                  onTap: () async {
                    await Navigator.pushNamed(
                      context,
                      "/orders",
                      arguments: {
                        "previousScreen": "ExploreProduct",
                      },
                    );

                    if (!context.mounted) return;
                    context.read<CashierOrderCubit>().findAll();
                  },
                ),
                ...orders.reversed.map(
                  (order) => OrderItem(
                    no: order.no,
                    customerName: order.customer?.name ?? "Umum",
                    tableName: order.table?.no ?? "Bebas",
                    onTap: () async {
                      await Navigator.pushNamed(
                        context,
                        "/orders/detail",
                        arguments: OrderDetailArgument(id: order.id),
                      );

                      if (!context.mounted) return;
                      context.read<CashierOrderCubit>().findAll();
                    },
                  ),
                ),
              ],
            ),
          ),
        CashierOrderLoadFailure(:final error) => Center(
            child: TextBodyS(
              error,
              color: TColors.error,
            ),
          ),
        _ => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 8.0,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: List.generate(
                  5,
                  (index) {
                    return Shimmer.fromColors(
                      baseColor: const Color(0xFFE8E9F1),
                      highlightColor: const Color(0xFFF8F9FE),
                      child: Container(
                        height: 55,
                        width: 123,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: TColors.neutralLightLightest,
                          border: Border.all(
                              color: TColors.neutralLightMedium, width: 1),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
      },
    );
  }
}
