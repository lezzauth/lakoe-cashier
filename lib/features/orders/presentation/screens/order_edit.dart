import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/responsive/responsive_layout.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/category/cashier_category_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_filter_state.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_state.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_add_item/order_add_item_cubit.dart';
import 'package:point_of_sales_cashier/features/orders/data/arguments/order_edit_argument.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/screens/mobile/edit_order_mobile.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/screens/tablet/edit_order_tablet.dart';
import 'package:product_repository/product_repository.dart';

class OrderEditScreen extends StatelessWidget {
  const OrderEditScreen({super.key, required this.arguments});

  final OrderEditArgument arguments;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OrderEditCubit()),
        BlocProvider(create: (context) => CashierProductCubit()),
        BlocProvider(create: (context) => CashierProductFilterCubit()),
        BlocProvider(create: (context) => CashierCategoryCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => CartDetailCubit()),
      ],
      child: OrderEdit(arguments: arguments),
    );
  }
}

class OrderEdit extends StatefulWidget {
  const OrderEdit({super.key, required this.arguments});

  final OrderEditArgument arguments;

  @override
  State<OrderEdit> createState() => _OrderEditState();
}

class _OrderEditState extends State<OrderEdit> {
  void _onInit() async {
    _onRefresh();
  }

  Future<void> _onUpdateCart(
      ProductModel product, int qty, String notes) async {
    context.read<CartCubit>().addCart(product);
    context.read<CartCubit>().updateNotes(product, notes);
    context.read<CartCubit>().updateQuantity(product, qty);
  }

  Future<void> _onRefresh() async {
    if (!mounted) return;

    CashierProductFilterState filterState =
        context.read<CashierProductFilterCubit>().state;

    List<OrderItem> orderItems = widget.arguments.order.items;

    context.read<CashierCategoryCubit>().findAll();
    await context.read<CashierProductCubit>().findAll(
          categoryId: filterState.categoryId,
          name: filterState.name,
        );

    /////

    if (!mounted) return;
    final productState = context.read<CashierProductCubit>().state;

    if (productState is CashierProductLoadSuccess) {
      final List<ProductModel> matchingProducts =
          productState.products.where((product) {
        return orderItems.any((orderItem) => orderItem.productId == product.id);
      }).toList();

      if (matchingProducts.isNotEmpty) {
        for (var product in matchingProducts) {
          var orderItem = orderItems.firstWhere(
            (orderItem) => orderItem.productId == product.id,
          );
          int qty = orderItem.quantity;
          String? notes = orderItem.notes;
          await _onUpdateCart(product, qty, notes!);
        }
        log("Matching products found: ${matchingProducts[0].name}");
      } else {
        log("Matching products not found");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CashierProductFilterCubit, CashierProductFilterState>(
      listener: (context, state) {
        context.read<CashierProductCubit>().findAll(
              categoryId: state.categoryId,
              name: state.name,
            );
      },
      child: ResponsiveLayout(
        mobile: OrderEditMobile(arguments: widget.arguments),
        tablet: OrderEditTablet(arguments: widget.arguments),
      ),
    );
  }
}
