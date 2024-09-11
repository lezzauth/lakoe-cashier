import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_state.dart';
import 'package:point_of_sales_cashier/features/cart/data/models/cart_model.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_state.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/explore_product_card.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:product_repository/product_repository.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  void _onAddToCart(ProductModel product) {
    context.read<CartCubit>().addCart(product);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CashierProductCubit, CashierProductState>(
      builder: (context, state) => DecoratedSliver(
        decoration: const BoxDecoration(
          color: TColors.neutralLightLight,
        ),
        sliver: SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          sliver: switch (state) {
            CashierProductLoadSuccess(:final products) => products.isEmpty
                ? const SliverFillRemaining(
                    child: EmptyList(
                        title: "Pencarian tidak ditemukan",
                        subTitle: "Coba cari dengan nama produk yang lain"),
                  )
                : BlocBuilder<CartCubit, CartState>(
                    builder: (context, cartState) {
                      return SliverGrid.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 208,
                          mainAxisExtent: 235.5,
                          childAspectRatio: 208 / 235.5,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          ProductModel product = products[index];
                          CartModel? cart = cartState.carts.firstWhereOrNull(
                            (element) => element.product.id == product.id,
                          );
                          return ExploreProductCard(
                            product: product,
                            qty: cart?.quantity ?? 0,
                            onTap: () {
                              _onAddToCart(product);
                            },
                          );
                        },
                      );
                    },
                  ),
            CashierProductLoadFailure(:final error) => SliverFillRemaining(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  color: TColors.neutralLightLight,
                  child: Center(
                    child: TextBodyS(
                      error,
                      color: TColors.error,
                    ),
                  ),
                ),
              ),
            _ => SliverFillRemaining(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  color: TColors.neutralLightLight,
                  child: const Center(child: CircularProgressIndicator()),
                ),
              ),
          },
        ),
      ),
    );
  }
}
