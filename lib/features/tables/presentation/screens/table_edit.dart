import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/responsive/responsive_layout.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_container.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_item.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_state.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/forms/table_information_form.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/tabs/table_new_qr_order_tab.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:table_repository/table_repository.dart';

class TableEditScreen extends StatelessWidget {
  const TableEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TableEdit();
  }
}

class TableEdit extends StatefulWidget {
  const TableEdit({super.key});

  @override
  State<TableEdit> createState() => _TableEditState();
}

class _TableEditState extends State<TableEdit> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _onSubmit(String tableId) async {
    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;

    if (!isFormValid) {
      return;
    }

    FocusScope.of(context).unfocus();
    dynamic value = _formKey.currentState?.value;

    await context.read<TableMasterCubit>().update(
        tableId,
        UpdateTableDto(
          no: value["no"],
          capacity: int.parse(value["capacity"]),
          outletRoomId: value["outletRoomId"],
        ));
  }

  Future<void> _onDeleted(String tableId) async {
    await context.read<TableMasterCubit>().delete(tableId);
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as TableModel;

    return MultiBlocListener(
      listeners: [
        BlocListener<TableMasterCubit, TableMasterState>(
          listener: (context, state) {
            if (state is TableMasterActionSuccess) {
              Navigator.pop(context, true);
            }
          },
        )
      ],
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: CustomAppbar(
            title: "Ubah Meja ${arguments.no}",
            actions: [
              ResponsiveLayout(
                mobile: BlocBuilder<TableMasterCubit, TableMasterState>(
                    builder: (context, state) {
                  return TextButton(
                    onPressed: state is TableMasterActionInProgress
                        ? null
                        : () => _onSubmit(arguments.id),
                    child: state is TableMasterActionInProgress
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 1.2,
                            ),
                          )
                        : const TextActionL(
                            "SIMPAN",
                            color: TColors.primary,
                          ),
                  );
                }),
                tablet: SizedBox.shrink(),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: ResponsiveLayout(
                mobile: TabContainer(
                  tabs: [
                    TabItem(title: "Info Meja"),
                    TabItem(
                      title: "QR Order",
                    )
                  ],
                ),
                tablet: SizedBox.shrink(),
              ),
            ),
          ),
          body: ResponsiveLayout(
            mobile: TabBarView(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16),
                  child: TableInformationForm(
                    formKey: _formKey,
                    initialValue: {
                      "no": arguments.no,
                      "capacity": arguments.capacity.toString(),
                      "outletRoomId": arguments.outletRoomId,
                    },
                    onDeleted: () => _onDeleted(arguments.id),
                    table: arguments,
                    tableNumber: arguments.no,
                  ),
                ),
                TableNewQrOrderTab(
                  table: arguments,
                ),
              ],
            ),
            tablet: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(0, 16, 40, 16),
              child: BlocBuilder<TableMasterCubit, TableMasterState>(
                  builder: (context, state) {
                return TableInformationForm(
                  formKey: _formKey,
                  initialValue: {
                    "no": arguments.no,
                    "capacity": arguments.capacity.toString(),
                    "outletRoomId": arguments.outletRoomId,
                  },
                  onDeleted: () => _onDeleted(arguments.id),
                  table: arguments,
                  tableNumber: arguments.no,
                  isLoading: state is TableMasterActionInProgress,
                  onSubmit: () => _onSubmit(arguments.id),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
