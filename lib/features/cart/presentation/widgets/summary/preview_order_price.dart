import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_state.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/widgets/summary/cart_summary.dart';
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

  double _getTaxes() {
    PreviewOrderCharge? taxChargeItem = previewOrderPrice.charges
        .firstWhereOrNull((charge) => charge.type == "TAX");
    PreviewOrderCharge? serviceFeeChargeItem = previewOrderPrice.charges
        .firstWhereOrNull((charge) => charge.type == "SERVICE_FEE");

    String tax = taxChargeItem?.amount ?? "0";
    String serviceFee = serviceFeeChargeItem?.amount ?? "0";

    return double.parse(tax) + double.parse(serviceFee);
  }

  double _getOrderTotal() {
    return previewOrderPrice.orderItems.fold(0, (sum, item) {
      return sum + double.parse(item.price);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CartSummary(
      tax: _getTaxes(),
      orderTotal: _getOrderTotal(),
      total: double.parse(previewOrderPrice.total),
    );
  }
}
