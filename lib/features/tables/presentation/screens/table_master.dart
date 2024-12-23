import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logman/logman.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/shimmer/list_shimmer.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/wrapper/error_wrapper.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_filter_state.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_state.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master_location/table_master_location_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/filter/table_location_filter.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/pages/table_detail_page.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:responsive_framework/responsive_framework.dart';
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

    context.read<TableMasterLocationCubit>().findAll();
    await context.read<TableMasterCubit>().init();
  }

  Future<void> _onGoToDetail(TableModel table) async {
    Logman.instance.info(
        "ResponsiveBreakpoints is ${ResponsiveBreakpoints.of(context).smallerThan(TABLET)}");
    if (ResponsiveBreakpoints.of(context).smallerThan(TABLET)) {
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
                tableNo: table.no,
              ),
            ),
          );
        },
      );

      if (editedProduct != true) return;
      _onRefresh();
    } else {
      bool? editedProduct = await Navigator.pushNamed(
        context,
        "/tables/edit",
        arguments: table,
      ) as bool?;
      if (editedProduct != true) return;
      _onRefresh();
    }
  }

  Future<void> _onGoToCreateScreen() async {
    TableModel? newTable =
        await Navigator.pushNamed(context, "/tables/new") as TableModel?;
    if (newTable == null) return;
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
                size: 20,
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
              builder: (context, state) => ErrorWrapper(
                fetchError: state is TableMasterLoadFailure,
                onRefresh: _onRefresh,
                child: switch (state) {
                  TableMasterLoadSuccess(:final tables) => ListView.builder(
                      itemCount: tables.length,
                      itemBuilder: (context, index) {
                        TableModel table = tables.elementAt(index);

                        bool isFreeTable = table.id == "-";

                        String title = table.no;
                        String subtitle =
                            "${table.capacity} Orang • ${table.outletRoom!.name}";

                        if (isFreeTable) {
                          title = "Bebas";
                          subtitle = "-";
                        }

                        return Column(
                          children: [
                            ListTile(
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
                                    size: 20,
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
                                      size: 12,
                                    ),
                            ),
                            const Divider(
                              color: TColors.neutralLightMedium,
                              indent: 16.0,
                              height: 1,
                            ),
                          ],
                        );
                      },
                    ),
                  _ => ListShimmer(
                      crossAlignment: "center",
                      circleAvatar: true,
                      sizeAvatar: 40.0,
                      heightTitle: 16.0,
                      heightSubtitle: 12.0,
                    ),
                },
              ),
            ),
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
