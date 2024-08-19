import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class ProductCategoryFilter extends StatelessWidget {
  const ProductCategoryFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Wrap(
          spacing: 8.0,
          children: [
            ChoiceChip(
              label: TextHeading5(
                "Semua",
                color: TColors.primary,
              ),
              selected: true,
              onSelected: (value) {},
            ),
            ChoiceChip(
              label: TextBodyS("Minuman"),
              selected: false,
              onSelected: (value) {},
            ),
            ChoiceChip(
              label: TextBodyS("Makanan"),
              selected: false,
              onSelected: (value) {},
            ),
            ChoiceChip(
              label: TextBodyS("Cemilan"),
              selected: false,
              onSelected: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
