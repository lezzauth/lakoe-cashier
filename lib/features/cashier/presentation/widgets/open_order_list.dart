import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/order/cashier_order_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/order/cashier_order_state.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/order/order_item.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/order/order_list_button.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

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
                const OrderListButton(),
                ...orders.map(
                  (order) => OrderItem(
                    no: order.no,
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
        _ => const Center(
            child: SizedBox(
              height: 32,
              width: 32,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
          ),
      },
    );
  }
}