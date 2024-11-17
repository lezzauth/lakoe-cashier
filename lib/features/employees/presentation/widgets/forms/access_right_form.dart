import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lakoe_pos/features/employees/presentation/widgets/section_card_access.dart';
import 'package:lakoe_pos/features/employees/presentation/widgets/section_list_access.dart';

class AccessRightForm extends StatefulWidget {
  const AccessRightForm({super.key, required this.formKey});
  final GlobalKey<FormBuilderState> formKey;

  @override
  State<AccessRightForm> createState() => _AccessRightFormState();
}

class _AccessRightFormState extends State<AccessRightForm> {
  List<_AccessItem> listPaymentMethodPrimary = [
    _AccessItem(
      title: "Penjualan",
      subTitle: "Buka dan tutup kasir",
      isActive: true,
    ),
    _AccessItem(
      title: "Kelola Produk",
      subTitle: "Tambah dan ubah info produk",
      isActive: false,
    ),
    _AccessItem(
      title: "Supplier",
      subTitle: "Tambah dan ubah supplier",
      isActive: true,
    ),
    _AccessItem(
      title: "Karyawan",
      subTitle: "Kelola data karyawan",
      isActive: false,
    ),
    _AccessItem(
      title: "Keuangan",
      subTitle: "Nomor rekening & penarikan saldo",
      isActive: false,
    ),
    _AccessItem(
      title: "QR Order & Meja",
      subTitle: "Atur meja dan desain brand",
      isActive: false,
    ),
    _AccessItem(
      title: "Laporan",
      subTitle: "Penjualan, keuntungan dan lain-lain",
      isActive: false,
      lastItem: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            AccessRightsSectionCard(
              children: listPaymentMethodPrimary
                  .map(
                    (item) => AccessRightsSectionItem(
                      title: item.title,
                      subTitle: item.subTitle,
                      isAction: item.isActive,
                      lastItem: item.lastItem,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccessItem {
  final String title;
  final String subTitle;
  final bool isActive;
  final bool lastItem;

  _AccessItem({
    required this.title,
    required this.subTitle,
    this.isActive = false,
    this.lastItem = false,
  });
}
