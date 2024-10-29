import 'package:category_repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_master/category_master_cubit.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_master/category_master_state.dart';
import 'package:point_of_sales_cashier/features/categories/presentation/widgets/forms/category_form.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class CategoryNewScreen extends StatefulWidget {
  const CategoryNewScreen({super.key});

  @override
  State<CategoryNewScreen> createState() => _CategoryNewScreenState();
}

class _CategoryNewScreenState extends State<CategoryNewScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _onSubmit() async {
    FocusScope.of(context).unfocus();

    bool isFormValidated = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValidated) {
      return;
    }
    dynamic value = _formKey.currentState?.value;

    context.read<CategoryMasterCubit>().create(
          CreateCategoryDto(
            name: value["name"],
            icon: value["icon"],
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CategoryMasterCubit, CategoryMasterState>(
          listener: (context, state) {
            if (state is CategoryMasterActionSuccess) {
              Navigator.pop(context, state.category.id);
            }
          },
        )
      ],
      child: BlocBuilder<CategoryMasterCubit, CategoryMasterState>(
          builder: (context, state) {
        return Scaffold(
          appBar: CustomAppbar(
            title: "Buat Kategori",
            actions: [
              TextButton(
                onPressed:
                    state is CategoryMasterActionInProgress ? null : _onSubmit,
                child: state is CategoryMasterActionInProgress
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(),
                      )
                    : const TextActionL(
                        "SIMPAN",
                        color: TColors.primary,
                      ),
              )
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CategoryForm(
              formKey: _formKey,
            ),
          ),
        );
      }),
    );
  }
}
