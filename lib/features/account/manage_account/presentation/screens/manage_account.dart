import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/general_information.dart';
import 'package:lakoe_pos/common/widgets/ui/list_item_card.dart';
import 'package:lakoe_pos/common/widgets/ui/section_card.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_1.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:token_provider/token_provider.dart';

class ManageAccountScreen extends StatefulWidget {
  const ManageAccountScreen({super.key});

  @override
  State<ManageAccountScreen> createState() => _ManageAccountScreenState();
}

class _ManageAccountScreenState extends State<ManageAccountScreen> {
  final TokenProvider _tokenProvider = TokenProvider();

  Future<void> _onLogout() async {
    await _tokenProvider.clearAll();

    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(
      context,
      "/",
      (route) => false,
    );
  }

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CustomBottomsheet(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 16,
                      bottom: 40,
                    ),
                    child: TextHeading1(
                      "Kamu yakin ingin keluar ingin keluar dari akun?",
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TColors.error,
                      ),
                      onPressed: _onLogout,
                      child: TextActionL("Keluar"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showCashierAccessBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CustomBottomsheet(
          child: GeneralInformation(
            imageSrc: TImages.generalIllustration,
            title: "Kasir masih terbuka, nih!",
            description:
                "Kamu tidak bisa keluar dari akun karena masih ada kasir yang buka. Jika, kamu ingin keluar dari akun, kamu perlu tutup kasir terlebih dahulu.",
            onAction: () {
              Navigator.pop(context);
            },
            actionTitle: "Oke, Paham",
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CashierCubit, CashierState>(builder: (context, state) {
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
                      iconSrc: TIcons.trash,
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
                        title: "Keluar akun",
                        iconSrc: TIcons.logout,
                        onTap: () {
                          if (state is CashierAlreadyOpen) {
                            _showCashierAccessBottomSheet(context);
                          } else {
                            _showLogoutBottomSheet(context);
                          }
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
