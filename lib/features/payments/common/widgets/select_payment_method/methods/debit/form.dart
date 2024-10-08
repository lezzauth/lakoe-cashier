import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class DebitPaymentForm extends StatefulWidget {
  const DebitPaymentForm({super.key});

  @override
  State<DebitPaymentForm> createState() => _DebitPaymentFormState();
}

class _DebitPaymentFormState extends State<DebitPaymentForm> {
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
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';

// class DebitPaymentForm extends StatefulWidget {
//   const DebitPaymentForm({super.key});

//   @override
//   State<DebitPaymentForm> createState() => DebitPaymentFormState();
// }

// class DebitPaymentFormState extends State<DebitPaymentForm> {
//   MaskTextInputFormatter creditFormatter = MaskTextInputFormatter(
//     mask: '####-####-####-####',
//     filter: {"#": RegExp(r'[0-9]')},
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           margin: const EdgeInsets.only(bottom: 20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(bottom: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const FormLabel(
//                       "Nomor Kartu",
//                       optional: true,
//                     ),
//                     FormBuilderTextField(
//                       name: "accountNumber",
//                       keyboardType: TextInputType.number,
//                       inputFormatters: [creditFormatter],
//                       decoration: const InputDecoration(
//                         hintText: '0000-0000-0000-0000',
//                       ),
//                       valueTransformer: (value) {
//                         return creditFormatter.getUnmaskedText();
//                       },
//                       validator: FormBuilderValidators.compose([
//                         FormBuilderValidators.skipWhen(
//                           (value) {
//                             return value == null || value.isEmpty;
//                           },
//                           FormBuilderValidators.equalLength(19,
//                               errorText: "Nomor kartu tidak valid."),
//                         )
//                       ]),
//                     ),
//                   ],
//                 ),
//               ),
//               // Column(
//               //   crossAxisAlignment: CrossAxisAlignment.start,
//               //   mainAxisSize: MainAxisSize.min,
//               //   children: [
//               //     const FormLabel(
//               //       "Catatan",
//               //       optional: true,
//               //     ),
//               //     FormBuilderTextField(
//               //       name: "notes",
//               //       decoration: const InputDecoration(
//               //         hintText: 'Masukan catatan jika diperlukan',
//               //       ),
//               //       maxLines: 3,
//               //     ),
//               //   ],
//               // ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }