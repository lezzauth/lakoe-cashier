import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/tiles/custom_radio_tile.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';

class FilterStatusContent extends StatefulWidget {
  const FilterStatusContent({super.key, required this.status});

  final String status;

  @override
  State<FilterStatusContent> createState() => _FilterStatusContentState();
}

class _FilterStatusContentState extends State<FilterStatusContent> {
  String? selectedStatus;

  final List<LabelValue<String>> _statuses = [
    const LabelValue(label: "Semua Status", value: "ALL"),
    const LabelValue(label: "Berlangsung", value: "OPEN"),
    const LabelValue(label: "Selesai", value: "COMPLETED"),
    const LabelValue(label: "Terhutang", value: "CLOSED"),
    const LabelValue(label: "Dibatalkan", value: "CANCELLED"),
  ];

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.status;
  }

  void _applyStatus() {
    Navigator.pop(context, selectedStatus);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextHeading2("Pilih status REPORT"),
          ),
          ..._statuses.map((status) {
            return CustomRadioTile(
              title: status.label,
              value: status.value,
              groupValue: selectedStatus,
              onChanged: (value) {
                setState(() {
                  selectedStatus = value!;
                });
              },
            );
          }),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _applyStatus,
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
