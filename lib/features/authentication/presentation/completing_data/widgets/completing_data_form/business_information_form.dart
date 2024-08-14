import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';

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
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Contoh: Warung Madura",
                ),
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
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8.0,
                  children: businessTypes.map((type) {
                    return InputChip(
                      label: Text(type),
                      selected: type == "Kuliner",
                      onPressed: () {
                        //
                      },
                    );
                  }).toList(),
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
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Cari alamat usaha",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
