import 'dart:async';
import 'dart:developer';

import 'package:cashier_repository/cashier_repository.dart';
import 'package:collection/collection.dart';
import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/data/models.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/counter.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_detail_state.dart';
import 'package:point_of_sales_cashier/features/cart/application/cubit/cart_state.dart';
import 'package:point_of_sales_cashier/features/cart/data/models/cart_model.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/widgets/bottom_sheet/customer_list.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/widgets/cards/card_order.dart';
import 'package:point_of_sales_cashier/features/cart/presentation/widgets/summary/cart_summary.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/order/cashier_order_cubit.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/select_payment_method.dart';
import 'package:point_of_sales_cashier/features/payments/data/models/payment_method_return_model.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/action/product_note_action.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/base_product_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/device/device_uility.dart';
import 'package:product_repository/product_repository.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Timer? _debounce;
  String _type = "DINEIN";
  CustomerModel? _selectedCustomer;

  final List<LabelValue> _orderType = [
    const LabelValue(label: "DineIn", value: "DINEIN"),
    const LabelValue(label: "Dibungkus", value: "TAKEAWAY"),
  ];

  void _onCartQuantityChanged(ProductModel product, int quantity) {
    context.read<CartCubit>().updateQuantity(product, quantity);
  }

  void _onCartNotesChanged(ProductModel product, String notes) {
    context.read<CartCubit>().updateNotes(product, notes);
  }

  Future<void> _onCartSaved() async {
    AuthState authState = context.read<AuthCubit>().state;
    if (authState is AuthReady) {
      CartState cartState = context.read<CartCubit>().state;

      await context.read<CartDetailCubit>().saveOrder(
            carts: cartState.carts,
            outletId: authState.outletId,
            type: _type,
            customerId: _selectedCustomer?.id,
          );
      Navigator.pop(context);
    }
  }

  Future<void> _onPreviewOrderPrice() async {
    AuthState authState = context.read<AuthCubit>().state;
    if (authState is AuthReady) {
      CartState cartState = context.read<CartCubit>().state;
      await context.read<CartDetailCubit>().previewOrderPrice(
            type: _type,
            carts: cartState.carts,
            outletId: authState.outletId,
          );
    }
  }

  Future<void> onCustomerOpened() async {
    CustomerModel? selectedCustomer =
        await showModalBottomSheet<CustomerModel?>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      useSafeArea: true,
      useRootNavigator: true,
      builder: (context) {
        return Padding(
          padding: TDeviceUtils.getViewInsets(context),
          child: const CartCustomerList(),
        );
      },
    );
    setState(() {
      _selectedCustomer = selectedCustomer;
    });
  }

  Future<void> onCashPaid(CashPaymentMethodReturn data) async {
    AuthState authState = context.read<AuthCubit>().state;
    if (authState is! AuthReady) return;

    CartState cartState = context.read<CartCubit>().state;

    await context.read<CartDetailCubit>().saveAndCompleteOrder(
          carts: cartState.carts,
          outletId: authState.outletId,
          paidAmount: data.paidAmount,
          change: data.change,
          paymentMethod: "CASH",
          type: _type,
          customerId: _selectedCustomer?.id,
        );
  }

  Future<void> onCompleteOrder(int amount) async {
    final response = await showModalBottomSheet<PaymentMethodReturnModel>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) {
        return SelectPaymentMethod(
          amount: amount,
        );
      },
    );

    if (response is CashPaymentMethodReturn) {
      await onCashPaid(response);
    }
  }

  void _onOrderTypeChanged(String type) {
    setState(() {
      _type = type;
    });
    _onPreviewOrderPrice();
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
        BlocListener<CartDetailCubit, CartDetailState>(
          listener: (context, state) {
            log('CartDetailStateListener: $state');
            if (state is CartDetailActionSuccess) {
              context.read<CartCubit>().reset();
              context.read<CashierOrderCubit>().findAll();
            }

            if (state is CartDetailCompleteActionSuccess) {
              log('CartDetailCompleteActionSuccess');
              Navigator.popAndPushNamed(
                context,
                "/payments/success_confirmation",
                arguments: state.response,
              );
            }
          },
        ),
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
      ],
      child: Scaffold(
        appBar: const CustomAppbar(
          title: "Pesanan Baru",
        ),
        body: SafeArea(
          child: Scrollbar(
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              backgroundColor: TColors.neutralLightLightest,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: CardOrder(
                                      title: "Pelanggan",
                                      subTitle: _selectedCustomer == null
                                          ? "Umum"
                                          : _selectedCustomer!.name,
                                      icon: const UiIcons(
                                        TIcons.profile,
                                        height: 20,
                                        width: 20,
                                        color: TColors.primary,
                                      ),
                                      onTap: onCustomerOpened,
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  const Flexible(
                                    flex: 1,
                                    child: CardOrder(
                                      title: "No. Meja",
                                      subTitle: "Bebas",
                                      icon: UiIcons(
                                        TIcons.tableRestaurant,
                                        height: 20,
                                        width: 20,
                                        color: TColors.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextHeading3("Jenis Pesanan"),
                                SingleChildScrollView(
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    spacing: 8,
                                    children: _orderType.map((orderType) {
                                      bool selected = _type == orderType.value;

                                      return InputChip(
                                        label: !selected
                                            ? TextBodyS(orderType.label)
                                            : TextHeading5(
                                                orderType.label,
                                                color: TColors.primary,
                                              ),
                                        selected: selected,
                                        onSelected: (value) {
                                          _onOrderTypeChanged(orderType.value);
                                        },
                                      );
                                    }).toList(),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TextHeading3("Pesanan"),
                                GestureDetector(
                                  onTap: () {},
                                  child: const TextHeading4(
                                    "Tambah Pesanan",
                                    color: TColors.primary,
                                  ),
                                ),
                              ],
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0),
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
                                          _onCartNotesChanged(
                                              cart.product, notes);
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
                              margin:
                                  const EdgeInsets.symmetric(vertical: 28.0),
                              child:
                                  BlocBuilder<CartDetailCubit, CartDetailState>(
                                builder: (context, state) => switch (state) {
                                  CartDetailLoadSuccess(
                                    :final previewOrderPrice
                                  ) =>
                                    CartDetailToSummary(
                                      previewOrderPrice: previewOrderPrice,
                                    ),
                                  CartDetailLoadFailure(:final error) =>
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: Center(
                                        child: TextBodyS(
                                          error,
                                          color: TColors.error,
                                        ),
                                      ),
                                    ),
                                  _ => Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<CartDetailCubit, CartDetailState>(
                      builder: (context, cartState) => Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 48.0,
                              child: OutlinedButton(
                                onPressed:
                                    cartState is CartDetailActionInProgress
                                        ? null
                                        : _onCartSaved,
                                style: const ButtonStyle(
                                  padding: WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(
                                      // vertical: 15.5,
                                      horizontal: 26,
                                    ),
                                  ),
                                ),
                                child: cartState is CartDetailActionInProgress
                                    ? const SizedBox(
                                        height: 16,
                                        width: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1,
                                        ),
                                      )
                                    : Text(
                                        "Simpan",
                                        style: GoogleFonts.inter(
                                          color: TColors.primary,
                                          fontWeight: FontWeight.w600,
                                          fontSize: TSizes.fontSizeActionL,
                                        ),
                                      ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: SizedBox(
                                height: 48.0,
                                child: ElevatedButton(
                                  onPressed: cartState
                                          is CartDetailActionInProgress
                                      ? null
                                      : () {
                                          if (cartState
                                              is CartDetailLoadSuccess) {
                                            onCompleteOrder(int.parse(cartState
                                                .previewOrderPrice.total));
                                          }
                                        },
                                  child: cartState is CartDetailActionInProgress
                                      ? const SizedBox(
                                          height: 16,
                                          width: 16,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 1,
                                            color: TColors.neutralLightLightest,
                                          ),
                                        )
                                      : const TextActionL(
                                          "Bayar & Selesai",
                                          color: TColors.neutralLightLightest,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CartDetailToSummary extends StatelessWidget {
  final PreviewOrderPriceResponse previewOrderPrice;

  const CartDetailToSummary({super.key, required this.previewOrderPrice});

  double _getTaxes() {
    PreviewOrderCharge? taxChargeItem = previewOrderPrice.charges
        .firstWhereOrNull((charge) => charge.type == "TAX");
    PreviewOrderCharge? serviceFeeChargeItem = previewOrderPrice.charges
        .firstWhereOrNull((charge) => charge.type == "SERVICE_FEE");

    String tax = taxChargeItem?.amount ?? "0";
    String serviceFee = serviceFeeChargeItem?.amount ?? "0";

    return double.parse(tax) + double.parse(serviceFee);
  }

  double _getOrderTotal() {
    return previewOrderPrice.orderItems.fold(0, (sum, item) {
      return sum + double.parse(item.price);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CartSummary(
      tax: _getTaxes(),
      orderTotal: _getOrderTotal(),
      total: double.parse(previewOrderPrice.total),
    );
  }
}
