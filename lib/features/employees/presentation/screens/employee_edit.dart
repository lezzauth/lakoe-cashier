import 'dart:io';

import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/wrapper/error_wrapper.dart';
import 'package:point_of_sales_cashier/features/employees/application/cubit/employee_master/employee_master_cubit.dart';
import 'package:point_of_sales_cashier/features/employees/application/cubit/employee_master/employee_master_state.dart';
import 'package:point_of_sales_cashier/features/employees/data/arguments/employee_edit_argument.dart';
import 'package:point_of_sales_cashier/features/employees/presentation/widgets/forms/employee_form.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/forms/field/image_picker_field.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeEditScreen extends StatefulWidget {
  const EmployeeEditScreen({super.key, required this.arguments});

  final EmployeeEditArgument arguments;

  @override
  State<EmployeeEditScreen> createState() => _EmployeeEditScreenState();
}

class _EmployeeEditScreenState extends State<EmployeeEditScreen>
    with SingleTickerProviderStateMixin {
  final _employeeFormKey = GlobalKey<FormBuilderState>();

  TabController? _tabController;

  Future<void> _onSubmitted() async {
    bool isFormValid =
        _employeeFormKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValid) {
      return;
    }

    dynamic value = _employeeFormKey.currentState?.value;
    ImagePickerValue? profilePicture =
        value["profilePicture"] as ImagePickerValue?;

    String? email = value["email"];
    if (email == null || email.isEmpty) {
      email = null;
    }

    File? profilePictureFile = profilePicture?.file;

    await context.read<EmployeeMasterCubit>().update(
          widget.arguments.employee.id,
          profilePicture: profilePictureFile,
          dto: UpdateEmployeeDto(
            name: value["name"],
            // pin: value["pin"],
            phoneNumber: value["phoneNumber"],
            role: widget.arguments.employee.role,
            email: email,
          ),
        );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final employee = widget.arguments.employee;

    return BlocConsumer<EmployeeMasterCubit, EmployeeMasterState>(
      listener: (context, state) {
        if (state is EmployeeMasterActionSuccess) {
          Navigator.pop(context, true);
        }
      },
      builder: (context, state) {
        bool isLoading = state is EmployeeMasterActionInProgress;

        return ErrorWrapper(
          actionError: state is EmployeeMasterActionFailure,
          child: Scaffold(
            appBar: CustomAppbar(
              title: "Ubah Data Kasir",
              actions: [
                TextButton(
                    onPressed: !isLoading ? _onSubmitted : null,
                    child: isLoading
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(),
                          )
                        : const TextActionL(
                            "SIMPAN",
                            color: TColors.primary,
                          ))
              ],
              // bottom: TabContainer(
              //   controller: _tabController,
              //   tabs: const [
              //     TabItem(
              //       title: "Info Karyawan",
              //     ),
              //     TabItem(title: "Hak Akses"),
              //   ],
              // ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16.0),
              child: EmployeeForm(
                formKey: _employeeFormKey,
                initialValue: {
                  "profilePicture": employee.profilePicture == null
                      ? null
                      : ImagePickerValue(url: employee.profilePicture!),
                  "name": employee.name,
                  "phoneNumber": employee.phoneNumber,
                  "email": employee.email,
                },
              ),
            ),
            // body: TabBarView(
            //   controller: _tabController,
            //   children: [
            //     SingleChildScrollView(
            //       padding: const EdgeInsets.only(top: 16.0),
            //       child: NewEmployeeForm(
            //         formKey: _employeeFormKey,
            //       ),
            //     ),
            //     SingleChildScrollView(
            //       padding: const EdgeInsets.only(top: 16.0),
            //       child: AccessRightForm(
            //         formKey: _accessFormKey,
            //       ),
            //     ),
            //   ],
            // ),
          ),
        );
      },
    );
  }
}
