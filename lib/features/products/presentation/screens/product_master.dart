import 'dart:async';

import 'package:category_repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_cubit.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_cubit.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_state.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/appbar/master_product_appbar.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/filter/product_category_filter.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/base_product_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:product_repository/product_repository.dart';

class ProductMasterScreen extends StatefulWidget {
  const ProductMasterScreen({super.key});

  @override
  State<ProductMasterScreen> createState() => _ProductMasterScreenState();
}

class _ProductMasterScreenState extends State<ProductMasterScreen> {
  int? _categoryId;
  String? _search;
  Timer? _debounce;

  Future<void> onFetchProducts() async {
    AuthState authState = context.read<AuthCubit>().state;
    if (authState is! AuthReady) return;

    return context.read<ProductCubit>().findAll(FindAllProductDto(
          outletId: authState.outletId,
          categoryId: _categoryId,
          name: _search,
        ));
  }

  Future<void> onFetchCategories() async {
    AuthState authState = context.read<AuthCubit>().state;
    if (authState is! AuthReady) return;

    return context
        .read<CategoryCubit>()
        .findAll(FindAllCategoryDto(outletId: authState.outletId));
  }

  Future<void> onRefresh() async {
    await onFetchCategories();
    await onFetchProducts();
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _search = query;
      });
      onFetchProducts();
    });
  }

  @override
  void initState() {
    super.initState();
    onFetchCategories();
    onFetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        search: SearchField(
          hintText: "Cari produk disini...",
          onChanged: _onSearchChanged,
        ),
        actions: [
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {},
            icon: const UiIcons(
              TIcons.box,
              height: 20,
              width: 20,
              color: TColors.primary,
            ),
          )
        ],
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
                child: ProductCategoryFilter(
                  value: _categoryId,
                  onChanged: (value) {
                    setState(() {
                      _categoryId = value;
                    });
                    onFetchProducts();
                  },
                ),
              ),
              Expanded(
                  child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) => switch (state) {
                  ProductLoadSuccess(:final products) => products.isEmpty
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
                                    product.images[0],
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
                  ProductLoadFailure(:final error) => Center(
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
          onPressed: () {
            Navigator.pushNamed(context, "/products/new");
          },
          elevation: 0,
          child: const Icon(
            Icons.add,
            size: 24,
          ),
        ),
      ),
    );
  }
}
