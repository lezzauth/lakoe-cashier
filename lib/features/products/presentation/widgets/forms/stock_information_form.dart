import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';

class StockInformationForm extends StatefulWidget {
  const StockInformationForm({super.key, required this.formKey});
  final GlobalKey<FormBuilderState> formKey;

  @override
  State<StockInformationForm> createState() => _StockInformationFormState();
}

class _StockInformationFormState extends State<StockInformationForm> {
  bool isUseStock = false;

  @override
  Widget build(BuildContext context) {
    final formKey = widget.formKey;

    return FormBuilder(
      key: formKey,
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
                          hintText: "Masukan jumlah stok saat ini"),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
