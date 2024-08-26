import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_container.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_item.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/forms/table_information_form.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/tabs/table_new_information_tab.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/tabs/table_new_qr_order_tab.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class TableNewScreen extends StatefulWidget {
  const TableNewScreen({super.key});

  @override
  State<TableNewScreen> createState() => _TableNewScreenState();
}

class _TableNewScreenState extends State<TableNewScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppbar(
          title: "Buat Meja Baru",
          actions: [
            TextButton(
              onPressed: () {},
              child: const TextActionL(
                "SIMPAN",
                color: TColors.primary,
              ),
            ),
          ],
          bottom: TabContainer(
            tabs: [
              TabItem(title: "Info Meja"),
              TabItem(
                title: "QR Order",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TableNewInformationTab(),
            TableNewQrOrderTab(),
          ],
        ),
      ),
    );
  }
}
