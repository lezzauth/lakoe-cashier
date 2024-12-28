import 'dart:async';

import 'package:app_data_provider/app_data_provider.dart';
import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/error_display/error_display.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_filter_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_filter_state.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_state.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_state.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/content/cart_content.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/footer/cart_footer.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_cubit.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_state.dart';
import 'package:lakoe_pos/features/payment_method/common/widgets/payment_method_not_available.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_state.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/select_payment_method.dart';
import 'package:lakoe_pos/features/payment_method/payments/data/arguments/success_confirmation_payment_argument.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartDetailFilterCubit(),
      child: const Cart(),
    );
  }
}

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final AppDataProvider _appDataProvider = AppDataProvider();
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 0 && !_isScrolled) {
        setState(() {
          _isScrolled = true;
        });
      } else if (_scrollController.offset <= 0 && _isScrolled) {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onCartSaved() async {
    CartState cartState = context.read<CartCubit>().state;
    CartDetailFilterState filterState =
        context.read<CartDetailFilterCubit>().state;

    await context.read<CartDetailCubit>().saveOrder(
          carts: cartState.carts,
          type: filterState.type,
          customerId: filterState.customer?.id,
          tableId: filterState.table?.id,
        );

    // if (!mounted) return;
    // Navigator.pop(context);
  }

  Future<void> _onCashPaid(PaymentCash data) async {
    CartState cartState = context.read<CartCubit>().state;
    CartDetailFilterState filterState =
        context.read<CartDetailFilterCubit>().state;

    await context.read<CartDetailCubit>().saveAndCompleteOrder(
          carts: cartState.carts,
          dto: CompleteCashOrderDto(
            paymentMethod: "CASH",
            paidAmount: data.paidAmount,
            change: data.change,
            customerId: filterState.customer?.id,
          ),
          type: filterState.type,
          customerId: filterState.customer?.id,
          tableId: filterState.table?.id,
        );
  }

  Future<void> _onBankTransferPaid(PaymentBankTransfer data) async {
    CartState cartState = context.read<CartCubit>().state;
    CartDetailFilterState filterState =
        context.read<CartDetailFilterCubit>().state;

    await context.read<CartDetailCubit>().saveAndCompleteOrder(
          carts: cartState.carts,
          dto: CompleteBankTransferOrderDto(
            photo: data.photo,
            data: CompleteBankTransferOrderData(
              paymentMethod: "BANK_TRANSFER",
              paidAmount: data.paidAmount,
              accountNumber: data.accountNumber,
            ),
          ),
          type: filterState.type,
          customerId: filterState.customer?.id,
          tableId: filterState.table?.id,
        );
  }

  Future<void> _onDebitCreditPaid(PaymentDebitCredit data) async {
    CartState cartState = context.read<CartCubit>().state;
    CartDetailFilterState filterState =
        context.read<CartDetailFilterCubit>().state;

    await context.read<CartDetailCubit>().saveAndCompleteOrder(
          carts: cartState.carts,
          dto: CompleteDebitCreditOrderDto(
            paymentMethod: "DEBIT",
            paidAmount: data.paidAmount,
            accountNumber: data.accountNumber,
            change: 0,
            paidFrom: data.paidFrom,
            approvalCode: data.approvalCode,
          ),
          type: filterState.type,
          customerId: filterState.customer?.id,
          tableId: filterState.table?.id,
        );
  }

  Future<void> _onQRCodePaid(PaymentQRCode data) async {
    CartState cartState = context.read<CartCubit>().state;
    CartDetailFilterState filterState =
        context.read<CartDetailFilterCubit>().state;

    await context.read<CartDetailCubit>().saveAndCompleteOrder(
          carts: cartState.carts,
          dto: CompleteQRCodeOrderDto(
            paymentMethod: "QR_CODE",
            paidAmount: data.paidAmount,
            change: data.change,
            paidFrom: data.paidFrom,
            approvalCode: data.approvalCode,
          ),
          type: filterState.type,
          customerId: filterState.customer?.id,
          tableId: filterState.table?.id,
        );
  }

  Future<void> onCompleteOrder(double amount) async {
    PaymentMethodState state = context.read<PaymentMethodCubit>().state;

    if (state is PaymentMethodLoadSuccess) {
      final activePaymentMethods =
          state.paymentMethod.where((method) => method.isActive).toList();

      if (activePaymentMethods.isEmpty) {
        return showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return const CustomBottomsheet(
              child: PaymentMethodNotAvailable(),
            );
          },
        );
      }
      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (context) {
          return CustomBottomsheet(
            child: SelectPaymentMethod(
              amount: amount,
              onPaymentCash: _onCashPaid,
              onPaymentBankTransfer: _onBankTransferPaid,
              onPaymentDebitCredit: _onDebitCreditPaid,
              onPaymentQRCode: _onQRCodePaid,
            ),
          );
        },
      );
    } else {
      return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return const CustomBottomsheet(
            child: PaymentMethodNotAvailable(),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartDetailCubit, CartDetailState>(
      listener: (context, state) async {
        if (state is CartDetailActionSuccess) {
          context.read<CartCubit>().reset();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/cashier",
              (route) => false,
            );
          });
        }

        if (state is CartDetailCompleteActionSuccess) {
          context.read<CartCubit>().reset();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.popAndPushNamed(
              context,
              "/payments/success_confirmation",
              arguments: SuccessConfirmationPaymentArgument(
                payment: state.res,
                isCashier: true,
              ),
            );
          });
        }

        if (state is CartDetailActionFailure && state.error.contains("402") ||
            state is CartDetailCompleteActionFailure &&
                state.error.contains("402")) {
          if (state is CartDetailCompleteActionFailure) {
            Navigator.pop(context);
          }

          final activePackage = await _appDataProvider.activePackage;

          String limit = "25";

          if (activePackage == "GROW") {
            limit = "50";
          }

          if (!context.mounted) return;

          showModalBottomSheet(
            context: context,
            enableDrag: false,
            isDismissible: false,
            builder: (context) {
              return PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) async {},
                child: CustomBottomsheet(
                  hasGrabber: false,
                  child: ErrorDisplay(
                    imageSrc: TImages.limitQuota,
                    title: "Pesanan lagi ramai banget, ya?",
                    description:
                        "Sayangnya, paket kamu saat ini cuma bisa buat $limit pesanan dalam sehari. Yuk! upgrade paket biar penjualan tidak terganggu.",
                    actionTitlePrimary: "Lihat Paket",
                    onActionPrimary: () {
                      context.read<CartCubit>().reset();

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (activePackage == "GROW") {
                          Navigator.popAndPushNamed(
                            context,
                            "/packages/upgrade",
                            arguments: {
                              'currentPackage': "GROW",
                              'upgradePakcage': "PRO",
                            },
                          );
                        } else {
                          Navigator.popAndPushNamed(context, "/packages");
                        }
                      });
                    },
                    actionTitleSecondary: "Nanti Saja",
                    onActionSecondary: () async {
                      context.read<CartCubit>().reset();
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.pop(context);
                      });
                    },
                  ),
                ),
              );
            },
          );
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
            title: "Pesanan Baru",
            isScrolled: _isScrolled,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CartContent(
                controller: _scrollController,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: TColors.neutralLightMedium,
                    width: 1.0,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                child: CartFooter(
                  onSaved: _onCartSaved,
                  onCompleted: onCompleteOrder,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
