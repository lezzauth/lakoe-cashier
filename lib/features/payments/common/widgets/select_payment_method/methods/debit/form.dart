import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';

class DebitPaymentForm extends StatefulWidget {
  const DebitPaymentForm({super.key});

  @override
  State<DebitPaymentForm> createState() => DebitPaymentFormState();
}

class DebitPaymentFormState extends State<DebitPaymentForm> {
  MaskTextInputFormatter creditFormatter = MaskTextInputFormatter(
    mask: '####-####-####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

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
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const FormLabel(
                      "Nomor Kartu",
                      // optional: true,
                    ),
                    FormBuilderTextField(
                      name: "accountNumber",
                      keyboardType: TextInputType.number,
                      inputFormatters: [creditFormatter],
                      decoration: const InputDecoration(
                        hintText: '0000-0000-0000-0000',
                      ),
                      valueTransformer: (value) {
                        return creditFormatter.getUnmaskedText();
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: ErrorTextStrings.required(),
                        ),
                        FormBuilderValidators.equalLength(19,
                            errorText: "Nomor kartu tidak valid.")
                      ]),
                    ),
                  ],
                ),
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     const FormLabel(
              //       "Catatan",
              //       optional: true,
              //     ),
              //     FormBuilderTextField(
              //       name: "notes",
              //       decoration: const InputDecoration(
              //         hintText: 'Masukan catatan jika diperlukan',
              //       ),
              //       maxLines: 3,
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
