import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_container.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_item.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/wrapper/keep_alive_wrapper.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_cubit.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_state.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/forms/field/image_picker_field.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/forms/product_information_form.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/forms/stock_information_form.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:product_repository/product_repository.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({super.key});

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  final _productInformationFormKey = GlobalKey<FormBuilderState>();
  final _stockInformationFormKey = GlobalKey<FormBuilderState>();

  onSubmit() {
    AuthState authState = context.read<AuthCubit>().state;
    if (authState is! AuthReady) return;

    if (_productInformationFormKey.currentState?.saveAndValidate() ?? false) {
      dynamic value = _productInformationFormKey.currentState?.value;

      ImagePickerValue images = value["images"] as ImagePickerValue;
      context.read<ProductCubit>().create(
        [images.file!],
        CreateProductDto(
          name: value["name"],
          price: value["price"],
          description: value["description"],
          modal: value["modal"],
          categoryId: value["categoryId"],
          unit: value["unit"],
          outletId: authState.outletId,
        ),
      );
    } else {
      const snackBar = SnackBar(
        content: Text('Product information validate error'),
        showCloseIcon: true,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          snackBar,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductCubit, ProductState>(
      listener: (context, state) {
        if (state is ProductActionSuccess) {
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: CustomAppbar(
                title: "Produk Baru",
                actions: [
                  TextButton(
                    onPressed: onSubmit,
                    child: state is ProductActionInProgress
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
                bottom: const TabContainer(
                  tabs: [
                    TabItem(
                      title: "Info Produk",
                    ),
                    TabItem(title: "Info Stok"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ProductInformationForm(
                      formKey: _productInformationFormKey,
                    ),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: StockInformationForm(
                      formKey: _stockInformationFormKey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
