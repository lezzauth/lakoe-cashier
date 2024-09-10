import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_state.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/screens/cart.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/category/cashier_category_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/category/cashier_category_state.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_filter_state.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/appbar/explore_product_appbar.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/open_order_list.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/product_list.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/filter/product_category_filter.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class ExploreProductTablet extends StatefulWidget {
  const ExploreProductTablet({super.key, required this.onRefresh});

  final Future<void> Function() onRefresh;

  @override
  State<ExploreProductTablet> createState() => _ExploreProductTabletState();
}

class _ExploreProductTabletState extends State<ExploreProductTablet> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Scaffold(
            appBar: const ExploreProductAppbar(),
            body: Scrollbar(
              child: RefreshIndicator(
                onRefresh: widget.onRefresh,
                backgroundColor: TColors.neutralLightLightest,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        color: TColors.neutralLightLight,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 6.0,
                        ),
                        child: BlocBuilder<CashierProductFilterCubit,
                            CashierProductFilterState>(
                          builder: (context, state) {
                            return SearchField(
                              hintText: "Cari menu disini…",
                              debounceTime: 500,
                              onChanged: (value) {
                                context
                                    .read<CashierProductFilterCubit>()
                                    .setFilter(name: value);
                              },
                            );
                          },
                        ),
                      ),
                    ),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
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
                                  categories:
                                      state is CashierCategoryLoadSuccess
                                          ? state.categories
                                          : [],
                                  errorText: state is CashierCategoryLoadFailure
                                      ? state.error
                                      : "",
                                  loading:
                                      state is CashierCategoryLoadInProgress,
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
            // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            // floatingActionButton: const CartCountFloatingAction(),
          ),
        ),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Visibility(
              visible: state.carts.isNotEmpty,
              child: const SizedBox(
                width: 500,
                child: CartScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
