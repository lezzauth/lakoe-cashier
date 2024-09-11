import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_filter_state.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_state.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_state.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/widgets/content/cart_content_tablet.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/widgets/footer/cart_footer.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/category/cashier_category_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/category/cashier_category_state.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/order/cashier_order_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_filter_state.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/appbar/explore_product_appbar.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/drawer/explore_product_drawer_tablet.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/open_order_list.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/product_grid.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/product_list.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/filter/product_category_filter.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class ExploreProductTablet extends StatelessWidget {
  const ExploreProductTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartDetailFilterCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) => switch (state) {
          AuthReady() => const ExploreProductTabletContent(),
          _ => const Scaffold(body: Center(child: CircularProgressIndicator())),
        },
      ),
    );
  }
}

class ExploreProductTabletContent extends StatefulWidget {
  const ExploreProductTabletContent({super.key});

  @override
  State<ExploreProductTabletContent> createState() =>
      _ExploreProductTabletContentState();
}

class _ExploreProductTabletContentState
    extends State<ExploreProductTabletContent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
  }

  Future<void> _onRefresh() async {
    if (!mounted) return;

    AuthReady authState = context.read<AuthCubit>().state as AuthReady;

    CashierProductFilterState filterState =
        context.read<CashierProductFilterCubit>().state;

    await context.read<CashierOrderCubit>().findAll();
    await context
        .read<CashierCategoryCubit>()
        .findAll(outletId: authState.outletId);
    await context.read<CashierProductCubit>().findAll(
          outletId: authState.outletId,
          categoryId: filterState.categoryId,
          name: filterState.name,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartDetailCubit, CartDetailState>(
      listener: (context, state) {
        if (state is CartDetailActionSuccess) {
          context.read<CartCubit>().reset();
          context.read<CashierOrderCubit>().findAll();
        }

        if (state is CartDetailActionSuccess ||
            state is CartDetailCompleteActionSuccess) {
          context.read<CartDetailFilterCubit>().clearFilter();
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: const ExploreProductDrawerTablet(),
        body: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Scaffold(
                appBar: const ExploreProductAppbar(),
                body: Scrollbar(
                  child: RefreshIndicator(
                    onRefresh: _onRefresh,
                    backgroundColor: TColors.neutralLightLightest,
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Container(
                            color: TColors.neutralLightLight,
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 12.0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextHeading3("Berlangsung"),
                                    ],
                                  ),
                                ),
                                const CashierOpenOrderList(),
                              ],
                            ),
                          ),
                        ),
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
                                                  .setFilter(categoryId: value);
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
                                        Container(
                                          width: 360,
                                          padding:
                                              const EdgeInsets.only(right: 24),
                                          child: SearchField(
                                            hintText: "Cari menu disini…",
                                            debounceTime: 500,
                                            onChanged: (value) {
                                              context
                                                  .read<
                                                      CashierProductFilterCubit>()
                                                  .setFilter(name: value);
                                            },
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
                        const ProductGrid(),
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
                    width: 500,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Expanded(
                          child: CartContentTablet(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          child: CartFooter(
                            onCompleted: (value) {
                              _scaffoldKey.currentState!.openEndDrawer();
                            },
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
    );
  }
}
