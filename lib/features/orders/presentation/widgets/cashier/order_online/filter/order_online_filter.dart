import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class OrderOnlineFilter extends StatefulWidget {
  const OrderOnlineFilter({super.key});

  @override
  State<OrderOnlineFilter> createState() => _OrderOnlineFilterState();
}

class _OrderOnlineFilterState extends State<OrderOnlineFilter> {
  String _activeFilter = "new";

  final List<LabelValue<String>> _filters = [
    const LabelValue(label: "Pesanan Baru", value: "new"),
    const LabelValue(label: "Diproses", value: "on_progress"),
    const LabelValue(label: "Selesai", value: "done"),
    const LabelValue(label: "Ditolak", value: "declined"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            spacing: 8.0,
            children: _filters.map((filter) {
              bool selected = filter.value == _activeFilter;

              return InputChip(
                label: selected
                    ? TextHeading4(
                        filter.label,
                        color: TColors.primary,
                      )
                    : TextBodyM(
                        filter.label,
                        color: TColors.neutralDarkDarkest,
                      ),
                selected: selected,
                onPressed: () {
                  setState(() {
                    _activeFilter = filter.value;
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
