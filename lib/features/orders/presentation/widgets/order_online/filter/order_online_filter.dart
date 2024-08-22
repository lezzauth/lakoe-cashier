import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/data/models.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/widgets/order_outlet/filter/order_outlet_advanced_filter.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

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
                    ? TextHeading5(
                        filter.label,
                        color: TColors.primary,
                      )
                    : TextBodyS(
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
