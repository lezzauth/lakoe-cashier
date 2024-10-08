import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
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

class TableDetailPage extends StatelessWidget {
  const TableDetailPage({super.key, required this.table});

  final TableModel table;

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
                      "Detail Meja ${table.no}",
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
                                  subTitle: "${table.capacity} Orang",
                                  icon: const UiIcons(
                                    TIcons.profile,
                                    height: 20,
                                    width: 20,
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
                                                              table
                                                                  .outletRoomId)
                                                      ?.name ??
                                                  "-",
                                              icon: const UiIcons(
                                                TIcons.map,
                                                height: 16,
                                                width: 16,
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
                        PreviewQrTable(
                          table.id,
                          // color: HexColor("#06B6D4"),
                          tableNumber: table.no,
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
                          arguments: table,
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
