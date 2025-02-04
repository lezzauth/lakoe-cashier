import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/shimmer/list_shimmer.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_state.dart';
import 'package:lakoe_pos/features/cart/data/models/cart_model.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_filter_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_filter_state.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/product/cashier_product_state.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/product/explore_product_item.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:product_repository/product_repository.dart';

class CashierProductList extends StatefulWidget {
  const CashierProductList({
    super.key,
    this.searchController,
    this.searchFocusNode,
  });

  final TextEditingController? searchController;
  final FocusNode? searchFocusNode;

  @override
  State<CashierProductList> createState() => _CashierProductListState();
}

class _CashierProductListState extends State<CashierProductList> {
  void _onAddToCart(ProductModel product) {
    context.read<CartCubit>().addCart(product);
  }

  void _onCartQuantityChanged(ProductModel product, int quantity) {
    context.read<CartCubit>().updateQuantity(product, quantity);
  }

  void _onCartNotesChanged(ProductModel product, String notes) {
    context.read<CartCubit>().updateNotes(product, notes);
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
      builder: (context, state) => DecoratedSliver(
        decoration: const BoxDecoration(color: TColors.neutralLightLightest),
        sliver: switch (state) {
          CashierProductLoadSuccess(:final products) =>
            BlocBuilder<CartCubit, CartState>(
              builder: (context, cartState) {
                if (products.isEmpty) {
                  return SliverToBoxAdapter(
                    child: EmptyList(
                      title: "Pencarian tidak ditemukan",
                      subTitle: "Coba cari dengan nama produk yang lain.",
                      action: TextButton(
                        onPressed: _handleChangeKeyword,
                        child: TextActionL(
                          "Ubah Pencarian",
                          color: TColors.primary,
                        ),
                      ),
                    ),
                  );
                }

                return SliverList.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    ProductModel product = products[index];
                    CartModel? cart = cartState.carts.firstWhereOrNull(
                      (element) => element.product.id == product.id,
                    );
                    return ExploreProductItem(
                      product: product,
                      qty: cart?.quantity ?? 0,
                      notes: cart?.notes ?? "",
                      onTap: () {
                        // if (product.availability != "AVAILABLE" || product.stock == 0) {
                        if (product.availability != "AVAILABLE") {
                          CustomToast.show(
                            "Produk tidak tersedia/stok habis.",
                            position: "bottom",
                          );
                        } else {
                          _onAddToCart(product);
                        }
                      },
                      onCounterChanged: (quantity) {
                        _onCartQuantityChanged(product, quantity);
                      },
                      onNotesChanged: (notes) {
                        _onCartNotesChanged(product, notes);
                      },
                    );
                  },
                );
              },
            ),
          CashierProductLoadFailure() => SliverToBoxAdapter(
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
          _ => SliverToBoxAdapter(
              child: ListShimmer(),
            ),
        },
      ),
    );
  }
}
