import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';

class AIBanner extends StatefulWidget {
  const AIBanner({super.key});

  @override
  State<AIBanner> createState() => _AIBannerState();
}

class _AIBannerState extends State<AIBanner> {
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
              colorFilter:
                  ColorFilter.mode(TColors.successMedium, BlendMode.srcIn),
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
                        "AI Chatbot",
                        style: GoogleFonts.inter(
                          fontSize: TSizes.fontSizeHeading4,
                          fontWeight: FontWeight.w600,
                          color: TColors.neutralDarkDark,
                        ),
                      ),
                      Text(
                        "Gunakan AI untuk pelayanan toko online-mu secara otomatis.",
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
                      onPressed: () {
                        Navigator.pushNamed(context, "/ai_chatbot");
                      },
                      style: const ButtonStyle(
                        padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                        ),
                        side: WidgetStatePropertyAll(
                          BorderSide(
                            width: 1.5,
                            color: TColors.successMedium,
                          ),
                        ),
                        overlayColor:
                            WidgetStatePropertyAll(TColors.successLight),
                      ),
                      child: TextActionL(
                        "Aktifkan",
                        color: TColors.successMedium,
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
