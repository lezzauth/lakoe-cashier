import 'dart:async';

import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/data/models.dart';
import 'package:point_of_sales_cashier/common/widgets/form/counter.dart';
import 'package:point_of_sales_cashier/common/widgets/responsive/responsive_layout.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_filter_state.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_state.dart';
import 'package:point_of_sales_cashier/features/cart/data/models/cart_model.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/widgets/customer_and_table_select.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/widgets/order_type_chip.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/widgets/summary/preview_order_price.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/action/product_note_action.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/base_product_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
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
              // TODO: cari cara buat nge handle carts kosong
              // Navigator.pop(context);
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
                                    children: _orderType.map((orderType) {
                                      bool selected =
                                          filter.type == orderType.value;

                                      return OrderTypeChip(
                                        label: orderType.label,
                                        icon: orderType.value == "DINEIN"
                                            ? TIcons.tableRestaurant
                                            : TIcons.bag,
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
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextHeading3("Pesanan"),
                              ResponsiveLayout(
                                mobile: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const TextHeading4(
                                    "Tambah Pesanan",
                                    color: TColors.primary,
                                  ),
                                ),
                                tablet: const SizedBox(),
                              ),
                            ],
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
                              image ??=
                                  "https://placehold.co/88/png?text=[...]";

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
                                  image: Image.network(
                                    image,
                                    height: 44,
                                    width: 44,
                                    fit: BoxFit.cover,
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
                          margin: const EdgeInsets.symmetric(vertical: 28.0),
                          child: const PreviewOrderPrice(),
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
