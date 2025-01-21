import 'package:app_data_provider/app_data_provider.dart';
import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/error_display/error_display.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_master/customer_master_cubit.dart';
import 'package:lakoe_pos/features/customers/application/cubit/customer_master/customer_master_state.dart';
import 'package:lakoe_pos/features/customers/presentation/widgets/forms/customer_form.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class NewCustomerScreen extends StatefulWidget {
  const NewCustomerScreen({super.key});

  @override
  State<NewCustomerScreen> createState() => _NewCustomerScreenState();
}

class _NewCustomerScreenState extends State<NewCustomerScreen> {
  final AppDataProvider _appDataProvider = AppDataProvider();
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _onSubmit() async {
    FocusScope.of(context).unfocus();

    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValid) return;

    dynamic value = _formKey.currentState?.value;

    String phoneNumber =
        PhoneNumberFormatter.formatForRequest(value["phoneNumber"]);

    await context.read<CustomerMasterCubit>().create(
          CustomerDto(
            name: value["name"],
            phoneNumber: phoneNumber,
            address: value["address"],
            email: value["email"],
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomerMasterCubit, CustomerMasterState>(
      listener: (context, state) async {
        if (state is CustomerMasterActionSuccess) {
          Navigator.pop(context, state.data);
        } else if (state is ErrorIssuePackage) {
          final activePackage = await _appDataProvider.activePackage;

          String limit = "10";

          if (activePackage == "GROW") {
            limit = "40";
          }

          if (!context.mounted) return;

          bool isExpired = state.res.message!.contains("expired");

          String title = "Pelanggan udah penuh, nih!";
          String description =
              "$limit pelanggan sudah tersimpan. Upgrade untuk simpan lebih banyak!";

          if (isExpired) {
            title = "Yah! masa aktif paket habis";
            description =
                "Paket $activePackage kamu sudah tidak aktif lagi. Yuk perpanjang atau upgrade paket untuk terus menikmati fitur Lakoe.";
          }

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
                    title: title,
                    description: description,
                    actionTitlePrimary: "Lihat Paket",
                    onActionPrimary: () {
                      Navigator.pop(context);
                      Navigator.pop(context, true);
                      if (isExpired && activePackage != "LITE") {
                        Navigator.pushNamed(
                          context,
                          "/account/active_package",
                          arguments: {'packageName': activePackage},
                        );
                      } else if (activePackage == "GROW") {
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
      },
      child: Scaffold(
        appBar: CustomAppbar(
          title: "Pelanggan Baru",
          actions: [
            BlocBuilder<CustomerMasterCubit, CustomerMasterState>(
              builder: (context, state) {
                return TextButton(
                  onPressed: state is CustomerMasterActionInProgress
                      ? null
                      : _onSubmit,
                  child: state is CustomerMasterActionInProgress
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(),
                        )
                      : const TextActionL(
                          "SIMPAN",
                          color: TColors.primary,
                        ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: CustomerForm(
            formKey: _formKey,
          ),
        ),
      ),
    );
  }
}
