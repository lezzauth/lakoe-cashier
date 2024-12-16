import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/common/widgets/form/counter.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/product/action/product_note_action.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/product/base_product_item.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
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

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(
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
            image: image != null
                ? Image.network(
                    image,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  )
                : SvgPicture.asset(
                    TImages.productAvatar,
                    height: 60,
                    width: 60,
                  ),
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
          ),
        ),
      ),
    );
  }
}
