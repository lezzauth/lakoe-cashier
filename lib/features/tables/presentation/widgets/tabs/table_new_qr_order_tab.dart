import 'package:app_data_provider/app_data_provider.dart';
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
  final AppDataProvider _appDataProvider = AppDataProvider();

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
                FutureBuilder<List<String?>>(
                  future: Future.wait([
                    _appDataProvider.colorBrand,
                    _appDataProvider.logoBrand,
                  ]),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      final String? colorBrandData = snapshot.data![0];
                      final String? logoBrandData = snapshot.data![1];

                      int argColorInt = 0xFFFD6E00;
                      if (colorBrandData != null) {
                        argColorInt = int.parse(
                            colorBrandData.replaceFirst("0x", ""),
                            radix: 16);
                      }

                      return PreviewQrTable(
                        widget.table?.id ?? DateTime.timestamp().toString(),
                        logo: logoBrandData ?? "",
                        colorBrand: argColorInt,
                        tableNumber: widget.table?.no ?? "T-00",
                      );
                    } else {
                      return PreviewQrTable(
                        widget.table?.id ?? DateTime.timestamp().toString(),
                        logo: "",
                        colorBrand: 0xFFFD6E00,
                        tableNumber: widget.table?.no ?? "T-01",
                      );
                    }
                  },
                ),
                if (widget.table != null)
                  TextButton(
                    onPressed: () {},
                    child: TextActionL(
                      "Download QR Order",
                      color: TColors.primary,
                    ),
                  ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Expanded(
            child: SizedBox(
              height: 48,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/tables/edit/brand");
                },
                child: TextActionL(
                  "Ubah Logo & Warna",
                  color: TColors.primary,
                ),
              ),
            ),
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
