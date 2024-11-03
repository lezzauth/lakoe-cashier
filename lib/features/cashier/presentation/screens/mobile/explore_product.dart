import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/category/cashier_category_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/category/cashier_category_state.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/order/cashier_order_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_filter_state.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/appbar/explore_product_appbar.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/button/cart_count_floating_action_button.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/open_order_list.dart';
import 'package:point_of_sales_cashier/features/cashier/presentation/widgets/product_list.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/filter/product_category_filter.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class ExploreProductMobile extends StatefulWidget {
  const ExploreProductMobile({
    super.key,
  });

  @override
  State<ExploreProductMobile> createState() => _ExploreProductMobileState();
}

class _ExploreProductMobileState extends State<ExploreProductMobile> {
  final TextEditingController _searchController = TextEditingController();

  Future<void> _onRefresh() async {
    if (!mounted) return;

    CashierProductFilterState filterState =
        context.read<CashierProductFilterCubit>().state;

    context.read<CashierOrderCubit>().findAll();
    context.read<CashierCategoryCubit>().findAll();
    await context.read<CashierProductCubit>().findAll(
          categoryId: filterState.categoryId,
          name: filterState.name,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExploreProductAppbar(),
      body: Scrollbar(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          backgroundColor: TColors.neutralLightLightest,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  color: TColors.neutralLightLight,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 6.0,
                  ),
                  child: BlocBuilder<CashierProductFilterCubit,
                      CashierProductFilterState>(
                    builder: (context, state) {
                      return SearchField(
                        hintText: "Cari menu disini…",
                        controller: _searchController,
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
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 12.0),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextHeading3("Daftar Pesanan"),
                          ],
                        ),
                      ),
                      CashierOpenOrderList(),
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
              CashierProductList(),
              SliverToBoxAdapter(
                child: SizedBox(height: 80),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CartCountFloatingAction(
        onPressed: () {
          Navigator.pushNamed(context, "/cart");
        },
      ),
    );
  }
}
