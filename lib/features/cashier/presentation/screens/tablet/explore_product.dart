import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/form/search_field.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
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
import 'package:lakoe_pos/features/cashier/presentation/widgets/appbar/explore_product_appbar.dart';
import 'package:lakoe_pos/features/cashier/presentation/widgets/drawer/explore_product_drawer_tablet.dart';
import 'package:lakoe_pos/features/cashier/presentation/widgets/open_order_list.dart';
import 'package:lakoe_pos/features/cashier/presentation/widgets/product_grid.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_cubit.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_state.dart';
import 'package:lakoe_pos/features/payment_method/common/widgets/payment_method_not_available.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/filter/product_category_filter.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class ExploreProductTablet extends StatelessWidget {
  const ExploreProductTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartDetailFilterCubit(),
      child: const ExploreProductTabletContent(),
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
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchController.clear();
    _onRefresh();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _onCartSaved() async {
    _searchController.clear();
    context.read<CashierProductFilterCubit>().setFilter(name: "");

    CartState cartState = context.read<CartCubit>().state;
    CartDetailFilterState filterState =
        context.read<CartDetailFilterCubit>().state;

    await context.read<CartDetailCubit>().saveOrder(
          carts: cartState.carts,
          type: filterState.type,
          customerId: filterState.customer?.id,
          tableId: filterState.table?.id,
        );
  }

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
    return BlocListener<CartDetailCubit, CartDetailState>(
      listener: (context, state) {
        if (state is CartDetailActionSuccess) {
          context.read<CartCubit>().reset();
          context.read<CashierOrderCubit>().findAll();
        }

        if (state is CartDetailActionSuccess ||
            state is CartDetailCompleteActionSuccess) {
          context.read<CartCubit>().reset();
          context.read<CartDetailFilterCubit>().clearFilter();
        }
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
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 12.0),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                          Container(
                                            width: 450,
                                            padding: EdgeInsets.only(
                                                right: 24, left: 12),
                                            child: SearchField(
                                              hintText: "Cari menu disini…",
                                              controller: _searchController,
                                              focusNode: _searchFocusNode,
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
                          ProductGrid(
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
                            child: CartContentTablet(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            child: CartFooter(
                              labelButtonCart: "Proses Pesanan",
                              onCompleted: (value) {
                                onCompleteOrder(value);
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
      ),
    );
  }

  Future<void> onCompleteOrder(double value) async {
    PaymentMethodState state = context.read<PaymentMethodCubit>().state;

    if (state is PaymentMethodLoadSuccess) {
      final activePaymentMethods =
          state.paymentMethod.where((method) => method.isActive).toList();

      if (activePaymentMethods.isEmpty) {
        return showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return const CustomBottomsheet(
              child: PaymentMethodNotAvailable(),
            );
          },
        );
      }
      _scaffoldKey.currentState!.openEndDrawer();
      _searchController.clear();
      context.read<CashierProductFilterCubit>().setFilter(name: "");
    } else {
      return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return const CustomBottomsheet(
            child: PaymentMethodNotAvailable(),
          );
        },
      );
    }
  }
}
