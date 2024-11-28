import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/cashier/order_outlet/filter/sort_radio_tile.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

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
  String? selectedTypesValue;

  List<LabelValue> sorts = [
    const LabelValue<String>(label: "Terbaru", value: "NEWEST"),
    const LabelValue<String>(label: "Terlama", value: "OLDERS"),
    const LabelValue<String>(label: "Transaksi terbanyak", value: "HIGHEST"),
    const LabelValue<String>(label: "Transaksi tersedikit", value: "CHEAPEST"),
  ];

  List<LabelValue<String>> types = [
    const LabelValue(label: "Makan di tempat", value: "DINEIN"),
    const LabelValue(label: "Dibungkus", value: "TAKEAWAY"),
  ];

  @override
  void initState() {
    super.initState();
    selectedSortValue = widget.value.sort ?? "NEWEST";
    selectedTypesValue = widget.value.type;
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
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextHeading2("Filter"),
            ),
          ],
        ),
        SizedBox(height: 12),
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
              child: TextHeading3("Jenis Pesanan"),
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
            children: types.map((type) {
              bool selected = type.value == selectedTypesValue;
              return InputChip(
                label: selected
                    ? TextHeading4(
                        type.label,
                        color: TColors.primary,
                      )
                    : TextBodyM(
                        type.label,
                        color: TColors.neutralDarkDarkest,
                      ),
                selected: selected,
                onPressed: () {
                  setState(() {
                    if (selected) {
                      selectedTypesValue = null;
                    } else {
                      selectedTypesValue = type.value;
                    }
                  });
                },
              );
            }).toList(),
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
                          type: "ALL",
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
                    onPressed: (selectedSortValue == "NEWEST" &&
                            selectedTypesValue == null)
                        ? null
                        : () {
                            widget.onFilterChanged(
                              widget.value.copyWith(
                                sort: selectedSortValue,
                                type: selectedTypesValue,
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
