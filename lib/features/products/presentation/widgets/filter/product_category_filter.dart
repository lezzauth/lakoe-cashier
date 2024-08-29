import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_cubit.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class ProductCategoryFilter extends StatefulWidget {
  final int? value;
  final ValueChanged<int?>? onChanged;

  const ProductCategoryFilter({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  State<ProductCategoryFilter> createState() => _ProductCategoryFilterState();
}

class _ProductCategoryFilterState extends State<ProductCategoryFilter> {
  @override
  @override
  Widget build(BuildContext context) {
    bool isAllCategorySelected = widget.value == null;

    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return SizedBox(
          height: 48.0,
          child: switch (state) {
            CategoryLoadSuccess(:final categories) => SingleChildScrollView(
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
                    ...categories.map(
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
              ),
            CategoryLoadFailure(:final error) => Center(
                child: TextBodyS(error),
              ),
            _ => const Center(
                child: SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(),
                ),
              )
          },
        );
      },
    );
  }
}
