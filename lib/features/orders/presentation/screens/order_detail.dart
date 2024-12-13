import 'package:flutter_svg/svg.dart';

import 'package:cashier_repository/cashier_repository.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/general_information.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/cashier/order_cashier_cubit.dart';
import 'package:lakoe_pos/features/orders/common/widgets/ui/tags/order_status/tag_strong_order_status.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_cubit.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_state.dart';
import 'package:lakoe_pos/features/payment_method/common/widgets/payment_method_not_available.dart';
import 'package:logman/logman.dart';
import 'package:order_repository/order_repository.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/popup_confirmation.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_xs.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:lakoe_pos/features/bill/application/cubit/bill_master/bill_master_cubit.dart';
import 'package:lakoe_pos/features/bill/data/arguments/template_order_model.dart';
import 'package:lakoe_pos/features/orders/application/cubit/order_detail/order_detail_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/order_detail/order_detail_state.dart';

import 'package:lakoe_pos/features/orders/common/widgets/summary/order_summary.dart';
import 'package:lakoe_pos/features/orders/data/arguments/order_edit_argument.dart';
import 'package:lakoe_pos/features/orders/data/arguments/order_detail_argument.dart';
import 'package:lakoe_pos/features/orders/data/models.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/ui/customer_table_card.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/ui/tags/solid_order_online_status_tag.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_state.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/select_payment_method.dart';
import 'package:lakoe_pos/features/payment_method/payments/data/arguments/success_confirmation_payment_argument.dart';
import 'package:lakoe_pos/features/payment_method/payments/data/models/payment_method_return_model.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/product/action/product_note_action.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/product/base_product_item.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:lakoe_pos/utils/helpers/receipt_helpers.dart';
import 'package:lakoe_pos/utils/print/bill.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({
    super.key,
    required this.arguments,
  });

  final OrderDetailArgument arguments;

  @override
  Widget build(BuildContext context) {
    return OrderDetail(
      arguments: arguments,
    );
  }
}

class OrderDetail extends StatefulWidget {
  const OrderDetail({
    super.key,
    required this.arguments,
  });
  final OrderDetailArgument arguments;

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  bool _isCashier = false;

