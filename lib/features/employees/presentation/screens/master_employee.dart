import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/form/search_field.dart';
import 'package:lakoe_pos/common/widgets/shimmer/list_shimmer.dart';
import 'package:lakoe_pos/common/widgets/wrapper/error_wrapper.dart';
import 'package:lakoe_pos/features/employees/application/cubit/employee_master/employee_master_cubit.dart';
import 'package:lakoe_pos/features/employees/application/cubit/employee_master/employee_master_state.dart';
import 'package:lakoe_pos/features/employees/common/widgets/employee_item.dart';
import 'package:lakoe_pos/features/employees/data/arguments/employee_edit_argument.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class MasterEmployeScreen extends StatefulWidget {
  const MasterEmployeScreen({super.key});

  @override
  State<MasterEmployeScreen> createState() => _MasterEmployeScreenState();
}

class _MasterEmployeScreenState extends State<MasterEmployeScreen> {
  final TextEditingController _searchController = TextEditingController();
  Future<void> _onRefresh() async {
    await context.read<EmployeeMasterCubit>().findAll(FindAllEmployeeDto());
  }

  void _onInit() {
    context.read<EmployeeMasterCubit>().init();
  }

  Future<void> _onGoToCreateScreen() async {
    bool? newProduct =
        await Navigator.pushNamed(context, "/employee/new") as bool?;

    if (newProduct != true) return;
    _onRefresh();
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
          hintText: "Cari kasir disini...",
          controller: _searchController,
          debounceTime: 500,
          onChanged: (value) {},
        ),
      ),
      body: Scrollbar(
        child: RefreshIndicator(
          backgroundColor: TColors.neutralLightLightest,
          onRefresh: _onRefresh,
          child: BlocBuilder<EmployeeMasterCubit, EmployeeMasterState>(
            builder: (context, state) => ErrorWrapper(
              connectionIssue: state is ConnectionIssue,
              fetchError: state is EmployeeMasterLoadFailure,
              child: switch (state) {
                EmployeeMasterLoadSuccess(:final employees) => ListView.builder(
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      List<EmployeeModel> sortedEmployees = List.from(employees)
                        ..sort((a, b) {
                          if (a.role == "OWNER") return -1;
                          if (b.role == "OWNER") return 1;
                          return 0;
                        });
                      EmployeeModel employee = sortedEmployees[index];
                      // EmployeeModel employee = employees.elementAt(index);

                      return EmployeeItem(
                        name: employee.name,
                        role: employee.role,
                        onTap: () async {
                          if (employee.role == "OWNER") {
                            await Navigator.pushNamed(context, "/account/edit");
                          } else {
                            await Navigator.pushNamed(
                              context,
                              "/employee/edit",
                              arguments:
                                  EmployeeEditArgument(employee: employee),
                            );
                          }
                          _onRefresh();
                        },
                      );
                    },
                  ),
                _ => ListShimmer(
                    crossAlignment: "center",
                    circleAvatar: true,
                    sizeAvatar: 40.0,
                    heightTitle: 16.0,
                    heightSubtitle: 12.0,
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
          onPressed: _onGoToCreateScreen,
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
