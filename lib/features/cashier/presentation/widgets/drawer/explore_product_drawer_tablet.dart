import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_filter_cubit.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_filter_state.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_detail_state.dart';
import 'package:lakoe_pos/features/cart/application/cubit/cart_state.dart';
import 'package:lakoe_pos/features/cart/presentation/widgets/content/cart_content_tablet.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_state.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/select_payment_method_tablet.dart';
import 'package:lakoe_pos/features/payment_method/payments/data/arguments/success_confirmation_payment_argument.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class ExploreProductDrawerTablet extends StatefulWidget {
  const ExploreProductDrawerTablet({super.key});

  @override
  State<ExploreProductDrawerTablet> createState() =>
      _ExploreProductDrawerTabletState();
}

class _ExploreProductDrawerTabletState
    extends State<ExploreProductDrawerTablet> {
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
            paidFrom: "EDC",
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

  Future<void> _onRefresh() async {
    if (!mounted) return;
    CartState cartState = context.read<CartCubit>().state;
    CartDetailFilterState filterState =
        context.read<CartDetailFilterCubit>().state;

    await context.read<CartDetailCubit>().previewOrderPrice(
          type: filterState.type,
          carts: cartState.carts,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartDetailCubit, CartDetailState>(
      listener: (context, state) {
        if (state is CartDetailCompleteActionSuccess) {
          Navigator.popAndPushNamed(
            context,
            "/payments/success_confirmation",
            arguments: SuccessConfirmationPaymentArgument(
              payment: state.res,
              isCashier: true,
            ),
          );
        }
      },
      child: Drawer(
        width: 900,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Row(
          children: [
            Container(
              width: 450,
              decoration: const BoxDecoration(
                border: Border(
                  right:
                      BorderSide(width: 4, color: TColors.neutralLightMedium),
                ),
              ),
              child: const CartContentTablet(),
            ),
            SizedBox(
              width: 450,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: BlocBuilder<CartDetailCubit, CartDetailState>(
                      builder: (context, state) => switch (state) {
                        CartDetailLoadSuccess(:final previewOrderPrice) =>
                          SelectPaymentMethodTablet(
                            amount: double.parse(previewOrderPrice.total),
                            onPaymentCash: _onCashPaid,
                            onPaymentBankTransfer: _onBankTransferPaid,
                            onPaymentDebitCredit: _onDebitCreditPaid,
                            onPaymentQRCode: _onQRCodePaid,
                          ),
                        CartDetailLoadFailure() => EmptyList(
                            title: "Gagal memuat data, nih!",
                            subTitle:
                                "Ada sedikit gangguan. Coba coba lagi, ya",
                            action: TextButton(
                              onPressed: _onRefresh,
                              child: TextActionL(
                                "Coba Lagi",
                                color: TColors.primary,
                              ),
                            ),
                          ),
                        _ => Center(child: CircularProgressIndicator()),
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
