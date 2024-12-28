import 'package:flutter/material.dart';
import 'package:package_repository/package_repository.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_1.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/features/packages/presentation/widgets/table_comparison.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class PriceInfoSection extends StatelessWidget {
  const PriceInfoSection({
    super.key,
    required this.index,
    required this.packageData,
    required this.currentPackage,
    required this.upgradedPackage,
  });

  final int index;
  final List<PackagePriceModel> packageData;
  final PackageModel currentPackage;
  final PackageModel upgradedPackage;

  @override
  Widget build(BuildContext context) {
    final package = packageData[index];
    return Column(
      children: [
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextHeading1(
                    TFormatter.formatToRupiah(package.pricePerMonth),
                    color: TColors.neutralDarkDarkest,
                    fontWeight: FontWeight.w900,
                  ),
                  const SizedBox(width: 4),
                  const TextBodyL(
                    "/bulan",
                    color: TColors.neutralDarkLightest,
                  ),
                  const SizedBox(width: 4),
                  if (package.discount != 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: TColors.errorLight,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: TextHeading5(
                        "Diskon ${package.discount}%",
                        color: TColors.error,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              if (package.discount == 0)
                const TextBodyL(
                  "Cocok buat bisnis yang mulai tumbuh",
                  color: TColors.neutralDarkLightest,
                ),
              if (package.discount != 0)
                Row(
                  children: [
                    const TextBodyL(
                      "Cuma bayar",
                      color: TColors.neutralDarkLightest,
                    ),
                    SizedBox(width: 4),
                    TextHeading3(
                      TFormatter.formatToRupiah(package.price),
                      color: TColors.neutralDarkDarkest,
                    ),
                    SizedBox(width: 4),
                    TextBodyL(
                      TFormatter.formatToRupiah(package.originPrice),
                      color: TColors.neutralDarkLightest,
                      decoration: TextDecoration.lineThrough,
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
          currentPackage: currentPackage,
          upgradedPackage: upgradedPackage,
        ),
      ],
    );
  }
}
