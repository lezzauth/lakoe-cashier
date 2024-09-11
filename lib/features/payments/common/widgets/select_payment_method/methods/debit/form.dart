import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class DebitPaymentForm extends StatefulWidget {
  const DebitPaymentForm({super.key});

  @override
  State<DebitPaymentForm> createState() => DebitPaymentFormState();
}

class DebitPaymentFormState extends State<DebitPaymentForm> {
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
                      optional: true,
                    ),
                    FormBuilderTextField(
                      name: "cardNumber",
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        CreditCardFormatter(),
                      ],
                      decoration: const InputDecoration(
                        hintText: '0000-0000-0000-0000',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const FormLabel(
                      "Catatan",
                      optional: true,
                    ),
                    FormBuilderTextField(
                      name: "notes",
                      decoration: const InputDecoration(
                        hintText: 'Masukan catatan jika diperlukan',
                      ),
                      maxLines: 3,
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
