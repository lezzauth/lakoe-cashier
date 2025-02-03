import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/form/search_field.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/shimmer/list_shimmer.dart';
import 'package:lakoe_pos/common/widgets/shimmer/product_card_shimmer.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/common/widgets/wrapper/error_wrapper.dart';
import 'package:lakoe_pos/features/home/application/cubit/onboarding_transaction/onboarding_transaction_cubit.dart';
import 'package:lakoe_pos/features/products/application/cubit/category/product_master_category_cubit.dart';
import 'package:lakoe_pos/features/products/application/cubit/category/product_master_category_state.dart';
import 'package:lakoe_pos/features/products/application/cubit/product_master/product_master_cubit.dart';
import 'package:lakoe_pos/features/products/application/cubit/product_master/product_master_filter_cubit.dart';
import 'package:lakoe_pos/features/products/application/cubit/product_master/product_master_filter_state.dart';
import 'package:lakoe_pos/features/products/application/cubit/product_master/product_master_state.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/filter/product_category_filter.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/product/base_product_card.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/product/base_product_item.dart';
import 'package:lakoe_pos/features/reports/data/arguments.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:product_repository/product_repository.dart';

class ProductMasterScreen extends StatelessWidget {
  const ProductMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductMasterFilterCubit(),
      child: const ProductMaster(),
    );
  }
}

class ProductMaster extends StatefulWidget {
  const ProductMaster({super.key});

  @override
  State<ProductMaster> createState() => _ProductMasterState();
}

class _ProductMasterState extends State<ProductMaster> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  Future<void> onRefresh() async {
    if (!mounted) return;

    ProductMasterFilterState filterState =
        context.read<ProductMasterFilterCubit>().state;

