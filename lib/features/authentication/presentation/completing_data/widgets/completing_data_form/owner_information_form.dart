import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';

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
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Masukkan nama pemilik bisnis",
                ),
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
              TextFormField(
                enabled: false,
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
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Contoh: warmindo@gmail.com",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
