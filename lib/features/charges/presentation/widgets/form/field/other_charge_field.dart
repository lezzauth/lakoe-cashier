import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class OtherChargeField extends StatelessWidget {
  const OtherChargeField({
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
                  const FormLabel("Biaya"),
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
                decoration: const InputDecoration(hintText: "Tulis nama pajak"),
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 82,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: Colors.white,
                      ),
                      child: FormBuilderDropdown<String>(
                        name: "unit_$id",
                        initialValue: initialValue["unit"] ?? "static",
                        items: const [
                          DropdownMenuItem<String>(
                            value: "static",
                            child: TextBodyM("Rp"),
                          ),
                          DropdownMenuItem<String>(
                            value: "percentage",
                            child: TextBodyM("%"),
                          ),
                        ],
                        alignment: Alignment.bottomCenter,
                        icon: const UiIcons(
                          TIcons.arrowDown,
                          height: 12,
                          width: 12,
                          color: TColors.neutralDarkLightest,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FormBuilderTextField(
                      name: "value_$id",
                      initialValue: initialValue["value"],
                      decoration: const InputDecoration(
                        suffixText: "%",
                        hintText: "0",
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}|^\d+\,?\d{0,2}')),
                      ],
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: ErrorTextStrings.required())
                      ]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
