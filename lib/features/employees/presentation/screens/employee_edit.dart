import 'dart:io';

import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/wrapper/error_wrapper.dart';
import 'package:lakoe_pos/features/employees/application/cubit/employee_master/employee_master_cubit.dart';
import 'package:lakoe_pos/features/employees/application/cubit/employee_master/employee_master_state.dart';
import 'package:lakoe_pos/features/employees/data/arguments/employee_edit_argument.dart';
import 'package:lakoe_pos/features/employees/presentation/widgets/forms/employee_form.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/forms/field/image_picker_field.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

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

  String formatterPhoneNumber(String value) {
    if (value.startsWith('+628')) {
      value = value.replaceFirst('+628', '08');
    } else if (value.startsWith('628')) {
      value = value.replaceFirst('628', '08');
    }

    value = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (value.length > 10) {
      value =
          '${value.substring(0, 4)}-${value.substring(4, 8)}-${value.substring(8, 12)}';
    } else if (value.length > 7) {
      value =
          '${value.substring(0, 4)}-${value.substring(4, 8)}-${value.substring(8)}';
    } else if (value.length > 3) {
      value = '${value.substring(0, 4)}-${value.substring(4)}';
    }

    return value;
  }

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

    String phoneNumber =
        PhoneNumberFormatter.formatForRequest(value["phoneNumber"]);

    await context.read<EmployeeMasterCubit>().update(
          widget.arguments.employee.id,
          profilePicture: profilePictureFile,
          dto: UpdateEmployeeDto(
            name: value["name"],
            // pin: value["pin"],
            phoneNumber: phoneNumber,
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
    final formattedValue = formatterPhoneNumber(employee.phoneNumber);

    return BlocConsumer<EmployeeMasterCubit, EmployeeMasterState>(
      listener: (context, state) {
        if (state is EmployeeMasterActionSuccess) {
          Navigator.pop(context, true);
        }
      },
      builder: (context, state) {
        bool isLoading = state is EmployeeMasterActionInProgress;

        return ErrorWrapper(
          connectionIssue: state is ConnectionIssue,
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
                  "phoneNumber": formattedValue,
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
