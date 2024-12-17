import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/shimmer/product_card_shimmer.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_state.dart';
import 'package:lakoe_pos/features/cart/data/models/cart_model.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_filter_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_filter_state.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_state.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/product/explore_product_card.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:product_repository/product_repository.dart';

class CashierProductGrid extends StatefulWidget {
  const CashierProductGrid(
      {super.key, this.searchController, this.searchFocusNode});

  final TextEditingController? searchController;
  final FocusNode? searchFocusNode;

  @override
  State<CashierProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<CashierProductGrid> {
  void _onAddToCart(ProductModel product) {
    context.read<CartCubit>().addCart(product);
  }

  void _onCartQuantityChanged(ProductModel product, int quantity) {
    context.read<CartCubit>().updateQuantity(product, quantity);
  }

  void _handleChangeKeyword() {
    widget.searchFocusNode!.requestFocus();
    widget.searchController!.selection = TextSelection(
      baseOffset: 0,
      extentOffset: widget.searchController!.text.length,
    );
  }

  Future<void> _onRefresh() async {
    if (!mounted) return;
    CashierProductFilterState filterState =
        context.read<CashierProductFilterCubit>().state;

    await context.read<CashierProductCubit>().findAll(
          categoryId: filterState.categoryId,
          name: filterState.name,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CashierProductCubit, CashierProductState>(
      builder: (context, state) => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        sliver: switch (state) {
          CashierProductLoadSuccess(:final products) => products.isEmpty
              ? SliverFillRemaining(
                  child: EmptyList(
                    title: "Pencarian tidak ditemukan",
                    subTitle: "Coba cari dengan nama produk yang lain",
                    action: TextButton(
                      onPressed: _handleChangeKeyword,
                      child: TextActionL(
                        "Ubah Pencarian",
                        color: TColors.primary,
                      ),
                    ),
                  ),
                )
              : BlocBuilder<CartCubit, CartState>(
                  builder: (context, cartState) {
                    return SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 180,
                        mainAxisExtent: 232,
                        childAspectRatio: 180 / 232,
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
          CashierProductLoadFailure() => SliverFillRemaining(
              child: EmptyList(
                title: "Gagal memuat data, nih!",
                subTitle: "Ada sedikit gangguan. Coba coba lagi, ya",
                action: TextButton(
                  onPressed: _onRefresh,
                  child: TextActionL(
                    "Coba Lagi",
                    color: TColors.primary,
                  ),
                ),
              ),
            ),
          _ => SliverFillRemaining(
              child: ProductCardShimmer(),
            ),
        },
      ),
    );
  }
}
