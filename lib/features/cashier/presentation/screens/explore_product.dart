import 'package:category_repository/category_repository.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/data/services/order/models/order_item_model.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_state.dart';
import 'package:point_of_sales_cashier/features/cart/data/models/cart_model.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_cubit.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_cubit.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_state.dart';
import 'package:point_of_sales_cashier/features/products/common/widgets/appbar/explore_product_appbar.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/filter/product_category_filter.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/order/order_item.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/order/order_list_button.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/explore_product_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';
import 'package:product_repository/product_repository.dart';

class ExploreProductScreen extends StatefulWidget {
  const ExploreProductScreen({super.key});

  @override
  State<ExploreProductScreen> createState() => _ExploreProductScreenState();
}

class _ExploreProductScreenState extends State<ExploreProductScreen> {
  int? _categoryId;
  String? _search;

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

    return await context
        .read<CategoryCubit>()
        .findAll(FindAllCategoryDto(outletId: authState.outletId));
  }

  Future<void> onRefresh() async {
    await onFetchCategories();
    await onFetchProducts();
  }

  void _onAddToCart(ProductModel product) {
    context.read<CartCubit>().addCart(product);
  }

  void _onCartQuantityChanged(ProductModel product, int quantity) {
    context.read<CartCubit>().updateQuantity(product, quantity);
  }

  void _onCartNotesChanged(ProductModel product, String notes) {
    context.read<CartCubit>().updateNotes(product, notes);
  }

  String _getTotalPrice(List<CartModel> carts) {
    return TFormatter.formatToRupiah(carts.fold(0,
        (sum, item) => sum + (item.quantity * int.parse(item.product.price))));
  }

  @override
  void initState() {
    super.initState();
    onFetchCategories();
    onFetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, cartState) {
        return Scaffold(
          appBar: const ExploreProductAppbar(),
          body: Scrollbar(
            child: RefreshIndicator(
              onRefresh: onRefresh,
              backgroundColor: TColors.neutralLightLightest,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      color: TColors.neutralLightLight,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                      child: SearchField(
                        hintText: "Cari menu disini…",
                        debounceTime: 500,
                        onChanged: (value) {
                          setState(() {
                            _search = value;
                          });
                          onFetchProducts();
                        },
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      color: TColors.neutralLightLight,
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 12.0),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextHeading3("Berlangsung"),
                              ],
                            ),
                          ),
                          Flexible(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Wrap(
                                direction: Axis.horizontal,
                                spacing: 8.0,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  OrderListButton(),
                                  OrderItem(),
                                  OrderItem(),
                                  OrderItem(),
                                  OrderItem(),
                                  OrderItem(),
                                  OrderItem(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
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
                  ),
                  BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) => DecoratedSliver(
                      decoration: const BoxDecoration(
                          color: TColors.neutralLightLightest),
                      sliver: switch (state) {
                        ProductLoadSuccess(:final products) =>
                          SliverList.builder(
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              ProductModel product = products[index];
                              CartModel? cart =
                                  cartState.carts.firstWhereOrNull(
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
                          ),
                        ProductLoadFailure(:final error) => SliverToBoxAdapter(
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
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 24),
                              child: const Center(
                                  child: CircularProgressIndicator()),
                            ),
                          ),
                      },
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 80),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Visibility(
            visible: cartState.carts.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 48,
                width: double.maxFinite,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/cart");
                  },
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextHeading3(
                          _getTotalPrice(cartState.carts),
                          color: TColors.neutralLightLightest,
                        ),
                        TextHeading3(
                          "Proses Pesanan (${cartState.carts.length.toString()})",
                          color: TColors.neutralLightLightest,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
