import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class BaseProductItem extends StatelessWidget {
  final String notes;
  final String name;
  final String? imageUrl;
  final int qty;
  final int price;
  final String description;
  final Widget? noteAction;
  final Widget? counter;
  final Widget? tag;
  final int? stock;

  const BaseProductItem({
    super.key,
    this.notes = "",
    this.name = "",
    this.imageUrl,
    this.qty = 0,
    this.price = 0,
    this.description = "",
    this.noteAction,
    this.counter,
    this.tag,
    this.stock,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Image.network(
            imageUrl ?? '',
            height: 60,
            width: 60,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return SvgPicture.asset(
                TImages.productAvatar,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return SvgPicture.asset(
                TImages.productAvatar,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHeading4(
                          name,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2.0),
                        TextBodyM(
                          "${(qty != 0) ? "$qty x " : ""}${TFormatter.formatToRupiah(price)}",
                          color: TColors.neutralDarkLight,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  if (counter != null) counter!,
                  if (tag != null) tag!,
                ],
              ),
              if (noteAction != null) noteAction!,
              Container(
                margin: EdgeInsets.only(top: 2.0),
                child: Column(
                  children: [
                    if (stock != null)
                      Row(
                        children: [
                          UiIcons(
                            TIcons.box,
                            size: 12,
                            color: TColors.neutralDarkLight,
                          ),
                          SizedBox(width: 4),
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.inter(
                                fontSize: TSizes.fontSizeBodyS,
                              ),
                              children: [
                                TextSpan(
                                  text: "Stok ",
                                  style: TextStyle(
                                      color: TColors.neutralDarkLight),
                                ),
                                TextSpan(
                                  text: stock != null ? stock.toString() : "-",
                                  style: TextStyle(
                                    color: TColors.neutralDarkDark,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    if (description.isNotEmpty && noteAction == null)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            child: UiIcons(
                              TIcons.document2,
                              size: 12,
                              color: TColors.neutralDarkLight,
                            ),
                          ),
                          SizedBox(width: 4),
                          Expanded(
                            child: TextBodyS(
                              description,
                              color: TColors.neutralDarkLight,
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
      ],
    );
  }
}
