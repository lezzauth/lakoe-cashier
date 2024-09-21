import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/list_item_card.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/section_card.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class ManageAccountScreen extends StatefulWidget {
  const ManageAccountScreen({super.key});

  @override
  State<ManageAccountScreen> createState() => _ManageAccountScreenState();
}

class _ManageAccountScreenState extends State<ManageAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: TColors.neutralLightLight,
      appBar: CustomAppbar(
        backgroundColor: TColors.neutralLightLightest,
        title: "Pengaturan Akun",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionCard(
              children: [
                ListItemCard(
                  isBoldTitle: true,
                  iconTrailing: false,
                  title: "Hapus akun",
                  subTitle:
                      "Akun kamu akan dihapus secara permanen. Jadi, kamu tidak bisa lagi akses riwayat transaksi, laporan dan lainnya dari akun ini.",
                  routeName: "/",
                  iconSrc: TIcons.billAlt,
                ),
              ],
            ),
            SizedBox(height: 12),
            SectionCard(
              children: [
                ListItemCard(
                  isBoldTitle: true,
                  iconTrailing: false,
                  dangerTheme: true,
                  title: "Keluar aplikasi",
                  routeName: "/",
                  iconSrc: TIcons.billAlt,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
