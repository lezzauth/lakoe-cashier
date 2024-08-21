import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/features/customers/common/widgets/customer_contact/customer_contact_item.dart';
import 'package:point_of_sales_cashier/features/customers/data/models/customer_model.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class MasterCustomerScreen extends StatefulWidget {
  const MasterCustomerScreen({super.key});

  @override
  State<MasterCustomerScreen> createState() => _MasterCustomerScreenState();
}

class _MasterCustomerScreenState extends State<MasterCustomerScreen> {
  List<CustomerModel> customers = [
    const CustomerModel(name: "Umum", phoneNumber: "-"),
    const CustomerModel(name: "Rangga", phoneNumber: "0821-0987-6543"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        search: SearchField(
          hintText: "Cari pelanggan...",
        ),
        actions: [
          SizedBox(
            width: 16.0,
          )
        ],
      ),
      body: Scrollbar(
        child: RefreshIndicator(
          onRefresh: () async {
            return await Future.delayed(Duration(seconds: 1));
          },
          backgroundColor: TColors.neutralLightLightest,
          child: ListView.builder(
            itemCount: customers.length,
            itemBuilder: (context, index) {
              CustomerModel customer = customers.elementAt(index);

              return CustomerContactItem(
                name: customer.name,
                phoneNumber: customer.phoneNumber,
                onTap: () {
                  Navigator.pushNamed(context, "/customers/detail");
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 48,
        width: 48,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/customers/new");
          },
          elevation: 0,
          child: const Icon(
            Icons.add,
            size: 24,
          ),
        ),
      ),
    );
  }
}
