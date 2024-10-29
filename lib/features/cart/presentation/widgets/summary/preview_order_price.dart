import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_state.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/summary/order_summary.dart';
import 'package:point_of_sales_cashier/features/orders/data/models.dart';

class PreviewOrderPrice extends StatelessWidget {
  const PreviewOrderPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartDetailCubit, CartDetailState>(
      builder: (context, state) => switch (state) {
        CartDetailLoadSuccess(:final previewOrderPrice) => CartDetailToSummary(
            previewOrderPrice: previewOrderPrice,
            isRefresh: state is CartDetailLoadInProgress,
          ),
        CartDetailLoadFailure() => CartDetailToSummary(
            previewOrderPrice: PreviewOrderPriceResponse(
              total: "0",
              orderItems: [
                PreviewOrderItem(
                  price: "0",
                  quantity: 0,
                  productId: "productId",
                  notes: "",
                ),
              ],
              charges: [
                PreviewOrderCharge(
                  type: "CHARGE",
                  name: "Service Charge",
                  amount: "0",
                  isPercentage: true,
                  percentageValue: "0",
                ),
                PreviewOrderCharge(
                  type: "TAX",
                  name: "PB1",
                  amount: "0",
                  isPercentage: true,
                  percentageValue: "0",
                ),
              ],
              orderItemTotal: "0",
            ),
            isRefresh: state is CartDetailLoadInProgress,
          ),
        _ => CartDetailToSummary(
            previewOrderPrice: PreviewOrderPriceResponse(
              total: "0",
              orderItems: [
                PreviewOrderItem(
                  price: "0",
                  quantity: 0,
                  productId: "productId",
                  notes: "",
                ),
              ],
              charges: [
                PreviewOrderCharge(
                  type: "CHARGE",
                  name: "Service Charge",
                  amount: "0",
                  isPercentage: true,
                  percentageValue: "0",
                ),
                PreviewOrderCharge(
                  type: "TAX",
                  name: "PB1",
                  amount: "0",
                  isPercentage: true,
                  percentageValue: "0",
                ),
              ],
              orderItemTotal: "0",
            ),
            isRefresh: state is CartDetailLoadInProgress,
          ),
      },
    );
  }
}

class CartDetailToSummary extends StatelessWidget {
  final PreviewOrderPriceResponse previewOrderPrice;
  final bool isRefresh;

  const CartDetailToSummary({
    super.key,
    required this.previewOrderPrice,
    required this.isRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return OrderSummary(
      isRefresh: isRefresh,
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
