import 'package:flutter/material.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:package_repository/package_repository.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/features/account/presentation/widgets/table_comparison.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class DetailActivePackage extends StatelessWidget {
  const DetailActivePackage({
    super.key,
    required this.index,
    required this.packageActive,
    required this.packageData,
    required this.previousPackage,
    required this.currentPackage,
  });

  final int index;
  final PackageActive? packageActive;
  final List<PackagePriceModel> packageData;
  final PackageModel previousPackage;
  final PackageModel currentPackage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBodyM(
                "Paket aktif hingga",
                color: TColors.neutralDarkLight,
              ),
              SizedBox(height: 4),
              (packageActive != null)
                  ? Row(
                      children: [
                        TextHeading3(
                          packageActive!.endPeriod.toString(),
                          color: TColors.neutralDarkDark,
                        ),
                        if (packageActive!.activePeriod.months! > 0)
                          TextBodyM(
                            " • ${packageActive!.activePeriod.months} bulan ${packageActive!.activePeriod.days} hari",
                            color: TColors.neutralDarkLight,
                          )
                        else
                          TextBodyM(
                            " • Sisa ${packageActive!.activePeriod.days} hari lagi",
                            color: TColors.neutralDarkLight,
                          ),
                      ],
                    )
                  : Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: const Color(0xFFE8E9F1),
                          highlightColor: const Color(0xFFF8F9FE),
                          child: Container(
                            height: 16,
                            width: 100,
                            decoration: BoxDecoration(
                              color: TColors.neutralLightLightest,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        TextBodyM(" • ", color: TColors.neutralDarkLight),
                        Shimmer.fromColors(
                          baseColor: const Color(0xFFE8E9F1),
                          highlightColor: const Color(0xFFF8F9FE),
                          child: Container(
                            height: 12,
                            width: 120,
                            decoration: BoxDecoration(
                              color: TColors.neutralLightLightest,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),

        const SizedBox(height: 20),
        // Highlighted Table
        PackageComparisonTable(
          packages: packageData,
          peviousPackage: previousPackage,
          currentPackage: currentPackage,
        ),
      ],
    );
  }
}
