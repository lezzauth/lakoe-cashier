import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/customers/presentation/screens/customer_detail.dart';
import 'package:point_of_sales_cashier/features/orders/data/arguments/order_detail_argument.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class OrderItem extends StatelessWidget {
  final DetailCustomerOrder order;

  const OrderItem({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    bool isPaid = order.status == "COMPLETED";
    bool isCancel = order.status == "CANCELLED";
    String tag = isPaid
        ? order.transactions.first.paymentMethod
        : (isCancel ? "CANCEL" : "NONE");

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
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 14,
              ),
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
                        margin: const EdgeInsets.only(bottom: 8.0),
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
                        TFormatter.orderDate(order.createdAt),
                        color: TColors.neutralDarkLight,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: TagPaymentMethod(tag: tag),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Total: ",
                          style: GoogleFonts.inter(
                            fontSize: TSizes.fontSizeBodyS,
                            color: TColors.neutralDarkLight,
                          ),
                          children: [
                            TextSpan(
                              text: TFormatter.formatToRupiah(
                                double.parse(order.price),
                              ),
                              style: GoogleFonts.inter(
                                fontSize: TSizes.fontSizeBodyM,
                                fontWeight: FontWeight.w800,
                                color: TColors.neutralDarkDarkest,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isPaid)
              Positioned(
                right: 40,
                bottom: 20,
                child: SvgPicture.asset(
                  TImages.stampPaid,
                  width: 40,
                  height: 40,
                ),
              ),
            if (isCancel)
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
    );
  }
}
