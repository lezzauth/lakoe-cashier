import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/form/search_field.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_filter_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_filter_state.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_state.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_state.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/content/cart_content_tablet.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/footer/cart_footer.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/category/cashier_category_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/category/cashier_category_state.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/order/cashier_order_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_filter_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_filter_state.dart';
import 'package:lakoe_pos/features/cashier/presentation/widgets/drawer/explore_product_drawer_tablet.dart';
import 'package:lakoe_pos/features/cashier/presentation/widgets/cashier_product_grid.dart';
import 'package:lakoe_pos/features/orders/application/cubit/order_add_item/order_add_item_cubit.dart';
import 'package:lakoe_pos/features/orders/data/arguments/order_edit_argument.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/filter/product_category_filter.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class OrderEditTablet extends StatelessWidget {
  const OrderEditTablet({super.key, required this.arguments});

  final OrderEditArgument arguments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartDetailFilterCubit(),
      child: OrderEditTabletContent(arguments: arguments),
    );
  }
}

class OrderEditTabletContent extends StatefulWidget {
  const OrderEditTabletContent(
      {super.key, required this.arguments, this.controller});

  final OrderEditArgument arguments;
  final ScrollController? controller;

  @override
  State<OrderEditTabletContent> createState() => _OrderEditTabletContentState();
}

class _OrderEditTabletContentState extends State<OrderEditTabletContent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _onInit();
  }

  void _onInit() async {
    _onRefresh();
  }

  Future<void> _onRefresh() async {
    await _onPreviewOrderPrice();

    if (!mounted) return;

    CashierProductFilterState filterState =
        context.read<CashierProductFilterCubit>().state;

    context.read<CashierCategoryCubit>().findAll();
    await context.read<CashierProductCubit>().findAll(
          categoryId: filterState.categoryId,
          name: filterState.name,
        );
  }

  Future<void> _onCartSaved() async {
    CartState cartState = context.read<CartCubit>().state;

    await context.read<OrderEditCubit>().editOrder(
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

  Future<void> _onPreviewOrderPrice() async {
    if (!mounted) return;
    CartState cartState = context.read<CartCubit>().state;
    CartDetailFilterState filterState =
        context.read<CartDetailFilterCubit>().state;

    await context.read<CartDetailCubit>().previewOrderPrice(
          type: filterState.type,
          carts: cartState.carts,
        );
  }

  @override
  Widget build(BuildContext context) {
    // OrderModel order = widget.arguments.order;

    return BlocListener<CartDetailCubit, CartDetailState>(
      listener: (context, state) {
        if (state is CartDetailActionSuccess) {
          context.read<CartCubit>().reset();
          context.read<CashierOrderCubit>().findAll();
        }

        if (state is CartDetailActionSuccess ||
            state is CartDetailCompleteActionSuccess) {}
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: TColors.neutralLightLightest,
          endDrawer: ExploreProductDrawerTablet(),
          body: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Scaffold(
                  backgroundColor: TColors.neutralLightLight,
                  appBar: CustomAppbar(
                    search: SearchField(
                      hintText: "Cari menu disini...",
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      debounceTime: 500,
                      onChanged: (value) {
                        context
                            .read<CashierProductFilterCubit>()
                            .setFilter(name: value);
                      },
                    ),
                  ),
                  body: Scrollbar(
                    child: RefreshIndicator(
                      onRefresh: _onRefresh,
                      backgroundColor: TColors.neutralLightLightest,
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Container(
                              color: TColors.neutralLightLight,
                              child: BlocBuilder<CashierProductFilterCubit,
                                  CashierProductFilterState>(
                                builder: (context, filterState) {
                                  return BlocBuilder<CashierCategoryCubit,
                                      CashierCategoryState>(
                                    builder: (context, state) {
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: ProductCategoryFilter(
                                              value: filterState.categoryId,
                                              onChanged: (value) {
                                                context
                                                    .read<
                                                        CashierProductFilterCubit>()
                                                    .setFilter(
                                                        categoryId: value);
                                              },
                                              categories: state
                                                      is CashierCategoryLoadSuccess
                                                  ? state.categories
                                                  : [],
                                              errorText: state
                                                      is CashierCategoryLoadFailure
                                                  ? state.error
                                                  : "",
                                              loading: state
                                                  is CashierCategoryLoadInProgress,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          CashierProductGrid(
                            searchController: _searchController,
                            searchFocusNode: _searchFocusNode,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return Visibility(
                    visible: state.carts.isNotEmpty,
                    child: SizedBox(
                      width: 440,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: CartContentTablet(
                              isNewOrder: false,
                              noOrder: widget.arguments.order.no,
                              arguments: widget.arguments,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            child: CartFooter(
                              onSaved: _onCartSaved,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
