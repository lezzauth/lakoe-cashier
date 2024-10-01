import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/common/widgets/wrapper/error_wrapper.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/category/product_master_category_cubit.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/category/product_master_category_state.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_master/product_master_cubit.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_master/product_master_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_master/product_master_filter_state.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_master/product_master_state.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/filter/product_category_filter.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/base_product_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
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

  Future<void> _onGoToEditScreen(ProductModel product) async {
    bool? updateProduct =
        await Navigator.pushNamed(context, "/products/edit", arguments: product)
            as bool?;

    if (updateProduct != true) return;
    onRefresh();
  }

  Future<void> _onGoToCreateScreen() async {
    bool? newProduct =
        await Navigator.pushNamed(context, "/products/new") as bool?;

    if (newProduct != true) return;
    onRefresh();
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
      ],
      child: Scaffold(
        appBar: CustomAppbar(
          search: SearchField(
            hintText: "Cari produk disini...",
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
                      fetchError: state is ProductMasterLoadFailure,
                      onRefresh: onRefresh,
                      child: switch (state) {
                        ProductMasterLoadSuccess(:final products) => products
                                .isEmpty
                            ? EmptyList(
                                title: "Belum ada produk, nih!",
                                subTitle:
                                    "Yuk! Masukan produk kamu dan mulai berjualan.",
                                image: SvgPicture.asset(
                                  TImages.productEmpty,
                                  height: 200,
                                  width: 276,
                                ),
                              )
                            : ListView.builder(
                                itemCount: products.length,
                                itemBuilder: (context, index) {
                                  ProductModel product = products[index];
                                  String? image =
                                      product.images.elementAtOrNull(0);
                                  image ??=
                                      "https://placehold.co/88/png?text=[...]";
                                  bool isNotAvailable =
                                      product.availability != "AVAILABLE";

                                  return InkWell(
                                    onTap: () {
                                      _onGoToEditScreen(product);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: TColors.neutralLightMedium,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: BaseProductItem(
                                        name: product.name,
                                        price: int.parse(product.price),
                                        image: Image.network(
                                          image,
                                          height: 44,
                                          width: 44,
                                          fit: BoxFit.cover,
                                        ),
                                        notes: product.description ?? "",
                                        tag: isNotAvailable
                                            ? Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: TColors
                                                      .neutralLightMedium,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: const TextHeading5(
                                                  "Tidak Tersedia",
                                                  color:
                                                      TColors.neutralDarkDark,
                                                ),
                                              )
                                            : null,
                                      ),
                                    ),
                                  );
                                },
                              ),
                        // ProductMasterLoadFailure(:final error) => Center(
                        //     child: TextBodyS(
                        //       error,
                        //       color: TColors.error,
                        //     ),
                        //   ),
                        _ => const Center(
                            child: CircularProgressIndicator(),
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
            child: const Icon(
              Icons.add,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
