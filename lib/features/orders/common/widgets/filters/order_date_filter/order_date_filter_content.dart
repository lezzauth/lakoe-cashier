import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/form/date_range_picker.dart';
import 'package:lakoe_pos/common/widgets/tiles/custom_radio_tile.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/features/orders/common/widgets/filters/order_date_filter.dart';

class OrderDateFilterContent extends StatefulWidget {
  const OrderDateFilterContent({
    super.key,
    this.from,
    this.to,
    this.template = "ALL",
  });

  final String? from;
  final String? to;
  final String template;

  @override
  State<OrderDateFilterContent> createState() => _OrderDateFilterContentState();
}

class _OrderDateFilterContentState extends State<OrderDateFilterContent> {
  String _groupValue = "ALL";

  final List<LabelValue> _templates = [
    const LabelValue(label: "Semua tanggal transaksi", value: "ALL"),
    const LabelValue(label: "30 Hari terakhir", value: "LAST30DAY"),
    const LabelValue(label: "90 Hari terakhir", value: "LAST90DAY"),
    const LabelValue(label: "Tentukan tanggal sendiri", value: "CUSTOM"),
  ];

  void _onSubmit() {
    Navigator.pop(context, OrderDateFilterValue(template: _groupValue));
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _groupValue = widget.template;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
            child: const TextHeading2("Pilih tanggal"),
          ),
          ..._templates.map((template) {
            return CustomRadioTile(
              title: template.label,
              value: template.value,
              groupValue: _groupValue,
              onChanged: (value) {
                setState(() {
                  _groupValue = value!;
                });
              },
            );
          }),
          if (_groupValue == "CUSTOM")
            DateRangePicker(
              hideLabel: true,
              from: widget.from == null
                  ? DateTime.now()
                  : DateTime.parse(widget.from!).toLocal(),
              to: widget.to == null
                  ? DateTime.now()
                  : DateTime.parse(widget.to!).toLocal(),
              onSubmit: ({from, to}) {
                final customFrom =
                    DateTime(from!.year, from.month, from.day, 00, 00, 00, 000);
                final customTo =
                    DateTime(to!.year, to.month, to.day, 23, 59, 59, 999);
                Navigator.pop(
                  context,
                  OrderDateFilterValue(
                    template: "CUSTOM",
                    from: customFrom,
                    to: customTo,
                  ),
                );
              },
            ),
          if (_groupValue != "CUSTOM")
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _onSubmit,
                        child: const TextActionL("Pasang"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
