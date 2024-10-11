import 'package:flutter/material.dart';
import 'package:online_shop_repository/online_shop_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/online_shop/data/arguments/online_shop_order_track_argument.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/helpers/helper.dart';

class OrderShippingDetailSection extends StatefulWidget {
  const OrderShippingDetailSection({super.key, required this.order});

  final OrderDetailModel order;

  @override
  State<OrderShippingDetailSection> createState() =>
      _OrderShippingDetailSectionState();
}

class _OrderShippingDetailSectionState
    extends State<OrderShippingDetailSection> {
  Future<void> _onGoToTracking() async {
    await Navigator.pushNamed(context, "/online_shop/orders/detail/track",
        arguments: OnlineShopOrderTrackArgument(order: widget.order));
  }

  Future<void> _onCopy({required String title, required String text}) async {
    await THelper.copyToClipboard(text);

    if (!mounted) return;
    SnackBar snackBar = SnackBar(
      content: Text(title),
      showCloseIcon: true,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        snackBar,
      );
  }

  @override
  Widget build(BuildContext context) {
    final isShowShipmentDetail =
        !["WAITING_FOR_PAYMENT", "CONFIRMED"].contains(widget.order.status);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: UiIcons(
              TIcons.truckFast,
              color: TColors.primary,
              height: 24,
              width: 24,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Expanded(child: TextHeading4("Detail Pengiriman")),
                      if (isShowShipmentDetail)
                        GestureDetector(
                          onTap: _onGoToTracking,
                          child: TextActionM(
                            "Lacak Pengiriman",
                            color: TColors.primary,
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
                        child: TextBodyM("Kurir"),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextActionL(
                          isShowShipmentDetail
                              ? "${widget.order.shipment.courierCompany!} - ${widget.order.shipment.courierType!}"
                              : "-",
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
                        child: Row(
                          children: [
                            TextBodyM("No. Resi"),
                            Container(
                              margin: const EdgeInsets.only(left: 4),
                              child: UiIcons(
                                onTap: () {
                                  _onCopy(
                                    title: "Nomor resi berhasil disalin",
                                    text: widget.order.shipment.waybillId ?? "",
                                  );
                                },
                                TIcons.copy,
                                height: 18,
                                width: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child:
                            TextActionL(widget.order.shipment.waybillId ?? "-"),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            TextBodyM("Alamat"),
                            Container(
                              margin: const EdgeInsets.only(left: 4),
                              child: UiIcons(
                                TIcons.copy,
                                height: 18,
                                width: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextBodyM(
                              "Jl. Elang IV, Sawah Lama, Kec. Ciputat, Kota Tangerang Selatan, Banten 15413",
                            ),
                            TextBodyM(
                              widget.order.shipment.destinationContactPhone,
                              color: TColors.neutralDarkLight,
                            ),
                            TextBodyM(
                              widget.order.shipment.destinationContactName,
                              color: TColors.neutralDarkLight,
                            ),
                          ],
                        ),
                      ),
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
