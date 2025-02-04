import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/form/counter.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/product/action/product_note_action.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/product/base_product_item.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:product_repository/product_repository.dart';

class ExploreProductItem extends StatelessWidget {
  final int qty;
  final String notes;
  final Function()? onTap;
  final ProductModel product;
  final ValueChanged<int> onCounterChanged;
  final ValueChanged<String>? onNotesChanged;

  const ExploreProductItem({
    super.key,
    this.qty = 0,
    this.notes = "",
    this.onTap,
    required this.product,
    required this.onCounterChanged,
    this.onNotesChanged,
  });

  @override
  Widget build(BuildContext context) {
    bool selected = qty > 0;
    String? image = product.images.elementAtOrNull(0);

    Color colorBgTag = TColors.neutralLightMedium;
    Color colorTextTag = TColors.neutralDarkDark;
    String labelTag = "Tidak Tersedia";

    // if (product.availability == "AVAILABLE") {
    //   if (product.stock != null) {
    //     if (product.stock! >= 1 && product.stock! <= 10) {
    //       colorBgTag = TColors.warningLight;
    //       colorTextTag = TColors.warningDark;
    //       labelTag = "Stok Menipis";
    //     } else if (product.stock == 0) {
    //       colorBgTag = TColors.errorLight;
    //       colorTextTag = TColors.errorDark;
    //       labelTag = "Stok Habis";
    //     }
    //   }
    // } else {
    //   colorBgTag = TColors.neutralLightMedium;
    //   colorTextTag = TColors.neutralDarkDark;
    //   labelTag = "Tidak Tersedia";
    // }

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8.0,
          ),
          decoration: BoxDecoration(
            color: selected ? TColors.highlightLightest : null,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? TColors.highlightMedium : Colors.transparent,
              width: 1,
            ),
          ),
          margin: EdgeInsets.only(bottom: 8.0),
          child: BaseProductItem(
            name: product.name,
            price: int.parse(product.price),
            notes: notes,
            description: product.description ?? "",
            imageUrl: image,
            counter: selected
                ? Counter(
                    value: qty,
                    onChanged: onCounterChanged,
                  )
                : null,
            noteAction: selected
                ? ProductNoteAction(
                    notes: notes,
                    onChanged: onNotesChanged,
                  )
                : null,
            tag: (product.availability != "AVAILABLE")
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: colorBgTag,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextHeading5(labelTag, color: colorTextTag),
                  )
                : SizedBox.shrink(),
            // tag: (!selected)
            //     ? (product.stock! >= 11 && product.availability == "AVAILABLE")
            //         ? SizedBox.shrink()
            //         : Container(
            //             padding:
            //                 EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            //             decoration: BoxDecoration(
            //               color: colorBgTag,
            //               borderRadius: BorderRadius.circular(4),
            //             ),
            //             child: TextHeading5(labelTag, color: colorTextTag),
            //           )
            //     : SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
