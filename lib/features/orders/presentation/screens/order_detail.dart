import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/cards/card_order.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/summary/order_summary.dart';
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
    return Scaffold(
      appBar: CustomAppbar(
        title: "Order #3621",
        actions: [
          IconButton(
            onPressed: () {},
            icon: UiIcons(
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
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: TColors.success,
                                    ),
                                    child: TextHeading5(
                                      "Dine In",
                                      color: TColors.neutralLightLightest,
                                    ),
                                  ),
                                  TextBodyM(
                                    "Rabu, 28 Agu 2014 - 20:18",
                                    color: TColors.neutralDarkLight,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            ),
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Row(
                  children: [
                    SizedBox(
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: TextActionL(
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
                          onPressed: () {},
                          child: TextActionL(
                            "Bayar & Selesaikan",
                            color: TColors.neutralLightLightest,
                          ),
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
    );
  }
}
