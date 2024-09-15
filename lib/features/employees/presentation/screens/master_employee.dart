import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/features/employees/common/widgets/employee_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class MasterEmployeScreen extends StatefulWidget {
  const MasterEmployeScreen({super.key});

  @override
  State<MasterEmployeScreen> createState() => _MasterEmployeScreenState();
}

class _MasterEmployeScreenState extends State<MasterEmployeScreen> {
  List<_EmployeeModel> listItemEmployee = [
    _EmployeeModel(name: "Aryo Dwi Nugroho", role: "Owner"),
    _EmployeeModel(name: "Rahmat Efendi", role: "Manajer"),
    _EmployeeModel(name: "Ardiana Lukman", role: "Kasir"),
    _EmployeeModel(name: "Rizki Yulian", role: "Pelayan/Waiter"),
    _EmployeeModel(name: "Andri Maulana", role: "Koki/Barista"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        search: SearchField(
          hintText: "Cari karyawan disini...",
          debounceTime: 500,
          onChanged: (value) {},
        ),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: listItemEmployee.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                width: 1,
                color: TColors.neutralLightMedium,
              ))),
              child: EmployeeItem(
                name: listItemEmployee[index].name,
                role: listItemEmployee[index].role,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/employee/detail",
                  );
                },
              ),
            );
          },
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
            Navigator.pushNamed(context, "/employee/new");
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

class _EmployeeModel {
  final String name;
  final String role;

  _EmployeeModel({
    required this.name,
    required this.role,
  });
}
