import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/features/packages/presentation/widgets/card_item_history.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:package_repository/package_repository.dart';

class HistoryPurchasePackageScreen extends StatefulWidget {
  const HistoryPurchasePackageScreen({super.key});

  @override
  State<HistoryPurchasePackageScreen> createState() =>
      _HistoryPurchasePackageScreenState();
}

class _HistoryPurchasePackageScreenState
    extends State<HistoryPurchasePackageScreen> {
  List<ListHistoryPurchaseModel> dummyListHistoryPurchase = [
    ListHistoryPurchaseModel(
      id: "967f29a2-926d-4b92-aa84-f1bdf6d01929",
      paymentMethod: "DANA",
      status: "PAID",
      paidAmount: "0",
      amount: "30000",
      period: 1,
      startPeriod: "2024-12-11T09:26:08.972Z",
      endPeriod: "2025-01-11T09:26:08.972Z",
      ownerId: "8f7acd69-66fc-47ef-be80-966d831a6d5a",
      externalId: "pr-88c29e8a-6227-4d95-907c-4a6da41b29b7",
      packageName: "GROW",
      createdAt: "2024-12-11T09:26:08.973Z",
      updatedAt: "2024-12-11T09:26:18.019Z",
    ),
    ListHistoryPurchaseModel(
      id: "9e7abba6-be2a-4880-87ab-941cd2cdb3a4",
      paymentMethod: "BCA",
      status: "UNPAID",
      paidAmount: "0",
      amount: "30000",
      period: 1,
      startPeriod: "2024-12-11T09:25:54.074Z",
      endPeriod: "2025-01-11T09:25:54.074Z",
      ownerId: "8f7acd69-66fc-47ef-be80-966d831a6d5a",
      externalId: "pr-5e11e001-2cc9-4c81-8d73-f86a20aef630",
      packageName: "GROW",
      createdAt: "2024-12-11T09:25:54.075Z",
      updatedAt: "2024-12-11T09:25:54.075Z",
    ),
    ListHistoryPurchaseModel(
      id: "5e0f79bc-d819-4513-810d-6d738c8cb35d",
      paymentMethod: "GOPAY",
      status: "PENDING",
      paidAmount: "0",
      amount: "25000",
      period: 1,
      startPeriod: "2024-10-15T10:00:00.000Z",
      endPeriod: "2024-11-15T10:00:00.000Z",
      ownerId: "b93acd23-f654-4876-b110-c2da111d68df",
      externalId: null,
      packageName: "GROW",
      createdAt: "2024-10-15T10:00:01.000Z",
      updatedAt: "2024-10-15T10:05:00.000Z",
    ),
    ListHistoryPurchaseModel(
      id: "8e234dfa-a223-4881-88a1-9e3f6d7a7a99",
      paymentMethod: "BANK_TRANSFER",
      status: "PAID",
      paidAmount: "100000",
      amount: "100000",
      period: 3,
      startPeriod: "2024-09-01T08:00:00.000Z",
      endPeriod: "2024-12-01T08:00:00.000Z",
      ownerId: "a65de910-9bb4-48e4-9677-13edb6f11a24",
      externalId: "pr-8872a8e2-926d-4d95-907c-1234b1f4d28f",
      packageName: "PRO",
      createdAt: "2024-09-01T08:10:00.000Z",
      updatedAt: "2024-09-01T08:20:00.000Z",
    ),
  ];

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
              Expanded(
                child: ListView.builder(
                    itemCount: dummyListHistoryPurchase.length,
                    itemBuilder: (context, index) {
                      ListHistoryPurchaseModel purchase =
                          dummyListHistoryPurchase[index];
                      return CardItemHistory(
                        data: purchase,
                      );
                    }),
              ),
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
    return Container(
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
    );
  }
}
