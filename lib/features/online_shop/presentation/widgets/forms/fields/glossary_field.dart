import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';

class GlossaryField extends StatelessWidget {
  const GlossaryField({
    super.key,
    required this.id,
    this.onDelete,
    this.initialValue = const <String, dynamic>{},
  });

  final String id;
  final VoidCallback? onDelete;
  final Map<String, dynamic> initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FormLabel("Istilah"),
                  GestureDetector(
                    onTap: onDelete,
                    child: const TextHeading4(
                      "Hapus",
                      color: TColors.error,
                    ),
                  ),
                ],
              ),
              FormBuilderTextField(
                name: "name_$id",
                initialValue: initialValue["name"],
                decoration:
                    const InputDecoration(hintText: "Masukan kata istilah"),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: ErrorTextStrings.required())
                ]),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormLabel(
                "Besaran",
              ),
              FormBuilderTextField(
                name: "mean_$id",
                initialValue: initialValue["mean"],
                decoration: const InputDecoration(
                    hintText: "Tuliskan arti dari kata istilah diatas"),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: ErrorTextStrings.required())
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}