import 'package:app_data_provider/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/form/custom_radio.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/outlets/application/outlet_cubit.dart';
import 'package:lakoe_pos/features/tables/common/widgets/preview_qr_table.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:table_repository/table_repository.dart';

class TableQrOrderTab extends StatefulWidget {
  const TableQrOrderTab({super.key, this.table});

  final TableModel? table;

  @override
  State<TableQrOrderTab> createState() => _TableQrOrderTabState();
}

class _TableQrOrderTabState extends State<TableQrOrderTab> {
  final AppDataProvider _appDataProvider = AppDataProvider();

  @override
  Widget build(BuildContext context) {
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
                        tableNumber: widget.table?.no ?? "T-00",
                      );
                    }
                  },
                ),
                SizedBox(height: 12),
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
          padding: EdgeInsets.all(20.0),
          child: SizedBox(
            height: 48,
            child: OutlinedButton(
              onPressed: () async {
                bool? result =
                    await Navigator.pushNamed(context, "/tables/edit/brand")
                        as bool?;

                if (result == true) {
                  if (mounted) {
                    context.read<OutletCubit>().init();
                  }
                }
              },
              child: TextActionL(
                "Ubah Logo & Warna",
                color: TColors.primary,
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
