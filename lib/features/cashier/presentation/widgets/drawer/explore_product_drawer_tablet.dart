import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_filter_state.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_state.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_state.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/widgets/content/cart_content_tablet.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_state.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/select_payment_method_tablet.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class ExploreProductDrawerTablet extends StatefulWidget {
  const ExploreProductDrawerTablet({super.key});

  @override
  State<ExploreProductDrawerTablet> createState() =>
      _ExploreProductDrawerTabletState();
}

class _ExploreProductDrawerTabletState
    extends State<ExploreProductDrawerTablet> {
  Future<void> _onCashPaid(PaymentCash data) async {
    AuthReady authState = context.read<AuthCubit>().state as AuthReady;
    CartState cartState = context.read<CartCubit>().state;
    CartDetailFilterState filterState =
        context.read<CartDetailFilterCubit>().state;

    await context.read<CartDetailCubit>().saveAndCompleteOrder(
          carts: cartState.carts,
          outletId: authState.outletId,
          dto: CompleteCashOrderDto(
            paidAmount: data.paidAmount,
            change: data.change,
            paymentMethod: "CASH",
          ),
          type: filterState.type,
          customerId: filterState.customer?.id,
          tableId: filterState.table?.id,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartDetailCubit, CartDetailState>(
      listener: (context, state) {
        if (state is CartDetailCompleteActionSuccess) {
          Navigator.popAndPushNamed(
            context,
            "/payments/success_confirmation",
            arguments: state.response,
          );
        }
      },
      child: Drawer(
        width: 1000,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Row(
          children: [
            Container(
              width: 500,
              decoration: const BoxDecoration(
                border: Border(
                  right:
                      BorderSide(width: 4, color: TColors.neutralLightMedium),
                ),
              ),
              child: const CartContentTablet(),
            ),
            SizedBox(
              width: 500,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: BlocBuilder<CartDetailCubit, CartDetailState>(
                      builder: (context, state) => switch (state) {
                        CartDetailLoadSuccess(:final previewOrderPrice) =>
                          SelectPaymentMethodTablet(
                            amount: int.parse(previewOrderPrice.total),
                            onPaymentCash: _onCashPaid,
                          ),
                        CartDetailLoadFailure(:final error) => Center(
                            child: TextBodyS(
                              error,
                              color: TColors.error,
                            ),
                          ),
                        _ => const Center(child: CircularProgressIndicator()),
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
