import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({super.key});

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        isShowBackButton: true,
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
      ),
    );
  }
}
