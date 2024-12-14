import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/popup_confirmation.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/features/products/application/cubit/product_master/form/product_form_cubit.dart';
import 'package:lakoe_pos/features/products/application/cubit/product_master/form/product_form_state.dart';
import 'package:lakoe_pos/features/products/application/cubit/product_master/product_master_cubit.dart';
import 'package:lakoe_pos/features/products/application/cubit/product_master/product_master_state.dart';
import 'package:lakoe_pos/features/products/application/cubit/product_state.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/forms/field/image_picker_field.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/forms/product_information_form.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:product_repository/product_repository.dart';

class ProductEditScreen extends StatelessWidget {
  const ProductEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductFormCubit(),
      child: const ProductEdit(),
    );
  }
}

class ProductEdit extends StatefulWidget {
  const ProductEdit({super.key});

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit>
    with SingleTickerProviderStateMixin {
  final _productInformationFormKey = GlobalKey<FormBuilderState>();
  final _stockInformationFormKey = GlobalKey<FormBuilderState>();

  TabController? _tabController;
  late ProductModel arguments;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    arguments = ModalRoute.of(context)!.settings.arguments as ProductModel;
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
      changeTabIndex(0);
      return;
    }

    if (!isStockInformationValid &&
        _stockInformationFormKey.currentState != null) {
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
            unit: "Pcs",
            sku: sku,
            stock: stock != null ? int.parse(stock) : null,
            availability: productInformationValue?["availability"],
          ),
        );
  }

  void _showPopupConfirmation() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      useSafeArea: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BlocBuilder<ProductMasterCubit, ProductMasterState>(
          builder: (context, state) {
            return PopupConfirmation(
              title: "Ada yang berubah...",
              message:
                  'Kamu telah melakukan perubahan data produk.\nMau disimpan atau diabaikan?',
              labelButtonPrimary: "Simpan",
              labelButtonSecondary: "Abaikan",
              isPrimaryActionLoading: state is ProductMasterActionInProgress,
              primaryAction: () async {
                await onSubmit(arguments.id);

                if (!context.mounted) return;
                Navigator.pop(context);
              },
              secondaryAction: () {
                Navigator.pop(context);
                Navigator.of(context, rootNavigator: true).pop();
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductMasterCubit, ProductMasterState>(
      listener: (context, state) {
        if (state is ProductMasterActionSuccess) {
          Navigator.pop(context, true);
        }
      },
      child: BlocBuilder<ProductMasterCubit, ProductMasterState>(
        builder: (context, state) {
          return BlocBuilder<ProductFormCubit, ProductFormState>(
              builder: (context, stateForm) {
            return PopScope(
              canPop: !stateForm.isFormDirty,
              onPopInvokedWithResult: (didPop, result) {
                if (didPop == true) return;
                _showPopupConfirmation();
              },
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: CustomAppbar(
                    title: "Ubah Produk",
                    handleBackButton: !stateForm.isFormDirty
                        ? null
                        : () => _showPopupConfirmation(),
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
                    // bottom: TabContainer(
                    //   controller: _tabController,
                    //   tabs: [
                    //     TabItem(
                    //       title: "Info Produk",
                    //     ),
                    //     TabItem(title: "Info Stok"),
                    //   ],
                    // ),
                  ),
                  // body: TabBarView(
                  //   controller: _tabController,
                  //   children: [
                  //     SingleChildScrollView(
                  //       padding: const EdgeInsets.only(top: 16.0),
                  //       child: ProductInformationForm(
                  //         formKey: _productInformationFormKey,
                  //         initialValue: {
                  //           "name": arguments.name,
                  //           "price": arguments.price,
                  //           "description": arguments.description,
                  //           "modal": arguments.modal,
                  //           "categoryId": arguments.categoryId,
                  //           "unit": arguments.unit,
                  //           "images": arguments.images.isEmpty
                  //               ? ImagePickerValue()
                  //               : ImagePickerValue(url: arguments.images[0]),
                  //         },
                  //       ),
                  //     ),
                  //     SingleChildScrollView(
                  //       padding: const EdgeInsets.only(top: 16.0),
                  //       child: StockInformationForm(
                  //         formKey: _stockInformationFormKey,
                  //         initialValue: {
                  //           "sku": arguments.sku,
                  //           "stock": arguments.stock?.toString(),
                  //           "availability": arguments.availability,
                  //         },
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  body: SingleChildScrollView(
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
                        "availability": arguments.availability,
                      },
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
