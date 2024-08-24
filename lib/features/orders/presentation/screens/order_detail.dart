import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_xs.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/cards/card_order.dart';

import 'package:point_of_sales_cashier/features/orders/common/widgets/summary/order_summary.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/ui/tags/ghost_order_type_tag.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/ui/tags/solid_order_type_tag.dart';
import 'package:point_of_sales_cashier/features/orders/data/arguments/order_detail_argument.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/widgets/ui/tags/ghost_order_online_status_tag.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/widgets/ui/tags/solid_order_online_status_tag.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/select_payment_method.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/action/product_note_action.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/base_product_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as OrderDetailArgument;
    bool isPaid = false;

    onCompleteOrder() {
      print('onCompleteOrder');
      showModalBottomSheet(
        context: context,
        showDragHandle: true,
        isScrollControlled: true,
        builder: (context) {
          return const SelectPaymentMethod();
        },
      );
    }

    return Scaffold(
      appBar: CustomAppbar(
        title: "Order #362${arguments.id}",
        actions: [
          IconButton(
            onPressed: () {},
            icon: const UiIcons(
              TIcons.bill,
              color: TColors.primary,
              height: 20,
              width: 20,
            ),
          )
        ],
      ),
      body: Scrollbar(
        child: RefreshIndicator(
          onRefresh: () async {
            return await Future.delayed(Duration(seconds: 1));
          },
          backgroundColor: TColors.neutralLightLightest,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(bottom: 13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
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
                                  switch (arguments.type) {
                                    "online" => SolidOrderOnlineStatusTag(
                                        status: arguments.orderOnlineStatus,
                                      ),
                                    _ => SolidOrderTypeTag(
                                        tag: arguments.orderType)
                                  },
                                  Expanded(
                                    child: const TextBodyM(
                                      "Rabu, 28 Agu 2014 - 20:18",
                                      color: TColors.neutralDarkLight,
                                      textAlign: TextAlign.end,
                                      maxLines: 2,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            switch (arguments.type) {
                              "online" => const ContactWhatsapp(),
                              _ => const CustomerAndTableInformation(),
                            },
                            Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
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
                      itemCount: 3,
                      itemBuilder: (context, index) {
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
                              "https://picsum.photos/200/300?random=$index",
                              height: 44,
                              width: 44,
                              fit: BoxFit.cover,
                            ),
                            name: "Makanan ${index + 1}",
                            price: 20000,
                            noteAction: ProductNoteAction(
                              notes: index == 0
                                  ? "Ini adl isi dari sebuah catatan Ini adl isi dari sebuah catatan"
                                  : "",
                              readOnly: true,
                            ),
                          ),
                        );
                      },
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: OrderSummary(
                          total: 20000,
                          tax: 0,
                          isPaid: isPaid,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (arguments.type == "outlet")
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: OrderOutletAction(
                    isPaid: isPaid,
                    type: arguments.orderType,
                    onAddMoreItem: () {},
                    onComplete: onCompleteOrder,
                    onPrint: () {},
                    onShare: () {},
                  ),
                ),
              if (arguments.type == "online")
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: OrderOnlineAction(
                    status: arguments.orderOnlineStatus,
                    onComplete: onCompleteOrder,
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
        const SizedBox(width: 6),
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
        const SizedBox(width: 6),
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
        const SizedBox(width: 6),
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
        const SizedBox(width: 6),
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
                child: Center(
                  child: UiIcons(
                    TIcons.profile,
                    height: 20,
                    width: 20,
                    color: TColors.primary,
                  ),
                ),
              ),
              Column(
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
                style: ButtonStyle(
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
                child: Wrap(
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
  });

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
              subTitle: "Umum",
              icon: UiIcons(
                TIcons.profile,
                height: 20,
                width: 20,
                color: TColors.primary,
              ),
            ),
          ),
          SizedBox(width: 12.0),
          Flexible(
            flex: 1,
            child: CardOrder(
              title: "Meja",
              subTitle: "T-10 (Luar)",
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
    );
  }
}
