import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_state.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/category/cashier_category_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/category/cashier_category_state.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_filter_state.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/button/cart_count_floating_action_button.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/product_list.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_add_item/order_add_item_cubit.dart';
import 'package:point_of_sales_cashier/features/orders/data/arguments/order_add_item_argument.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/screens/order_detail.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/filter/product_category_filter.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class OrderAddItemScreen extends StatelessWidget {
  const OrderAddItemScreen({super.key, required this.arguments});

  final OrderAddItemArgument arguments;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OrderAddItemCubit()),
        BlocProvider(create: (context) => CashierProductCubit()),
        BlocProvider(create: (context) => CashierProductFilterCubit()),
        BlocProvider(create: (context) => CashierCategoryCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => CartDetailCubit()),
      ],
      child: OrderAddItem(arguments: arguments),
    );
  }
}

class OrderAddItem extends StatefulWidget {
  const OrderAddItem({super.key, required this.arguments});

  final OrderAddItemArgument arguments;

  @override
  State<OrderAddItem> createState() => _OrderAddItemState();
}

class _OrderAddItemState extends State<OrderAddItem> {
  void _onInit() {
    _onRefresh();
  }

  Future<void> _onRefresh() async {
    if (!mounted) return;

    AuthReady authState = context.read<AuthCubit>().state as AuthReady;

    CashierProductFilterState filterState =
        context.read<CashierProductFilterCubit>().state;

    context.read<CashierCategoryCubit>().findAll(outletId: authState.outletId);
    await context.read<CashierProductCubit>().findAll(
          outletId: authState.outletId,
          categoryId: filterState.categoryId,
          name: filterState.name,
        );
  }

  Future<void> _onCartSaved() async {
    CartState cartState = context.read<CartCubit>().state;

    await context.read<OrderAddItemCubit>().addItems(
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
        AuthReady authState = context.read<AuthCubit>().state as AuthReady;

        context.read<CashierProductCubit>().findAll(
              outletId: authState.outletId,
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
                        top: 6, left: 16, right: 16, bottom: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: TextHeading3(
                              "Order #${widget.arguments.order.no}"),
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
                const CashierProductList(),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 80),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CartCountFloatingAction(
          onPressed: _onCartSaved,
        ),
      ),
    );
  }
}
