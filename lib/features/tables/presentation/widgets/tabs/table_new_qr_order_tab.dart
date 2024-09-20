import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/form/custom_radio.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/tables/common/widgets/preview_qr_table.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/bottom_sheet/download_qr_order_content.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:table_repository/table_repository.dart';

class TableNewQrOrderTab extends StatefulWidget {
  const TableNewQrOrderTab({super.key, this.table});

  final TableModel? table;

  @override
  State<TableNewQrOrderTab> createState() => _TableNewQrOrderTabState();
}

class _TableNewQrOrderTabState extends State<TableNewQrOrderTab> {
  @override
  Widget build(BuildContext context) {
    showDownloadQR() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (context) {
          return const CustomBottomsheet(
            child: DownloadQrOrderContent(),
          );
        },
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                PreviewQrTable(
                  widget.table?.id ?? DateTime.timestamp().toString(),
                  // color: HexColor("#06B6D4"),
                  tableNumber: widget.table?.no ?? "Example",
                )
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
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const TextActionL(
                      "Edit Brand",
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
                    onPressed: showDownloadQR,
                    child: const TextActionL(
                      "Download",
                      color: TColors.neutralLightLightest,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class DownloadItemRadio extends StatelessWidget {
  const DownloadItemRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  });

  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == groupValue;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? TColors.primary : TColors.neutralLightMedium,
          width: 1,
        ),
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => onChanged(value),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CustomRadio(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
              const SizedBox(width: 12),
              TextHeading4(
                title,
                color: TColors.neutralDarkDarkest,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
