import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_state.dart';
import 'package:lakoe_pos/features/cart/data/models/cart_model.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_state.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/product/explore_product_card.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
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

  void _onCartQuantityChanged(ProductModel product, int quantity) {
    context.read<CartCubit>().updateQuantity(product, quantity);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CashierProductCubit, CashierProductState>(
      builder: (context, state) => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
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
                          onCounterChanged: (qty) {
                            _onCartQuantityChanged(product, qty);
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
    );
  }
}
