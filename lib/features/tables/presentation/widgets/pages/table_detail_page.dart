import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/cards/card_order.dart';
import 'package:point_of_sales_cashier/features/tables/common/widgets/preview_qr_table.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/helpers/helper.dart';
import 'package:table_repository/table_repository.dart';

class TableDetailPage extends StatelessWidget {
  const TableDetailPage({super.key, required this.table});

  final TableModel table;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextHeading2(
                      "Detail Meja ${table.no}",
                      color: TColors.neutralDarkDarkest,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: CardOrder(
                                  title: "Kapasitas",
                                  subTitle: "${table.capacity} Orang",
                                  icon: const UiIcons(
                                    TIcons.profile,
                                    height: 20,
                                    width: 20,
                                    color: TColors.primary,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              Flexible(
                                flex: 1,
                                child: CardOrder(
                                  title: "Lokasi",
                                  subTitle: "Indoor",
                                  icon: UiIcons(
                                    TIcons.map,
                                    height: 24,
                                    width: 24,
                                    color: TColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const TextHeading3(
                          "Tampilan QR Order",
                          color: TColors.neutralDarkDarkest,
                        ),

                        PreviewQrTable(
                          table.id,
                          // color: HexColor("#06B6D4"),
                          tableNumber: table.no,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: TColors.neutralLightLight,
                        //     border: Border.all(
                        //       width: 1,
                        //       color: TColors.neutralLightDark,
                        //     ),
                        //   ),
                        //   child:
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const TextActionL(
                        "Download",
                        color: TColors.neutralLightLightest,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const TextActionL(
                        "Ubah Meja",
                        color: TColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
