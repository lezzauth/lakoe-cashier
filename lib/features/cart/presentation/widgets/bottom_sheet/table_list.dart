import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_filter_state.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_state.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master_location/table_master_location_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/filter/table_location_filter.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:table_repository/table_repository.dart';

class TableList extends StatelessWidget {
  const TableList({super.key, this.value});

  final TableModel? value;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TableMasterCubit()),
        BlocProvider(create: (context) => TableMasterFilterCubit()),
        BlocProvider(create: (context) => TableMasterLocationCubit()),
      ],
      child: TableListContent(value: value),
    );
  }
}

class TableListContent extends StatefulWidget {
  const TableListContent({super.key, this.value});

  final TableModel? value;

  @override
  State<TableListContent> createState() => _TableListContentState();
}

class _TableListContentState extends State<TableListContent> {
  Future<void> _onInit() async {
    if (!mounted) return;

    context.read<TableMasterLocationCubit>().findAll();
    context.read<TableMasterCubit>().init();
  }

  @override
  void initState() {
    super.initState();
    _onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TableMasterFilterCubit, TableMasterFilterState>(
      listener: (context, state) {
        context.read<TableMasterCubit>().findAll(FindAllTableDto(
              outletRoomId: state.outletRoomId,
            ));
      },
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: const TextHeading2("Pilih nomor meja"),
            ),
            BlocBuilder<TableMasterFilterCubit, TableMasterFilterState>(
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
              },
            ),
            Expanded(
                child: BlocBuilder<TableMasterCubit, TableMasterState>(
              builder: (context, state) => switch (state) {
                TableMasterLoadSuccess(:final tables) => ListView.builder(
                    itemCount: tables.length,
                    itemBuilder: (context, index) {
                      TableModel table = tables.elementAt(index);

                      bool isFreeTable = table.id == "-";

                      String title = table.no;
                      String subtitle = "${table.capacity} Orang • Indoor";

                      bool selected = table.id == (widget.value?.id ?? "-");

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
                        ))),
                        child: ListTile(
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: TColors.highlightLightest,
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            child: const Center(
                              child: UiIcons(
                                TIcons.tableRestaurant,
                                size: 20,
                                color: TColors.primary,
                              ),
                            ),
                          ),
                          title: TextHeading4(title),
                          subtitle: TextBodyS(
                            subtitle,
                            color: TColors.neutralDarkLight,
                          ),
                          onTap: () {
                            Navigator.pop(
                              context,
                              isFreeTable ? null : table,
                            );
                          },
                          trailing: selected
                              ? const UiIcons(
                                  TIcons.check,
                                  size: 16,
                                  color: TColors.primary,
                                )
                              : const UiIcons(
                                  TIcons.arrowRight,
                                  size: 12,
                                  color: TColors.neutralDarkLightest,
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
              },
            ))
          ],
        ),
        floatingActionButton: SizedBox(
          height: 48,
          width: 48,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            onPressed: () async {
              bool? newTable =
                  await Navigator.pushNamed(context, "/tables/new") as bool?;
              if (newTable != true) return;
              _onInit();
            },
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
