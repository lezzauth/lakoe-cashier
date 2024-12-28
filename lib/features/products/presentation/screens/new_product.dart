import 'package:app_data_provider/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/error_display/error_display.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/wrapper/error_wrapper.dart';
import 'package:lakoe_pos/features/products/application/cubit/product_master/product_master_cubit.dart';
import 'package:lakoe_pos/features/products/application/cubit/product_master/product_master_state.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/forms/field/image_picker_field.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/forms/product_information_form.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:product_repository/product_repository.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({super.key});

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen>
    with SingleTickerProviderStateMixin {
  final AppDataProvider _appDataProvider = AppDataProvider();
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

  onSubmit() {
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

    ImagePickerValue? images =
        productInformationValue["images"] as ImagePickerValue?;

    String? stock =
        stockInformationValue != null ? stockInformationValue["stock"] : null;
    String? sku =
        stockInformationValue != null ? stockInformationValue["sku"] : null;

    context.read<ProductMasterCubit>().create(
          images?.file != null ? [images!.file!] : [],
          CreateProductDto(
            name: productInformationValue["name"],
            price: productInformationValue["price"],
            description: productInformationValue["description"],
            modal: productInformationValue["modal"],
            categoryId: productInformationValue["categoryId"],
            unit: "Pcs",
            // unit: productInformationValue["unit"],
            sku: sku,
            stock: stock != null ? int.parse(stock) : null,
            availability:
                productInformationValue?["availability"] ?? "AVAILABLE",
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductMasterCubit, ProductMasterState>(
      listener: (context, state) async {
        if (state is ProductMasterActionSuccess) {
          Navigator.pop(context, true);
        } else if (state is ProductMasterReachesLimit) {
          final activePackage = await _appDataProvider.activePackage;

          String limit = "10";

          if (activePackage == "GROW") {
            limit = "25";
          }

          if (!context.mounted) return;

          showModalBottomSheet(
            context: context,
            enableDrag: false,
            isDismissible: false,
            builder: (context) {
              return PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) async {},
                child: CustomBottomsheet(
                  hasGrabber: false,
                  child: ErrorDisplay(
                    imageSrc: TImages.limitQuota,
                    title: "Yah! produk udah full, nih",
                    description:
                        "Dengan paket $activePackage kamu hanya bisa menambahkan $limit menu. Upgrade paket untuk lebih banyak produk, yuk!",
                    actionTitlePrimary: "Lihat Paket",
                    onActionPrimary: () {
                      Navigator.pop(context);
                      Navigator.pop(context, true);
                      if (activePackage != "LITE") {
                        Navigator.pushNamed(
                          context,
                          "/account/active_package",
                          arguments: {'packageName': activePackage},
                        );
                      } else {
                        Navigator.pushNamed(context, "/packages");
                      }
                    },
                    actionTitleSecondary: "Nanti Saja",
                    onActionSecondary: () {
                      Navigator.pop(context);
                      Navigator.pop(context, true);
                    },
                  ),
                ),
              );
            },
          );
        }
      },
      child: BlocBuilder<ProductMasterCubit, ProductMasterState>(
        builder: (context, state) {
          bool isFormValid = state is! ProductMasterActionInProgress;
          return ErrorWrapper(
            connectionIssue: state is ConnectionIssue,
            actionError: state is ProductMasterActionFailure,
            child: Scaffold(
              appBar: CustomAppbar(
                title: "Produk Baru",
                handleBackButton: () => Navigator.pop(context, true),
                actions: [
                  TextButton(
                    onPressed: isFormValid ? onSubmit : null,
                    child: state is ProductMasterActionInProgress
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
                //   tabs: const [
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
              //       ),
              //     ),
              //     SingleChildScrollView(
              //       padding: const EdgeInsets.only(top: 16.0),
              //       child: StockInformationForm(
              //         formKey: _stockInformationFormKey,
              //       ),
              //     ),
              //   ],
              // ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 16.0),
                child: ProductInformationForm(
                  formKey: _productInformationFormKey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
