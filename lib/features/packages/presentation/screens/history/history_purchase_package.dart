import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/features/packages/application/cubit/history/purchase_history_cubit.dart';
import 'package:lakoe_pos/features/packages/application/cubit/history/purchase_history_state.dart';
import 'package:lakoe_pos/features/packages/presentation/widgets/card_item_history.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:owner_repository/owner_repository.dart';

class HistoryPurchasePackageScreen extends StatefulWidget {
  const HistoryPurchasePackageScreen({super.key});

  @override
  State<HistoryPurchasePackageScreen> createState() =>
      _HistoryPurchasePackageScreenState();
}

class _HistoryPurchasePackageScreenState
    extends State<HistoryPurchasePackageScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PurchaseHistoryCubit>().findAll();
  }

  Future<void> _onRefresh() async {
    await context.read<PurchaseHistoryCubit>().findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Paket & Riwayat",
      ),
      body: Scrollbar(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 12.0),
                child: TextHeading3(
                  "Paket Aktif",
                  color: TColors.neutralDarkDarkest,
                ),
              ),
              CardItemPackageActive(),
              Container(
                margin: EdgeInsets.only(bottom: 12.0, top: 24),
                child: TextHeading3(
                  "Riwayat Pembelian",
                  color: TColors.neutralDarkDarkest,
                ),
              ),
              BlocBuilder<PurchaseHistoryCubit, PurchaseHistoryState>(
                  builder: (context, state) {
                if (state is PurchaseHistoryLoadSuccess) {
                  if (state.purchases.isEmpty) {
                    return EmptyList(
                      image: SvgPicture.asset(
                        TImages.catBox,
                        width: 140,
                        height: 101.45,
                      ),
                      title: "Belum ada riwayat pembelian",
                      subTitle:
                          " Yuk, Upgrade paket Lakoe bersama dengan bertumbuhnya bisnis kamu.",
                      action: TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, "/packages"),
                        child: TextActionL(
                          "Explore Paket",
                          color: TColors.primary,
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                        itemCount: state.purchases.length,
                        itemBuilder: (context, index) {
                          HistoryPurchaseModel purchase =
                              state.purchases[index];
                          return CardItemHistory(data: purchase);
                        }),
                  );
                } else if (state is PurchaseHistoryLoadInProgress) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is PurchaseHistoryLoadFailure) {
                  return EmptyList(
                    title: "Gagal memuat data, nih!",
                    subTitle: "Ada sedikit gangguan. Coba coba lagi, ya",
                    action: TextButton(
                      onPressed: _onRefresh,
                      child: TextActionL(
                        "Coba Lagi",
                        color: TColors.primary,
                      ),
                    ),
                  );
                } else {
                  return EmptyList(
                    title: "Bentar, ada masalah tak terduga, nih!",
                    subTitle: "Tenang, kamu bisa mencobanya lagi, kok",
                    action: TextButton(
                      onPressed: _onRefresh,
                      child: TextActionL(
                        "Coba Lagi",
                        color: TColors.primary,
                      ),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class CardItemPackageActive extends StatelessWidget {
  const CardItemPackageActive({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.pushNamed(
          context,
          "/account/detail_package",
          arguments: {
            'packageName': "GROW",
          },
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Color(0xFFE7F4E8),
          border: Border.all(
            color: TColors.neutralLightMedium,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset(
                TImages.pakcageWaves,
                colorFilter: ColorFilter.mode(
                  Color(0xFF00712D),
                  BlendMode.srcIn,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextHeading3(
                        "Paket Grow",
                        color: TColors.neutralDarkDark,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          TextBodyM(
                            "Aktif sampai:",
                            color: TColors.neutralDarkLight,
                          ),
                          SizedBox(width: 4),
                          TextBodyM(
                            "16 Nov 2024",
                            fontWeight: FontWeight.bold,
                            color: TColors.neutralDarkLight,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    TImages.growLogoPackage,
                    height: 28,
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
