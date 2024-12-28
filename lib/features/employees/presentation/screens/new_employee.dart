import 'dart:io';

import 'package:app_data_provider/app_data_provider.dart';
import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/error_display/error_display.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/wrapper/error_wrapper.dart';
import 'package:lakoe_pos/features/employees/application/cubit/employee_master/employee_master_cubit.dart';
import 'package:lakoe_pos/features/employees/application/cubit/employee_master/employee_master_state.dart';
import 'package:lakoe_pos/features/employees/presentation/widgets/forms/employee_form.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/forms/field/image_picker_field.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class NewEmployeeScreen extends StatefulWidget {
  const NewEmployeeScreen({super.key});

  @override
  State<NewEmployeeScreen> createState() => _NewEmployeeScreenState();
}

class _NewEmployeeScreenState extends State<NewEmployeeScreen>
    with SingleTickerProviderStateMixin {
  final AppDataProvider _appDataProvider = AppDataProvider();
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

    String phoneNumber =
        PhoneNumberFormatter.formatForRequest(value["phoneNumber"]);

    await context.read<EmployeeMasterCubit>().create(
          profilePictureFile,
          CreateEmployeeDto(
            name: value["name"],
            pin: value["pin"],
            phoneNumber: phoneNumber,
            role: "CASHIER",
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
    return BlocConsumer<EmployeeMasterCubit, EmployeeMasterState>(
      listener: (context, state) async {
        if (state is EmployeeMasterActionSuccess) {
          Navigator.pop(context, true);
        } else if (state is EmployeeMasterActionError) {
          if (state.res.statusCode == 409) {
            CustomToast.show(
              "PIN sudah digunakan kasir lain.",
              position: 'bottom',
              duration: 2,
            );
          } else if (state.res.statusCode == 402) {
            final activePackage = await _appDataProvider.activePackage;

            String message =
                "Paket kamu saat ini belum bisa tambah kasir baru. Upgrade, yuk!";

            if (activePackage == "GROW") {
              message =
                  "Paket kamu saat ini hanya bisa menyimpan 5 kasir. Yuk! upgrade saat bisnismu bertumbuh.";
            }

            if (!context.mounted) return;

            showModalBottomSheet(
              context: context,
              enableDrag: false,
              isDismissible: false,
              builder: (context) {
                return PopScope(
                  canPop: false,
                  onPopInvokedWithResult: (didPop, result) async {},
                  child: CustomBottomsheet(
                    hasGrabber: false,
                    child: ErrorDisplay(
                      imageSrc: TImages.limitQuota,
                      title: "Upgrade paket, yuk!",
                      description: message,
                      actionTitlePrimary: "Lihat Paket",
                      onActionPrimary: () {
                        Navigator.pop(context);
                        Navigator.pop(context, true);
                        if (activePackage == "GROW") {
                          Navigator.pushNamed(
                            context,
                            "/packages/upgrade",
                            arguments: {
                              'currentPackage': "GROW",
                              'upgradePakcage': "PRO",
                            },
                          );
                        } else {
                          Navigator.pushNamed(context, "/packages");
                        }
                      },
                      actionTitleSecondary: "Nanti Saja",
                      onActionSecondary: () {
                        Navigator.pop(context);
                        Navigator.pop(context, true);
                      },
                    ),
                  ),
                );
              },
            );
          }
        }
      },
      builder: (context, state) {
        bool isLoading = state is EmployeeMasterActionInProgress;

        return ErrorWrapper(
          connectionIssue: state is ConnectionIssue,
          actionError: state is EmployeeMasterActionFailure,
          child: Scaffold(
            appBar: CustomAppbar(
              title: "Tambah Kasir Baru",
              handleBackButton: () => Navigator.pop(context, true),
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
