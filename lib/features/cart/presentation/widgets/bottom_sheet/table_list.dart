import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_filter_state.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_state.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master_location/table_master_location_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/filter/table_location_filter.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:table_location_repository/table_location_repository.dart';
import 'package:table_repository/table_repository.dart';

class TableList extends StatelessWidget {
  const TableList({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TableMasterCubit()),
        BlocProvider(create: (context) => TableMasterFilterCubit()),
        BlocProvider(create: (context) => TableMasterLocationCubit()),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) => switch (state) {
          AuthReady() => const TableListContent(),
          _ => const Center(
              child: CircularProgressIndicator(),
            ),
        },
      ),
    );
  }
}

class TableListContent extends StatefulWidget {
  const TableListContent({super.key});

  @override
  State<TableListContent> createState() => _TableListContentState();
}

class _TableListContentState extends State<TableListContent> {
  Future<void> _onInit() async {
    if (!mounted) return;

    AuthReady authState = context.read<AuthCubit>().state as AuthReady;

    await context
        .read<TableMasterLocationCubit>()
        .findAll(FindAllTableLocationDto(outletId: authState.outletId));
    await context.read<TableMasterCubit>().init(authState.outletId);
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
        AuthReady authState = context.read<AuthCubit>().state as AuthReady;
        context.read<TableMasterCubit>().findAll(FindAllTableDto(
              outletId: authState.outletId,
              outletRoomId: state.outletRoomId,
            ));
      },
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                height: 20,
                                width: 20,
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
