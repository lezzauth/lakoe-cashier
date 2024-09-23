import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/list_item_card.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/section_card.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_1.dart';
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
    return Scaffold(
      backgroundColor: TColors.neutralLightLight,
      appBar: const CustomAppbar(
        backgroundColor: TColors.neutralLightLightest,
        title: "Pengaturan Akun",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionCard(
              children: [
                Container(
                  color: TColors.neutralLightLightest,
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: const ListItemCard(
                    isBoldTitle: true,
                    iconTrailing: false,
                    title: "Hapus akun",
                    subTitle:
                        "Akun kamu akan dihapus secara permanen. Jadi, kamu tidak bisa lagi akses riwayat transaksi, laporan dan lainnya dari akun ini.",
                    routeName: "/delete_account",
                    iconSrc: TIcons.billAlt,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SectionCard(
              children: [
                Container(
                  color: TColors.errorLight,
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ListItemCard(
                      isBoldTitle: true,
                      iconTrailing: false,
                      dangerTheme: true,
                      title: "Keluar aplikasi",
                      iconSrc: TIcons.billAlt,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CustomBottomsheet(
                              child: SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                          top: 16,
                                          bottom: 40,
                                        ),
                                        child: const TextHeading1(
                                          "Kamu yakin ingin keluar aplikasi?",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 48,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: TColors.error),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const TextActionL("Keluar"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
