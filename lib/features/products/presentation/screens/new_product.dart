import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_container.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_item.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/wrapper/keep_alive_wrapper.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/forms/product_information_form.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/forms/stock_information_form.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({super.key});

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  final _productInformationFormKey = GlobalKey<FormBuilderState>();
  final _stockInformationFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppbar(
          title: "Produk Baru",
          actions: [
            TextButton(
              onPressed: () {},
              child: const TextActionL(
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
  }
}
