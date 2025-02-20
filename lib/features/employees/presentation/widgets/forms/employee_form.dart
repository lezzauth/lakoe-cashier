import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lakoe_pos/common/widgets/form/form_label.dart';
import 'package:lakoe_pos/features/products/presentation/widgets/forms/field/image_picker_field.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

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
                        const FormLabel("Nama Kasir"),
                        FormBuilderTextField(
                          name: "name",
                          decoration: const InputDecoration(
                            hintText: "Masukan nama kasir",
                          ),
                          validator: FormBuilderValidators.required(
                              errorText: ErrorTextStrings.required(
                                  name: "Nama Kasir")),
                        ),
                      ],
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
                      PhoneNumberFormatter(isDisplayFormat: true),
                      LengthLimitingTextInputFormatter(14),
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
                      hintText: "Email kasir",
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
                              errorText: ErrorTextStrings.required(name: "PIN"),
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
