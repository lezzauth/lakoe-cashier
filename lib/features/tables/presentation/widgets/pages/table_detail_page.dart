import 'package:app_data_provider/app_data_provider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/responsive/responsive_layout.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/cards/card_order.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master_location/table_master_location_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master_location/table_master_location_state.dart';
import 'package:point_of_sales_cashier/features/tables/common/widgets/preview_qr_table.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:table_repository/table_repository.dart';

class TableDetailPage extends StatefulWidget {
  const TableDetailPage({
    super.key,
    required this.table,
    required this.tableNo,
  });
  final TableModel table;
  final String tableNo;

  @override
  State<TableDetailPage> createState() => _TableDetailPageState();
}

class _TableDetailPageState extends State<TableDetailPage> {
  final AppDataProvider _appDataProvider = AppDataProvider();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: TextHeading2(
                      "Detail Meja ${widget.table.no}",
                      color: TColors.neutralDarkDarkest,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CardOrder(
                                  title: "Kapasitas",
                                  subTitle: "${widget.table.capacity} Orang",
                                  icon: const UiIcons(
                                    TIcons.profile,
                                    size: 20,
                                    color: TColors.primary,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              Expanded(
                                flex: 1,
                                child: BlocBuilder<TableMasterLocationCubit,
                                        TableMasterLocationState>(
                                    builder: (context, state) =>
                                        switch (state) {
                                          TableMasterLocationLoadSuccess(
                                            :final locations
                                          ) =>
                                            CardOrder(
                                              title: "Lokasi",
                                              subTitle: locations
                                                      .firstWhereOrNull(
                                                          (item) =>
                                                              item.id ==
                                                              widget.table
                                                                  .outletRoomId)
                                                      ?.name ??
                                                  "-",
                                              icon: const UiIcons(
                                                TIcons.map,
                                                size: 16,
                                                color: TColors.primary,
                                              ),
                                            ),
                                          _ => const SizedBox(
                                              height: 32,
                                              width: 32,
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                        }),
                              ),
                            ],
                          ),
                        ),
                        const TextHeading3(
                          "Tampilan QR Order",
                          color: TColors.neutralDarkDarkest,
                        ),
                        const SizedBox(height: 12.0),
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

                              return ResponsiveLayout(
                                mobile: PreviewQrTable(
                                  widget.table.id,
                                  logo: logoBrandData ?? "",
                                  colorBrand: argColorInt,
                                  tableNumber: widget.table.no,
                                ),
                                tablet: Center(
                                  child: SizedBox(
                                    width: 450,
                                    child: PreviewQrTable(
                                      widget.table.id,
                                      logo: logoBrandData ?? "",
                                      colorBrand: argColorInt,
                                      tableNumber: widget.table.no,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return PreviewQrTable(
                                widget.table.id,
                                logo: "",
                                colorBrand: 0xFFFD6E00,
                                tableNumber: widget.table.no,
                              );
                            }
                          },
                        ),
                      ],
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
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () async {
                        bool? editedProduct = await Navigator.pushNamed(
                          context,
                          "/tables/edit",
                          arguments: widget.table,
                        ) as bool?;
                        if (editedProduct != true) return;
                        Navigator.pop(context, true);
                      },
                      child: const TextActionL(
                        "Ubah Meja",
                        color: TColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
