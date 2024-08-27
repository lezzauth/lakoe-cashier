import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class BusinessInformationForm extends StatefulWidget {
  const BusinessInformationForm({super.key});

  @override
  State<BusinessInformationForm> createState() =>
      _BusinessInformationFormState();
}

class _BusinessInformationFormState extends State<BusinessInformationForm> {
  final List<String> businessTypes = ["Kuliner", "Toko Online", "Retail"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormLabel(
                "Nama Usaha",
              ),
              FormBuilderTextField(
                name: "outletName",
                decoration: const InputDecoration(
                  hintText: "Contoh: Warung Madura",
                ),
                validator: FormBuilderValidators.required(),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormLabel(
                  "Jenis Usaha",
                ),
                FormBuilderField(
                  name: "outletType",
                  builder: (field) {
                    return Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8.0,
                      children: businessTypes.map((type) {
                        bool selected = type == field.value;

                        return InputChip(
                          label: selected
                              ? TextHeading5(
                                  type,
                                  color: TColors.primary,
                                )
                              : TextBodyS(type),
                          selected: selected,
                          onPressed: () {
                            field.didChange(type);
                          },
                        );
                      }).toList(),
                    );
                  },
                  validator: FormBuilderValidators.required(),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormLabel(
                "Alamat",
              ),
              FormBuilderTextField(
                name: "outletAddress",
                decoration: const InputDecoration(
                  hintText: "Cari alamat usaha",
                ),
                maxLines: 2,
                validator: FormBuilderValidators.required(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
