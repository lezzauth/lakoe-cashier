import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
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

class ExploreProductScreen extends StatefulWidget {
  const ExploreProductScreen({super.key});

  @override
  State<ExploreProductScreen> createState() => _ExploreProductScreenState();
}

class _ExploreProductScreenState extends State<ExploreProductScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) => switch (state) {
              AuthReady(:final outletId) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                        create: (context) => CashierOrderCubit()..init()),
                    BlocProvider(
                        create: (context) =>
                            CashierProductCubit()..init(outletId)),
                    BlocProvider(
                        create: (context) =>
                            CashierCategoryCubit()..init(outletId)),
                    BlocProvider(
                        create: (context) => CashierProductFilterCubit()),
                  ],
                  child: const ExploreProduct(),
                ),
              _ => const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            });
  }
}

class ExploreProduct extends StatefulWidget {
  const ExploreProduct({super.key});

  @override
  State<ExploreProduct> createState() => _ExploreProductState();
}

class _ExploreProductState extends State<ExploreProduct> {
  Future<void> onRefresh() async {
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
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, authState) {
      return MultiBlocListener(
        listeners: [
          BlocListener<CashierProductFilterCubit, CashierProductFilterState>(
            listener: (context, state) {
              if (authState is! AuthReady) return;
              context.read<CashierProductCubit>().findAll(
                    outletId: authState.outletId,
                    categoryId: state.categoryId,
                    name: state.name,
                  );
            },
          ),
        ],
        child: Scaffold(
          appBar: const ExploreProductAppbar(),
          body: Scrollbar(
            child: RefreshIndicator(
              onRefresh: onRefresh,
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
                          CashierProductFilterState>(builder: (context, state) {
                        return SearchField(
                          hintText: "Cari menu disini…",
                          debounceTime: 500,
                          onChanged: (value) {
                            context
                                .read<CashierProductFilterCubit>()
                                .setFilter(name: value);
                          },
                        );
                      }),
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
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const CartCountFloatingAction(),
        ),
      );
    });
  }
}
