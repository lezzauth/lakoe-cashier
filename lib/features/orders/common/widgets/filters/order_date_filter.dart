import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/features/orders/common/widgets/filters/order_date_filter/order_date_filter_content.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';

class OrderDateFilter extends StatefulWidget {
  const OrderDateFilter({
    super.key,
    this.from,
    this.to,
    this.template = "ALL",
    required this.onChanged,
  });

  final String? from;
  final String? to;
  final String template;
  final Function(
    String template,
    DateTime? from,
    DateTime? to,
  ) onChanged;

  @override
  State<OrderDateFilter> createState() => _OrderDateFilterState();
}

class _OrderDateFilterState extends State<OrderDateFilter> {
  String _display() {
    if (widget.template == "LAST90DAY") return "90 Hari terakhir";
    if (widget.template == "LAST30DAY") return "30 Hari terakhir";

    if (widget.from == null || widget.to == null) return "Semua Tanggal";

    DateTime parsedFrom = DateTime.parse(widget.from!).toLocal();
    DateTime parsedTo = DateTime.parse(widget.to!).toLocal();

    String formattedFrom =
        DateFormat("dd MMM yyyy", "id_ID").format(parsedFrom);
    String formattedTo = DateFormat("dd MMM yyyy", "id_ID").format(parsedTo);

    return "$formattedFrom - $formattedTo";
  }

  Future<void> _onSelected() async {
    OrderDateFilterValue? value =
        await showModalBottomSheet<OrderDateFilterValue?>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CustomBottomsheet(
          child: OrderDateFilterContent(
            template: widget.template,
            from: widget.from,
            to: widget.to,
          ),
        );
      },
    );
    if (value == null) return;

    widget.onChanged(value.template, value.from, value.to);
  }

  @override
  Widget build(BuildContext context) {
    bool isNotEmpty = widget.to != null && widget.from != null;

    return FilterChip(
      onSelected: (value) {
        _onSelected();
      },
      onDeleted: isNotEmpty
          ? () {
              widget.onChanged("ALL", null, null);
            }
          : null,
      deleteIconColor: TColors.neutralDarkLightest,
      clipBehavior: Clip.antiAlias,
      label: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextBodyM(_display()),
          if (!isNotEmpty) ...[
            const SizedBox(width: 8),
            const UiIcons(
              TIcons.arrowDown,
              size: 12,
              color: TColors.neutralDarkLightest,
            ),
          ]
        ],
      ),
    );
  }
}

class OrderDateFilterValue {
  final DateTime? from;
  final DateTime? to;
  final String template;

  OrderDateFilterValue({this.from, this.to, required this.template});
}
