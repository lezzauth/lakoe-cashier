import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/ui/tags/ghost_order_type_tag.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class OrderListItem extends StatelessWidget {
  final bool isWithQR;
  final String type;
  final bool isPaid;
  final Function()? onTap;
  final String customerName;
  final String tableName;
  final int no;
  final String price;

  const OrderListItem({
    super.key,
    this.isWithQR = false,
    this.type = "DINEIN",
    this.isPaid = false,
    this.onTap,
    this.customerName = "",
    this.tableName = "",
    this.no = 0,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            TImages.contactAvatar,
                            height: 44,
                            width: 44,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                constraints:
                                    const BoxConstraints(maxWidth: 150),
                                child: RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.inter(
                                      fontSize: TSizes.fontSizeHeading4,
                                      color: TColors.neutralDarkDarkest,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    text: customerName,
                                    children: [
                                      TextSpan(
                                        style: GoogleFonts.inter(
                                          fontSize: TSizes.fontSizeBodyS,
                                          color: TColors.neutralDarkLight,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        text: " Order #$no",
                                      ),
                                    ],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Wrap(
                                direction: Axis.horizontal,
                                spacing: 4,
                                children: [
                                  const UiIcons(
                                    TIcons.tableRestaurant,
                                    height: 16,
                                    width: 16,
                                    color: TColors.neutralDarkLight,
                                  ),
                                  if (isWithQR)
                                    const UiIcons(
                                      TIcons.qr,
                                      height: 16,
                                      width: 16,
                                      color: TColors.neutralDarkLight,
                                    ),
                                  TextHeading5(
                                    tableName.isEmpty ? "-" : tableName,
                                    color: TColors.neutralDarkLight,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: GhostOrderTypeTag(
                            tag: type,
                          ),
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
                                    double.parse(price),
                                  ),
                                  style: GoogleFonts.inter(
                                    fontSize: TSizes.fontSizeBodyM,
                                    fontWeight: FontWeight.w800,
                                    color: TColors.neutralDarkDarkest,
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (isPaid)
                Positioned(
                  right: 100,
                  bottom: 10,
                  child: Image.asset(
                    TImages.stamp,
                    width: 80,
                    height: 53.35,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
