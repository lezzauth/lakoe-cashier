import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_container.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_item.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_master/product_master_cubit.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_master/product_master_state.dart';
import 'package:point_of_sales_cashier/features/products/application/cubit/product_state.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/forms/field/image_picker_field.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/forms/product_information_form.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/forms/stock_information_form.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';
import 'package:product_repository/product_repository.dart';

class ProductEditScreen extends StatefulWidget {
  const ProductEditScreen({super.key});

  @override
  State<ProductEditScreen> createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen>
    with SingleTickerProviderStateMixin {
  final _productInformationFormKey = GlobalKey<FormBuilderState>();
  final _stockInformationFormKey = GlobalKey<FormBuilderState>();

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void changeTabIndex(int index) {
    _tabController?.animateTo(index);
  }

  onSubmit(String productId) {
    FocusScope.of(context).unfocus();

    bool isProductInformationValid =
        _productInformationFormKey.currentState?.saveAndValidate() ?? false;
    bool isStockInformationValid =
        _stockInformationFormKey.currentState?.saveAndValidate() ?? false;

    if (!isProductInformationValid) {
      SnackBar snackBar = SnackBar(
        content: Text(ErrorTextStrings.formInvalid()),
        showCloseIcon: true,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          snackBar,
        );
      changeTabIndex(0);
      return;
    }

    if (!isStockInformationValid &&
        _stockInformationFormKey.currentState != null) {
      SnackBar snackBar = SnackBar(
        content: Text(ErrorTextStrings.formInvalid()),
        showCloseIcon: true,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          snackBar,
        );
      changeTabIndex(1);

      return;
    }

    dynamic productInformationValue =
        _productInformationFormKey.currentState?.value;
    dynamic stockInformationValue =
        _stockInformationFormKey.currentState?.value;

    ImagePickerValue images =
        productInformationValue["images"] as ImagePickerValue;

    String? stock =
        stockInformationValue != null ? stockInformationValue["stock"] : null;
    String? sku =
        stockInformationValue != null ? stockInformationValue["sku"] : null;

    context.read<ProductMasterCubit>().update(
          productId,
          images.file != null ? [images.file!] : [],
          UpdateProductDto(
            name: productInformationValue["name"],
            price: productInformationValue["price"],
            description: productInformationValue["description"],
            modal: productInformationValue["modal"],
            categoryId: productInformationValue["categoryId"],
            unit: productInformationValue["unit"],
            sku: sku,
            stock: stock != null ? int.parse(stock) : null,
            availability: stockInformationValue?["availability"],
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return BlocListener<ProductMasterCubit, ProductMasterState>(
      listener: (context, state) {
        if (state is ProductMasterActionSuccess) {
          Navigator.pop(context, true);
        }
      },
      child: BlocBuilder<ProductMasterCubit, ProductMasterState>(
        builder: (context, state) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: CustomAppbar(
                title: "Ubah Produk",
                actions: [
                  TextButton(
                    onPressed: () => onSubmit(arguments.id),
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
                bottom: TabContainer(
                  controller: _tabController,
                  tabs: [
                    TabItem(
                      title: "Info Produk",
                    ),
                    TabItem(title: "Info Stok"),
                  ],
                ),
              ),
              body: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ProductInformationForm(
                      formKey: _productInformationFormKey,
                      initialValue: {
                        "name": arguments.name,
                        "price": arguments.price,
                        "description": arguments.description,
                        "modal": arguments.modal,
                        "categoryId": arguments.categoryId,
                        "unit": arguments.unit,
                        "images": arguments.images.isEmpty
                            ? ImagePickerValue()
                            : ImagePickerValue(url: arguments.images[0]),
                      },
                    ),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: StockInformationForm(
                      formKey: _stockInformationFormKey,
                      initialValue: {
                        "sku": arguments.sku,
                        "stock": arguments.stock?.toString(),
                        "availability": arguments.availability,
                      },
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
