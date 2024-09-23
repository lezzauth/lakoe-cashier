import 'package:cashier_repository/cashier_repository.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_xs.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_detail/order_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/orders/application/cubit/order_detail/order_detail_state.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/cards/card_order.dart';

import 'package:point_of_sales_cashier/features/orders/common/widgets/summary/order_summary.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/ui/tags/solid_order_type_tag.dart';
import 'package:point_of_sales_cashier/features/orders/data/arguments/order_detail_argument.dart';
import 'package:point_of_sales_cashier/features/orders/data/models.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/widgets/ui/tags/solid_order_online_status_tag.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_state.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/select_payment_method.dart';
import 'package:point_of_sales_cashier/features/payments/data/models/payment_method_return_model.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/action/product_note_action.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/base_product_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const OrderDetail();
  }
}

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  Future<void> _onRefresh() async {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        final arguments =
            ModalRoute.of(context)!.settings.arguments as OrderDetailArgument;
        await context.read<OrderDetailCubit>().findOne(arguments.id);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _onRefresh();
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
        ));
  }

  Future<void> _onCompleteOrder({
    required double amount,
    required OrderModel order,
  }) async {
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
  }

  double _getOrderTotal(OrderModel order) {
    return order.items.fold(0, (sum, item) {
      return sum + double.parse(item.price);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<OrderDetailCubit, OrderDetailState>(
          listener: (context, state) {
            if (state is OrderDetailActionSuccess) {
              Navigator.popAndPushNamed(
                context,
                "/payments/success_confirmation",
                arguments: state.response,
              );
            }
          },
        ),
      ],
      child: BlocBuilder<OrderDetailCubit, OrderDetailState>(
          builder: (context, state) => switch (state) {
                OrderDetailLoadSuccess(:final order) => Scaffold(
                    appBar: CustomAppbar(
                      title: "Order #${order.no}",
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
                                slivers: [
                                  SliverToBoxAdapter(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 8, 12, 8),
                                            margin: const EdgeInsets.only(
                                                bottom: 13),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                width: 1,
                                                color:
                                                    TColors.neutralLightMedium,
                                              ),
                                              color: TColors.neutralLightLight,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                switch (order.source) {
                                                  "QRONLINE" =>
                                                    SolidOrderOnlineStatusTag(
                                                      status: order.type,
                                                    ),
                                                  _ => SolidOrderTypeTag(
                                                      tag: order.type,
                                                    )
                                                },
                                                Expanded(
                                                  child: TextHeading4(
                                                    TFormatter.orderDate(
                                                      order.createdAt,
                                                      withDay: true,
                                                    ),
                                                    color: TColors
                                                        .neutralDarkLight,
                                                    textAlign: TextAlign.end,
                                                    maxLines: 2,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          switch (order.source) {
                                            "QRONLINE" =>
                                              const ContactWhatsapp(),
                                            _ => CustomerAndTableInformation(
                                                customer: order.customer,
                                                table: order.table,
                                              ),
                                          },
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: const TextHeading3(
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
                                          order.items.elementAt(index);
                                      OrderItemProduct product =
                                          orderItem.product;
                                      String? image =
                                          product.images.elementAtOrNull(0);
                                      image ??=
                                          "https://placehold.co/88/png?text=[...]";

                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12.0,
                                          horizontal: 16.0,
                                        ),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 1,
                                              color: TColors.neutralLightMedium,
                                            ),
                                          ),
                                        ),
                                        child: BaseProductItem(
                                          image: Image.network(
                                            image,
                                            height: 44,
                                            width: 44,
                                            fit: BoxFit.cover,
                                          ),
                                          name: product.name,
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
                                      padding: const EdgeInsets.all(16.0),
                                      child: OrderSummary(
                                        orderTotal: _getOrderTotal(order),
                                        total: double.parse(order.price),
                                        isPaid: order.paymentStatus == "PAID",
                                        charges: order.charges
                                            .map((e) => OrderSummaryChargeModel(
                                                  type: e.type,
                                                  amount: e.amount,
                                                  name: e.name,
                                                ))
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (order.source == "CASHIER")
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                child: OrderOutletAction(
                                  isPaid: order.paymentStatus == "PAID",
                                  type: order.type,
                                  onAddMoreItem: () {},
                                  onComplete: () {
                                    _onCompleteOrder(
                                      amount: double.parse(order.price),
                                      order: order,
                                    );
                                  },
                                  onPrint: () {},
                                  onShare: () {},
                                ),
                              ),
                            if (order.source == "QRONLINE")
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
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
                  ),
                OrderDetailLoadFailure(:final error) => Scaffold(
                    body: Center(
                      child: TextBodyS(
                        error,
                        color: TColors.error,
                      ),
                    ),
                  ),
                _ => const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              }),
    );
  }
}

class OrderOutletAction extends StatelessWidget {
  final String type;
  final bool isPaid;

  final Function() onAddMoreItem;
  final Function() onComplete;
  final Function() onShare;
  final Function() onPrint;

  const OrderOutletAction({
    super.key,
    required this.type,
    required this.isPaid,
    required this.onAddMoreItem,
    required this.onComplete,
    required this.onShare,
    required this.onPrint,
  });

  @override
  Widget build(BuildContext context) {
    if (isPaid) {
      return OrderOutlinePaidAction(
        onPrint: onPrint,
        onShare: onShare,
      );
    }

    return OrderOutlineOnProgressAction(
      onAddMoreItem: onAddMoreItem,
      onComplete: onComplete,
    );
  }
}

class OrderOutlineOnProgressAction extends StatelessWidget {
  final Function() onAddMoreItem;
  final Function() onComplete;

  const OrderOutlineOnProgressAction({
    super.key,
    required this.onAddMoreItem,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 48,
          child: OutlinedButton(
            onPressed: onAddMoreItem,
            child: const TextActionL(
              "Tambah Item",
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

class OrderOutlinePaidAction extends StatelessWidget {
  final Function() onShare;
  final Function() onPrint;

  const OrderOutlinePaidAction({
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
                    height: 20,
                    width: 20,
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
                      height: 16,
                      width: 16,
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

class CustomerAndTableInformation extends StatelessWidget {
  const CustomerAndTableInformation({
    super.key,
    this.customer,
    this.table,
  });

  final OrderCustomer? customer;
  final OrderTable? table;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: CardOrder(
              title: "Pelanggan",
              subTitle: customer == null ? "Umum" : customer!.name,
              icon: const UiIcons(
                TIcons.profile,
                height: 20,
                width: 20,
                color: TColors.primary,
              ),
            ),
          ),
          const SizedBox(width: 12.0),
          Flexible(
            flex: 1,
            child: CardOrder(
              title: "Meja",
              subTitle: table == null ? "Bebas" : table!.no,
              icon: const UiIcons(
                TIcons.tableRestaurant,
                height: 20,
                width: 20,
                color: TColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
