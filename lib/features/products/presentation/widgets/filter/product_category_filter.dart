import 'package:category_repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/responsive/responsive_layout.dart';
import 'package:point_of_sales_cashier/common/widgets/shimmer/chips_shimmer.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ChipsShimmer(),
        ),
      );
    }

    if (widget.errorText.isNotEmpty) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ChipsShimmer(),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Wrap(
        spacing: 8.0,
        children: [
          FilterChip(
            label: "Semua",
            selected: isAllCategorySelected,
            onSelected: (value) {
              if (widget.onChanged == null) return;
              widget.onChanged!(null);
            },
          ),
          ...widget.categories.map(
            (category) {
              bool selected = widget.value == category.id;
              return FilterChip(
                label: category.name,
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

class FilterChip extends StatelessWidget {
  const FilterChip({
    super.key,
    this.selected = false,
    this.onSelected,
    required this.label,
  });

  final bool selected;
  final Function(bool)? onSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return SizedBox(
      height: 52,
      child: ChoiceChip(
        label: ResponsiveLayout(
          mobile: !selected
              ? TextBodyM(label)
              : TextHeading4(
                  label,
                  color: TColors.primary,
                ),
          tablet: !selected
              ? TextBodyL(label)
              : TextHeading3(
                  label,
                  color: TColors.primary,
                ),
        ),
        selected: selected,
        onSelected: onSelected,
        padding: isMobile
            ? null
            : const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      ),
    );
  }
}