  ScrollController scrollController = ScrollController();
  Future<void> _onRefresh() async {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<OrderDetailCubit>().findOne(widget.arguments.id);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<OrderDetailCubit>().findOne(widget.arguments.id);

    setState(() {
      _isCashier = widget.arguments.isCashier;
    });

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

  Future<void> _onCashPaid({
    required PaymentCash data,
    required OrderModel order,
  }) async {
    await context.read<OrderDetailCubit>().completeOrder(
          order.id,
          CompleteCashOrderDto(
            paymentMethod: "CASH",
            paidAmount: data.paidAmount,
            change: data.change,
            customerId: order.customerId,
          ),
        );
  }

  Future<void> _onBankTransferPaid({
    required PaymentBankTransfer data,
    required OrderModel order,
  }) async {
    await context.read<OrderDetailCubit>().completeOrder(
          order.id,
          CompleteBankTransferOrderDto(
            data: CompleteBankTransferOrderData(
              paymentMethod: "BANK_TRANSFER",
              paidAmount: data.paidAmount,
              accountNumber: data.accountNumber,
            ),
            photo: data.photo,
          ),
        );
  }

  Future<void> _onDebitCreditPaid({
    required PaymentDebitCredit data,
    required OrderModel order,
  }) async {
    await context.read<OrderDetailCubit>().completeOrder(
        order.id,
        CompleteDebitCreditOrderDto(
          paymentMethod: "DEBIT",
          paidAmount: data.paidAmount,
          accountNumber: data.accountNumber,
          change: 0,
          paidFrom: "EDC",
          approvalCode: data.approvalCode,
        ));
  }

  Future<void> _onQRCodePaid({
    required PaymentQRCode data,
    required OrderModel order,
  }) async {
    await context.read<OrderDetailCubit>().completeOrder(
        order.id,
        CompleteQRCodeOrderDto(
          paymentMethod: "QR_CODE",
          paidAmount: data.paidAmount,
          change: data.change,
          paidFrom: data.paidFrom,
          approvalCode: data.approvalCode,
        ));
  }

  Future<void> _onCompleteOrder({
    required double amount,
    required OrderModel order,
  }) async {
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
      await showModalBottomSheet<PaymentMethodReturnModel>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (context) {
          return CustomBottomsheet(
            child: SelectPaymentMethod(
              amount: amount,
              onPaymentCash: (value) {
                _onCashPaid(data: value, order: order);
              },
              onPaymentBankTransfer: (value) {
                _onBankTransferPaid(data: value, order: order);
              },
              onPaymentDebitCredit: (value) {
                _onDebitCreditPaid(data: value, order: order);
              },
              onPaymentQRCode: (value) {
                _onQRCodePaid(data: value, order: order);
              },
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

  double _getOrderTotal(OrderModel order) {
    return order.items.fold(0, (sum, item) {
      return sum + double.parse(item.price);
    });
  }

  void _handlePrintReceipt(
    BuildContext context,
    OrderModel order,
    Function(
      BuildContext,
      OwnerProfileModel,
      OrderModel,
      String,
      ScrollController,
    ) action,
  ) {
    final billMasterState = context.read<BillMasterCubit>().state;
    String footNote = billMasterState.footNote;

    final authState = context.read<AuthCubit>().state;

    OwnerProfileModel profile;
    if (authState is AuthReady) {
      profile = authState.profile;
    } else {
      profile = TemplateOrderModel().ownerProfile;
      Logman.instance.error("AuthState is not ready, using default profile.");
    }

    action(context, profile, order, footNote, _scrollController);
  }

  void cancelOrder(OrderDetailState state, OrderModel order) async {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      useSafeArea: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return PopupConfirmation(
          title: "Batalkan pesanan no #${order.no}?",
          message:
              "Pesanan yang sudah dibatalkan tidak dapat diproses kembali. Yakin?",
          labelButtonPrimary: "Tidak",
          labelButtonSecondary: "Ya, Batalkan",
          isSecondaryActionLoading: state is OrderDetailActionInProgress,
          primaryAction: () async {
            Navigator.pop(context);
          },
          secondaryAction: () async {
            await context.read<OrderDetailCubit>().cancelOrder(order.id);

            if (!context.mounted) return;
            Navigator.pop(context);
            context.read<OrderCashierCubit>().init();
          },
        );
      },
    );
  }

  void showCashierAccessBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CustomBottomsheet(
          child: GeneralInformation(
            imageSrc: TImages.generalIllustration,
            title: "Masuk ke Halaman Kasir",
            description:
                "Untuk menyelesaikan pembayaran ini, kamu perlu masuk ke halaman kasir terlebih dahulu.",
            onAction: () {
              Navigator.pop(context);
            },
            actionTitle: "Oke, Paham",
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<OrderDetailCubit, OrderDetailState>(
            listener: (context, state) {
              if (state is OrderDetailActionSuccess) {
                if (state.completeResponse != null) {
                  Navigator.popAndPushNamed(
                    context,
                    "/payments/success_confirmation",
                    arguments: SuccessConfirmationPaymentArgument(
                      payment: state.completeResponse!,
                    ),
                  );
                } else {
                  Navigator.pop(context, true);
                }
              }
            },
          ),
        ],
        child: BlocBuilder<OrderDetailCubit, OrderDetailState>(
          builder: (context, state) {
            if (state is OrderDetailLoadSuccess) {
              final order = state.order;
              return Scaffold(
                appBar: CustomAppbar(
                  title: "Order ${order.no}",
                  isScrolled: _isScrolled,
                  actions: [
                    order.status == "OPEN"
                        ? TextButton(
                            onPressed: () {
                              if (_isCashier) {
                                cancelOrder(state, order);
                              } else {
                                showCashierAccessBottomSheet(context);
                              }
                            },
                            child: const TextActionL(
                              "Batalkan",
                              color: TColors.error,
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
                body: Scrollbar(
                  child: RefreshIndicator(
                    onRefresh: _onRefresh,
                    backgroundColor: TColors.neutralLightLightest,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: CustomScrollView(
                            controller: _scrollController,
                            slivers: [
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(8, 8, 12, 8),
                                        margin: EdgeInsets.only(bottom: 13),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            width: 1,
                                            color: TColors.neutralLightMedium,
                                          ),
                                          color: TColors.neutralLightLight,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (order.source == "QRONLINE")
                                              SolidOrderOnlineStatusTag(
                                                status: order.type,
                                              )
                                            else
                                              TagStrongOrderStatus(
                                                tag: order.status,
                                              ),
                                            Expanded(
                                              child: TextBodyM(
                                                TFormatter.dateTime(
                                                  order.createdAt,
                                                  withDay: true,
                                                ),
                                                color: TColors.neutralDarkLight,
                                                textAlign: TextAlign.end,
                                                maxLines: 2,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      if (order.source == "QRONLINE")
                                        ContactWhatsapp()
                                      else
                                        Container(
                                          margin: EdgeInsets.only(bottom: 16),
                                          child: CustomerAndTableInformation(
                                            order: order,
                                            customer: order.customer,
                                            table: order.table,
                                          ),
                                        ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 8.0),
                                        child: TextHeading3(
                                          "Pesanan",
                                          color: TColors.neutralDarkDarkest,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SliverList.builder(
                                itemCount: order.items.length,
                                itemBuilder: (context, index) {
                                  OrderItem orderItem =
                                      order.items.reversed.elementAt(index);
                                  OrderItemProduct product = orderItem.product;
                                  String? image =
                                      product.images.elementAtOrNull(0);

                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 12.0,
                                      horizontal: 16.0,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 1,
                                          color: TColors.neutralLightMedium,
                                        ),
                                      ),
                                    ),
                                    child: BaseProductItem(
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
                                      name: product.name,
                                      qty: orderItem.quantity,
                                      price: int.parse(product.price),
                                      noteAction: ProductNoteAction(
                                        notes: orderItem.notes ?? "",
                                        readOnly: true,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          bottom: 12.0,
                                          top: 4,
                                        ),
                                        child: TextHeading3(
                                          "Ringkasan tagihan",
                                          color: TColors.neutralDarkDarkest,
                                        ),
                                      ),
                                      OrderSummary(
                                        orderTotal: _getOrderTotal(order),
                                        total: double.parse(order.price),
                                        isPaid: order.status == "COMPLETED",
                                        isCancel: order.status == "CANCELLED",
                                        paymentInfo: order.transactions,
                                        charges: order.charges!
                                            .map((e) => OrderSummaryChargeModel(
                                                  type: e.type,
                                                  name: e.name,
                                                  amount: e.amount,
                                                  isPercentage: e.isPercentage,
                                                  percentageValue: e
                                                      .percentageValue
                                                      .toString(),
                                                ))
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (order.source == "CASHIER")
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: TColors.neutralLightMedium,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(16, 12, 16, 20),
                              child: OrderOutletAction(
                                  isPaid: order.status == "COMPLETED",
                                  isCancel: order.status == "CANCELLED",
                                  isClosed: order.status == "CLOSED",
                                  type: order.type,
                                  onEditOrder: () async {
                                    if (order.status == "OPEN" && _isCashier) {
                                      await Navigator.pushNamed(
                                        context,
                                        "/orders/add-item",
                                        arguments:
                                            OrderEditArgument(order: order),
                                      );

                                      _onRefresh();
                                    } else {
                                      showCashierAccessBottomSheet(context);
                                    }
                                  },
                                  onComplete: () {
                                    if (order.status == "CLOSED") {
                                      _onCompleteOrder(
                                        amount: double.parse(order.price),
                                        order: order,
                                      );
                                    } else if (order.status == "OPEN" &&
                                        _isCashier) {
                                      _onCompleteOrder(
                                        amount: double.parse(order.price),
                                        order: order,
                                      );
                                    } else {
                                      showCashierAccessBottomSheet(context);
                                    }
                                  },
                                  onPrint: () {
                                    _handlePrintReceipt(
                                      context,
                                      order,
                                      (context, profile, order, footNote,
                                          scrollController) {
                                        TBill.printReceipt(
                                          context,
                                          profile,
                                          order,
                                          footNote,
                                        );
                                      },
                                    );
                                  },
                                  onShare: () {
                                    _handlePrintReceipt(
                                      context,
                                      order,
                                      (context, profile, order, footNote,
                                          scrollController) {
                                        ReceiptHelper.showDetailBill(
                                          context,
                                          profile: profile,
                                          order: order,
                                          footNote: footNote,
                                          scrollController: scrollController,
                                        );
                                      },
                                    );
                                  }),
                            ),
                          ),
                        if (order.source == "QRONLINE")
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            child: OrderOnlineAction(
                              status: order.type,
                              onComplete: () {},
                              onDeclined: () {},
                              onPrint: () {},
                              onProcessed: () {},
                              onShare: () {},
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is OrderDetailLoadFailure) {
              return Scaffold(
                appBar: CustomAppbar(
                  title: "Detail Order",
                ),
                body: EmptyList(
                  title: "Gagal memuat data, nih!",
                  subTitle: "Ada sedikit gangguan. Coba coba lagi, ya",
                  action: TextButton(
                    onPressed: _onRefresh,
                    child: TextActionL(
                      "Coba Lagi",
                      color: TColors.primary,
                    ),
                  ),
                ),
              );
            } else {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ));
  }
}

class OrderOutletAction extends StatelessWidget {
  final String type;
  final bool isPaid;
  final bool isCancel;
  final bool isClosed;

  final Function() onEditOrder;
  final Function() onComplete;
  final Function() onShare;
  final Function() onPrint;

  const OrderOutletAction({
    super.key,
    required this.type,
    required this.isPaid,
    required this.isCancel,
    required this.isClosed,
    required this.onEditOrder,
    required this.onComplete,
    required this.onShare,
    required this.onPrint,
  });

  @override
  Widget build(BuildContext context) {
    if (isPaid) {
      return OrderOutletPaidAction(
        onPrint: onPrint,
        onShare: onShare,
      );
    }

    if (isCancel) {
      return SizedBox.shrink();
    }

    if (isClosed) {
      return OrderOutetOnClosedAction(
        onComplete: onComplete,
      );
    }

    return OrderOutetOnProgressAction(
      onEditOrder: onEditOrder,
      onComplete: onComplete,
    );
  }
}

class OrderOutetOnProgressAction extends StatelessWidget {
  final Function() onEditOrder;
  final Function() onComplete;

  const OrderOutetOnProgressAction({
    super.key,
    required this.onEditOrder,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 48,
          child: OutlinedButton(
            onPressed: onEditOrder,
            child: const TextActionL(
              "Ubah Pesanan",
              color: TColors.primary,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: onComplete,
              child: const TextActionL(
                "Bayar & Selesaikan",
                color: TColors.neutralLightLightest,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OrderOutetOnClosedAction extends StatelessWidget {
  final Function() onComplete;

  const OrderOutetOnClosedAction({
    super.key,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onComplete,
        child: const TextActionL(
          "Lunasi Pesanan",
          color: TColors.neutralLightLightest,
        ),
      ),
    );
  }
}

class OrderOutletPaidAction extends StatelessWidget {
  final Function() onShare;
  final Function() onPrint;

  const OrderOutletPaidAction({
    super.key,
    required this.onPrint,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48,
            child: OutlinedButton(
              onPressed: onShare,
              child: const TextActionL(
                "Bagikan",
                color: TColors.primary,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: onPrint,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiIcons(
                    TIcons.printer,
                    size: 20,
                    color: TColors.highlightLightest,
                  ),
                  SizedBox(width: 8),
                  const TextActionL(
                    "Cetak",
                    color: TColors.neutralLightLightest,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OrderOnlineAction extends StatelessWidget {
  final String status;

  final Function() onDeclined;
  final Function() onProcessed;
  final Function() onComplete;
  final Function() onShare;
  final Function() onPrint;

  const OrderOnlineAction({
    super.key,
    required this.status,
    required this.onComplete,
    required this.onProcessed,
    required this.onShare,
    required this.onPrint,
    required this.onDeclined,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case "new":
        return OrderOnlineNewAction(
          onDeclined: onDeclined,
          onProcessed: onProcessed,
        );
      case "on_progress":
        return OrderOnlineOnProgressAction(
          onComplete: onComplete,
        );
      case "done":
        return OrderOnlineDoneAction(
          onPrint: onPrint,
          onShare: onShare,
        );
      case "declined":
        return Container();
      default:
        return OrderOnlineNewAction(
          onDeclined: onDeclined,
          onProcessed: onProcessed,
        );
    }
  }
}

class OrderOnlineNewAction extends StatelessWidget {
  final Function() onDeclined;
  final Function() onProcessed;

  const OrderOnlineNewAction({
    super.key,
    required this.onProcessed,
    required this.onDeclined,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48,
            child: OutlinedButton(
              style: const ButtonStyle(
                side: WidgetStatePropertyAll(
                  BorderSide(
                    width: 1,
                    color: TColors.error,
                  ),
                ),
              ),
              onPressed: onDeclined,
              child: const TextActionL(
                "Tolak Pesanan",
                color: TColors.primary,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: onProcessed,
              child: const TextActionL(
                "Proses Pesanan",
                color: TColors.neutralLightLightest,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OrderOnlineOnProgressAction extends StatelessWidget {
  final Function() onComplete;

  const OrderOnlineOnProgressAction({
    super.key,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: onComplete,
              child: const TextActionL(
                "Selesaikan Pesanan",
                color: TColors.neutralLightLightest,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OrderOnlineDoneAction extends StatelessWidget {
  final Function() onShare;
  final Function() onPrint;

  const OrderOnlineDoneAction({
    super.key,
    required this.onPrint,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48,
            child: OutlinedButton(
              onPressed: onShare,
              child: const TextActionL(
                "Bagikan",
                color: TColors.primary,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: onPrint,
              child: const TextActionL(
                "Cetak",
                color: TColors.neutralLightLightest,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ContactWhatsapp extends StatelessWidget {
  const ContactWhatsapp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: TColors.neutralLightMedium, width: 1),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: TColors.highlightLightest,
                  borderRadius: BorderRadius.circular(32.0),
                ),
                margin: const EdgeInsets.only(right: 8.0),
                child: const Center(
                  child: UiIcons(
                    TIcons.profile,
                    size: 20,
                    color: TColors.primary,
                  ),
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextBodyXS("No. Whatsapp",
                      color: TColors.neutralDarkLightest),
                  TextHeading4("0821-0987-6543")
                ],
              ),
            ],
          ),
          SizedBox(
            height: 32,
            child: ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 12,
                    ),
                  ),
                  backgroundColor: WidgetStatePropertyAll(
                    Color(0xFF60D669),
                  ),
                ),
                child: const Wrap(
                  spacing: 8,
                  children: [
                    UiIcons(
                      TIcons.whatsapp,
                      color: TColors.neutralLightLightest,
                      size: 16,
                    ),
                    TextActionM(
                      "Hubungi",
                      color: TColors.neutralLightLightest,
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class _BillPriceItem {
  final String label;
  final String price;

  _BillPriceItem({
    required this.label,
    required this.price,
  });
}
