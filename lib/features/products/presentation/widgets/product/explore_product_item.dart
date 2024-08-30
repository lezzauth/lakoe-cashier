import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/form/counter.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/action/product_note_action.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/product/base_product_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/device/device_uility.dart';
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
    // bool isNotesEmpty = notes.isEmpty;

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
          margin: const EdgeInsets.only(bottom: 8.0),
          child: BaseProductItem(
            image: Image.network(
              product.images[0],
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            name: product.name,
            price: int.parse(product.price),
            notes: notes,
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
