import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/cashier/order_outlet/filter/sort_radio_tile.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';

class OrderOutletAdvancedFilter extends StatefulWidget {
  final FindAllOrderCashierDto value;
  final ValueChanged<FindAllOrderCashierDto> onFilterChanged;

  const OrderOutletAdvancedFilter({
    super.key,
    required this.value,
    required this.onFilterChanged,
  });

  @override
  State<OrderOutletAdvancedFilter> createState() =>
      _OrderOutletAdvancedFilterState();
}

class _OrderOutletAdvancedFilterState extends State<OrderOutletAdvancedFilter> {
  late String selectedSortValue;

  List<LabelValue> sorts = [
    const LabelValue<String>(label: "Terbaru", value: "NEWEST"),
    const LabelValue<String>(label: "Terlama", value: "OLDERS"),
    const LabelValue<String>(label: "Transaksi terbanyak", value: "HIGHEST"),
    const LabelValue<String>(label: "Transaksi tersedikit", value: "CHEAPEST"),
  ];

  @override
  void initState() {
    super.initState();
    selectedSortValue = widget.value.sort ?? "NEWEST";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 16,
              ),
              child: const TextHeading2("Filter"),
            ),
          ],
        ),
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextHeading3("Urutkan"),
            ),
          ],
        ),
        ...sorts.map(
          (e) => SortRadioTile(
            title: e.label,
            value: e.value,
            groupValue: selectedSortValue,
            onChanged: (value) {
              setState(() {
                selectedSortValue = value!;
              });
            },
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    text: "Dine In",
                    style: GoogleFonts.inter(
                      fontSize: TSizes.fontSizeHeading3,
                      color: TColors.neutralDarkDarkest,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: " (Makan di tempat)",
                        style: GoogleFonts.inter(
                          fontSize: TSizes.fontSizeHeading3,
                          color: TColors.neutralDarkMedium,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ]),
              ),
              SizedBox(
                height: 28,
                child: Switch(
                  value: true,
                  onChanged: (value) {},
                ),
              )
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       RichText(
        //         text: TextSpan(
        //           text: "Pesan dari QR Meja",
        //           style: GoogleFonts.inter(
        //             fontSize: TSizes.fontSizeHeading3,
        //             color: TColors.neutralDarkDarkest,
        //             fontWeight: FontWeight.w700,
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 28,
        //         child: Switch(
        //           value: true,
        //           onChanged: (value) {},
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        {
                          'isFilterUsed': false,
                          'sort': "NEWEST",
                        },
                      );
                    },
                    child: const TextActionL(
                      "Hapus",
                      color: TColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onFilterChanged(
                        widget.value.copyWith(
                          sort: selectedSortValue,
                        ),
                      );
                      Navigator.pop(
                        context,
                        {
                          'isFilterUsed': true,
                          'sort': selectedSortValue,
                        },
                      );
                    },
                    child: const TextActionL(
                      "Pasang",
                      color: TColors.neutralLightLightest,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
