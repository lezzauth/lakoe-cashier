import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/forms/table_information_form.dart';

class TableNewInformationTab extends StatelessWidget {
  const TableNewInformationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 16),
      child: TableInformationForm(),
    );
  }
}
