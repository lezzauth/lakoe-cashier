import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
// import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
// import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class BaseProductCard extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final int price;
  final bool selected;
  final Widget? counter;
  final bool isNotAvailable;
  final int? stock;
  final bool isCashierView;

  BaseProductCard({
    super.key,
    this.name = "",
    this.imageUrl,
    this.price = 0,
    this.selected = false,
    this.counter,
    this.isNotAvailable = false,
    this.stock,
    this.isCashierView = false,
  });

  // final GlobalKey<TooltipState> _tooltipKey = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color:
            selected ? TColors.highlightLightest : TColors.neutralLightLightest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color:
              selected ? TColors.highlightMedium : TColors.neutralLightMedium,
        ),
      ),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: TColors.neutralLightMedium,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                height: 165.5,
                width: 208,
                child: Image.network(
                  imageUrl ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return SvgPicture.asset(
                      TImages.productAvatar,
                      height: 165.5,
                      width: 208,
                      fit: BoxFit.cover,
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SvgPicture.asset(
                      TImages.productAvatar,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              // if (isNotAvailable || stock == 0)
              if (isNotAvailable)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                  ),
                ),
              if (isNotAvailable)
                Positioned.fill(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: TColors.neutralLightMedium,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: TextHeading5(
                        "Tidak Tersedia",
                        color: TColors.neutralDarkDark,
                      ),
                    ),
                  ),
                ),
              // if (stock == 0)
              //   Positioned.fill(
              //     child: Center(
              //       child: Container(
              //         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              //         decoration: BoxDecoration(
              //           color: TColors.errorLight,
              //           borderRadius: BorderRadius.circular(4),
              //         ),
              //         child: TextHeading5(
              //           "Stok Habis",
              //           color: TColors.errorDark,
              //         ),
              //       ),
              //     ),
              //   ),
              if (counter != null) counter!,
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextHeading3(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextBodyM(
                          TFormatter.formatToRupiah(price),
                          color: TColors.neutralDarkLight,
                          fontWeight: FontWeight.w500,
                        ),
                        // if (stock != null && isCashierView)
                        //   if (stock! >= 1 && stock! <= 10)
                        //     Tooltip(
                        //       key: _tooltipKey,
                        //       message: "Stok Menipis",
                        //       decoration: BoxDecoration(
                        //         color: TColors.neutralDarkDark,
                        //         borderRadius: BorderRadius.circular(8),
                        //       ),
                        //       textStyle: GoogleFonts.inter(
                        //         color: TColors.neutralLightLightest,
                        //         fontSize: TSizes.fontSizeBodyS,
                        //       ),
                        //       padding: EdgeInsets.symmetric(
                        //         horizontal: 12,
                        //         vertical: 0,
                        //       ),
                        //       verticalOffset: 12,
                        //       child: UiIcons(
                        //         TIcons.warning,
                        //         size: 16,
                        //         color: TColors.warningDark,
                        //         onTap: () {
                        //           _tooltipKey.currentState
                        //               ?.ensureTooltipVisible();
                        //         },
                        //       ),
                        //     )
                      ],
                    ),
                  ),
                  // if (!isCashierView)
                  //   Container(
                  //     margin: EdgeInsets.only(top: 4),
                  //     child: Row(
                  //       children: [
                  //         UiIcons(
                  //           TIcons.box,
                  //           size: 12,
                  //           color: TColors.neutralDarkLight,
                  //         ),
                  //         SizedBox(width: 4),
                  //         RichText(
                  //           text: TextSpan(
                  //             style: GoogleFonts.inter(
                  //               fontSize: TSizes.fontSizeBodyS,
                  //             ),
                  //             children: [
                  //               TextSpan(
                  //                 text: "Stok ",
                  //                 style: TextStyle(
                  //                     color: TColors.neutralDarkLight),
                  //               ),
                  //               TextSpan(
                  //                 text: stock != null ? stock.toString() : "-",
                  //                 style: TextStyle(
                  //                   color: TColors.neutralDarkDark,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //           maxLines: 1,
                  //           overflow: TextOverflow.ellipsis,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
