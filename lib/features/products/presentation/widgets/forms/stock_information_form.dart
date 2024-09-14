import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/data/models.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class StockInformationForm extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  final Map<String, dynamic> initialValue;
  final Function()? onChanged;

  const StockInformationForm({
    super.key,
    required this.formKey,
    this.initialValue = const <String, dynamic>{},
    this.onChanged,
  });

  @override
  State<StockInformationForm> createState() => _StockInformationFormState();
}

class _StockInformationFormState extends State<StockInformationForm>
    with AutomaticKeepAliveClientMixin<StockInformationForm> {
  bool isUseStock = false;

  final List<LabelValue> _availability = [
    const LabelValue(label: "Tersedia", value: "AVAILABLE"),
    const LabelValue(label: "Tidak Tersedia", value: "UNAVAILABLE"),
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final formKey = widget.formKey;

    return FormBuilder(
      key: formKey,
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.always,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FormLabel("Kode Produk / SKU"),
                  FormBuilderTextField(
                    name: "sku",
                    decoration:
                        const InputDecoration(hintText: "Buat kode produk"),
                  ),
                ],
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(bottom: 16.0),
            //   child: Container(
            //     padding: const EdgeInsets.all(12.0),
            //     decoration: BoxDecoration(
            //       color: TColors.neutralLightLight,
            //       borderRadius: BorderRadius.circular(12.0),
            //       border: Border.all(
            //         width: 1,
            //         color: TColors.neutralLightMedium,
            //       ),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         const TextHeading4(
            //           "Stok berdasarkan bahan baku",
            //           color: TColors.neutralDarkDarkest,
            //         ),
            //         SizedBox(
            //           height: 28,
            //           child: FormBuilderField(
            //             name: "isUseStock",
            //             initialValue: false,
            //             builder: (FormFieldState<bool> field) {
            //               return Switch(
            //                 value: field.value ?? false,
            //                 onChanged: (value) {
            //                   setState(() {
            //                     isUseStock = value;
            //                   });
            //                   field.didChange(value);
            //                 },
            //               );
            //             },
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            if (!isUseStock)
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FormLabel("Jumlah Stok"),
                    FormBuilderTextField(
                      name: "stock",
                      decoration: const InputDecoration(
                        hintText: "Masukan jumlah stok saat ini",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FormLabel("Status Produk"),
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: FormBuilderField<String>(
                            name: "availability",
                            initialValue: widget.initialValue["availability"] ??
                                "AVAILABLE",
                            builder: (field) {
                              return Wrap(
                                direction: Axis.horizontal,
                                spacing: 8,
                                children: [
                                  ..._availability.map((item) {
                                    bool selected = item.value == field.value;
                                    return InputChip(
                                      label: !selected
                                          ? TextBodyM(item.label)
                                          : TextHeading4(
                                              item.label,
                                              color: TColors.primary,
                                            ),
                                      selected: selected,
                                      onPressed: () {
                                        field.didChange(item.value);
                                      },
                                    );
                                  }),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
