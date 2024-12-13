import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/features/packages/presentation/screens/package_master.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class CardPackageItem extends StatelessWidget {
  const CardPackageItem({super.key, required this.data});

  final List<ModelItemPackage> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        children: data
            .map((item) => Container(
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: TColors.neutralLightMedium,
                      width: 1,
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: SvgPicture.asset(
                          TImages.pakcageWaves,
                          colorFilter: ColorFilter.mode(
                            item.color,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              item.logo,
                              height: 28,
                            ),
                            SizedBox(height: 12),
                            TextBodyM(
                              item.description,
                              color: TColors.neutralDarkLight,
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (item.price != 0)
                                      TextHeading5(
                                        "Mulai dari",
                                        color: TColors.neutralDarkLightest,
                                      ),
                                    TextHeading2(
                                      item.price == 0
                                          ? "Gratis"
                                          : TFormatter.formatToRupiah(
                                              item.price),
                                      color: TColors.neutralDarkDark,
                                    ),
                                  ],
                                ),
                                if (item.isActive == false &&
                                    item.name != "LITE")
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        "/packages/detail",
                                        arguments: {'packageName': item.name},
                                      );
                                    },
                                    style: ButtonStyle(
                                      minimumSize: WidgetStateProperty.all(
                                        Size(0, 36),
                                      ),
                                      padding: WidgetStateProperty.all(
                                        EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                      ),
                                    ),
                                    child: TextActionL("Cek Detail"),
                                  ),
                                if (item.isActive == true)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: TColors.neutralLightMedium,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const TextHeading5(
                                      "Paket kamu saat ini",
                                      color: TColors.neutralDarkDark,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
