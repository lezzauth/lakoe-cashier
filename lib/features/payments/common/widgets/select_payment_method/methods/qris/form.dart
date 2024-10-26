import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/form/custom_checkbox.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';

class QrisPaymentForm extends StatefulWidget {
  const QrisPaymentForm({
    super.key,
    this.useQRISStatic = false,
    required this.onChanged,
  });

  final bool useQRISStatic;
  final ValueChanged<bool> onChanged;

  @override
  State<QrisPaymentForm> createState() => _QrisPaymentFormState();
}

class _QrisPaymentFormState extends State<QrisPaymentForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    CustomCheckbox(
                      value: widget.useQRISStatic,
                      onChanged: widget.onChanged,
                    ),
                    SizedBox(width: 12),
                    TextBodyL(
                      "Tidak menggunakan mesin EDC",
                      color: TColors.neutralDarkDark,
                    ),
                  ],
                ),
              ),
              if (!widget.useQRISStatic)
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FormLabel("Kode Approval"),
                      FormBuilderTextField(
                        name: "codeApproval",
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(6),
                        ],
                        decoration: const InputDecoration(
                          hintText: 'Masukkan kode approval',
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: ErrorTextStrings.required(),
                          ),
                          FormBuilderValidators.numeric(
                            errorText: ErrorTextStrings.numeric(),
                          ),
                          FormBuilderValidators.minLength(
                            6,
                            errorText: ErrorTextStrings.minLength(
                              name: "Kode approval",
                              minLength: 6,
                              isNumber: true,
                            ),
                          ),
                          FormBuilderValidators.maxLength(
                            6,
                            errorText: ErrorTextStrings.maxLength(
                              name: "Kode approval",
                              maxLength: 6,
                              isNumber: true,
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: const TextBodyS(
                          "Gunakan Kode Approval yang ada di struk dari mesin EDC. Biasanya terdiri dari 6 digit angka.",
                          color: TColors.neutralDarkLightest,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
