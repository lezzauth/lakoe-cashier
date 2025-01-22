import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lakoe_pos/common/widgets/form/form_label.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';

class QrisPaymentForm extends StatefulWidget {
  const QrisPaymentForm({
    super.key,
    this.useQRISStatic = false,
    required this.onSubmitted,
  });

  final bool useQRISStatic;
  final VoidCallback onSubmitted;

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
                        onSubmitted: (_) => widget.onSubmitted(),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: ErrorTextStrings.required(
                                name: "Kode Approval"),
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
