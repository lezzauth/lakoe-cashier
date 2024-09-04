import 'package:category_repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class ProductCategoryFilter extends StatefulWidget {
  final int? value;
  final ValueChanged<int?>? onChanged;
  final List<CategoryModel> categories;
  final bool loading;
  final String errorText;

  const ProductCategoryFilter({
    super.key,
    this.onChanged,
    required this.value,
    required this.categories,
    this.loading = false,
    this.errorText = "",
  });

  @override
  State<ProductCategoryFilter> createState() => _ProductCategoryFilterState();
}

class _ProductCategoryFilterState extends State<ProductCategoryFilter> {
  @override
  Widget build(BuildContext context) {
    bool isAllCategorySelected = widget.value == null;

    if (widget.loading) {
      return const Center(
        child: SizedBox(
          height: 16,
          width: 16,
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (widget.errorText.isNotEmpty) {
      return Center(
        child: TextBodyS(widget.errorText),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Wrap(
        spacing: 8.0,
        children: [
          ChoiceChip(
            label: !isAllCategorySelected
                ? const TextBodyS("Semua")
                : const TextHeading5(
                    "Semua",
                    color: TColors.primary,
                  ),
            selected: isAllCategorySelected,
            onSelected: (value) {
              if (widget.onChanged == null) return;
              widget.onChanged!(null);
            },
          ),
          ...widget.categories.map(
            (category) {
              bool selected = widget.value == category.id;
              return ChoiceChip(
                label: !selected
                    ? TextBodyS(category.name)
                    : TextHeading5(
                        category.name,
                        color: TColors.primary,
                      ),
                selected: selected,
                onSelected: (value) {
                  if (widget.onChanged == null) return;
                  widget.onChanged!(category.id);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
