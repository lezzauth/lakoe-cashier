import 'package:flutter/material.dart';
import 'package:package_repository/package_repository.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/features/account/presentation/widgets/table_comparison.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class DetailPackage extends StatelessWidget {
  const DetailPackage({
    super.key,
    required this.index,
    required this.packageData,
    required this.litePackage,
    required this.upgradedPackage,
  });

  final int index;
  final List<PackagePriceModel> packageData;
  final PackageModel litePackage;
  final PackageModel upgradedPackage;

  @override
  Widget build(BuildContext context) {
    final package = packageData[index];
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
              Row(
                children: [
                  TextHeading3(
                    "08 Feb 2025",
                    color: TColors.neutralDarkDark,
                  ),
                  TextBodyM(
                    " • 3 bulan 21 hari",
                    color: TColors.neutralDarkLight,
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),
        // Highlighted Table
        PackageComparisonTable(
          package: package,
          litePackage: litePackage,
          upgradedPackage: upgradedPackage,
        ),
      ],
    );
  }
}
