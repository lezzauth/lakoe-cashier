import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class OrderItem extends StatelessWidget {
  final int no;
  final String customerName;
  final String tableName;
  final Function()? onTap;

  const OrderItem({
    super.key,
    this.customerName = "",
    this.tableName = "",
    this.onTap,
    required this.no,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: TColors.neutralLightLightest,
          border: Border.all(color: TColors.neutralLightMedium, width: 1),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: RichText(
                text: TextSpan(
                    text: "Order: ",
                    style: GoogleFonts.inter(
                      fontSize: TSizes.fontSizeBodyS,
                      color: TColors.neutralDarkLight,
                    ),
                    children: [
                      TextSpan(
                        text: "#$no",
                        style: GoogleFonts.inter(
                          fontSize: TSizes.fontSizeHeading5,
                          color: TColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ]),
              ),
            ),
            Row(
              children: [
                Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 4.0,
                  children: [
                    const UiIcons(
                      TIcons.profile,
                      height: 12,
                      width: 12,
                      color: TColors.neutralDarkLightest,
                    ),
                    TextHeading5(customerName.isEmpty ? "Umum" : customerName),
                  ],
                ),
                const SizedBox(width: 12),
                Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 4.0,
                  children: [
                    const UiIcons(
                      TIcons.tableRestaurant,
                      height: 12,
                      width: 12,
                      color: TColors.neutralDarkLightest,
                    ),
                    TextHeading5(tableName.isEmpty ? "Bebas" : tableName),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
