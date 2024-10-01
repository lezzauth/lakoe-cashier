import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_filter_state.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_state.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master_location/table_master_location_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/filter/table_location_filter.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/pages/table_detail_page.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:table_location_repository/table_location_repository.dart';
import 'package:table_repository/table_repository.dart';

class TableMasterScreen extends StatelessWidget {
  const TableMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TableMasterFilterCubit(),
      child: const TableMaster(),
    );
  }
}

class TableMaster extends StatefulWidget {
  const TableMaster({super.key});

  @override
  State<TableMaster> createState() => _TableMasterState();
}

class _TableMasterState extends State<TableMaster> {
  Future<void> _onRefresh() async {
    if (!mounted) return;

    context.read<TableMasterLocationCubit>().findAll(FindAllTableLocationDto());
    await context.read<TableMasterCubit>().init();
  }

  Future<void> _onGoToDetail(TableModel table) async {
    bool? editedProduct = await showModalBottomSheet<bool?>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      useRootNavigator: true,
      builder: (context) {
        return CustomBottomsheet(
          child: Expanded(
            child: TableDetailPage(
              table: table,
            ),
          ),
        );
      },
    );
    if (editedProduct != true) return;
    _onRefresh();
  }

  Future<void> _onGoToCreateScreen() async {
    bool? newTable = await Navigator.pushNamed(context, "/tables/new") as bool?;
    if (newTable != true) return;
    _onRefresh();
  }

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TableMasterFilterCubit, TableMasterFilterState>(
          listener: (context, state) {
            context.read<TableMasterCubit>().findAll(
                  FindAllTableDto(
                    outletRoomId: state.outletRoomId,
                  ),
                );
          },
        )
      ],
      child: Scaffold(
        appBar: CustomAppbar(
          title: "Meja & QR Order",
          actions: [
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {},
              icon: const UiIcons(
                TIcons.download,
                height: 20,
                width: 20,
                color: TColors.primary,
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: BlocBuilder<TableMasterFilterCubit, TableMasterFilterState>(
                builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                child: TableLocationFilter(
                  value: state.outletRoomId,
                  onChanged: (value) {
                    context
                        .read<TableMasterFilterCubit>()
                        .setFilter(outletRoomId: value);
                  },
                ),
              );
            }),
          ),
        ),
        body: Scrollbar(
          child: RefreshIndicator(
            backgroundColor: TColors.neutralLightLightest,
            onRefresh: _onRefresh,
            child: BlocBuilder<TableMasterCubit, TableMasterState>(
                builder: (context, state) => switch (state) {
                      TableMasterLoadSuccess(:final tables) => ListView.builder(
                          itemCount: tables.length,
                          itemBuilder: (context, index) {
                            TableModel table = tables.elementAt(index);

                            bool isFreeTable = table.id == "-";

                            String title = table.no;
                            String subtitle =
                                "${table.capacity} Orang • Indoor";

                            if (isFreeTable) {
                              title = "Bebas";
                              subtitle = "-";
                            }

                            return Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1,
                                    color: TColors.neutralLightMedium,
                                  ),
                                ),
                              ),
                              child: ListTile(
                                onTap: isFreeTable
                                    ? null
                                    : () {
                                        _onGoToDetail(table);
                                      },
                                splashColor: TColors.highlightLightest,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                leading: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: TColors.highlightLightest,
                                  ),
                                  child: const Center(
                                    child: UiIcons(
                                      TIcons.tableRestaurant,
                                      color: TColors.primary,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                ),
                                title: TextHeading4(
                                  title,
                                  color: TColors.neutralDarkDarkest,
                                ),
                                subtitle: TextBodyS(
                                  subtitle,
                                  color: TColors.neutralDarkLight,
                                ),
                                trailing: isFreeTable
                                    ? null
                                    : const UiIcons(
                                        TIcons.arrowRight,
                                        color: TColors.neutralDarkLightest,
                                        height: 12,
                                        width: 12,
                                      ),
                              ),
                            );
                          },
                        ),
                      TableMasterLoadFailure(:final error) => Center(
                          child: TextBodyS(
                            error,
                            color: TColors.error,
                          ),
                        ),
                      _ => const Center(
                          child: CircularProgressIndicator(),
                        ),
                    }),
          ),
        ),
        floatingActionButton: SizedBox(
          height: 48,
          width: 48,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            onPressed: _onGoToCreateScreen,
            elevation: 0,
            child: const Icon(
              Icons.add,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
