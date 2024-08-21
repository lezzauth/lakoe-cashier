import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_item.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/wrapper/keep_alive_wrapper.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/forms/product_information_form.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({super.key});

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  String activeContent = "product-info";

  onContentChanged(String value) {
    setState(() {
      activeContent = value;
    });
  }

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
              child: TextActionL(
                "SIMPAN",
                color: TColors.primary,
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: TColors.neutralLightLight,
                    border:
                        Border.all(color: TColors.neutralLightMedium, width: 1),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Container(
                    child: TabBar(
                      tabs: [
                        TabItem(
                          title: "Info Produk",
                          counter: 2,
                        ),
                        TabItem(title: "Info Stok"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(children: [
          const SingleChildScrollView(
            padding: EdgeInsets.only(top: 16.0),
            child: ProductInformationForm(),
          ),
          Expanded(
            child: Container(
              color: TColors.error,
            ),
          )
        ]),
      ),
    );
  }
}
