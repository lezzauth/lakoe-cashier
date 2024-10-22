import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/features/products/presentation/widgets/forms/field/image_picker_field.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EmployeeForm extends StatefulWidget {
  const EmployeeForm({
    super.key,
    required this.formKey,
    this.initialValue = const <String, dynamic>{},
  });

  final GlobalKey<FormBuilderState> formKey;
  final Map<String, dynamic> initialValue;

  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final pinFormatter = MaskTextInputFormatter(
    mask: '######',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    bool isEdit = widget.initialValue.isNotEmpty;

    return FormBuilder(
      key: widget.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: widget.initialValue,
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
                    name: "profilePicture",
                    builder: (field) {
                      return ImagePickerField(
                        value: field.value,
                        onChanged: field.didChange,
                        errorText: field.errorText ?? "",
                        onError: (errorText) {
                          widget.formKey.currentState?.fields["profilePicture"]
                              ?.invalidate(errorText);
                        },
                      );
                    },
                    // validator: FormBuilderValidators.compose([
                    //   FormBuilderValidators.required(
                    //       errorText: ErrorTextStrings.required()),
                    // ]),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FormLabel("Nama Karyawan"),
                        FormBuilderTextField(
                          name: "name",
                          decoration: const InputDecoration(
                            hintText: "Masukan nama karyawan",
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
            // Container(
            //   margin: const EdgeInsets.only(bottom: 8.0),
            //   child: Row(
            //     children: [
            //       Expanded(
            //           child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           const FormLabel("Kategori"),
            //           Container(
            //             margin: const EdgeInsets.only(bottom: 8),
            //             child: const RolesField(),
            //           ),
            //         ],
            //       ))
            //     ],
            //   ),
            // ),
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
                    validator: FormBuilderValidators.required(
                        errorText: ErrorTextStrings.required()),
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
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.conditional((value) {
                        if (value == null) return false;
                        if (value.isEmpty) return false;
                        return true;
                      },
                          FormBuilderValidators.email(
                            errorText: ErrorTextStrings.email(),
                          ))
                    ]),
                  ),
                ],
              ),
            ),
            if (!isEdit)
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
                      keyboardType: TextInputType.number,
                      inputFormatters: [pinFormatter],
                      obscureText: true,
                      validator: FormBuilderValidators.conditional(
                        (value) {
                          if (isEdit) {
                            if (value == null) return false;
                          }

                          return true;
                        },
                        FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(
                              errorText: ErrorTextStrings.required(),
                            ),
                            FormBuilderValidators.equalLength(
                              6,
                              errorText:
                                  ErrorTextStrings.equalLength(maxLength: 6),
                            )
                          ],
                        ),
                      ),
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
