import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_state.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/category/cashier_category_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/category/cashier_category_state.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_filter_state.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_state.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/button/cart_count_floating_action_button.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/product_list.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_add_item/order_add_item_cubit.dart';
import 'package:point_of_sales_cashier/features/orders/data/arguments/order_edit_argument.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/screens/order_detail.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/filter/product_category_filter.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
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

  Future<void> _onAddToCart(ProductModel product, int qty) async {
    await context.read<CartCubit>().addCart(product);

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
        for (var matchingProduct in matchingProducts) {
          int qty = orderItems
              .firstWhere(
                  (orderItem) => orderItem.productId == matchingProduct.id)
              .quantity;
          await _onAddToCart(matchingProduct, qty);
        }
        log("Matching products found: ${matchingProducts[0].name}");
      } else {
        log("Matching products not found");
      }
    }
  }

  Future<void> _onCartSaved() async {
    CartState cartState = context.read<CartCubit>().state;

    await context.read<OrderEditCubit>().addItems(
          widget.arguments.order.id,
          cartState.carts
              .map((cart) => OrderItemDto(
                    quantity: cart.quantity,
                    notes: cart.notes ?? "",
                    productId: cart.product.id,
                  ))
              .toList(),
        );

    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _onInit();
  }

  @override
  Widget build(BuildContext context) {
    OrderModel order = widget.arguments.order;

    return BlocListener<CashierProductFilterCubit, CashierProductFilterState>(
      listener: (context, state) {
        context.read<CashierProductCubit>().findAll(
              categoryId: state.categoryId,
              name: state.name,
            );
      },
      child: Scaffold(
        appBar: CustomAppbar(
          search: SearchField(
            hintText: "Cari menu disini...",
            debounceTime: 500,
            onChanged: (value) {
              context.read<CashierProductFilterCubit>().setFilter(name: value);
            },
          ),
        ),
        backgroundColor: TColors.neutralLightLight,
        body: Scrollbar(
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            backgroundColor: TColors.neutralLightLightest,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 6,
                      left: 16,
                      right: 16,
                      bottom: 8,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: TextHeading3("Order #${order.no}"),
                        ),
                        CustomerAndTableInformation(
                          customer: order.customer,
                          table: order.table,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.only(top: 8),
                    color: TColors.neutralLightLightest,
                    child: BlocBuilder<CashierProductFilterCubit,
                        CashierProductFilterState>(
                      builder: (context, filterState) {
                        return BlocBuilder<CashierCategoryCubit,
                            CashierCategoryState>(
                          builder: (context, state) {
                            return ProductCategoryFilter(
                              value: filterState.categoryId,
                              onChanged: (value) {
                                context
                                    .read<CashierProductFilterCubit>()
                                    .setFilter(categoryId: value);
                              },
                              categories: state is CashierCategoryLoadSuccess
                                  ? state.categories
                                  : [],
                              errorText: state is CashierCategoryLoadFailure
                                  ? state.error
                                  : "",
                              loading: state is CashierCategoryLoadInProgress,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                BlocBuilder<CartCubit, CartState>(
                    builder: (context, cartState) {
                  return const CashierProductList();
                }),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 80),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CartCountFloatingAction(
          labelButton: "Simpan Pesanan",
          onPressed: _onCartSaved,
        ),
      ),
    );
  }
}
