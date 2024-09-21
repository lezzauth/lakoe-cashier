import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:point_of_sales_cashier/common/widgets/access_permission/contact_denied_permission.dart';
import 'package:point_of_sales_cashier/common/widgets/access_permission/contact_permission.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class NewCustomerForm extends StatefulWidget {
  const NewCustomerForm({super.key, required this.formKey});
  final GlobalKey<FormBuilderState> formKey;

  @override
  State<NewCustomerForm> createState() => _NewCustomerFormState();
}

class _NewCustomerFormState extends State<NewCustomerForm> {
  Future<void> _onSelectContact() async {
    if (!context.mounted) return;

    if (await Permission.contacts.isPermanentlyDenied) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return const ContactDeniedPermission();
        },
      );

      return;
    }

    if (!(await Permission.contacts.isGranted)) {
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
        widget.formKey.currentState?.patchValue({
          "name": contact.displayName,
          "phoneNumber": contact.phones.first.number,
        });
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
                            height: 24,
                            width: 24,
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
                      const FormLabel("No. HP"),
                      FormBuilderTextField(
                        name: "phoneNumber",
                        decoration: const InputDecoration(
                          hintText: "Masukan nomor hp atau wa",
                        ),
                        keyboardType: TextInputType.phone,
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
