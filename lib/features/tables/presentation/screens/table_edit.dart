import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_container.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_item.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_state.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/forms/table_information_form.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/tabs/table_new_qr_order_tab.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';
import 'package:table_repository/table_repository.dart';

class TableEditScreen extends StatelessWidget {
  const TableEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) => switch (state) {
        AuthReady() => const TableEdit(),
        _ => const Scaffold(body: Center(child: CircularProgressIndicator())),
      },
    );
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
    FocusScope.of(context).unfocus();
    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;

    if (!isFormValid) {
      SnackBar snackBar = SnackBar(
        content: Text(ErrorTextStrings.formInvalid()),
        showCloseIcon: true,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          snackBar,
        );

      return;
    }

    dynamic value = _formKey.currentState?.value;
    AuthReady authState = context.read<AuthCubit>().state as AuthReady;

    await context.read<TableMasterCubit>().update(
        tableId,
        UpdateTableDto(
          no: value["no"],
          capacity: int.parse(value["capacity"]),
          outletId: authState.outletId,
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
            title: "Meja ${arguments.no}",
            actions: [
              BlocBuilder<TableMasterCubit, TableMasterState>(
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
            ],
            bottom: const TabContainer(
              tabs: [
                TabItem(title: "Info Meja"),
                TabItem(
                  title: "QR Order",
                )
              ],
            ),
          ),
          body: TabBarView(
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
                ),
              ),
              TableNewQrOrderTab(
                table: arguments,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