    context.read<ProductMasterCategoryCubit>().findAll();
    await context.read<ProductMasterCubit>().findAll(
          FindAllProductDto(
            name: filterState.name,
            categoryId: filterState.categoryId,
          ),
        );
  }

  Future<void> _onGoToReportScreen(ProductModel product, int index) async {
    bool? updateProduct = await Navigator.pushNamed(
      context,
      "/reports/best_seller/detail",
      arguments: ReportProductSalesArguments(
        rank: 0,
        product: OutletReportBestSalesProductModel(
          id: product.id,
          name: product.name,
          images: product.images,
          soldCount: product.sold,
        ),
      ),
    ) as bool?;
    if (updateProduct != true) return;
    onRefresh();
  }

  Future<void> _onGoToCreateScreen() async {
    bool? newProduct =
        await Navigator.pushNamed(context, "/products/new") as bool?;

    if (newProduct != true) return;
    onRefresh();
  }

  void _handleChangeKeyword() {
    _searchFocusNode.requestFocus();
    _searchController.selection = TextSelection(
      baseOffset: 0,
      extentOffset: _searchController.text.length,
    );
  }

  Widget _buildProductList(List<ProductModel> products) {
    final filterState = context.read<ProductMasterFilterCubit>().state;

    if (products.isEmpty) {
      if (filterState.name == null || filterState.name!.isEmpty) {
        return EmptyList(
          title: "Belum ada produk, nih!",
          subTitle: "Yuk! Masukan produk kamu dan mulai berjualan.",
          image: SvgPicture.asset(
            TImages.productEmpty,
            height: 200,
            width: 276,
          ),
        );
      }

      return EmptyList(
        title: "Pencarian tidak ditemukan",
        subTitle: "Coba cari dengan nama produk yang lain.",
        action: TextButton(
          onPressed: _handleChangeKeyword,
          child: TextActionL(
            "Ubah Pencarian",
            color: TColors.primary,
          ),
        ),
      );
    }

    return ResponsiveLayout(
      mobile: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          ProductModel product = products[index];
          String? imageUrl = product.images.elementAtOrNull(0);
          bool isNotAvailable = product.availability != "AVAILABLE";

          return InkWell(
            onTap: () {
              _onGoToReportScreen(product, index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: TColors.neutralLightMedium,
                    width: 1,
                  ),
                ),
              ),
              child: BaseProductItem(
                name: product.name,
                price: double.parse(product.price).round(),
                imageUrl: imageUrl,
                description: product.description ?? "",
                stock: product.stock,
                tag: isNotAvailable
                    ? Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: TColors.neutralLightMedium,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TextHeading5(
                          "Tidak Tersedia",
                          color: TColors.neutralDarkDark,
                        ),
                      )
                    : null,
              ),
            ),
          );
        },
      ),
      tablet: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 180,
            mainAxisExtent: 250,
            childAspectRatio: 180 / 250,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            ProductModel product = products[index];
            String? imageUrl = product.images.elementAtOrNull(0);
            bool isNotAvailable = product.availability != "AVAILABLE";

            return InkWell(
              onTap: () {
                _onGoToReportScreen(product, index);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: BaseProductCard(
                name: product.name,
                price: double.parse(product.price).round(),
                isNotAvailable: isNotAvailable,
                stock: product.stock,
                imageUrl: imageUrl,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    context.read<ProductMasterCubit>().init();
    context.read<ProductMasterCategoryCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProductMasterFilterCubit, ProductMasterFilterState>(
          listener: (context, state) {
            context.read<ProductMasterCubit>().findAll(
                  FindAllProductDto(
                    name: state.name,
                    categoryId: state.categoryId,
                  ),
                );
          },
        ),
        BlocListener<ProductMasterCubit, ProductMasterState>(
          listener: (context, state) {
            if (state is ProductMasterLoadSuccess) {
              if (state.products.length == 1) {
                context.read<OnboardingTransactionCubit>().init();
              }
            }
          },
        )
      ],
      child: Scaffold(
        appBar: CustomAppbar(
          search: SearchField(
            hintText: "Cari produk disini...",
            controller: _searchController,
            focusNode: _searchFocusNode,
            debounceTime: 500,
            onChanged: (value) {
              context.read<ProductMasterFilterCubit>().setFilter(name: value);
            },
          ),
        ),
        body: Scrollbar(
          child: RefreshIndicator(
            backgroundColor: TColors.neutralLightLightest,
            onRefresh: onRefresh,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: TColors.neutralLightLightest,
                  child: BlocBuilder<ProductMasterFilterCubit,
                      ProductMasterFilterState>(
                    builder: (context, filterState) {
                      return BlocBuilder<ProductMasterCategoryCubit,
                              ProductMasterCategoryState>(
                          builder: (context, state) {
                        return ProductCategoryFilter(
                          value: filterState.categoryId,
                          onChanged: (value) {
                            context
                                .read<ProductMasterFilterCubit>()
                                .setFilter(categoryId: value);
                          },
                          categories: state is ProductMasterCategoryLoadSuccess
                              ? state.categories
                              : [],
                          errorText: state is ProductMasterCategoryLoadFailure
                              ? state.error
                              : "",
                          loading: state is ProductMasterCategoryLoadInProgress,
                        );
                      });
                    },
                  ),
                ),
                Expanded(
                  child: BlocBuilder<ProductMasterCubit, ProductMasterState>(
                    builder: (context, state) => ErrorWrapper(
                      connectionIssue: state is ConnectionIssue,
                      fetchError: state is ProductMasterLoadFailure,
                      onRefresh: onRefresh,
                      child: switch (state) {
                        ProductMasterLoadSuccess(:final products) =>
                          _buildProductList(products),
                        _ => ResponsiveLayout(
                            mobile: ListShimmer(
                              crossAlignment: "center",
                              sizeAvatar: 44.0,
                              heightTitle: 16.0,
                              heightSubtitle: 12.0,
                            ),
                            tablet: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 16,
                                ),
                                child: ProductCardShimmer()),
                          ),
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          height: 48,
          width: 48,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            onPressed: () {
              _onGoToCreateScreen();
            },
            elevation: 0,
            child: Icon(
              Icons.add,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
