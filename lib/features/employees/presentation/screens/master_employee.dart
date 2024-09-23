import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/wrapper/error_wrapper.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/employees/application/cubit/employee_master/employee_master_cubit.dart';
import 'package:point_of_sales_cashier/features/employees/application/cubit/employee_master/employee_master_state.dart';
import 'package:point_of_sales_cashier/features/employees/common/widgets/employee_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class MasterEmployeScreen extends StatefulWidget {
  const MasterEmployeScreen({super.key});

  @override
  State<MasterEmployeScreen> createState() => _MasterEmployeScreenState();
}

class _MasterEmployeScreenState extends State<MasterEmployeScreen> {
  void _onInit() {
    AuthReady authState = context.read<AuthCubit>().state as AuthReady;

    context.read<EmployeeMasterCubit>().init(authState.outletId);
  }

  @override
  void initState() {
    super.initState();
    _onInit();
  }

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
        child: RefreshIndicator(
          backgroundColor: TColors.neutralLightLightest,
          onRefresh: () async {
            return await Future.delayed(const Duration(milliseconds: 200));
          },
          child: BlocBuilder<EmployeeMasterCubit, EmployeeMasterState>(
            builder: (context, state) => ErrorWrapper(
              fetchError: state is EmployeeMasterLoadFailure,
              child: switch (state) {
                EmployeeMasterLoadSuccess(:final employees) => ListView.builder(
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      EmployeeModel employee = employees.elementAt(index);

                      return Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          width: 1,
                          color: TColors.neutralLightMedium,
                        ))),
                        child: EmployeeItem(
                          name: employee.name,
                          role: employee.role,
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
                _ => const Center(
                    child: CircularProgressIndicator(),
                  ),
              },
            ),
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
