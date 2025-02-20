import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/ui/tags/ghost_order_online_status_tag.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class OrderOnlineListItem extends StatelessWidget {
  final String status;
  final Function()? onTap;

  const OrderOnlineListItem({
    super.key,
    this.status = "new",
    this.onTap,
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
                                child: RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.inter(
                                      fontSize: TSizes.fontSizeHeading4,
                                      color: TColors.neutralDarkDarkest,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    text: "Tamu",
                                    children: [
                                      TextSpan(
                                        style: GoogleFonts.inter(
                                          fontSize: TSizes.fontSizeBodyS,
                                          color: TColors.neutralDarkLight,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        text: " Order #2938",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Wrap(
                                direction: Axis.horizontal,
                                spacing: 4,
                                children: [
                                  const UiIcons(
                                    TIcons.whatsapp,
                                    size: 16,
                                    color: TColors.neutralDarkLight,
                                  ),
                                  TextHeading5(
                                    "0821-0987-6543",
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
                          child: GhostOrderOnlineStatusTag(
                            status: status,
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
                                    10000,
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
            ],
          ),
        ),
      ),
    );
  }
}
