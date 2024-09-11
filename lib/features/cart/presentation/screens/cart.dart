import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_filter_state.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_state.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_state.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/widgets/content/cart_content.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/widgets/footer/cart_footer.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/order/cashier_order_cubit.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_state.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/select_payment_method.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartDetailFilterCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) => switch (state) {
          AuthReady() => const Cart(),
          _ => const Scaffold(body: Center(child: CircularProgressIndicator())),
        },
      ),
    );
  }
}

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Future<void> _onCartSaved() async {
    AuthReady authState = context.read<AuthCubit>().state as AuthReady;
    CartState cartState = context.read<CartCubit>().state;
    CartDetailFilterState filterState =
        context.read<CartDetailFilterCubit>().state;

    await context.read<CartDetailCubit>().saveOrder(
          carts: cartState.carts,
          outletId: authState.outletId,
          type: filterState.type,
          customerId: filterState.customer?.id,
          tableId: filterState.table?.id,
        );
    Navigator.pop(context);
  }

  Future<void> _onCashPaid(PaymentCash data) async {
    AuthReady authState = context.read<AuthCubit>().state as AuthReady;
    CartState cartState = context.read<CartCubit>().state;
    CartDetailFilterState filterState =
        context.read<CartDetailFilterCubit>().state;

    await context.read<CartDetailCubit>().saveAndCompleteOrder(
          carts: cartState.carts,
          outletId: authState.outletId,
          paidAmount: data.paidAmount,
          change: data.change,
          paymentMethod: "CASH",
          type: filterState.type,
          customerId: filterState.customer?.id,
          tableId: filterState.table?.id,
        );
  }

  Future<void> onCompleteOrder(int amount) async {
    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return SelectPaymentMethod(
          amount: amount,
          onPaymentCash: _onCashPaid,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CartDetailCubit, CartDetailState>(
          listener: (context, state) {
            if (state is CartDetailActionSuccess) {
              context.read<CartCubit>().reset();
              context.read<CashierOrderCubit>().findAll();
            }

            if (state is CartDetailCompleteActionSuccess) {
              Navigator.popAndPushNamed(
                context,
                "/payments/success_confirmation",
                arguments: state.response,
              );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            title: "Pesanan Baru",
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Expanded(
              child: CartContent(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: CartFooter(
                onCompleted: onCompleteOrder,
                onSaved: _onCartSaved,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
