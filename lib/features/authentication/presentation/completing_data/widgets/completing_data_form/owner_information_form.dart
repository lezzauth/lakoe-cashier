import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';

class OwnerInformationForm extends StatefulWidget {
  const OwnerInformationForm({super.key});

  @override
  State<OwnerInformationForm> createState() => _OwnerInformationFormState();
}

class _OwnerInformationFormState extends State<OwnerInformationForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32, left: 24, right: 24),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormLabel(
                "Nama Pemilik",
              ),
              FormBuilderTextField(
                name: "name",
                decoration: const InputDecoration(
                  hintText: "Masukkan nama pemilik bisnis",
                ),
                validator: FormBuilderValidators.required(
                    errorText: ErrorTextStrings.required(name: "Nama Pemilik")),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormLabel(
                "Nomor WA",
                enabled: false,
              ),
              FormBuilderTextField(
                name: "phoneNumber",
                enabled: false,
                validator: FormBuilderValidators.required(
                    errorText: ErrorTextStrings.required(name: "Nomor WA")),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormLabel(
                "Email",
              ),
              FormBuilderTextField(
                name: "email",
                decoration: const InputDecoration(
                  hintText: "Contoh: warmindo@gmail.com",
                ),
                validator: FormBuilderValidators.email(
                    errorText: ErrorTextStrings.email()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
