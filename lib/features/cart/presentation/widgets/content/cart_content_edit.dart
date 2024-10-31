import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:order_repository/order_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/form/counter.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_filter_state.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_state.dart';
import 'package:point_of_sales_cashier/features/cart/data/models/cart_model.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/widgets/summary/preview_order_price.dart';
import 'package:point_of_sales_cashier/features/orders/data/arguments/order_edit_argument.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/widgets/ui/customer_table_card.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/action/product_note_action.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/base_product_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:product_repository/product_repository.dart';

class CartContentEdit extends StatefulWidget {
  const CartContentEdit({super.key, this.controller, required this.arguments});

  final ScrollController? controller;
  final OrderEditArgument arguments;

  @override
  State<CartContentEdit> createState() => _CartContentEditState();
}

class _CartContentEditState extends State<CartContentEdit> {
  Timer? _debounce;

  void _onCartQuantityChanged(ProductModel product, int quantity) =>
      context.read<CartCubit>().updateQuantity(product, quantity);

  void _onCartNotesChanged(ProductModel product, String notes) =>
      context.read<CartCubit>().updateNotes(product, notes);

  Future<void> _onPreviewOrderPrice() async {
    if (!mounted) return;
    CartState cartState = context.read<CartCubit>().state;
    CartDetailFilterState filterState =
        context.read<CartDetailFilterCubit>().state;

    await context.read<CartDetailCubit>().previewOrderPrice(
          type: filterState.type,
          carts: cartState.carts,
        );
  }

  Future<void> _onRefresh() async {
    await _onPreviewOrderPrice();
  }

  @override
  void initState() {
    super.initState();
    _onPreviewOrderPrice();
  }

  @override
  Widget build(BuildContext context) {
    OrderModel order = widget.arguments.order;

    return MultiBlocListener(
      listeners: [
        BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            if (state.carts.isEmpty) {
              if (ModalRoute.of(context)!.settings.name != "/cart") {
                return;
              }

              Navigator.pop(context);
              return;
            }

            if (_debounce?.isActive ?? false) _debounce?.cancel();
            _debounce = Timer(const Duration(milliseconds: 500), () {
              _onPreviewOrderPrice();
            });
          },
        ),
        BlocListener<CartDetailFilterCubit, CartDetailFilterState>(
          listener: (context, state) {
            _onPreviewOrderPrice();
          },
        )
      ],
      child: Scrollbar(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          backgroundColor: TColors.neutralLightLightest,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: CustomScrollView(
                    controller: widget.controller,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: CustomerAndTableInformation(
                            customer: order.customer,
                            table: order.table,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: const TextHeading3("Pesanan"),
                      ),
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, cartState) {
                          return SliverList.builder(
                            itemCount: cartState.carts.length,
                            itemBuilder: (context, index) {
                              CartModel cart = cartState.carts[index];
                              String? image =
                                  cart.product.images.elementAtOrNull(0);

                              return Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: TColors.neutralLightMedium,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: BaseProductItem(
                                  name: cart.product.name,
                                  price: int.parse(cart.product.price),
                                  image: image != null
                                      ? Image.network(
                                          image,
                                          height: 44,
                                          width: 44,
                                          fit: BoxFit.cover,
                                        )
                                      : SvgPicture.asset(
                                          TImages.productAvatar,
                                          height: 44,
                                          width: 44,
                                        ),
                                  counter: Counter(
                                    value: cart.quantity,
                                    onChanged: (quantity) {
                                      _onCartQuantityChanged(
                                          cart.product, quantity);
                                    },
                                  ),
                                  notes: cart.notes ?? "",
                                  noteAction: ProductNoteAction(
                                    notes: cart.notes ?? "",
                                    onChanged: (notes) {
                                      _onCartNotesChanged(cart.product, notes);
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: 12.0,
                                  top: 4,
                                ),
                                child: const TextHeading3(
                                  "Ringkasan tagihan",
                                  color: TColors.neutralDarkDarkest,
                                ),
                              ),
                              const PreviewOrderPrice(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
