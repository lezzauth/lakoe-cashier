import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/features/employees/presentation/widgets/forms/fields/roles_field.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/forms/field/image_picker_field.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';

class NewEmployeeForm extends StatefulWidget {
  const NewEmployeeForm({super.key, required this.formKey});
  final GlobalKey<FormBuilderState> formKey;

  @override
  State<NewEmployeeForm> createState() => _NewEmployeeFormState();
}

class _NewEmployeeFormState extends State<NewEmployeeForm> {
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormBuilderField<ImagePickerValue>(
                    name: "images",
                    builder: (field) {
                      return ImagePickerField(
                        value: field.value,
                        onChanged: field.didChange,
                        errorText: field.errorText ?? "",
                        onError: (errorText) {
                          widget.formKey.currentState?.fields["images"]
                              ?.invalidate(errorText);
                        },
                      );
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: ErrorTextStrings.required()),
                    ]),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FormLabel("Nama Produk"),
                        FormBuilderTextField(
                          name: "name",
                          decoration: const InputDecoration(
                            hintText: "Contoh: Es Teh",
                          ),
                          validator: FormBuilderValidators.required(
                              errorText: ErrorTextStrings.required()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormLabel("Kategori"),
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: const RolesField(),
                      ),
                    ],
                  ))
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
                      hintText: "Email karyawan",
                    ),
                    keyboardType: TextInputType.emailAddress,
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
                    "Kode Akses (PIN)",
                  ),
                  FormBuilderTextField(
                    name: "pin",
                    decoration: const InputDecoration(
                      hintText: "Masukan buat 6 digit PIN",
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
