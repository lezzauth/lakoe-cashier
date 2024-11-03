import 'package:category_repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/shimmer/chips_shimmer.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/category/product_master_category_cubit.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/category/product_master_category_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class CategoryField extends StatefulWidget {
  const CategoryField({
    super.key,
    this.initialValue,
  });

  final int? initialValue;

  @override
  State<CategoryField> createState() => _CategoryFieldState();
}

class _CategoryFieldState extends State<CategoryField> {
  late List<CategoryModel> categories = [];
  int? _selectedCategoryId;

  Future<void> _onCreateCategory(BuildContext context) async {
    if (!context.mounted) return;

    int? newCategoryId = await Navigator.pushNamed(
      context,
      "/categories/new",
    ) as int?;
    if (newCategoryId == null) return;

    if (!context.mounted) return;
    context.read<ProductMasterCategoryCubit>().findAll();

    setState(() {
      _selectedCategoryId = newCategoryId;
    });
    final field = FormBuilder.of(context)?.fields['categoryId'];
    field?.didChange(newCategoryId);
  }

  void _onInit() {
    context.read<ProductMasterCategoryCubit>().init();
  }

  int? _getInitialValue(List<CategoryModel> categories) {
    if (widget.initialValue != null) return widget.initialValue;
    if (categories.isEmpty) return null;

    return categories[0].id;
  }

  @override
  void initState() {
    super.initState();
    _onInit();
    _selectedCategoryId = _getInitialValue(categories);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductMasterCategoryCubit, ProductMasterCategoryState>(
      listener: (context, state) {
        if (state is ProductMasterCategoryLoadSuccess) {
          categories = state.categories;

          if (_selectedCategoryId == null && categories.isNotEmpty) {
            setState(() {
              _selectedCategoryId = categories[0].id;
            });
          }
        }
      },
      builder: (context, state) => switch (state) {
        ProductMasterCategoryLoadSuccess(:final categories) =>
          FormBuilderField<int>(
            name: "categoryId",
            // initialValue: _getInitialValue(categories),
            initialValue: _selectedCategoryId,
            builder: (field) {
              return Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                runSpacing: -4,
                children: [
                  ...categories.map((category) {
                    bool selected = field.value == category.id;
                    return InputChip(
                      label: !selected
                          ? TextBodyM(category.name)
                          : TextHeading4(
                              category.name,
                              color: TColors.primary,
                            ),
                      selected: selected,
                      onPressed: () {
                        field.didChange(category.id);
                      },
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      height: 33,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          _onCreateCategory(context);
                        },
                        label: const TextActionM(
                          "Buat Baru",
                          color: TColors.primary,
                        ),
                        style: const ButtonStyle(
                          padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 14.0),
                          ),
                          side: WidgetStatePropertyAll(
                            BorderSide(
                              width: 1,
                              color: TColors.primary,
                            ),
                          ),
                        ),
                        icon: const UiIcons(
                          TIcons.add,
                          size: 12,
                          color: TColors.primary,
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ProductMasterCategoryLoadFailure() => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: null,
            clipBehavior: Clip.none,
            child: ChipsShimmer(),
          ),
        _ => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: null,
            clipBehavior: Clip.none,
            child: ChipsShimmer(),
          ),
      },
    );
  }
}
