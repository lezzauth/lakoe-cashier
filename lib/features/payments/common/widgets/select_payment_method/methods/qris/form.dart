import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class QrisPaymentForm extends StatefulWidget {
  const QrisPaymentForm({super.key, required this.onFormChanged});

  final Function(bool) onFormChanged;

  @override
  State<QrisPaymentForm> createState() => _QrisPaymentFormState();
}

class _QrisPaymentFormState extends State<QrisPaymentForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      onChanged: () {
        widget.onFormChanged(
          _formKey.currentState?.validate() ?? false,
        );
      },
      child: Column(
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
                            errorText: 'Kode approval wajib diisi',
                          ),
                          FormBuilderValidators.numeric(
                            errorText: 'Kode approval hanya boleh angka',
                          ),
                          FormBuilderValidators.minLength(
                            6,
                            errorText: 'Kode approval harus 6 digit',
                          ),
                          FormBuilderValidators.maxLength(
                            6,
                            errorText: 'Kode approval harus 6 digit',
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
      ),
    );
  }
}
