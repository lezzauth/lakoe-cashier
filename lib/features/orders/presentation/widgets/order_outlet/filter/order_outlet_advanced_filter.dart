import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/data/models.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/widgets/order_outlet/filter/sort_radio_tile.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class OrderOutletAdvancedFilter extends StatefulWidget {
  final Function() onFilterChanged;

  const OrderOutletAdvancedFilter({super.key, required this.onFilterChanged});

  @override
  State<OrderOutletAdvancedFilter> createState() =>
      _OrderOutletAdvancedFilterState();
}

class _OrderOutletAdvancedFilterState extends State<OrderOutletAdvancedFilter> {
  String _sortValue = "newest";

  List<LabelValue> sorts = [
    const LabelValue<String>(label: "Terbaru", value: "newest"),
    const LabelValue<String>(label: "Terlama", value: "oldest"),
    const LabelValue<String>(
        label: "Transaksi terbanyak", value: "highest_transaction"),
    const LabelValue<String>(
        label: "Transaksi tersedikit", value: "lowest_transaction"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(bottom: 16),
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
          (e) => SortRadioTile<String>(
            value: e.value,
            groupValue: _sortValue,
            onChanged: (value) {
              setState(() {
                _sortValue = value!;
              });
            },
            title: e.label,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: "Pesan dari QR Meja",
                  style: GoogleFonts.inter(
                    fontSize: TSizes.fontSizeHeading3,
                    color: TColors.neutralDarkDarkest,
                    fontWeight: FontWeight.w700,
                  ),
                ),
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
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {},
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
                      widget.onFilterChanged();
                      Navigator.pop(context);
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
