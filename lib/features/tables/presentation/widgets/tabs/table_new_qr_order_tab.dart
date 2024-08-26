import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/bottom_sheet/download_qr_order_content.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/device/device_uility.dart';

class TableNewQrOrderTab extends StatefulWidget {
  const TableNewQrOrderTab({super.key});

  @override
  State<TableNewQrOrderTab> createState() => _TableNewQrOrderTabState();
}

class _TableNewQrOrderTabState extends State<TableNewQrOrderTab> {
  String _selectedDownload = "current";

  @override
  Widget build(BuildContext context) {
    showDownloadQR() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        useSafeArea: true,
        builder: (context) {
          return const DownloadQrOrderContent();
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
                Container(
                  height: 485.39,
                  decoration: BoxDecoration(
                    color: TColors.neutralLightLight,
                    border: Border.all(
                      width: 1,
                      color: TColors.neutralLightDark,
                    ),
                  ),
                ),
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
                    onPressed: showDownloadQR,
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
      child: ListTileTheme(
        horizontalTitleGap: 0,
        child: RadioListTile<String>(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          dense: true,
          title: TextHeading4(title),
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          contentPadding: const EdgeInsets.all(0),
        ),
      ),
    );
  }
}
