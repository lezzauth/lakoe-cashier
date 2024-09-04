import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
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
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) => switch (state) {
        AuthReady() => const ProductMaster(),
        _ => const Scaffold(body: Center(child: CircularProgressIndicator())),
      },
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

    AuthReady authState = context.read<AuthCubit>().state as AuthReady;

    ProductMasterFilterState filterState =
        context.read<ProductMasterFilterCubit>().state;

    await context
        .read<ProductMasterCategoryCubit>()
        .findAll(outletId: authState.outletId);
    await context.read<ProductMasterCubit>().findAll(
          FindAllProductDto(
            outletId: authState.outletId,
            name: filterState.name,
            categoryId: filterState.categoryId,
          ),
        );
  }

  @override
  void initState() {
    super.initState();
    AuthReady authState = context.read<AuthCubit>().state as AuthReady;

    context.read<ProductMasterCubit>().init(authState.outletId);
    context.read<ProductMasterCategoryCubit>().init(authState.outletId);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProductMasterFilterCubit, ProductMasterFilterState>(
          listener: (context, state) {
            AuthReady authState = context.read<AuthCubit>().state as AuthReady;

            context.read<ProductMasterCubit>().findAll(
                  FindAllProductDto(
                    outletId: authState.outletId,
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
                  builder: (context, state) => switch (state) {
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
                              String? image = product.images.elementAtOrNull(0);
                              image ??=
                                  "https://placehold.co/88/png?text=[...]";

                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    "/products/edit",
                                    arguments: product,
                                  );
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
                                  ),
                                ),
                              );
                            },
                          ),
                    ProductMasterLoadFailure(:final error) => Center(
                        child: TextBodyS(
                          error,
                          color: TColors.error,
                        ),
                      ),
                    _ => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  },
                ))
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
            onPressed: () async {
              bool? newProduct =
                  await Navigator.pushNamed(context, "/products/new") as bool?;
              if (newProduct != true) return;
              onRefresh();
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
