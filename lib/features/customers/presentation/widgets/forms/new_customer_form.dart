import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:lakoe_pos/common/widgets/access_permission/contact_denied_permission.dart';
import 'package:lakoe_pos/common/widgets/access_permission/contact_permission.dart';
import 'package:lakoe_pos/common/widgets/form/form_label.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class NewCustomerForm extends StatefulWidget {
  const NewCustomerForm({super.key, required this.formKey});
  final GlobalKey<FormBuilderState> formKey;

  @override
  State<NewCustomerForm> createState() => _NewCustomerFormState();
}

class _NewCustomerFormState extends State<NewCustomerForm> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _onSelectContact() async {
    if (!context.mounted) return;

    if (await Permission.contacts.isPermanentlyDenied) {
      if (!mounted) return;
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return CustomBottomsheet(
            child: const ContactDeniedPermission(),
          );
        },
      );

      return;
    }

    if (!(await Permission.contacts.isGranted)) {
      if (!mounted) return;
      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return const CustomBottomsheet(
            child: ContactPermission(),
          );
        },
      );
    }

    if (await Permission.contacts.isGranted) {
      final contact = await FlutterContacts.openExternalPick();
      if (contact != null) {
        if (contact.phones.isNotEmpty) {
          widget.formKey.currentState?.patchValue({
            "name": contact.displayName,
            "phoneNumber": contact.phones.first.number,
          });
        } else {
          CustomToast.show(
            "Kontak tidak memiliki nomor telepon",
            position: 'bottom',
            duration: 2,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FormLabel("Nama Pelanggan"),
                      FormBuilderTextField(
                        name: "name",
                        decoration: InputDecoration(
                          hintText: "Masukan nama pelanggan",
                          suffixIcon: UiIcons(
                            onTap: _onSelectContact,
                            TIcons.contactBook,
                            size: 24,
                            color: TColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FormLabel("Nomor HP/WA"),
                      FormBuilderTextField(
                        name: "phoneNumber",
                        decoration: const InputDecoration(
                          hintText: "Masukan nomor hp atau wa",
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          PhoneNumberFormatter(isDisplayFormat: true)
                        ],
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.maxLength(14,
                              errorText: ErrorTextStrings.maxLength(
                                  maxLength: 14, isNumber: true)),
                          FormBuilderValidators.minLength(9,
                              errorText: ErrorTextStrings.minLength(
                                  minLength: 9, isNumber: true)),
                        ]),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FormLabel(
                        "Email",
                        optional: true,
                      ),
                      FormBuilderTextField(
                        name: "email",
                        decoration: const InputDecoration(
                          hintText: "Email pelanggan",
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 4,
            color: TColors.neutralLightMedium,
            margin: const EdgeInsets.only(bottom: 16.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FormLabel(
                        "Alamat",
                        optional: true,
                      ),
                      FormBuilderTextField(
                        name: "address",
                        decoration: const InputDecoration(
                          hintText: "Alamat pelanggan",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
