import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/cashier/order_outlet/filter/sort_radio_tile.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:order_repository/order_repository.dart';

class OrderOutletAdvancedFilter extends StatefulWidget {
  final FindAllOrderDto value;
  final ValueChanged<FindAllOrderDto> onFilterChanged;

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
  String? selectedStatusValue;

  List<LabelValue> sorts = [
    const LabelValue<String>(label: "Terbaru", value: "NEWEST"),
    const LabelValue<String>(label: "Terlama", value: "OLDERS"),
    const LabelValue<String>(label: "Transaksi terbanyak", value: "HIGHEST"),
    const LabelValue<String>(label: "Transaksi tersedikit", value: "CHEAPEST"),
  ];

  List<LabelValue<String>> statuses = [
    const LabelValue(label: "Berlangsung", value: "OPEN"),
    const LabelValue(label: "Selesai", value: "COMPLETED"),
    const LabelValue(label: "Terhutang", value: "CLOSED"),
    const LabelValue(label: "Dibatalkan", value: "CANCELLED"),
  ];

  @override
  void initState() {
    super.initState();
    selectedSortValue = widget.value.sort ?? "NEWEST";
    selectedStatusValue = widget.value.status;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 16,
              ),
              child: TextHeading2("Filter"),
            ),
          ],
        ),
        Row(
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
        SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextHeading3("Status"),
            ),
          ],
        ),
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            spacing: 8.0,
            children: statuses.map((status) {
              bool selected = status.value == selectedStatusValue;
              return InputChip(
                label: selected
                    ? TextHeading4(
                        status.label,
                        color: TColors.primary,
                      )
                    : TextBodyM(
                        status.label,
                        color: TColors.neutralDarkDarkest,
                      ),
                selected: selected,
                onPressed: () {
                  setState(() {
                    selectedStatusValue = status.value;
                  });
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
          padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {
                      widget.onFilterChanged(
                        widget.value.copyWith(
                          sort: "NEWEST",
                          status: "ALL",
                        ),
                      );
                      Navigator.pop(context, {'isFilterUsed': false});
                    },
                    child: TextActionL(
                      "Hapus",
                      color: TColors.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onFilterChanged(
                        widget.value.copyWith(
                          sort: selectedSortValue,
                          status: selectedStatusValue,
                        ),
                      );
                      Navigator.pop(context, {'isFilterUsed': true});
                    },
                    child: TextActionL(
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
