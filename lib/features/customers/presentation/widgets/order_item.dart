import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/bottomsheets/info_bagde_status.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/features/orders/common/widgets/ui/tags/order_status/tag_thin_order_status.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/features/orders/data/arguments/order_detail_argument.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class OrderItem extends StatelessWidget {
  final DetailCustomerOrder order;

  const OrderItem({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    String status = order.status;
    bool isPaid = order.paymentStatus == "PAID";

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/orders/detail",
          arguments: OrderDetailArgument(id: order.id),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: TColors.neutralLightMedium,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment:
                    isPaid ? CrossAxisAlignment.center : CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: RichText(
                          text: TextSpan(
                            style: GoogleFonts.inter(
                              fontSize: TSizes.fontSizeHeading4,
                              color: TColors.neutralDarkDarkest,
                              fontWeight: FontWeight.w600,
                            ),
                            text: "Order #${order.no}",
                            children: [
                              TextSpan(
                                style: GoogleFonts.inter(
                                  fontSize: TSizes.fontSizeBodyS,
                                  color: TColors.neutralDarkLight,
                                  fontWeight: FontWeight.w400,
                                ),
                                text: " - (${order.count.items} Item)",
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextBodyS(
                        TFormatter.dateTime(order.createdAt),
                        color: TColors.neutralDarkLight,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextBodyM(
                        TFormatter.formatToRupiah(double.parse(order.price)),
                        fontWeight: FontWeight.w800,
                        color: TColors.neutralDarkDarkest,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return CustomBottomsheet(
                                  child: InfoBagdeStatus(isStrong: false),
                                );
                              },
                            );
                          },
                          child: TagThinOrderStatus(tag: status),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
