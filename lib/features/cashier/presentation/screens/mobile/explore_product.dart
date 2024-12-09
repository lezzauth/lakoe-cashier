import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/error_display/error_display.dart';
import 'package:lakoe_pos/common/widgets/form/search_field.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/category/cashier_category_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/category/cashier_category_state.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/order/cashier_order_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/order/cashier_order_state.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_filter_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_filter_state.dart';
import 'package:lakoe_pos/features/cashier/presentation/widgets/appbar/explore_product_appbar.dart';
import 'package:lakoe_pos/features/cashier/presentation/widgets/button/cart_count_floating_action_button.dart';
import 'package:lakoe_pos/features/cashier/presentation/widgets/open_order_list.dart';
import 'package:lakoe_pos/features/cashier/presentation/widgets/product_list.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/filter/product_category_filter.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

class ExploreProductMobile extends StatefulWidget {
  const ExploreProductMobile({
    super.key,
  });

  @override
  State<ExploreProductMobile> createState() => _ExploreProductMobileState();
}

class _ExploreProductMobileState extends State<ExploreProductMobile> {
  bool isBottomSheetVisible = false;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

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

  Future<void> openSettings() async {
    final intent = AndroidIntent(
      action: 'android.settings.SETTINGS',
      flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
    );
    await intent.launch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExploreProductAppbar(),
      body: BlocListener<CashierOrderCubit, CashierOrderState>(
        listener: (BuildContext context, CashierOrderState state) {
          if (state is ConnectionIssue && !isBottomSheetVisible) {
            isBottomSheetVisible = true;
            if (!mounted) return;

            showModalBottomSheet(
              context: context,
              enableDrag: false,
              isDismissible: false,
              builder: (context) {
                return PopScope(
                  canPop: false,
                  onPopInvokedWithResult: (didPop, result) async {},
                  child: CustomBottomsheet(
                    hasGrabber: false,
                    child: ErrorDisplay(
                      imageSrc: TImages.noConnection,
                      title: "Koneksi internet aman ngga?",
                      description:
                          "Coba cek WiFi atau kuota internet kamu dulu terus bisa dicoba lagi, ya!",
                      actionTitlePrimary: "Pengaturan",
                      onActionPrimary: () {
                        isBottomSheetVisible = false;
                        Navigator.pop(context);
                        openSettings();
                      },
                      actionTitleSecondary: "Coba Lagi",
                      onActionSecondary: () async {
                        isBottomSheetVisible = false;
                        Navigator.pop(context);
                        await Future.delayed(Duration(seconds: 2));
                        _onRefresh();
                      },
                    ),
                  ),
                );
              },
            ).whenComplete(() => isBottomSheetVisible = false);
            return;
          }
        },
        child: Scrollbar(
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
                          focusNode: _searchFocusNode,
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
                CashierProductList(
                  searchController: _searchController,
                  searchFocusNode: _searchFocusNode,
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 80),
                ),
              ],
            ),
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
