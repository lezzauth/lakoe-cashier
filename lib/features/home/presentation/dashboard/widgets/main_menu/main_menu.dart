import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class MainMenu extends StatelessWidget {
  final String? cashierName;
  final Function()? onTap;

  const MainMenu({
    super.key,
    this.cashierName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCashierOpened = cashierName != null;

    onCashierOpened() {}

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          decoration: BoxDecoration(
            gradient: isCashierOpened
                ? TColors.mainMenuCashierOpenedGradient
                : TColors.mainMenuCashierClosedGradient,
            borderRadius: BorderRadius.circular(
              16.0,
            ),
          ),
          // height: 90.0,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: SvgPicture.asset(
                  TImages.mainMenuWaves,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 12,
                          ),
                          child: const UiIcons(
                            TIcons.cashier,
                          ),
                        ),
                        Text(
                          "Buka Kasir",
                          style: GoogleFonts.inter(
                            fontSize: TSizes.fontSizeBodyL,
                            fontWeight: FontWeight.w700,
                            color: TColors.neutralLightLightest,
                          ),
                        )
                      ],
                    ),
                    if (isCashierOpened)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              "Kasir: ",
                              style: GoogleFonts.inter(
                                fontSize: TSizes.fontSizeBodyM,
                                fontWeight: FontWeight.w400,
                                color: TColors.neutralLightLight,
                              ),
                            ),
                          ),
                          Text(
                            cashierName ?? "",
                            style: GoogleFonts.inter(
                              fontSize: TSizes.fontSizeBodyL,
                              fontWeight: FontWeight.w700,
                              color: TColors.neutralLightLightest,
                            ),
                          )
                        ],
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
