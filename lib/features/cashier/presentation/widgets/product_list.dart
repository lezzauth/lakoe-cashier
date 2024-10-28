import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/shimmer/list_shimmer.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_state.dart';
import 'package:point_of_sales_cashier/features/cart/data/models/cart_model.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_state.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/explore_product_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:product_repository/product_repository.dart';

class CashierProductList extends StatefulWidget {
  const CashierProductList({super.key});

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
                        _onAddToCart(product);
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
              child: ListShimmer(),
            ),
          _ => SliverToBoxAdapter(
              child: ListShimmer(),
            ),
        },
      ),
    );
  }
}
