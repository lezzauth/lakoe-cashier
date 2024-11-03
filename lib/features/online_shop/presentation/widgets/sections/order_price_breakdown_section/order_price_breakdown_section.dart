import 'package:flutter/material.dart';
import 'package:online_shop_repository/online_shop_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class OrderPriceBreakdownSection extends StatefulWidget {
  const OrderPriceBreakdownSection({super.key, required this.order});

  final OrderDetailModel order;

  @override
  State<OrderPriceBreakdownSection> createState() =>
      _OrderPriceBreakdownSectionState();
}

class _OrderPriceBreakdownSectionState
    extends State<OrderPriceBreakdownSection> {
  OrderDetailCharge _getDeliverCharge() {
    return widget.order.charges
        .firstWhere((charge) => charge.name == "delivery charges");
  }

  List<OrderDetailCharge> _getCharges() {
    return widget.order.charges
        .where((charge) => charge.name != "delivery charges")
        .toList();
  }

  double _getRawPrice() {
    return widget.order.items.fold(
      0,
      (previousValue, element) {
        return previousValue +
            (element.quantity * double.parse(element.product.price));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: UiIcons(
              TIcons.wallet2,
              color: TColors.primary,
              size: 24,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: TextHeading4("Rincian Pembayaran"),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextBodyM(
                            "Total Harga (${widget.order.items.length} barang)"),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextActionL(
                          TFormatter.formatToRupiah(_getRawPrice()),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextBodyM("Total Ongkos Kirim"),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextActionL(
                          TFormatter.formatToRupiah(
                            double.parse(
                              _getDeliverCharge().amount,
                            ),
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
                ..._getCharges().map(
                  (charge) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextBodyM(
                                "${charge.name}${charge.isPercentage ? " (${charge.percentageValue!.toStringAsFixed(0)}%)" : ""}"),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextActionL(
                              TFormatter.formatToRupiah(
                                double.parse(
                                  charge.amount,
                                ),
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: TColors.neutralLightDark,
                  margin: const EdgeInsets.only(bottom: 12),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextHeading3("Total Penjualan"),
                      ),
                      TextHeading3(TFormatter.formatToRupiah(
                          double.parse(widget.order.price))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
