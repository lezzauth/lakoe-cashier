import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master_location/table_master_location_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/filter/table_location_filter.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/pages/table_detail_page.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:table_location_repository/table_location_repository.dart';

class TableMasterScreen extends StatelessWidget {
  const TableMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) => switch (state) {
        AuthReady() => const TableMaster(),
        _ => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      },
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
    AuthReady authState = context.read<AuthCubit>().state as AuthReady;

    await context
        .read<TableMasterLocationCubit>()
        .findAll(FindAllTableLocationDto(outletId: authState.outletId));
  }

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: SizedBox(
            width: double.infinity,
            child: TableLocationFilter(),
          ),
        ),
      ),
      body: Scrollbar(
        child: RefreshIndicator(
          backgroundColor: TColors.neutralLightLightest,
          onRefresh: _onRefresh,
          child: ListView.builder(
            itemBuilder: (context, index) {
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
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      showDragHandle: true,
                      useSafeArea: true,
                      builder: (context) {
                        return TableDetailPage();
                      },
                    );
                  },
                  splashColor: TColors.highlightLightest,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
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
                    "T-${index + 1}",
                    color: TColors.neutralDarkDarkest,
                  ),
                  subtitle: const TextBodyS(
                    "4 Orang • Indoor",
                    color: TColors.neutralDarkLight,
                  ),
                  trailing: const UiIcons(
                    TIcons.arrowRight,
                    color: TColors.neutralDarkLightest,
                    height: 12,
                    width: 12,
                  ),
                ),
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
          onPressed: () {
            Navigator.pushNamed(context, "/tables/new");
          },
          elevation: 0,
          child: const Icon(
            Icons.add,
            size: 24,
          ),
        ),
      ),
    );
  }
}
