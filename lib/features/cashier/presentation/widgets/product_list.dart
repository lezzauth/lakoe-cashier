import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_state.dart';
import 'package:point_of_sales_cashier/features/cart/data/models/cart_model.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/product/cashier_product_state.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/explore_product_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:product_repository/product_repository.dart';
import 'package:shimmer/shimmer.dart';

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
          CashierProductLoadFailure(:final error) => SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: TextBodyS(
                    error,
                    color: TColors.error,
                  ),
                ),
              ),
            ),
          _ => SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Wrap(
                  runSpacing: 12,
                  children: List.generate(
                    8,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 4.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                              baseColor: const Color(0xFFE8E9F1),
                              highlightColor: const Color(0xFFF8F9FE),
                              child: Container(
                                height: 60.0,
                                width: 60.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: TColors.neutralLightLightest,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Wrap(
                              spacing: 8.0,
                              direction: Axis.vertical,
                              children: [
                                Shimmer.fromColors(
                                  baseColor: const Color(0xFFE8E9F1),
                                  highlightColor: const Color(0xFFF8F9FE),
                                  child: Container(
                                    height: 20.0,
                                    width: 200.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: TColors.neutralLightLightest,
                                    ),
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: const Color(0xFFE8E9F1),
                                  highlightColor: const Color(0xFFF8F9FE),
                                  child: Container(
                                    height: 16.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: TColors.neutralLightLightest,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  //  Container(
                  //   margin: const EdgeInsets.symmetric(vertical: 24),
                  //   child: const Center(child: CircularProgressIndicator()),
                  // ),
                ),
              ),
            ),
        },
      ),
    );
  }
}
