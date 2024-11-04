import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/error_display/error_display.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_container.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/tab/tab_item.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_state.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/forms/table_information_form.dart';
import 'package:point_of_sales_cashier/features/tables/presentation/widgets/tabs/table_new_qr_order_tab.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:table_repository/table_repository.dart';

class TableNewScreen extends StatelessWidget {
  const TableNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TableNew();
  }
}

class TableNew extends StatefulWidget {
  const TableNew({super.key});

  @override
  State<TableNew> createState() => _TableNewState();
}

class _TableNewState extends State<TableNew> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _onSubmit() async {
    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;

    if (!isFormValid) {
      return;
    }

    FocusScope.of(context).unfocus();
    dynamic value = _formKey.currentState?.value;

    await context.read<TableMasterCubit>().create(CreateTableDto(
          no: value["no"],
          capacity: int.parse(value["capacity"]),
          outletRoomId: value["outletRoomId"],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TableMasterCubit, TableMasterState>(
          listener: (context, state) {
            if (state is TableMasterActionSuccess) {
              Navigator.pop(context, true);
            } else if (state is TableMasterReachesLimit) {
              showModalBottomSheet(
                context: context,
                enableDrag: false,
                isDismissible: false,
                builder: (context) {
                  return CustomBottomsheet(
                    hasGrabber: false,
                    child: ErrorDisplay(
                      imageSrc: TImages.limitQuota,
                      title: "Meja maksimal, nih!",
                      description:
                          "Sudah 5 QR Meja. Upgrade untuk tambah meja QR!",
                      actionTitlePrimary: "Lihat Paket",
                      onActionPrimary: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, "/packages");
                      },
                      actionTitleSecondary: "Nanti Saja",
                      onActionSecondary: () {
                        Navigator.pop(context);
                        Navigator.pop(context, true);
                      },
                    ),
                  );
                },
              );
            }
          },
        )
      ],
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: CustomAppbar(
            title: "Buat Meja Baru",
            actions: [
              BlocBuilder<TableMasterCubit, TableMasterState>(
                  builder: (context, state) {
                return TextButton(
                  onPressed:
                      state is TableMasterActionInProgress ? null : _onSubmit,
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
                child: TableInformationForm(formKey: _formKey),
              ),
              const TableNewQrOrderTab(),
            ],
          ),
        ),
      ),
    );
  }
}
