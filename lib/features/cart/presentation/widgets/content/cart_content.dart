import 'dart:async';

import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/form/counter.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_filter_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_filter_state.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_state.dart';
import 'package:lakoe_pos/features/cart/data/models/cart_model.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/customer_and_table_select.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/order_type_chip.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/summary/preview_order_price.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/product/action/product_note_action.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/product/base_product_item.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:product_repository/product_repository.dart';
import 'package:table_repository/table_repository.dart';

class CartContent extends StatefulWidget {
  const CartContent({super.key, this.controller});

  final ScrollController? controller;

  @override
  State<CartContent> createState() => _CartContentState();
}

class _CartContentState extends State<CartContent> {
  Timer? _debounce;

  final List<LabelValue> _orderType = [
    const LabelValue(label: "Dine In", value: "DINEIN"),
    const LabelValue(label: "Dibungkus", value: "TAKEAWAY"),
    // const LabelValue(label: "GoFood", value: "GOFOOD"),
    // const LabelValue(label: "GrabFood", value: "GRABFOOD"),
  ];

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

  Future<void> _onCustomerChanged(CustomerModel? customer) async {
    context.read<CartDetailFilterCubit>().setCustomer(customer: customer);
  }

  Future<void> _onTableChanged(TableModel? table) async {
    context.read<CartDetailFilterCubit>().setTable(table: table);
  }

  void _onOrderTypeChanged(String type) {
    context.read<CartDetailFilterCubit>().setType(type: type);
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
                          child: BlocBuilder<CartDetailFilterCubit,
                                  CartDetailFilterState>(
                              builder: (context, filter) {
                            return CustomerAndTableSelect(
                              customer: filter.customer,
                              table: filter.table,
                              onCustomerChanged: _onCustomerChanged,
                              onTableChanged: _onTableChanged,
                            );
                          }),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                child: const TextHeading3("Jenis Pesanan"),
                              ),
                              BlocBuilder<CartDetailFilterCubit,
                                      CartDetailFilterState>(
                                  builder: (context, filter) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    spacing: 8,
                                    runSpacing: -4,
                                    children: _orderType.map((orderType) {
                                      bool selected =
                                          filter.type == orderType.value;

                                      return OrderTypeChip(
                                        type: orderType,
                                        selected: selected,
                                        onSelected: (value) {
                                          _onOrderTypeChanged(orderType.value);
                                        },
                                      );
                                    }).toList(),
                                  ),
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 8.0),
                          child: TextHeading3(
                            "Pesanan",
                            color: TColors.neutralDarkDarkest,
                          ),
                        ),
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
                                  imageUrl: image,
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
                        child: ResponsiveLayout(
                            mobile: Padding(
                              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 20.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: TColors.neutralLightMedium,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Row(children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextHeading3(
                                          "Mau tambah pesanan?",
                                          color: TColors.neutralDarkDarkest,
                                        ),
                                        TextBodyS(
                                          "Kamu masih bisa tambah pesanan ini.",
                                          color: TColors.neutralDarkLight,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 36,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: TColors.primary,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: TextActionL("Tambah"),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            tablet: SizedBox.shrink()),
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
