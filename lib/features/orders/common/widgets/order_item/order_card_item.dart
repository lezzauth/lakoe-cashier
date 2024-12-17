import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/common/widgets/bottomsheets/info_bagde_status.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_xs.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/orders/common/widgets/ui/tags/order_status/tag_thin_order_status.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class OrderCardItem extends StatelessWidget {
  const OrderCardItem({
    super.key,
    required this.order,
    this.onTap,
    this.isWithQR = false,
    this.isCashier = false,
  });

  final dynamic order;
  final Function()? onTap;
  final bool isWithQR;
  final bool isCashier;

  @override
  Widget build(BuildContext context) {
    int no = order.no ?? 0;
    String price = order.price;
    String type = order.type;
    String status = order.status;
    String customerName = order.customer?.name ?? "Tamu";
    String tableName = order.table?.no ?? "Bebas";
    bool isPaid = order.paymentStatus == "PAID";
    bool isCancel = order.status == "CANCELLED";

    return InkWell(
      onTap: onTap,
      splashColor: TColors.highlightLightest,
      highlightColor: TColors.highlightLightest,
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: TColors.neutralLightLightest,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
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
                          (type == "DINEIN") ? TIcons.servingDome : TIcons.bag,
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                                SizedBox(height: 2),
                                Row(
                                  children: [
                                    TextBodyXS(
                                      "Order #$no",
                                      color: TColors.neutralDarkLight,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      child: TextBodyS(
                                        "/",
                                        color: TColors.neutralDarkLightest,
                                      ),
                                    ),
                                    TextBodyXS(
                                      tableName,
                                      color: TColors.neutralDarkLight,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2),
                                          child: TextBodyS(
                                            "/",
                                            color: TColors.neutralDarkLightest,
                                          ),
                                        ),
                                        TextBodyXS(
                                          (type == "DINEIN")
                                              ? "Dine In"
                                              : "Takeaway",
                                          color: TColors.neutralDarkLight,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 12),
                          Container(
                            child: (isCashier)
                                ? SizedBox.shrink()
                                : InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return CustomBottomsheet(
                                            child: InfoBagdeStatus(
                                                isStrong: false),
                                          );
                                        },
                                      );
                                    },
                                    child: TagThinOrderStatus(tag: status),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 12),
                Divider(color: TColors.neutralLightMedium, height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextBodyS(
                      "Total",
                      color: TColors.neutralDarkLight,
                    ),
                    TextHeading4(
                      TFormatter.formatToRupiah(double.parse(price)),
                      color: TColors.neutralDarkDarkest,
                      fontWeight: FontWeight.w900,
                    ),
                  ],
                )
              ],
            ),
          ),
          if (isPaid)
            Positioned(
              right: 40,
              bottom: 20,
              child: SvgPicture.asset(
                TImages.stampPaid,
                width: 60,
                height: 60,
              ),
            ),
          if (isCancel)
            Positioned(
              right: 40,
              bottom: 20,
              child: SvgPicture.asset(
                TImages.stampCancel,
                width: 60,
                height: 60,
              ),
            ),
        ],
      ),
    );
  }
}
