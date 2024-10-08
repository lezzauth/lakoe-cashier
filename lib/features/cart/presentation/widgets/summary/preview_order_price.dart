import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_state.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/summary/order_summary.dart';
import 'package:point_of_sales_cashier/features/orders/data/models.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class PreviewOrderPrice extends StatelessWidget {
  const PreviewOrderPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartDetailCubit, CartDetailState>(
      builder: (context, state) => switch (state) {
        CartDetailLoadSuccess(:final previewOrderPrice) => CartDetailToSummary(
            previewOrderPrice: previewOrderPrice,
          ),
        CartDetailLoadFailure(:final error) => Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: TextBodyS(
                error,
                color: TColors.error,
              ),
            ),
          ),
        _ => Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      },
    );
  }
}

class CartDetailToSummary extends StatelessWidget {
  final PreviewOrderPriceResponse previewOrderPrice;

  const CartDetailToSummary({super.key, required this.previewOrderPrice});

  @override
  Widget build(BuildContext context) {
    return OrderSummary(
      orderTotal: double.parse(previewOrderPrice.orderItemTotal),
      total: double.parse(previewOrderPrice.total),
      charges: previewOrderPrice.charges
          .map((e) => OrderSummaryChargeModel(
                type: e.type,
                name: e.name,
                amount: e.amount,
                isPercentage: e.isPercentage,
                percentageValue: e.percentageValue,
              ))
          .toList(),
    );
  }
}
