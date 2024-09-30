import 'package:category_repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/popup_confirmation.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_master/category_master_cubit.dart';
import 'package:point_of_sales_cashier/features/categories/application/cubit/category_master/category_master_state.dart';
import 'package:point_of_sales_cashier/features/categories/presentation/widgets/forms/category_form.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class CategoryEditScreen extends StatefulWidget {
  const CategoryEditScreen({super.key});

  @override
  State<CategoryEditScreen> createState() => _CategoryEditScreenState();
}

class _CategoryEditScreenState extends State<CategoryEditScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _onSubmit(int categoryId) async {
    FocusScope.of(context).unfocus();

    bool isFormValidated = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValidated) {
      return;
    }
    dynamic value = _formKey.currentState?.value;

    context.read<CategoryMasterCubit>().update(
          categoryId,
          UpdateCategoryDto(
            name: value["name"],
            icon: value["icon"],
          ),
        );
    Navigator.pop(context);
  }

  Future<void> _onDelete(int categoryId) async {
    //
  }

  void _showPopupConfirmation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      useSafeArea: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return PopupConfirmation(
          title: "Hapus kategori?",
          message:
              "Semua produk dalam kategori ini akan masuk kategori Umum. Kamu yakin ingin menghapus meja ini?",
          labelButtonPrimary: "Tidak",
          labelButtonSecondary: "Ya, Hapus",
          discardAction: () {
            Navigator.pop(context);
          },
          saveAction: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;

    return BlocBuilder<CategoryMasterCubit, CategoryMasterState>(
        builder: (context, state) {
      return Scaffold(
        appBar: CustomAppbar(
          title: "Ubah Kategori",
          actions: [
            TextButton(
              onPressed: state is CategoryMasterActionInProgress
                  ? null
                  : () {
                      _onSubmit(arguments.id);
                    },
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
            child: Column(
              children: [
                CategoryForm(
                  formKey: _formKey,
                  initialValue: {
                    "name": arguments.name,
                    "icon": arguments.icon,
                  },
                ),
                // if ((arguments.count?.products ?? 0) == 0)
                TextButton(
                  onPressed: () => _showPopupConfirmation(context),
                  child: const TextActionL(
                    "Hapus Kategori",
                    color: TColors.error,
                  ),
                )
              ],
            )),
      );
    });
  }
}
