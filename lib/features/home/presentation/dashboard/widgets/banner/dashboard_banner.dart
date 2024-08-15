import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class DashboardBanner extends StatelessWidget {
  const DashboardBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12.0,
        ),
        border: Border.all(
          color: TColors.neutralLightMedium,
          width: 1,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              TImages.bannerWaves,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              direction: Axis.horizontal,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Toko Online",
                        style: GoogleFonts.inter(
                          fontSize: TSizes.fontSizeHeading4,
                          fontWeight: FontWeight.w600,
                          color: TColors.neutralDarkDark,
                        ),
                      ),
                      Text(
                        "Bagikan toko online-mu dan jangkau lebih banyak pelanggan.",
                        style: GoogleFonts.inter(
                          fontSize: TSizes.fontSizeBodyS,
                          color: TColors.neutralDarkLight,
                        ),
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        textWidthBasis: TextWidthBasis.parent,
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    height: 36,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(
                            vertical: 9.5,
                            horizontal: 12,
                          ),
                        ),
                        side: WidgetStatePropertyAll(
                          BorderSide(
                            color: TColors.primary,
                            width: 1.5,
                          ),
                        ),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                12.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      child: Text(
                        "Bagikan",
                        style: GoogleFonts.inter(
                          color: TColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: TSizes.fontSizeActionL,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
