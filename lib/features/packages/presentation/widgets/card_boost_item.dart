import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/separator/separator.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class CardBoostItem extends StatelessWidget {
  const CardBoostItem({super.key, required this.data});

  final List data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
          children: data
              .map(
                (item) => Container(
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: TColors.neutralLightMedium,
                      width: 1,
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextHeading3(
                            item.title,
                            color: TColors.neutralDarkDarkest,
                          ),
                          TextBodyM(
                            item.subtitle,
                            color: TColors.neutralDarkLightest,
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      const Separator(
                        color: TColors.neutralLightMedium,
                        height: 1,
                        dashWidth: 5.0,
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (item.price != 0)
                                TextBodyS(
                                  "Mulai dari",
                                  color: TColors.neutralDarkLightest,
                                ),
                              TextHeading2(
                                TFormatter.formatToRupiah(item.price),
                                color: TColors.neutralDarkDark,
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                item.routeName,
                                arguments: {
                                  'id': item.id,
                                  'title': item.title,
                                  'subtitle': item.subtitle,
                                },
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
                        ],
                      ),
                    ],
                  ),
                ),
              )
              .toList()),
    );
  }
}
