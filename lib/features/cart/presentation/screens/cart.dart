import 'dart:async';

import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_filter_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_filter_state.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_state.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_state.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/content/cart_content.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/footer/cart_footer.dart';
import 'package:lakoe_pos/features/payments/application/cubit/payment/payment_state.dart';
import 'package:lakoe_pos/features/payments/common/widgets/select_payment_method/select_payment_method.dart';
import 'package:lakoe_pos/features/payments/data/arguments/success_confirmation_payment_argument.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

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
            paidAmount: data.paidAmount,
            change: data.change,
            paymentMethod: "CASH",
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
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartDetailCubit, CartDetailState>(
      listener: (context, state) {
        if (state is CartDetailActionSuccess) {
          context.read<CartCubit>().reset();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/cashier/explore-products",
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
              ),
            );
          });
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
