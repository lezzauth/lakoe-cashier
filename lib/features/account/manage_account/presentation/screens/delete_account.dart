import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/form/custom_checkbox.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Hapus Akun",
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextHeading3(
                        "Setelah akun dihapus, kamu akan kehilangan akses ke informasi berikut:",
                        color: TColors.neutralDarkDark,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(height: 20),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextHeading4(
                            "1. Riwayat Pesanan",
                            color: TColors.neutralDarkDark,
                          ),
                          SizedBox(height: 4),
                          TextBodyM(
                            "Rincian riwayat transaksi, metode pembayaran, data produk atau menu, dst.",
                            color: TColors.neutralDarkDark,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextHeading4(
                            "2. Pelanggan & Supplier",
                            color: TColors.neutralDarkDark,
                          ),
                          SizedBox(height: 4),
                          TextBodyM(
                            "Semua informasi tentang data pelanggan dan supplier akan hilang.",
                            color: TColors.neutralDarkDark,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextHeading4(
                            "3. Profil & Akun",
                            color: TColors.neutralDarkDark,
                          ),
                          SizedBox(height: 4),
                          TextBodyM(
                            "Info personal dan tentang bisnis kamu akan hilang.",
                            color: TColors.neutralDarkDark,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 24.0,
                  thickness: 4.0,
                  color: TColors.neutralLightMedium,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextBodyM(
                        "Lakoe tidak bertanggung jawab atas hilangnya informasi, data atau uang setelah akun kamu berhasil dihapus.",
                        color: TColors.neutralDarkDark,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isAgreed
                              ? TColors.highlightLightest
                              : TColors.neutralLightLight,
                          border: Border.all(
                            color: isAgreed
                                ? TColors.highlightLight
                                : TColors.neutralLightMedium,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            CustomCheckbox(
                              value: isAgreed,
                              onChanged: (bool value) {
                                setState(() {
                                  isAgreed = value;
                                });
                              },
                            ),
                            const SizedBox(width: 20),
                            const Flexible(
                              child: TextHeading4(
                                "Saya setuju dan bersedia menghapus akun ini secara permanen.",
                                color: TColors.neutralDarkDark,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: TColors.neutralLightMedium,
                  width: 1.0,
                ),
              ),
            ),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: (isAgreed)
                      ? () {
                          Navigator.pushNamed(
                              context, "/delete_account/reason");
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: TColors.neutralLightLightest,
                    backgroundColor: TColors.error,
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: const TextActionL("Lanjut"),
                ),
                const SizedBox(height: 6),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: TColors.error,
                    side: const BorderSide(color: TColors.error),
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: const TextActionL("Batal"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
