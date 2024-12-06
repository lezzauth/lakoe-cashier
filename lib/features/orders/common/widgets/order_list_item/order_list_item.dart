import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/orders/common/widgets/ui/tags/order_status/tag_thin_order_status.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class OrderListItem extends StatelessWidget {
  final dynamic order;
  final Function()? onTap;
  final bool isWithQR;
  final bool isCashier;

  const OrderListItem({
    super.key,
    required this.order,
    this.onTap,
    this.isWithQR = false,
    this.isCashier = false,
  });

  @override
  Widget build(BuildContext context) {
    int no = order.no ?? 0;
    String price = order.price;
    String type = order.type;
    String status = order.status;
    String customerName = order.customer?.name ?? "Umum";
    String tableName = order.table?.no ?? "Bebas";
    bool isPaid = order.paymentStatus == "PAID";
    bool isCancel = order.status == "CANCELLED";

    return InkWell(
      onTap: onTap,
      splashColor: TColors.highlightLightest,
      highlightColor: TColors.highlightLightest,
      child: GestureDetector(
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: TColors.neutralLightMedium,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (type == "DINEIN")
                                  ? TColors.successLight
                                  : TColors.warningLight,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                (type == "DINEIN")
                                    ? TIcons.servingDome
                                    : TIcons.bag,
                                height: 16,
                                width: 16,
                                colorFilter: ColorFilter.mode(
                                  (type == "DINEIN")
                                      ? TColors.successDark
                                      : TColors.warningDark,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextHeading4(
                                  customerName,
                                  color: TColors.neutralDarkDarkest,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                SizedBox(height: 6),
                                Row(
                                  children: [
                                    Wrap(
                                      direction: Axis.horizontal,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      spacing: 4,
                                      children: [
                                        const UiIcons(
                                          TIcons.hashtagBold,
                                          size: 16,
                                          color: TColors.neutralDarkLight,
                                        ),
                                        TextBodyS(
                                          "Order #$no",
                                          color: TColors.neutralDarkLight,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: TextBodyS(
                                        "-",
                                        color: TColors.neutralDarkLightest,
                                      ),
                                    ),
                                    Wrap(
                                      direction: Axis.horizontal,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      spacing: 4,
                                      children: [
                                        const UiIcons(
                                          TIcons.tableRestaurant,
                                          size: 16,
                                          color: TColors.neutralDarkLight,
                                        ),
                                        if (isWithQR)
                                          const UiIcons(
                                            TIcons.qr,
                                            size: 16,
                                            color: TColors.neutralDarkLight,
                                          ),
                                        TextBodyS(
                                          tableName,
                                          color: TColors.neutralDarkLight,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        (isCashier)
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextBodyS(
                                    "Total",
                                    color: TColors.neutralDarkLight,
                                  ),
                                  SizedBox(height: 4),
                                  TextBodyM(
                                    TFormatter.formatToRupiah(
                                        double.parse(price)),
                                    fontWeight: FontWeight.w800,
                                    color: TColors.neutralDarkDarkest,
                                  ),
                                ],
                              )
                            : TextBodyM(
                                TFormatter.formatToRupiah(double.parse(price)),
                                fontWeight: FontWeight.w800,
                                color: TColors.neutralDarkDarkest,
                              ),
                        Container(
                          margin: const EdgeInsets.only(top: 6),
                          child: (isCashier)
                              ? SizedBox.shrink()
                              : TagThinOrderStatus(tag: status),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (isPaid && isCashier)
                Positioned(
                  right: 40,
                  bottom: 20,
                  child: SvgPicture.asset(
                    TImages.stampPaid,
                    width: 40,
                    height: 40,
                  ),
                ),
              if (isCancel && isCashier)
                Positioned(
                  right: 40,
                  bottom: 20,
                  child: SvgPicture.asset(
                    TImages.stampCancel,
                    width: 40,
                    height: 40,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
