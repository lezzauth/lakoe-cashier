import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/category/product_master_category_cubit.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/category/product_master_category_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class CategoryField extends StatelessWidget {
  const CategoryField({
    super.key,
    this.initialValue,
  });

  final int? initialValue;

  Future<void> _onCreateCategory(BuildContext context) async {
    if (!context.mounted) return;

    bool? newCategory = await Navigator.pushNamed(
      context,
      "/categories/new",
    ) as bool?;
    if (newCategory != true) return;

    AuthReady authState = context.read<AuthCubit>().state as AuthReady;
    context
        .read<ProductMasterCategoryCubit>()
        .findAll(outletId: authState.outletId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductMasterCategoryCubit, ProductMasterCategoryState>(
      builder: (context, state) => switch (state) {
        ProductMasterCategoryLoadSuccess(:final categories) =>
          FormBuilderField<int>(
            name: "categoryId",
            initialValue: initialValue ?? categories[0].id,
            builder: (field) {
              return Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                children: [
                  ...categories.map((category) {
                    bool selected = field.value == category.id;
                    return InputChip(
                      label: !selected
                          ? TextBodyS(category.name)
                          : TextHeading5(
                              category.name,
                              color: TColors.primary,
                            ),
                      selected: selected,
                      onPressed: () {
                        field.didChange(category.id);
                      },
                    );
                  }),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      height: 32,
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
                          height: 12,
                          width: 12,
                          color: TColors.primary,
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ProductMasterCategoryLoadFailure(:final error) => TextBodyS(
            error,
            color: TColors.error,
          ),
        _ => const SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
            ),
          ),
      },
    );
  }
}
