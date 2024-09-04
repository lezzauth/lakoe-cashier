import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_container.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_item.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_master/product_master_cubit.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_master/product_master_state.dart';
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

    bool isProductInformationValid =
        _productInformationFormKey.currentState?.saveAndValidate() ?? false;
    bool isStockInformationValid =
        _stockInformationFormKey.currentState?.saveAndValidate() ?? false;

    if (!isProductInformationValid) {
      const snackBar = SnackBar(
        content: Text('Product information validate error'),
        showCloseIcon: true,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          snackBar,
        );

      return;
    }

    if (!isStockInformationValid) {
      const snackBar = SnackBar(
        content: Text('Stock information validate error'),
        showCloseIcon: true,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          snackBar,
        );
    }

    dynamic productInformationValue =
        _productInformationFormKey.currentState?.value;
    dynamic stockInformationValue =
        _stockInformationFormKey.currentState?.value;

    ImagePickerValue images =
        productInformationValue["images"] as ImagePickerValue;

    context.read<ProductMasterCubit>().create(
      [images.file!],
      CreateProductDto(
        name: productInformationValue["name"],
        price: productInformationValue["price"],
        description: productInformationValue["description"],
        modal: productInformationValue["modal"],
        categoryId: productInformationValue["categoryId"],
        unit: productInformationValue["unit"],
        outletId: authState.outletId,
        sku: stockInformationValue["sku"],
        stock: int.parse(stockInformationValue["stock"] ?? "0"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductMasterCubit, ProductMasterState>(
      listener: (context, state) {
        if (state is ProductActionSuccess) {
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<ProductMasterCubit, ProductMasterState>(
        builder: (context, state) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: CustomAppbar(
                title: "Produk Baru",
                actions: [
                  TextButton(
                    onPressed:
                        state is ProductActionInProgress ? null : onSubmit,
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
