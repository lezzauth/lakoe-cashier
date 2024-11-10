import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';

class BusinessInformationForm extends StatefulWidget {
  const BusinessInformationForm({super.key});

  @override
  State<BusinessInformationForm> createState() =>
      _BusinessInformationFormState();
}

class _BusinessInformationFormState extends State<BusinessInformationForm> {
  final List<String> businessTypes = [
    "Kuliner",
    "Toko Online",
    "Retail",
    "Lainnya"
  ];

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
                validator: FormBuilderValidators.required(
                    errorText: ErrorTextStrings.required(name: "Nama Usaha")),
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
                      alignment: WrapAlignment.start,
                      spacing: 8.0,
                      children: businessTypes.map((type) {
                        bool selected = type == field.value;

                        return InputChip(
                          label: selected
                              ? TextHeading4(
                                  type,
                                  color: TColors.primary,
                                )
                              : TextBodyM(type),
                          selected: selected,
                          onPressed: () {
                            field.didChange(type);
                          },
                        );
                      }).toList(),
                    );
                  },
                  validator: FormBuilderValidators.required(
                      errorText:
                          ErrorTextStrings.required(name: "Jenis Usaha")),
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
                  hintText:
                      "Masukan alamat dengan format [Kecamatan], [Kabupaten], [Provinsi]\nContoh: Banjarsari, Solo, Jawa Tengah",
                ),
                maxLines: 3,
                validator: FormBuilderValidators.required(
                    errorText: ErrorTextStrings.required(name: "Alamat")),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     const FormLabel(
          //       "Pinpoint Lokasi",
          //     ),
          //     Container(
          //       margin: const EdgeInsets.only(bottom: 8),
          //       child: TextBodyS(
          //         "Tandai lokasi untuk mempermudah pemintaan pickup kurir",
          //         color: TColors.neutralDarkLightest,
          //       ),
          //     ),
          //     FormBuilderField<LatLng>(
          //       builder: (field) => Pinpoint(
          //         onChanged: field.didChange,
          //         value: field.value,
          //         errorText: field.errorText ?? "",
          //         hasError: field.hasError,
          //       ),
          //       name: "outletPinpoint",
          //       validator: FormBuilderValidators.required(
          //         errorText: ErrorTextStrings.required(),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
