import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/customers/presentation/widgets/forms/new_customer_form.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class NewCustomerScreen extends StatefulWidget {
  const NewCustomerScreen({super.key});

  @override
  State<NewCustomerScreen> createState() => _NewCustomerScreenState();
}

class _NewCustomerScreenState extends State<NewCustomerScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Pelanggan Baru",
        actions: [
          TextButton(
            onPressed: () {},
            child: const TextActionL(
              "SIMPAN",
              color: TColors.primary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: NewCustomerForm(
          formKey: _formKey,
        ),
      ),
    );
  }
}
