import 'package:category_repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_cubit.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_state.dart';
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
    AuthState authState = context.read<AuthCubit>().state;
    if (authState is! AuthReady) return;

    bool isFormValidated = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValidated) {
      return;
    }
    dynamic value = _formKey.currentState?.value;

    context.read<CategoryCubit>().create(
          CreateCategoryDto(
            outletId: authState.outletId,
            name: value["name"],
            icon: value["icon"],
          ),
        );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
      return Scaffold(
        appBar: CustomAppbar(
          title: "Buat Kategori",
          actions: [
            TextButton(
              onPressed: state is CategoryActionInProgress ? null : _onSubmit,
              child: state is CategoryActionInProgress
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
    });
  }
}