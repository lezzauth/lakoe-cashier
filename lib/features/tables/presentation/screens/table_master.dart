import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/shimmer/list_shimmer.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/wrapper/error_wrapper.dart';
import 'package:lakoe_pos/features/tables/application/cubit/table_master/table_master_cubit.dart';
import 'package:lakoe_pos/features/tables/application/cubit/table_master/table_master_filter_cubit.dart';
import 'package:lakoe_pos/features/tables/application/cubit/table_master/table_master_filter_state.dart';
import 'package:lakoe_pos/features/tables/application/cubit/table_master/table_master_state.dart';
import 'package:lakoe_pos/features/tables/application/cubit/table_master_location/table_master_location_cubit.dart';
import 'package:lakoe_pos/features/tables/common/widgets/table_item.dart';
import 'package:lakoe_pos/features/tables/presentation/widgets/filter/table_location_filter.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
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
  bool tableIsEmpty = false;

  Future<void> _onRefresh() async {
    if (!mounted) return;

    context.read<TableMasterLocationCubit>().findAll();
    await context.read<TableMasterCubit>().init();
  }

  Future<void> _onGoToEditTable(TableModel table) async {
    bool? editedProduct = await Navigator.pushNamed(
      context,
      "/tables/edit",
      arguments: table,
    ) as bool?;
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
                size: 20,
                color: TColors.primary,
              ),
            )
          ],
          bottom: (!tableIsEmpty)
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(48),
                  child: BlocBuilder<TableMasterFilterCubit,
                      TableMasterFilterState>(builder: (context, state) {
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
                )
              : null,
        ),
        body: Scrollbar(
          child: RefreshIndicator(
            backgroundColor: TColors.neutralLightLightest,
            onRefresh: _onRefresh,
            child: BlocBuilder<TableMasterCubit, TableMasterState>(
              builder: (context, state) {
                return ErrorWrapper(
                  connectionIssue: state is ConnectionIssue,
                  fetchError: state is TableMasterLoadFailure,
                  onRefresh: _onRefresh,
                  child: () {
                    if (state is TableMasterLoadSuccess) {
                      final tables = state.tables
                          .where((table) => table.id != "-")
                          .toList();

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        setState(() {
                          tableIsEmpty = tables.isEmpty;
                        });
                      });

                      if (tables.isEmpty) {
                        return EmptyList(
                          image: SvgPicture.asset(TImages.catBox, width: 200),
                          title: "Belum ada meja",
                          subTitle: "Yuk, simpan meja yang kamu punya.",
                          action: TextButton(
                            onPressed: _onGoToCreateScreen,
                            child: TextActionL(
                              "Buat Baru",
                              color: TColors.primary,
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        itemCount: tables.length,
                        itemBuilder: (context, index) {
                          TableModel table = tables[index];

                          return TableItem(
                            table: table,
                            onTap: () {
                              _onGoToEditTable(table);
                            },
                          );
                        },
                      );
                    } else {
                      return const ListShimmer(
                        crossAlignment: "center",
                        circleAvatar: true,
                        sizeAvatar: 40.0,
                        heightTitle: 16.0,
                        heightSubtitle: 12.0,
                      );
                    }
                  }(),
                );
              },
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
